import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';
import '../../../../shared/widgets/layout_components.dart';
import '../../../../core/theme/spacing.dart';
import '../../../../core/theme/radius.dart';
import '../../../../core/theme/color_scheme.dart';
import '../../domain/entities/expense_entities.dart';
import '../../application/providers/expense_notifier.dart';
import '../../../batches/application/providers/batch_notifier.dart';
import '../../../batches/application/providers/batch_state.dart';
import '../../../batches/domain/entities/batch_entities.dart';
import '../../../labour/application/providers/labour_notifier.dart';
import '../../../labour/application/providers/labour_state.dart';
import '../../../labour/domain/entities/labour_entities.dart';

class ExpenseFormScreen extends ConsumerStatefulWidget {
  final Expense? expense;
  final String? initialBatchId;

  const ExpenseFormScreen({super.key, this.expense, this.initialBatchId});

  @override
  ConsumerState<ExpenseFormScreen> createState() => _ExpenseFormScreenState();
}

class _ExpenseFormScreenState extends ConsumerState<ExpenseFormScreen> {
  final _formKey = GlobalKey<FormState>();

  late TextEditingController _amountController;
  late TextEditingController _quantityController;
  late TextEditingController _descController;
  late TextEditingController _notesController;
  DateTime _selectedDate = DateTime.now();
  String _paymentMethod = 'Cash';
  ExpenseCategory? _selectedCategory;
  String? _selectedBatchId;
  LabourWorker? _selectedWorker;

  final _paymentMethods = ['Cash', 'UPI', 'Bank Transfer', 'Credit Card'];

  final _categories = const [
    ExpenseCategory(id: 'c1', name: 'DFL Cost', colorCode: '#4CAF50', iconName: 'egg'),
    ExpenseCategory(id: 'c2', name: 'Mulberry Leaves', colorCode: '#8BC34A', iconName: 'eco'),
    ExpenseCategory(id: 'c3', name: 'Fertilizer & Chemicals', colorCode: '#FF9800', iconName: 'science'),
    ExpenseCategory(id: 'c4', name: 'Labour Wages', colorCode: '#F44336', iconName: 'people'),
    ExpenseCategory(id: 'c5', name: 'Electricity & Power', colorCode: '#FFEB3B', iconName: 'bolt'),
    ExpenseCategory(id: 'c6', name: 'Medicine & Disinfectant', colorCode: '#E91E63', iconName: 'medical_services'),
    ExpenseCategory(id: 'c7', name: 'Transport & Freight', colorCode: '#2196F3', iconName: 'local_shipping'),
    ExpenseCategory(id: 'c8', name: 'Maintenance & Repairs', colorCode: '#9E9E9E', iconName: 'build'),
    ExpenseCategory(id: 'c9', name: 'Equipment', colorCode: '#607D8B', iconName: 'handyman'),
    ExpenseCategory(id: 'c10', name: 'Other Farm Expense', colorCode: '#000000', iconName: 'more_horiz'),
  ];

  @override
  void initState() {
    super.initState();
    _amountController = TextEditingController(text: widget.expense?.amount.toString() ?? '');
    _quantityController = TextEditingController(text: widget.expense?.quantity?.toString() ?? '');
    _descController = TextEditingController(text: widget.expense?.description ?? '');
    _notesController = TextEditingController(text: widget.expense?.receiptUrl ?? '');
    _selectedBatchId = widget.expense?.batchId ?? widget.initialBatchId;

    if (widget.expense != null) {
      _selectedDate = widget.expense!.date;
      _paymentMethod = widget.expense!.paymentMethod;
      _selectedCategory = widget.expense!.category;
    } else {
      _selectedCategory = _categories[0];
    }
  }

  @override
  void dispose() {
    _amountController.dispose();
    _quantityController.dispose();
    _descController.dispose();
    _notesController.dispose();
    super.dispose();
  }

  void _save() async {
    if (_formKey.currentState!.validate()) {
      final amount = double.tryParse(_amountController.text) ?? 0.0;
      final quantity = double.tryParse(_quantityController.text);
      
      String desc = _descController.text.trim();
      if (desc.isEmpty) {
        if (_selectedCategory?.id == 'c4' && _selectedWorker != null) {
          desc = 'Labour: ${_selectedWorker!.fullName}';
        } else {
          desc = _selectedCategory?.name ?? 'Farm Expense';
        }
      }

      final expense = Expense(
        id: widget.expense?.id ?? const Uuid().v4(),
        amount: amount,
        quantity: quantity,
        date: _selectedDate,
        category: _selectedCategory ?? _categories[0],
        paymentMethod: _paymentMethod,
        description: desc,
        batchId: _selectedBatchId,
      );

      final success = await ref.read(expenseNotifierProvider.notifier).addExpense(expense);
      if (mounted) {
        if (success) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              backgroundColor: AppColorScheme.success,
              content: Text('✓ Expense saved successfully!'),
            ),
          );
          context.pop();
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Failed to save expense')),
          );
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final isEditing = widget.expense != null;
    final activeBatch = ref.watch(activeBatchProvider);
    final batchState = ref.watch(batchNotifierProvider);
    final allBatches = switch (batchState) {
      BatchStateData(batches: final list) => list,
      _ => <Batch>[],
    };

    if (_selectedBatchId == null && activeBatch != null) {
      _selectedBatchId = activeBatch.id;
    }

    final labourState = ref.watch(labourNotifierProvider);
    final workers = (labourState is LabourStateData) ? labourState.workers : <LabourWorker>[];

    final isLabour = _selectedCategory?.id == 'c4' || _selectedCategory?.name.toLowerCase().contains('labour') == true;

    return BaseScaffold(
      appBar: AppBar(
        title: Text(isEditing ? 'Edit Expense' : 'Add Expense'),
        backgroundColor: AppColorScheme.primary,
        foregroundColor: Colors.white,
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(AppSpacing.md),
          children: [
            // Batch Linkage
            DropdownButtonFormField<String>(
              initialValue: _selectedBatchId,
              decoration: const InputDecoration(
                labelText: 'Associated Batch',
                prefixIcon: Icon(Icons.egg_outlined),
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
            ),
            const SizedBox(height: AppSpacing.md),

            // Category Picker
            DropdownButtonFormField<ExpenseCategory>(
              initialValue: _selectedCategory,
              decoration: const InputDecoration(
                labelText: 'Expense Category',
                prefixIcon: Icon(Icons.category_outlined),
                border: OutlineInputBorder(),
              ),
              items: _categories.map((c) {
                return DropdownMenuItem(
                  value: c,
                  child: Text(c.name),
                );
              }).toList(),
              onChanged: (v) {
                setState(() {
                  _selectedCategory = v;
                  if (v?.id == 'c4' && workers.isNotEmpty) {
                    _selectedWorker = workers.first;
                    _amountController.text = _selectedWorker!.dailyWage.toStringAsFixed(0);
                    _descController.text = 'Labour: ${_selectedWorker!.fullName}';
                  }
                });
              },
            ),
            const SizedBox(height: AppSpacing.md),

            // Worker Selector if category is Labour
            if (isLabour && workers.isNotEmpty) ...[
              DropdownButtonFormField<LabourWorker>(
                initialValue: _selectedWorker ?? workers.first,
                decoration: const InputDecoration(
                  labelText: 'Select Farm Worker',
                  prefixIcon: Icon(Icons.person_outline),
                  border: OutlineInputBorder(),
                ),
                items: workers.map((w) {
                  return DropdownMenuItem(
                    value: w,
                    child: Text('${w.fullName} (₹${w.dailyWage.toStringAsFixed(0)}/day)'),
                  );
                }).toList(),
                onChanged: (w) {
                  if (w != null) {
                    setState(() {
                      _selectedWorker = w;
                      _amountController.text = w.dailyWage.toStringAsFixed(0);
                      _descController.text = 'Labour: ${w.fullName}';
                    });
                  }
                },
              ),
              const SizedBox(height: AppSpacing.md),
            ],

            // Amount & Quantity
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: TextFormField(
                    controller: _amountController,
                    decoration: const InputDecoration(
                      labelText: 'Amount (₹)',
                      prefixIcon: Icon(Icons.currency_rupee),
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: const TextInputType.numberWithOptions(decimal: true),
                    validator: (v) => (double.tryParse(v ?? '') ?? 0) <= 0 ? 'Enter valid amount' : null,
                  ),
                ),
                const SizedBox(width: AppSpacing.sm),
                Expanded(
                  child: TextFormField(
                    controller: _quantityController,
                    decoration: const InputDecoration(
                      labelText: 'Qty / Units',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: const TextInputType.numberWithOptions(decimal: true),
                  ),
                ),
              ],
            ),
            const SizedBox(height: AppSpacing.md),

            // Date
            ListTile(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppRadius.md),
                side: BorderSide(color: Colors.grey.shade300),
              ),
              leading: const Icon(Icons.calendar_today, color: AppColorScheme.primaryLight),
              title: const Text('Expense Date'),
              subtitle: Text(DateFormat('dd MMMM yyyy').format(_selectedDate)),
              trailing: const Icon(Icons.edit, size: 18),
              onTap: () async {
                final picked = await showDatePicker(
                  context: context,
                  initialDate: _selectedDate,
                  firstDate: DateTime(2020),
                  lastDate: DateTime.now().add(const Duration(days: 30)),
                );
                if (picked != null) setState(() => _selectedDate = picked);
              },
            ),
            const SizedBox(height: AppSpacing.md),

            // Description
            TextFormField(
              controller: _descController,
              decoration: const InputDecoration(
                labelText: 'Description / Purpose',
                prefixIcon: Icon(Icons.notes),
                border: OutlineInputBorder(),
              ),
              validator: (v) => (v == null || v.trim().isEmpty) ? 'Please enter description' : null,
            ),
            const SizedBox(height: AppSpacing.md),

            // Payment Method
            DropdownButtonFormField<String>(
              initialValue: _paymentMethod,
              decoration: const InputDecoration(
                labelText: 'Payment Method',
                prefixIcon: Icon(Icons.payment),
                border: OutlineInputBorder(),
              ),
              items: _paymentMethods.map((m) => DropdownMenuItem(value: m, child: Text(m))).toList(),
              onChanged: (v) => setState(() => _paymentMethod = v!),
            ),
            const SizedBox(height: AppSpacing.xl),

            // Save Button
            SizedBox(
              width: double.infinity,
              height: 52,
              child: FilledButton(
                onPressed: _save,
                style: FilledButton.styleFrom(
                  backgroundColor: AppColorScheme.primary,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppRadius.md)),
                ),
                child: const Text('SAVE EXPENSE', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
