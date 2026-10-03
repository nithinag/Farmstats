import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';
import 'package:drift/drift.dart' hide Column, Batch, Table;
import '../../../../shared/widgets/layout_components.dart';
import '../../../../core/theme/spacing.dart';
import '../../../../core/theme/radius.dart';
import '../../../../core/theme/color_scheme.dart';
import '../../../../data/providers/database_provider.dart';
import '../../../../data/database/app_database.dart';
import '../../../batches/application/providers/batch_notifier.dart';
import '../../../batches/application/providers/batch_state.dart';
import '../../../batches/domain/entities/batch_entities.dart';
import '../../../income/application/providers/income_notifier.dart';
import '../../../income/domain/entities/income_entities.dart';
import '../../application/providers/harvest_notifier.dart';
import '../../../dashboard/application/providers/dashboard_notifier.dart';
import '../../../reports/application/providers/reports_notifier.dart';

final buyersListProvider = FutureProvider<List<Buyer>>((ref) async {
  final db = ref.watch(appDatabaseProvider);
  final rows = await db.select(db.buyersTable).get();
  if (rows.isEmpty) {
    return const [
      Buyer(id: 'b1', name: 'Govt Cocoon Market (Ramanagara)', contact: '080-27271234'),
      Buyer(id: 'b2', name: 'ABC Silk Traders', contact: '+91 98765 43210'),
      Buyer(id: 'b3', name: 'Karnataka Silk Industries Corp (KSIC)', contact: '+91 80 2226 7890'),
    ];
  }
  return rows.map((r) => Buyer(id: r.id, name: r.name, contact: r.contact)).toList();
});

class CocoonSaleWizardScreen extends ConsumerStatefulWidget {
  final String? initialBatchId;

  const CocoonSaleWizardScreen({super.key, this.initialBatchId});

  @override
  ConsumerState<CocoonSaleWizardScreen> createState() => _CocoonSaleWizardScreenState();
}

class _CocoonSaleWizardScreenState extends ConsumerState<CocoonSaleWizardScreen> {
  final _formKey = GlobalKey<FormState>();

  String? _selectedBatchId;
  Buyer? _selectedBuyer;
  DateTime _saleDate = DateTime.now();

  late TextEditingController _grossWeightController;
  late TextEditingController _tareWeightController;
  late TextEditingController _rateController;
  late TextEditingController _commissionController;
  late TextEditingController _transportController;
  late TextEditingController _otherDeductionsController;
  late TextEditingController _amountReceivedController;
  late TextEditingController _remarksController;

  String _paymentStatus = 'Paid'; // Paid, Partially Paid, Pending
  final String _paymentMode = 'Cash'; // Cash, UPI, Bank Transfer, Cheque
  bool _isSaving = false;

  final _paymentStatuses = ['Paid', 'Partially Paid', 'Pending'];

  @override
  void initState() {
    super.initState();
    _selectedBatchId = widget.initialBatchId;

    _grossWeightController = TextEditingController();
    _tareWeightController = TextEditingController(text: '0.0');
    _rateController = TextEditingController();
    _commissionController = TextEditingController(text: '0.0');
    _transportController = TextEditingController(text: '0.0');
    _otherDeductionsController = TextEditingController(text: '0.0');
    _amountReceivedController = TextEditingController();
    _remarksController = TextEditingController();

    // Attach listeners for dynamic auto-calculation
    _grossWeightController.addListener(_onCalculationsChanged);
    _tareWeightController.addListener(_onCalculationsChanged);
    _rateController.addListener(_onCalculationsChanged);
    _commissionController.addListener(_onCalculationsChanged);
    _transportController.addListener(_onCalculationsChanged);
    _otherDeductionsController.addListener(_onCalculationsChanged);
  }

  @override
  void dispose() {
    _grossWeightController.removeListener(_onCalculationsChanged);
    _tareWeightController.removeListener(_onCalculationsChanged);
    _rateController.removeListener(_onCalculationsChanged);
    _commissionController.removeListener(_onCalculationsChanged);
    _transportController.removeListener(_onCalculationsChanged);
    _otherDeductionsController.removeListener(_onCalculationsChanged);

    _grossWeightController.dispose();
    _tareWeightController.dispose();
    _rateController.dispose();
    _commissionController.dispose();
    _transportController.dispose();
    _otherDeductionsController.dispose();
    _amountReceivedController.dispose();
    _remarksController.dispose();
    super.dispose();
  }

  void _onCalculationsChanged() {
    if (mounted) {
      setState(() {
        if (_paymentStatus == 'Paid') {
          _amountReceivedController.text = netRevenue.toStringAsFixed(0);
        }
      });
    }
  }

  double get grossWeight => double.tryParse(_grossWeightController.text) ?? 0.0;
  double get tareWeight => double.tryParse(_tareWeightController.text) ?? 0.0;
  double get netWeight => (grossWeight - tareWeight).clamp(0.0, double.infinity);

  double get ratePerKg => double.tryParse(_rateController.text) ?? 0.0;
  double get grossAmount => netWeight * ratePerKg;

  double get commission => double.tryParse(_commissionController.text) ?? 0.0;
  double get transport => double.tryParse(_transportController.text) ?? 0.0;
  double get otherDeductions => double.tryParse(_otherDeductionsController.text) ?? 0.0;
  double get totalDeductions => commission + transport + otherDeductions;

  double get netRevenue => (grossAmount - totalDeductions).clamp(0.0, double.infinity);

  Future<void> _showAddBuyerDialog() async {
    final nameCtrl = TextEditingController();
    final contactCtrl = TextEditingController();

    await showDialog(
      context: context,
      builder: (ctx) {
        return AlertDialog(
          title: const Text('Add New Buyer / Mandi'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameCtrl,
                decoration: const InputDecoration(labelText: 'Buyer / Market Name *'),
              ),
              const SizedBox(height: AppSpacing.sm),
              TextField(
                controller: contactCtrl,
                decoration: const InputDecoration(labelText: 'Contact Number'),
                keyboardType: TextInputType.phone,
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(ctx),
              child: const Text('Cancel'),
            ),
            FilledButton(
              onPressed: () async {
                if (nameCtrl.text.trim().isNotEmpty) {
                  final db = ref.read(appDatabaseProvider);
                  final buyerId = const Uuid().v4();
                  await db.into(db.buyersTable).insert(
                        BuyersTableCompanion.insert(
                          id: buyerId,
                          name: nameCtrl.text.trim(),
                          contact: contactCtrl.text.trim().isNotEmpty ? contactCtrl.text.trim() : '+91 00000 00000',
                        ),
                      );
                  ref.invalidate(buyersListProvider);
                  if (ctx.mounted) Navigator.pop(ctx);
                }
              },
              style: FilledButton.styleFrom(backgroundColor: AppColorScheme.primary),
              child: const Text('Add Buyer'),
            ),
          ],
        );
      },
    );
  }

  Future<void> _confirmSale() async {
    if (_selectedBatchId == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please select an associated batch.'), backgroundColor: AppColorScheme.error),
      );
      return;
    }

    if (_selectedBuyer == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please select a buyer or cocoon market.'), backgroundColor: AppColorScheme.error),
      );
      return;
    }

    if (_formKey.currentState!.validate()) {
      if (netWeight <= 0) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Net weight must be greater than 0 kg.'), backgroundColor: AppColorScheme.error),
        );
        return;
      }

      setState(() => _isSaving = true);
      try {
        final db = ref.read(appDatabaseProvider);
        final harvestId = const Uuid().v4();
        final incomeId = const Uuid().v4();

        await db.transaction(() async {
          // 1. Insert Harvest Record
          await db.into(db.harvestsTable).insert(
                HarvestsTableCompanion.insert(
                  id: harvestId,
                  batchId: _selectedBatchId!,
                  harvestDate: _saleDate,
                  actualHarvestDuration: 1.0,
                  grossWeight: grossWeight,
                  netSaleableWeight: netWeight,
                  rejectedWeight: 0.0,
                  moisturePercentage: 0.0,
                  wastePercentage: 0.0,
                  averageCocoonSize: 0.0,
                  gradeAWeight: netWeight,
                  gradeBWeight: 0.0,
                  gradeCWeight: 0.0,
                  yieldPercentage: 100.0,
                  survivalRate: 100.0,
                  feedConversionRatio: 0.0,
                  mortalityPercentage: 0.0,
                  harvestEfficiency: 100.0,
                  remarks: Value(_remarksController.text.trim()),
                ),
                mode: InsertMode.replace,
              );

          // 2. Insert Income / Sale Record
          await db.into(db.incomesTable).insert(
                IncomesTableCompanion.insert(
                  id: incomeId,
                  saleDate: _saleDate,
                  batchId: Value(_selectedBatchId),
                  buyerId: _selectedBuyer!.id,
                  categoryId: 'inc_cocoon',
                  cocoonGrade: 'Standard Grade',
                  quantity: netWeight,
                  rate: ratePerKg,
                  grossAmount: grossAmount,
                  transportCharges: transport,
                  commission: commission + otherDeductions,
                  netAmount: netRevenue,
                  paymentMethod: _paymentMode,
                  paymentStatus: _paymentStatus,
                  remarks: Value(_remarksController.text.trim()),
                ),
                mode: InsertMode.replace,
              );

          // 3. Insert Batch Timeline Entry
          await db.into(db.batchTimelinesTable).insert(
                BatchTimelinesTableCompanion.insert(
                  id: const Uuid().v4(),
                  batchId: _selectedBatchId!,
                  timestamp: _saleDate,
                  eventType: 'sale',
                  description: 'Cocoon Sale: ${netWeight.toStringAsFixed(1)} kg sold to ${_selectedBuyer!.name} for ₹${netRevenue.toStringAsFixed(0)} (Rate: ₹${ratePerKg.toStringAsFixed(0)}/kg)',
                ),
                mode: InsertMode.replace,
              );
        });

        // Invalidate and reload all financial and reporting state
        await ref.read(incomeNotifierProvider.notifier).loadIncomes();
        await ref.read(harvestNotifierProvider.notifier).loadHarvests();
        await ref.read(batchNotifierProvider.notifier).loadBatches();
        ref.read(dashboardAggregatorProvider.notifier).loadDashboard();
        ref.read(reportsNotifierProvider.notifier).loadReports();

        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('✓ Cocoon sale of ₹${netRevenue.toStringAsFixed(0)} successfully recorded!'),
              backgroundColor: AppColorScheme.primary,
            ),
          );
          context.pop();
        }
      } catch (e) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Failed to record cocoon sale: $e'), backgroundColor: AppColorScheme.error),
          );
        }
      } finally {
        if (mounted) setState(() => _isSaving = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final activeBatch = ref.watch(activeBatchProvider);
    final batchState = ref.watch(batchNotifierProvider);
    final buyersAsync = ref.watch(buyersListProvider);
    final currency = NumberFormat.currency(symbol: '₹', decimalDigits: 0, locale: 'en_IN');

    final allBatches = switch (batchState) {
      BatchStateData(batches: final list) => list,
      _ => <Batch>[],
    };

    if (_selectedBatchId == null && activeBatch != null) {
      _selectedBatchId = activeBatch.id;
    }

    final selectedBatch = allBatches.where((b) => b.id == _selectedBatchId).firstOrNull ?? activeBatch;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return BaseScaffold(
      appBar: AppBar(
        title: const Text(
          'Cocoon Sale',
          style: TextStyle(fontWeight: FontWeight.w800, fontSize: 18),
        ),
        backgroundColor: isDark ? AppColorScheme.backgroundDark : AppColorScheme.backgroundLight,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.md),
          child: SizedBox(
            width: double.infinity,
            height: 50,
            child: FilledButton.icon(
              onPressed: _isSaving ? null : _confirmSale,
              style: FilledButton.styleFrom(
                backgroundColor: AppColorScheme.forestGreen,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppRadius.sm)),
              ),
              icon: _isSaving
                  ? const SizedBox(width: 18, height: 18, child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2))
                  : const Icon(Icons.check, size: 20),
              label: Text(_isSaving ? 'Saving...' : '✓ Save Sale', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            ),
          ),
        ),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.fromLTRB(AppSpacing.md, AppSpacing.xs, AppSpacing.md, 40),
          children: [
            // Top Batch Indicator Card
            if (selectedBatch != null)
              Container(
                padding: const EdgeInsets.all(AppSpacing.md),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(color: AppColorScheme.cardBorderLight),
                ),
                child: Row(
                  children: [
                    Container(
                      width: 42,
                      height: 42,
                      decoration: BoxDecoration(
                        color: const Color(0xFFE8F5E9),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Icon(Icons.spa_outlined, color: Color(0xFF2E7D32), size: 22),
                    ),
                    const SizedBox(width: AppSpacing.md),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            selectedBatch.batchName,
                            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                          ),
                          Text(
                            'Day ${selectedBatch.currentAgeDays > 0 ? selectedBatch.currentAgeDays : 25} / 30 • ${selectedBatch.numberOfDfls} DFLs',
                            style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            const SizedBox(height: AppSpacing.md),

            // Buyer Selector with Quick Add
            buyersAsync.when(
              data: (buyers) {
                if (_selectedBuyer == null && buyers.isNotEmpty) {
                  _selectedBuyer = buyers.first;
                }
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Buyer', style: TextStyle(fontSize: 12, color: Colors.grey.shade700, fontWeight: FontWeight.w600)),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        Expanded(
                          child: DropdownButtonFormField<Buyer>(
                            initialValue: _selectedBuyer,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              prefixIcon: const Icon(Icons.person_outline, size: 20),
                              contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                              border: OutlineInputBorder(borderRadius: BorderRadius.circular(AppRadius.sm), borderSide: const BorderSide(color: AppColorScheme.cardBorderLight)),
                              enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(AppRadius.sm), borderSide: const BorderSide(color: AppColorScheme.cardBorderLight)),
                            ),
                            items: buyers.map((b) => DropdownMenuItem(value: b, child: Text(b.name, style: const TextStyle(fontSize: 13), overflow: TextOverflow.ellipsis))).toList(),
                            onChanged: (b) => setState(() => _selectedBuyer = b),
                          ),
                        ),
                        const SizedBox(width: 8),
                        IconButton.filledTonal(
                          icon: const Icon(Icons.add, size: 20, color: AppColorScheme.primary),
                          tooltip: 'Add Buyer',
                          onPressed: _showAddBuyerDialog,
                        ),
                      ],
                    ),
                  ],
                );
              },
              loading: () => const LinearProgressIndicator(),
              error: (_, __) => const SizedBox.shrink(),
            ),
            const SizedBox(height: AppSpacing.md),

            // Date Picker Row
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Date', style: TextStyle(fontSize: 12, color: Colors.grey.shade700, fontWeight: FontWeight.w600)),
                const SizedBox(height: 4),
                InkWell(
                  onTap: () async {
                    final d = await showDatePicker(
                      context: context,
                      initialDate: _saleDate,
                      firstDate: DateTime(2020),
                      lastDate: DateTime.now().add(const Duration(days: 30)),
                    );
                    if (d != null) setState(() => _saleDate = d);
                  },
                  borderRadius: BorderRadius.circular(AppRadius.sm),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(AppRadius.sm),
                      border: Border.all(color: AppColorScheme.cardBorderLight),
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.calendar_today_outlined, size: 18, color: Colors.grey),
                        const SizedBox(width: 10),
                        Text(DateFormat('dd MMM yyyy').format(_saleDate), style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: AppSpacing.md),

            // Gross Weight & Tare Weight Side-by-Side
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Gross Weight (kg)', style: TextStyle(fontSize: 12, color: Colors.grey.shade700, fontWeight: FontWeight.w600)),
                      const SizedBox(height: 4),
                      TextFormField(
                        controller: _grossWeightController,
                        keyboardType: const TextInputType.numberWithOptions(decimal: true),
                        decoration: InputDecoration(
                          hintText: '80.0',
                          prefixIcon: const Icon(Icons.scale_outlined, size: 18),
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(AppRadius.sm), borderSide: const BorderSide(color: AppColorScheme.cardBorderLight)),
                          enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(AppRadius.sm), borderSide: const BorderSide(color: AppColorScheme.cardBorderLight)),
                        ),
                        validator: (v) => (double.tryParse(v ?? '') ?? 0) <= 0 ? 'Required' : null,
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: AppSpacing.md),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Tare Weight (kg)', style: TextStyle(fontSize: 12, color: Colors.grey.shade700, fontWeight: FontWeight.w600)),
                      const SizedBox(height: 4),
                      TextFormField(
                        controller: _tareWeightController,
                        keyboardType: const TextInputType.numberWithOptions(decimal: true),
                        decoration: InputDecoration(
                          hintText: '2.0',
                          prefixIcon: const Icon(Icons.shopping_bag_outlined, size: 18),
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(AppRadius.sm), borderSide: const BorderSide(color: AppColorScheme.cardBorderLight)),
                          enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(AppRadius.sm), borderSide: const BorderSide(color: AppColorScheme.cardBorderLight)),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: AppSpacing.sm),

            // Highlighted Net Weight Box
            Container(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              decoration: BoxDecoration(
                color: const Color(0xFFF0FDF4),
                borderRadius: BorderRadius.circular(AppRadius.sm),
                border: Border.all(color: const Color(0xFFBBF7D0)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Net Weight', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 13, color: Color(0xFF166534))),
                  Text('${netWeight.toStringAsFixed(1)} kg', style: const TextStyle(fontWeight: FontWeight.w900, fontSize: 18, color: Color(0xFF166534))),
                ],
              ),
            ),
            const SizedBox(height: AppSpacing.md),

            // Rate (₹/kg) and Gross Amount Side-by-Side
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Rate (₹ / kg)', style: TextStyle(fontSize: 12, color: Colors.grey.shade700, fontWeight: FontWeight.w600)),
                      const SizedBox(height: 4),
                      TextFormField(
                        controller: _rateController,
                        keyboardType: const TextInputType.numberWithOptions(decimal: true),
                        decoration: InputDecoration(
                          prefixText: '₹ ',
                          hintText: '580',
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(AppRadius.sm), borderSide: const BorderSide(color: AppColorScheme.cardBorderLight)),
                          enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(AppRadius.sm), borderSide: const BorderSide(color: AppColorScheme.cardBorderLight)),
                        ),
                        validator: (v) => (double.tryParse(v ?? '') ?? 0) <= 0 ? 'Enter rate' : null,
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: AppSpacing.md),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Gross Amount', style: TextStyle(fontSize: 12, color: Colors.grey.shade700, fontWeight: FontWeight.w600)),
                      const SizedBox(height: 4),
                      Container(
                        height: 48,
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        decoration: BoxDecoration(
                          color: const Color(0xFFF9FAFB),
                          borderRadius: BorderRadius.circular(AppRadius.sm),
                          border: Border.all(color: AppColorScheme.cardBorderLight),
                        ),
                        alignment: Alignment.centerLeft,
                        child: Text(currency.format(grossAmount), style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: AppSpacing.md),

            // Deductions Section (Commission, Transport, Other)
            Container(
              padding: const EdgeInsets.all(AppSpacing.md),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(14),
                border: Border.all(color: AppColorScheme.cardBorderLight),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Deductions', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                  const SizedBox(height: AppSpacing.sm),
                  _deductionRow('Commission', _commissionController, '1500'),
                  const SizedBox(height: 8),
                  _deductionRow('Transport', _transportController, '800'),
                  const SizedBox(height: 8),
                  _deductionRow('Other', _otherDeductionsController, '200'),
                ],
              ),
            ),
            const SizedBox(height: AppSpacing.md),

            // Highlighted Net Revenue Box
            Container(
              padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
              decoration: BoxDecoration(
                color: const Color(0xFFF0FDF4),
                borderRadius: BorderRadius.circular(14),
                border: Border.all(color: const Color(0xFF86EFAC)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Net Revenue', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Color(0xFF166534))),
                  Text(currency.format(netRevenue), style: const TextStyle(fontWeight: FontWeight.w900, fontSize: 20, color: Color(0xFF166534))),
                ],
              ),
            ),
            const SizedBox(height: AppSpacing.md),

            // Payment Status Segmented Selector
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Payment Status', style: TextStyle(fontSize: 12, color: Colors.grey.shade700, fontWeight: FontWeight.w600)),
                const SizedBox(height: 6),
                Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: const Color(0xFFE5E9E6),
                    borderRadius: BorderRadius.circular(AppRadius.pill),
                  ),
                  child: Row(
                    children: _paymentStatuses.map((s) {
                      final isSelected = _paymentStatus == s;
                      return Expanded(
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              _paymentStatus = s;
                              if (s == 'Paid') {
                                _amountReceivedController.text = netRevenue.toStringAsFixed(0);
                              }
                            });
                          },
                          borderRadius: BorderRadius.circular(AppRadius.pill),
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 150),
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            decoration: BoxDecoration(
                              color: isSelected ? AppColorScheme.primary : Colors.transparent,
                              borderRadius: BorderRadius.circular(AppRadius.pill),
                            ),
                            child: Center(
                              child: Text(
                                s,
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                                  color: isSelected ? Colors.white : Colors.grey.shade800,
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
            const SizedBox(height: AppSpacing.xxl),
          ],
        ),
      ),
    );
  }

  Widget _deductionRow(String label, TextEditingController controller, String hint) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: TextStyle(fontSize: 13, color: Colors.grey.shade700)),
        SizedBox(
          width: 120,
          height: 40,
          child: TextFormField(
            controller: controller,
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            textAlign: TextAlign.end,
            decoration: InputDecoration(
              prefixText: '₹ ',
              hintText: hint,
              contentPadding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(AppRadius.xs), borderSide: const BorderSide(color: AppColorScheme.cardBorderLight)),
              enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(AppRadius.xs), borderSide: const BorderSide(color: AppColorScheme.cardBorderLight)),
            ),
          ),
        ),
      ],
    );
  }
}
