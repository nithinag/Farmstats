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
  String _paymentMode = 'Cash'; // Cash, UPI, Bank Transfer, Cheque
  bool _isSaving = false;

  final _paymentStatuses = ['Paid', 'Partially Paid', 'Pending'];
  final _paymentModes = ['Cash', 'UPI', 'Bank Transfer', 'Cheque'];

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

    return BaseScaffold(
      appBar: AppBar(
        title: const Text('Record Cocoon Sale'),
        elevation: 0,
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(AppSpacing.md),
          children: [
            // 1. BATCH & BUYER CARD
            Card(
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppRadius.md),
                side: BorderSide(color: Colors.grey.shade300),
              ),
              child: Padding(
                padding: const EdgeInsets.all(AppSpacing.md),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'BATCH & BUYER',
                      style: TextStyle(fontSize: 11, fontWeight: FontWeight.w700, color: Colors.grey),
                    ),
                    const SizedBox(height: AppSpacing.sm),

                    // Batch Selector
                    DropdownButtonFormField<String>(
                      initialValue: _selectedBatchId,
                      decoration: const InputDecoration(
                        labelText: 'Select Batch *',
                        prefixIcon: Icon(Icons.layers_outlined),
                        border: OutlineInputBorder(),
                      ),
                      items: allBatches.map((b) {
                        final isCurrent = activeBatch?.id == b.id;
                        return DropdownMenuItem(
                          value: b.id,
                          child: Text('${b.batchName} (${b.numberOfDfls} DFLs) ${isCurrent ? '• Active' : ''}'),
                        );
                      }).toList(),
                      onChanged: (v) => setState(() => _selectedBatchId = v),
                      validator: (v) => v == null ? 'Please select a batch' : null,
                    ),
                    const SizedBox(height: AppSpacing.md),

                    // Buyer Selector
                    buyersAsync.when(
                      data: (buyers) {
                        if (_selectedBuyer == null && buyers.isNotEmpty) {
                          _selectedBuyer = buyers.first;
                        }
                        return Row(
                          children: [
                            Expanded(
                              child: DropdownButtonFormField<Buyer>(
                                initialValue: _selectedBuyer,
                                decoration: const InputDecoration(
                                  labelText: 'Buyer / Cocoon Market *',
                                  prefixIcon: Icon(Icons.storefront_outlined),
                                  border: OutlineInputBorder(),
                                ),
                                items: buyers.map((b) => DropdownMenuItem(value: b, child: Text(b.name, overflow: TextOverflow.ellipsis))).toList(),
                                onChanged: (b) => setState(() => _selectedBuyer = b),
                              ),
                            ),
                            const SizedBox(width: 8),
                            IconButton.outlined(
                              icon: const Icon(Icons.add),
                              tooltip: 'Add Buyer',
                              onPressed: _showAddBuyerDialog,
                            ),
                          ],
                        );
                      },
                      loading: () => const LinearProgressIndicator(),
                      error: (_, __) => const Text('Failed to load buyers'),
                    ),
                    const SizedBox(height: AppSpacing.md),

                    // Date
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: const Icon(Icons.calendar_today, color: AppColorScheme.primaryLight),
                      title: const Text('Sale Date'),
                      subtitle: Text(DateFormat('dd MMMM yyyy').format(_saleDate)),
                      trailing: OutlinedButton(
                        onPressed: () async {
                          final d = await showDatePicker(
                            context: context,
                            initialDate: _saleDate,
                            firstDate: DateTime(2020),
                            lastDate: DateTime.now().add(const Duration(days: 30)),
                          );
                          if (d != null) setState(() => _saleDate = d);
                        },
                        child: const Text('Change'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: AppSpacing.md),

            // 2. WEIGHT & RATE CARD
            Card(
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppRadius.md),
                side: BorderSide(color: Colors.grey.shade300),
              ),
              child: Padding(
                padding: const EdgeInsets.all(AppSpacing.md),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'HARVEST WEIGHT & RATE',
                      style: TextStyle(fontSize: 11, fontWeight: FontWeight.w700, color: Colors.grey),
                    ),
                    const SizedBox(height: AppSpacing.sm),
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: _grossWeightController,
                            keyboardType: const TextInputType.numberWithOptions(decimal: true),
                            decoration: const InputDecoration(
                              labelText: 'Gross Weight (kg) *',
                              prefixIcon: Icon(Icons.scale_outlined),
                              border: OutlineInputBorder(),
                            ),
                            validator: (v) => (double.tryParse(v ?? '') ?? 0) <= 0 ? 'Enter weight' : null,
                          ),
                        ),
                        const SizedBox(width: AppSpacing.sm),
                        Expanded(
                          child: TextFormField(
                            controller: _tareWeightController,
                            keyboardType: const TextInputType.numberWithOptions(decimal: true),
                            decoration: const InputDecoration(
                              labelText: 'Tare (kg)',
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: AppSpacing.sm),

                    // Net Weight Pill
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md, vertical: 8),
                      decoration: BoxDecoration(
                        color: const Color(0xFFE8F5E9),
                        borderRadius: BorderRadius.circular(AppRadius.sm),
                        border: Border.all(color: const Color(0xFFC8E6C9)),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Net Cocoon Weight:', style: TextStyle(fontWeight: FontWeight.w600, color: Color(0xFF1B5E20))),
                          Text(
                            '${netWeight.toStringAsFixed(2)} kg',
                            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Color(0xFF1B5E20)),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: AppSpacing.md),

                    // Rate & Gross Amount
                    TextFormField(
                      controller: _rateController,
                      keyboardType: const TextInputType.numberWithOptions(decimal: true),
                      decoration: const InputDecoration(
                        labelText: 'Market Rate (₹ / kg) *',
                        prefixIcon: Icon(Icons.currency_rupee),
                        hintText: 'e.g. 580',
                        border: OutlineInputBorder(),
                      ),
                      validator: (v) => (double.tryParse(v ?? '') ?? 0) <= 0 ? 'Enter rate per kg' : null,
                    ),
                    const SizedBox(height: AppSpacing.sm),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Gross Cocoon Value:', style: TextStyle(color: Colors.grey, fontSize: 13)),
                        Text(
                          currency.format(grossAmount),
                          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: AppSpacing.md),

            // 3. DEDUCTIONS CARD
            Card(
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppRadius.md),
                side: BorderSide(color: Colors.grey.shade300),
              ),
              child: Padding(
                padding: const EdgeInsets.all(AppSpacing.md),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'MARKET CHARGES & DEDUCTIONS',
                      style: TextStyle(fontSize: 11, fontWeight: FontWeight.w700, color: Colors.grey),
                    ),
                    const SizedBox(height: AppSpacing.sm),
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: _commissionController,
                            keyboardType: const TextInputType.numberWithOptions(decimal: true),
                            decoration: const InputDecoration(
                              labelText: 'Commission (₹)',
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                        const SizedBox(width: AppSpacing.sm),
                        Expanded(
                          child: TextFormField(
                            controller: _transportController,
                            keyboardType: const TextInputType.numberWithOptions(decimal: true),
                            decoration: const InputDecoration(
                              labelText: 'Transport (₹)',
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: AppSpacing.sm),
                    TextFormField(
                      controller: _otherDeductionsController,
                      keyboardType: const TextInputType.numberWithOptions(decimal: true),
                      decoration: const InputDecoration(
                        labelText: 'Market / Other Charges (₹)',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: AppSpacing.md),

            // 4. NET REVENUE HERO SUMMARY
            Container(
              padding: const EdgeInsets.all(AppSpacing.md),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF1B5E20), Color(0xFF2E7D32)],
                ),
                borderRadius: BorderRadius.circular(AppRadius.md),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('NET REVENUE TO RECEIVE', style: TextStyle(color: Colors.white70, fontSize: 12, fontWeight: FontWeight.bold)),
                      Text(
                        currency.format(netRevenue),
                        style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w900, fontSize: 24),
                      ),
                    ],
                  ),
                  const Divider(color: Colors.white24, height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Gross: ${currency.format(grossAmount)}', style: const TextStyle(color: Colors.white70, fontSize: 11)),
                      Text('Deductions: -${currency.format(totalDeductions)}', style: const TextStyle(color: Colors.white70, fontSize: 11)),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: AppSpacing.md),

            // 5. PAYMENT STATUS
            Card(
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppRadius.md),
                side: BorderSide(color: Colors.grey.shade300),
              ),
              child: Padding(
                padding: const EdgeInsets.all(AppSpacing.md),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'PAYMENT SETTLEMENT',
                      style: TextStyle(fontSize: 11, fontWeight: FontWeight.w700, color: Colors.grey),
                    ),
                    const SizedBox(height: AppSpacing.sm),
                    Row(
                      children: [
                        Expanded(
                          child: DropdownButtonFormField<String>(
                            initialValue: _paymentStatus,
                            decoration: const InputDecoration(
                              labelText: 'Payment Status',
                              border: OutlineInputBorder(),
                            ),
                            items: _paymentStatuses.map((s) => DropdownMenuItem(value: s, child: Text(s))).toList(),
                            onChanged: (s) {
                              if (s != null) {
                                setState(() {
                                  _paymentStatus = s;
                                  if (s == 'Paid') {
                                    _amountReceivedController.text = netRevenue.toStringAsFixed(0);
                                  }
                                });
                              }
                            },
                          ),
                        ),
                        const SizedBox(width: AppSpacing.sm),
                        Expanded(
                          child: DropdownButtonFormField<String>(
                            initialValue: _paymentMode,
                            decoration: const InputDecoration(
                              labelText: 'Payment Mode',
                              border: OutlineInputBorder(),
                            ),
                            items: _paymentModes.map((m) => DropdownMenuItem(value: m, child: Text(m))).toList(),
                            onChanged: (m) => setState(() => _paymentMode = m ?? 'Cash'),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: AppSpacing.lg),

            // 6. SUBMIT BUTTON
            SizedBox(
              height: 52,
              child: FilledButton.icon(
                onPressed: _isSaving ? null : _confirmSale,
                style: FilledButton.styleFrom(
                  backgroundColor: AppColorScheme.primary,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppRadius.md)),
                ),
                icon: _isSaving
                    ? const SizedBox(width: 20, height: 20, child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2))
                    : const Icon(Icons.check_circle_outline),
                label: Text(
                  _isSaving ? 'Recording Sale...' : 'CONFIRM COCOON SALE',
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ),
            ),
            const SizedBox(height: AppSpacing.xxl),
          ],
        ),
      ),
    );
  }
}
