import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';
import 'package:drift/drift.dart' hide Column, Batch;
import '../../../../shared/widgets/layout_components.dart';
import '../../../../core/theme/spacing.dart';
import '../../../../core/theme/radius.dart';
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
  late TextEditingController _supplierController;
  late TextEditingController _varietyController;
  late TextEditingController _mulberryController;
  late TextEditingController _rearingHouseController;
  late TextEditingController _tempController;
  late TextEditingController _humController;
  late TextEditingController _notesController;

  DateTime _startDate = DateTime.now();
  InstarStage _currentStage = InstarStage.first;
  BatchStatus _status = BatchStatus.active;
  bool _recordDflExpense = true;
  bool _isSaving = false;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.batch?.batchName ?? '');
    _dflsController = TextEditingController(text: widget.batch?.numberOfDfls.toString() ?? '300');
    _dflPriceController = TextEditingController(text: widget.batch?.dflPrice?.toString() ?? '15');
    _supplierController = TextEditingController(text: widget.batch?.eggSource ?? 'Govt CRC (Chawki Rearing Center)');
    _varietyController = TextEditingController(text: widget.batch?.silkwormVariety ?? 'CSR2');
    _mulberryController = TextEditingController(text: widget.batch?.mulberryVariety ?? 'V1');
    _rearingHouseController = TextEditingController(text: widget.batch?.rearingHouse ?? 'Main House');
    _tempController = TextEditingController(text: widget.batch?.temperature.toString() ?? '25.0');
    _humController = TextEditingController(text: widget.batch?.humidity.toString() ?? '75.0');
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
    _supplierController.dispose();
    _varietyController.dispose();
    _mulberryController.dispose();
    _rearingHouseController.dispose();
    _tempController.dispose();
    _humController.dispose();
    _notesController.dispose();
    super.dispose();
  }

  int get _dfls => int.tryParse(_dflsController.text) ?? 0;
  double get _dflPrice => double.tryParse(_dflPriceController.text) ?? 0.0;
  double get _totalDflCost => _dfls * _dflPrice;

  Future<void> _save() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isSaving = true);
    try {
      final batchId = widget.batch?.id ?? const Uuid().v4();
      final batch = Batch(
        id: batchId,
        batchName: _nameController.text.trim(),
        startDate: _startDate,
        expectedHarvestDate: _startDate.add(const Duration(days: 28)),
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
        temperature: double.tryParse(_tempController.text) ?? 25.0,
        humidity: double.tryParse(_humController.text) ?? 75.0,
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
              description: 'DFL Purchase - $_dfls DFLs @ ₹${_dflPrice.toStringAsFixed(1)} from ${_supplierController.text}',
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
            backgroundColor: AppColorScheme.success,
            content: Text('✓ Batch ${batch.batchName} created successfully!'),
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
      appBar: AppBar(
        title: Text(isNew ? 'Start New Batch' : 'Edit Batch'),
        backgroundColor: AppColorScheme.primary,
        foregroundColor: Colors.white,
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(AppSpacing.md),
          children: [
            // Header Card
            Card(
              elevation: 0,
              color: AppColorScheme.primaryContainer.withValues(alpha: 0.35),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppRadius.md),
                side: BorderSide(color: AppColorScheme.primaryLight.withValues(alpha: 0.3)),
              ),
              child: Padding(
                padding: const EdgeInsets.all(AppSpacing.md),
                child: Row(
                  children: [
                    const CircleAvatar(
                      backgroundColor: AppColorScheme.primaryLight,
                      child: Icon(Icons.egg_outlined, color: Colors.white),
                    ),
                    const SizedBox(width: AppSpacing.md),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            isNew ? 'New Rearing Cycle' : 'Update Rearing Batch',
                            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            isNew ? 'Enter DFL details to begin tracking this batch.' : 'Edit batch parameters.',
                            style: TextStyle(fontSize: 12, color: Colors.grey.shade700),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: AppSpacing.lg),

            // Batch Name & Start Date
            TextFormField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: 'Batch Number / Name',
                prefixIcon: Icon(Icons.tag),
                border: OutlineInputBorder(),
              ),
              validator: (v) => (v == null || v.trim().isEmpty) ? 'Batch name required' : null,
            ),
            const SizedBox(height: AppSpacing.md),

            ListTile(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppRadius.md),
                side: BorderSide(color: Colors.grey.shade300),
              ),
              leading: const Icon(Icons.calendar_today, color: AppColorScheme.primaryLight),
              title: const Text('Start Date'),
              subtitle: Text(DateFormat('dd MMMM yyyy').format(_startDate)),
              trailing: const Icon(Icons.edit, size: 18),
              onTap: () async {
                final picked = await showDatePicker(
                  context: context,
                  initialDate: _startDate,
                  firstDate: DateTime(2020),
                  lastDate: DateTime.now().add(const Duration(days: 30)),
                );
                if (picked != null) setState(() => _startDate = picked);
              },
            ),
            const SizedBox(height: AppSpacing.md),

            // DFLs & Price
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: _dflsController,
                    decoration: const InputDecoration(
                      labelText: 'DFL Quantity',
                      prefixIcon: Icon(Icons.numbers),
                      border: OutlineInputBorder(),
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
                    decoration: const InputDecoration(
                      labelText: 'Price / DFL (₹)',
                      prefixIcon: Icon(Icons.currency_rupee),
                      border: OutlineInputBorder(),
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
              padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md, vertical: AppSpacing.sm),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(AppRadius.sm),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Total DFL Cost:'),
                  Text(
                    currency.format(_totalDflCost),
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: AppColorScheme.primary),
                  ),
                ],
              ),
            ),
            if (isNew) ...[
              CheckboxListTile(
                value: _recordDflExpense,
                title: const Text('Record as initial batch expense', style: TextStyle(fontSize: 13)),
                subtitle: const Text('Automatically logs DFL purchase into batch expense ledger', style: TextStyle(fontSize: 11)),
                contentPadding: EdgeInsets.zero,
                onChanged: (v) => setState(() => _recordDflExpense = v ?? true),
              ),
            ],
            const SizedBox(height: AppSpacing.md),

            // Supplier / CRC
            TextFormField(
              controller: _supplierController,
              decoration: const InputDecoration(
                labelText: 'Egg Source / CRC Supplier',
                prefixIcon: Icon(Icons.business),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: AppSpacing.md),

            // Silkworm Variety & Mulberry
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: _varietyController,
                    decoration: const InputDecoration(labelText: 'Silkworm Variety', border: OutlineInputBorder()),
                  ),
                ),
                const SizedBox(width: AppSpacing.sm),
                Expanded(
                  child: TextFormField(
                    controller: _mulberryController,
                    decoration: const InputDecoration(labelText: 'Mulberry Variety', border: OutlineInputBorder()),
                  ),
                ),
              ],
            ),
            const SizedBox(height: AppSpacing.md),

            // Rearing House
            TextFormField(
              controller: _rearingHouseController,
              decoration: const InputDecoration(
                labelText: 'Rearing Shed / House',
                prefixIcon: Icon(Icons.warehouse_outlined),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: AppSpacing.md),

            // Current Stage & Status
            Row(
              children: [
                Expanded(
                  child: DropdownButtonFormField<InstarStage>(
                    initialValue: _currentStage,
                    decoration: const InputDecoration(labelText: 'Current Stage', border: OutlineInputBorder()),
                    items: InstarStage.values.map((s) => DropdownMenuItem(value: s, child: Text(s.name.toUpperCase()))).toList(),
                    onChanged: (v) => setState(() => _currentStage = v!),
                  ),
                ),
                const SizedBox(width: AppSpacing.sm),
                Expanded(
                  child: DropdownButtonFormField<BatchStatus>(
                    initialValue: _status,
                    decoration: const InputDecoration(labelText: 'Status', border: OutlineInputBorder()),
                    items: BatchStatus.values.map((s) => DropdownMenuItem(value: s, child: Text(s.name.toUpperCase()))).toList(),
                    onChanged: (v) => setState(() => _status = v!),
                  ),
                ),
              ],
            ),
            const SizedBox(height: AppSpacing.md),

            // Notes
            TextFormField(
              controller: _notesController,
              decoration: const InputDecoration(
                labelText: 'Additional Notes',
                prefixIcon: Icon(Icons.note_alt_outlined),
                border: OutlineInputBorder(),
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
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppRadius.md)),
                ),
                child: _isSaving
                    ? const CircularProgressIndicator(color: Colors.white)
                    : Text(
                        isNew ? 'CREATE & START BATCH' : 'UPDATE BATCH',
                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
