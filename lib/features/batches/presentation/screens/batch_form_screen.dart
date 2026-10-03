import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';
import 'package:drift/drift.dart' hide Column, Batch;
import '../../../../shared/widgets/layout_components.dart';
import '../../../../core/theme/spacing.dart';
import '../../../../core/theme/color_scheme.dart';
import '../../../../data/providers/database_provider.dart';
import '../../../../data/database/app_database.dart';
import '../../domain/entities/batch_entities.dart';
import '../../application/providers/batch_notifier.dart';
import '../../../expenses/application/providers/expense_notifier.dart';
import '../../../dashboard/application/providers/dashboard_notifier.dart';
import '../../../reports/application/providers/reports_notifier.dart';

class BatchFormScreen extends ConsumerStatefulWidget {
  final Batch? batch;
  const BatchFormScreen({super.key, this.batch});

  @override
  ConsumerState<BatchFormScreen> createState() => _BatchFormScreenState();
}

class _BatchFormScreenState extends ConsumerState<BatchFormScreen> {
  final _formKey = GlobalKey<FormState>();

  late TextEditingController _nameController;
  late TextEditingController _dflsController;
  late TextEditingController _dflPriceController;
  late TextEditingController _durationController;
  late TextEditingController _supplierController;
  late TextEditingController _varietyController;
  late TextEditingController _mulberryController;
  late TextEditingController _rearingHouseController;
  late TextEditingController _notesController;

  DateTime _startDate = DateTime.now();
  InstarStage _currentStage = InstarStage.second; // Default to 2nd stage (Chawki)
  BatchStatus _status = BatchStatus.active;
  bool _recordDflExpense = true;
  bool _isSaving = false;

  static const List<String> kCrcSuppliers = [
    'Govt Chawki Rearing Center (CRC)',
    'National Silkworm Seed Organization (NSSO)',
    'Central Silk Board (CSB) Grainage',
    'Sri Lakshmi Chawki Center',
    'Venkateshwara CRC',
    'Local Certified CRC',
  ];

  static const List<String> kSilkwormVarieties = [
    'Bivoltine Double Hybrid (FC1 x FC2)',
    'Cross Breed (CB / PM x CSR2)',
    'CSR2 x CSR4 (Bivoltine)',
    'Pure Mysore (PM)',
    'Double Hybrid (CSR16 x CSR17)',
  ];

  static const List<String> kMulberryVarieties = [
    'V-1 (Victory-1)',
    'G-4',
    'K-2 (M5)',
    'S-36',
    'Local Mulberry',
  ];

  @override
  void initState() {
    super.initState();
    final initialDuration = widget.batch != null
        ? widget.batch!.expectedHarvestDate.difference(widget.batch!.startDate).inDays
        : 28;

    _nameController = TextEditingController(text: widget.batch?.batchName ?? '');
    _dflsController = TextEditingController(text: widget.batch?.numberOfDfls.toString() ?? '300');
    _dflPriceController = TextEditingController(text: widget.batch?.dflPrice?.toString() ?? '15');
    _durationController = TextEditingController(text: initialDuration > 0 ? initialDuration.toString() : '28');
    _supplierController = TextEditingController(text: widget.batch?.eggSource ?? kCrcSuppliers.first);
    _varietyController = TextEditingController(text: widget.batch?.silkwormVariety ?? kSilkwormVarieties.first);
    _mulberryController = TextEditingController(text: widget.batch?.mulberryVariety ?? 'V-1');
    _rearingHouseController = TextEditingController(text: widget.batch?.rearingHouse ?? 'Main Rearing House');
    _notesController = TextEditingController(text: widget.batch?.notes ?? '');

    if (widget.batch != null) {
      _startDate = widget.batch!.startDate;
      _currentStage = widget.batch!.currentStage;
      _status = widget.batch!.status;
      _recordDflExpense = false;
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _dflsController.dispose();
    _dflPriceController.dispose();
    _durationController.dispose();
    _supplierController.dispose();
    _varietyController.dispose();
    _mulberryController.dispose();
    _rearingHouseController.dispose();
    _notesController.dispose();
    super.dispose();
  }

  int get _dfls => int.tryParse(_dflsController.text) ?? 0;
  double get _dflPrice => double.tryParse(_dflPriceController.text) ?? 0.0;
  int get _durationDays => int.tryParse(_durationController.text) ?? 28;
  double get _totalDflCost => _dfls * _dflPrice;

  String _getStageLabel(InstarStage stage) {
    switch (stage) {
      case InstarStage.first:
        return '1st Stage (Chawki)';
      case InstarStage.second:
        return '2nd Stage (Chawki - Standard)';
      case InstarStage.third:
        return '3rd Stage (Late Age Rearing)';
      case InstarStage.fourth:
        return '4th Stage (Late Age Rearing)';
      case InstarStage.fifth:
        return '5th Stage (Mounting / Spinning)';
      case InstarStage.spinning:
        return 'Spinning & Cocooning Stage';
    }
  }

  Future<void> _deleteBatch() async {
    if (widget.batch == null) return;
    final confirm = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Delete / Terminate Batch?'),
        content: Text('Are you sure you want to delete ${widget.batch!.batchName}? All linked records and timeline data will be removed.'),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx, false), child: const Text('Cancel')),
          FilledButton(
            style: FilledButton.styleFrom(backgroundColor: AppColorScheme.error),
            onPressed: () => Navigator.pop(ctx, true),
            child: const Text('Delete Batch'),
          ),
        ],
      ),
    );

    if (confirm == true && mounted) {
      setState(() => _isSaving = true);
      await ref.read(batchNotifierProvider.notifier).deleteBatch(widget.batch!.id);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Batch ${widget.batch!.batchName} deleted.')),
        );
        context.pop();
      }
    }
  }

  Future<void> _save() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isSaving = true);
    try {
      final batchId = widget.batch?.id ?? const Uuid().v4();
      final batch = Batch(
        id: batchId,
        batchName: _nameController.text.trim(),
        startDate: _startDate,
        expectedHarvestDate: _startDate.add(Duration(days: _durationDays > 0 ? _durationDays : 28)),
        actualHarvestDate: widget.batch?.actualHarvestDate,
        silkwormVariety: _varietyController.text.trim(),
        eggSource: _supplierController.text.trim(),
        numberOfDfls: _dfls,
        dflPrice: _dflPrice > 0 ? _dflPrice : null,
        mulberryVariety: _mulberryController.text.trim(),
        rearingHouse: _rearingHouseController.text.trim(),
        currentStage: _currentStage,
        currentAgeDays: widget.batch?.currentAgeDays ?? 1,
        status: _status,
        healthStatus: widget.batch?.healthStatus ?? HealthStatus.good,
        temperature: widget.batch?.temperature ?? 25.0,
        humidity: widget.batch?.humidity ?? 75.0,
        notes: _notesController.text.isEmpty ? null : _notesController.text.trim(),
      );

      final notifier = ref.read(batchNotifierProvider.notifier);
      bool success;
      if (widget.batch == null) {
        success = await notifier.addBatch(batch);

        // Record initial DFL purchase expense if selected
        if (success && _recordDflExpense && _totalDflCost > 0) {
          final db = ref.read(appDatabaseProvider);
          await db.into(db.expensesTable).insert(
            ExpenseDbModel(
              id: const Uuid().v4(),
              amount: _totalDflCost,
              quantity: _dfls.toDouble(),
              date: _startDate,
              categoryId: 'c1', // DFL Cost
              paymentMethod: 'Cash',
              description: 'DFL Purchase: $_dfls DFLs @ ₹${_dflPrice.toStringAsFixed(1)} from ${_supplierController.text}',
              batchId: batchId,
            ),
            mode: InsertMode.insertOrIgnore,
          );
          ref.read(expenseNotifierProvider.notifier).loadExpenses();
        }

        // Insert initial timeline event
        final db = ref.read(appDatabaseProvider);
        await db.batchDao.insertTimelineEvent(
          BatchTimelineDbModel(
            id: const Uuid().v4(),
            batchId: batchId,
            timestamp: _startDate,
            eventType: 'Batch Started',
            description: 'Started batch ${_nameController.text} with $_dfls DFLs (${_varietyController.text}) from ${_supplierController.text}.',
          ),
        );
      } else {
        success = await notifier.updateBatch(batch, widget.batch!);
      }

      ref.read(dashboardAggregatorProvider.notifier).loadDashboard();
      ref.read(reportsNotifierProvider.notifier).loadReports();

      if (success && mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: AppColorScheme.forestGreen,
            content: Text('✓ Batch ${batch.batchName} saved successfully!'),
          ),
        );
        context.pop();
      } else if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Failed to save batch.')),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: $e')),
        );
      }
    } finally {
      if (mounted) setState(() => _isSaving = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final isNew = widget.batch == null;
    final nextNumber = ref.watch(nextBatchNumberProvider);
    if (isNew && _nameController.text.isEmpty) {
      _nameController.text = 'Batch $nextNumber';
    }

    final currency = NumberFormat.currency(symbol: '₹', decimalDigits: 0, locale: 'en_IN');

    return BaseScaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(isNew ? 'Start New Batch' : 'Edit Batch'),
        backgroundColor: Colors.white,
        foregroundColor: const Color(0xFF1E293B),
        elevation: 0,
        actions: [
          if (!isNew)
            IconButton(
              icon: const Icon(Icons.delete_outline, color: AppColorScheme.error),
              tooltip: 'Delete Batch',
              onPressed: _deleteBatch,
            ),
        ],
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(AppSpacing.md),
          children: [
            // Batch Name & Start Date
            TextFormField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'Batch Number / Name *',
                prefixIcon: const Icon(Icons.layers_outlined, color: AppColorScheme.primary),
                filled: true,
                fillColor: const Color(0xFFF8FAFC),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: const BorderSide(color: Color(0xFFE2E8F0))),
                enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: const BorderSide(color: Color(0xFFE2E8F0))),
              ),
              validator: (v) => (v == null || v.trim().isEmpty) ? 'Batch name required' : null,
            ),
            const SizedBox(height: AppSpacing.md),

            // Start Date picker
            InkWell(
              onTap: () async {
                final picked = await showDatePicker(
                  context: context,
                  initialDate: _startDate,
                  firstDate: DateTime(2020),
                  lastDate: DateTime.now().add(const Duration(days: 90)),
                );
                if (picked != null) setState(() => _startDate = picked);
              },
              borderRadius: BorderRadius.circular(12),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
                decoration: BoxDecoration(
                  color: const Color(0xFFF8FAFC),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: const Color(0xFFE2E8F0)),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.calendar_today, color: AppColorScheme.primary, size: 20),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Start Date', style: TextStyle(fontSize: 11, color: Color(0xFF64748B))),
                          Text(DateFormat('dd MMMM yyyy').format(_startDate), style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14)),
                        ],
                      ),
                    ),
                    const Icon(Icons.arrow_drop_down, color: Color(0xFF64748B)),
                  ],
                ),
              ),
            ),
            const SizedBox(height: AppSpacing.md),

            // DFL Quantity & Price / DFL
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: _dflsController,
                    decoration: InputDecoration(
                      labelText: 'DFL Quantity *',
                      prefixIcon: const Icon(Icons.egg_outlined, color: AppColorScheme.primary),
                      filled: true,
                      fillColor: const Color(0xFFF8FAFC),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: const BorderSide(color: Color(0xFFE2E8F0))),
                      enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: const BorderSide(color: Color(0xFFE2E8F0))),
                    ),
                    keyboardType: TextInputType.number,
                    onChanged: (_) => setState(() {}),
                    validator: (v) => (int.tryParse(v ?? '') ?? 0) <= 0 ? 'Enter valid DFLs' : null,
                  ),
                ),
                const SizedBox(width: AppSpacing.sm),
                Expanded(
                  child: TextFormField(
                    controller: _dflPriceController,
                    decoration: InputDecoration(
                      labelText: 'Rate / DFL (₹)',
                      prefixIcon: const Icon(Icons.currency_rupee, color: AppColorScheme.primary),
                      filled: true,
                      fillColor: const Color(0xFFF8FAFC),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: const BorderSide(color: Color(0xFFE2E8F0))),
                      enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: const BorderSide(color: Color(0xFFE2E8F0))),
                    ),
                    keyboardType: const TextInputType.numberWithOptions(decimal: true),
                    onChanged: (_) => setState(() {}),
                  ),
                ),
              ],
            ),
            const SizedBox(height: AppSpacing.sm),

            // Calculated DFL Cost banner
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
              decoration: BoxDecoration(
                color: const Color(0xFFF0FDF4),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: const Color(0xFF86EFAC)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Total DFL Cost:', style: TextStyle(color: Color(0xFF166534), fontWeight: FontWeight.w600)),
                  Text(
                    currency.format(_totalDflCost),
                    style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 16, color: Color(0xFF166534)),
                  ),
                ],
              ),
            ),
            if (isNew) ...[
              CheckboxListTile(
                value: _recordDflExpense,
                title: const Text('Record as initial batch expense', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500)),
                subtitle: const Text('Automatically logs DFL purchase into batch expense ledger', style: TextStyle(fontSize: 11, color: Color(0xFF64748B))),
                contentPadding: EdgeInsets.zero,
                activeColor: AppColorScheme.primary,
                onChanged: (v) => setState(() => _recordDflExpense = v ?? true),
              ),
            ],
            const SizedBox(height: AppSpacing.md),

            // Supplier / CRC Dropdown with editable value
            DropdownButtonFormField<String>(
              initialValue: kCrcSuppliers.contains(_supplierController.text) ? _supplierController.text : null,
              decoration: InputDecoration(
                labelText: 'Egg Source / CRC Supplier',
                prefixIcon: const Icon(Icons.store_outlined, color: AppColorScheme.primary),
                filled: true,
                fillColor: const Color(0xFFF8FAFC),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: const BorderSide(color: Color(0xFFE2E8F0))),
                enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: const BorderSide(color: Color(0xFFE2E8F0))),
              ),
              items: kCrcSuppliers.map((s) => DropdownMenuItem(value: s, child: Text(s, style: const TextStyle(fontSize: 13)))).toList(),
              onChanged: (v) {
                if (v != null) setState(() => _supplierController.text = v);
              },
            ),
            const SizedBox(height: AppSpacing.md),

            // Silkworm Variety Dropdown
            DropdownButtonFormField<String>(
              initialValue: kSilkwormVarieties.contains(_varietyController.text) ? _varietyController.text : kSilkwormVarieties.first,
              decoration: InputDecoration(
                labelText: 'Silkworm Variety',
                prefixIcon: const Icon(Icons.spa_outlined, color: AppColorScheme.primary),
                filled: true,
                fillColor: const Color(0xFFF8FAFC),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: const BorderSide(color: Color(0xFFE2E8F0))),
                enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: const BorderSide(color: Color(0xFFE2E8F0))),
              ),
              items: kSilkwormVarieties.map((v) => DropdownMenuItem(value: v, child: Text(v, style: const TextStyle(fontSize: 13)))).toList(),
              onChanged: (v) {
                if (v != null) setState(() => _varietyController.text = v);
              },
            ),
            const SizedBox(height: AppSpacing.md),

            // Mulberry Variety (Default V-1)
            DropdownButtonFormField<String>(
              initialValue: kMulberryVarieties.contains(_mulberryController.text) ? _mulberryController.text : 'V-1 (Victory-1)',
              decoration: InputDecoration(
                labelText: 'Mulberry Leaf Variety',
                prefixIcon: const Icon(Icons.eco_outlined, color: AppColorScheme.primary),
                filled: true,
                fillColor: const Color(0xFFF8FAFC),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: const BorderSide(color: Color(0xFFE2E8F0))),
                enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: const BorderSide(color: Color(0xFFE2E8F0))),
              ),
              items: kMulberryVarieties.map((m) => DropdownMenuItem(value: m, child: Text(m, style: const TextStyle(fontSize: 13)))).toList(),
              onChanged: (v) {
                if (v != null) setState(() => _mulberryController.text = v);
              },
            ),
            const SizedBox(height: AppSpacing.md),

            // Current Stage (Default 2nd Stage Chawki) & Status
            Row(
              children: [
                Expanded(
                  flex: 3,
                  child: DropdownButtonFormField<InstarStage>(
                    initialValue: _currentStage,
                    decoration: InputDecoration(
                      labelText: 'Current Stage',
                      filled: true,
                      fillColor: const Color(0xFFF8FAFC),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: const BorderSide(color: Color(0xFFE2E8F0))),
                      enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: const BorderSide(color: Color(0xFFE2E8F0))),
                    ),
                    items: InstarStage.values.map((s) => DropdownMenuItem(value: s, child: Text(_getStageLabel(s), style: const TextStyle(fontSize: 12)))).toList(),
                    onChanged: (v) => setState(() => _currentStage = v!),
                  ),
                ),
                const SizedBox(width: AppSpacing.sm),
                Expanded(
                  flex: 2,
                  child: DropdownButtonFormField<BatchStatus>(
                    initialValue: _status,
                    decoration: InputDecoration(
                      labelText: 'Status',
                      filled: true,
                      fillColor: const Color(0xFFF8FAFC),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: const BorderSide(color: Color(0xFFE2E8F0))),
                      enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: const BorderSide(color: Color(0xFFE2E8F0))),
                    ),
                    items: const [
                      DropdownMenuItem(value: BatchStatus.active, child: Text('Active', style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: Color(0xFF15803D)))),
                      DropdownMenuItem(value: BatchStatus.planned, child: Text('Planned', style: TextStyle(fontSize: 13, color: Color(0xFF2563EB)))),
                      DropdownMenuItem(value: BatchStatus.completed, child: Text('Completed', style: TextStyle(fontSize: 13, color: Color(0xFF4B5563)))),
                      DropdownMenuItem(value: BatchStatus.cancelled, child: Text('Cancelled', style: TextStyle(fontSize: 13, color: Color(0xFFDC2626)))),
                    ],
                    onChanged: (v) => setState(() => _status = v!),
                  ),
                ),
              ],
            ),
            const SizedBox(height: AppSpacing.md),

            // Rearing House
            TextFormField(
              controller: _rearingHouseController,
              decoration: InputDecoration(
                labelText: 'Rearing House / Shed',
                prefixIcon: const Icon(Icons.warehouse_outlined, color: AppColorScheme.primary),
                filled: true,
                fillColor: const Color(0xFFF8FAFC),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: const BorderSide(color: Color(0xFFE2E8F0))),
                enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: const BorderSide(color: Color(0xFFE2E8F0))),
              ),
            ),
            const SizedBox(height: AppSpacing.md),

            // Notes
            TextFormField(
              controller: _notesController,
              decoration: InputDecoration(
                labelText: 'Additional Notes / Batch Info',
                prefixIcon: const Icon(Icons.note_alt_outlined, color: AppColorScheme.primary),
                filled: true,
                fillColor: const Color(0xFFF8FAFC),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: const BorderSide(color: Color(0xFFE2E8F0))),
                enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: const BorderSide(color: Color(0xFFE2E8F0))),
              ),
              maxLines: 2,
            ),
            const SizedBox(height: AppSpacing.xl),

            // Action Button
            SizedBox(
              width: double.infinity,
              height: 52,
              child: FilledButton(
                onPressed: _isSaving ? null : _save,
                style: FilledButton.styleFrom(
                  backgroundColor: AppColorScheme.primary,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                ),
                child: _isSaving
                    ? const CircularProgressIndicator(color: Colors.white)
                    : Text(
                        isNew ? 'START REARING BATCH' : 'UPDATE BATCH',
                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15, letterSpacing: 0.3),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
