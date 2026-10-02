import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';
import '../../../../shared/widgets/layout_components.dart';
import '../../../../core/theme/spacing.dart';
import '../../../../core/theme/radius.dart';
import '../../domain/entities/expense_entities.dart';
import '../../application/providers/expense_notifier.dart';

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

  final _paymentMethods = ['Cash', 'Bank Transfer', 'Credit Card', 'UPI'];

  final _categories = const [
    ExpenseCategory(id: 'c1', name: 'DFL Cost', colorCode: '#4CAF50', iconName: 'egg'),
    ExpenseCategory(id: 'c2', name: 'Mulberry Leaves', colorCode: '#8BC34A', iconName: 'eco'),
    ExpenseCategory(id: 'c3', name: 'Fertilizer', colorCode: '#FF9800', iconName: 'science'),
    ExpenseCategory(id: 'c4', name: 'Labour', colorCode: '#F44336', iconName: 'people'),
    ExpenseCategory(id: 'c5', name: 'Electricity', colorCode: '#FFEB3B', iconName: 'bolt'),
    ExpenseCategory(id: 'c6', name: 'Medicine', colorCode: '#E91E63', iconName: 'medical_services'),
    ExpenseCategory(id: 'c7', name: 'Transport', colorCode: '#2196F3', iconName: 'local_shipping'),
    ExpenseCategory(id: 'c8', name: 'Maintenance', colorCode: '#9E9E9E', iconName: 'build'),
    ExpenseCategory(id: 'c9', name: 'Equipment', colorCode: '#607D8B', iconName: 'handyman'),
    ExpenseCategory(id: 'c10', name: 'Other', colorCode: '#000000', iconName: 'more_horiz'),
  ];

  @override
  void initState() {
    super.initState();
    _amountController = TextEditingController(text: widget.expense?.amount.toString() ?? '');
    _quantityController = TextEditingController(text: widget.expense?.quantity?.toString() ?? '');
    _descController = TextEditingController(text: widget.expense?.description ?? '');
    _notesController = TextEditingController(text: widget.expense?.receiptUrl ?? '');
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
      final expense = Expense(
        id: widget.expense?.id ?? const Uuid().v4(),
        amount: amount,
        quantity: quantity,
        date: _selectedDate,
        category: _selectedCategory ?? _categories[0],
        paymentMethod: _paymentMethod,
        description: _descController.text,
        batchId: widget.expense?.batchId,
      );

      final success = await ref.read(expenseNotifierProvider.notifier).addExpense(expense);
      if (mounted) {
        if (success) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Expense saved successfully!')),
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
    final isWide = MediaQuery.of(context).size.width > 600;

    return BaseScaffold(
      appBar: AppBar(
        title: Text(isEditing ? 'Edit Expense' : 'Add Expense'),
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: isWide ? 600 : double.infinity),
          child: Form(
            key: _formKey,
            child: ListView(
              padding: const EdgeInsets.all(AppSpacing.md),
              children: [
                // Date picker trigger button
                InkWell(
                  onTap: () async {
                    final date = await showDatePicker(
                      context: context,
                      initialDate: _selectedDate,
                      firstDate: DateTime(2020),
                      lastDate: DateTime(2030),
                    );
                    if (date != null) {
                      setState(() => _selectedDate = date);
                    }
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md, vertical: 16),
                    decoration: BoxDecoration(
                      color: Colors.grey.withValues(alpha: 0.05),
                      borderRadius: BorderRadius.circular(AppRadius.md),
                      border: Border.all(color: Colors.grey.shade300),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          DateFormat('dd MMM yyyy').format(_selectedDate),
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        const Icon(Icons.calendar_today, size: 20, color: Color(0xFF2E7D32)),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: AppSpacing.md),

                 // Category Dropdown
                DropdownButtonFormField<ExpenseCategory>(
                  initialValue: _selectedCategory,
                  decoration: const InputDecoration(
                    labelText: 'Category',
                    border: OutlineInputBorder(),
                  ),
                  items: _categories.map((c) {
                    return DropdownMenuItem(
                      value: c,
                      child: Text(c.name),
                    );
                  }).toList(),
                  onChanged: (val) {
                    if (val != null) setState(() => _selectedCategory = val);
                  },
                ),
                const SizedBox(height: AppSpacing.md),

                // Amount
                TextFormField(
                  controller: _amountController,
                  decoration: const InputDecoration(
                    labelText: 'Amount (₹)',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: const TextInputType.numberWithOptions(decimal: true),
                  validator: (value) {
                    if (value == null || value.isEmpty) return 'Required';
                    if (double.tryParse(value) == null) return 'Invalid amount';
                    return null;
                  },
                ),
                const SizedBox(height: AppSpacing.md),

                // Quantity
                TextFormField(
                  controller: _quantityController,
                  decoration: InputDecoration(
                    labelText: _selectedCategory?.name == 'DFL Cost' ? 'Quantity (DFLs)' : 'Quantity (Optional)',
                    border: const OutlineInputBorder(),
                  ),
                  keyboardType: const TextInputType.numberWithOptions(decimal: true),
                ),
                const SizedBox(height: AppSpacing.md),

                // Payment Method
                DropdownButtonFormField<String>(
                  initialValue: _paymentMethod,
                  decoration: const InputDecoration(
                    labelText: 'Payment Mode',
                    border: OutlineInputBorder(),
                  ),
                  items: _paymentMethods.map((m) {
                    return DropdownMenuItem(
                      value: m,
                      child: Text(m),
                    );
                  }).toList(),
                  onChanged: (val) {
                    if (val != null) setState(() => _paymentMethod = val);
                  },
                ),
                const SizedBox(height: AppSpacing.md),

                // Description
                TextFormField(
                  controller: _descController,
                  decoration: const InputDecoration(
                    labelText: 'Description',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) return 'Required';
                    return null;
                  },
                ),
                const SizedBox(height: AppSpacing.md),

                // Note
                TextFormField(
                  controller: _notesController,
                  decoration: const InputDecoration(
                    labelText: 'Note (Optional)',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: AppSpacing.xl),

                // Save button
                ElevatedButton(
                  onPressed: _save,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF2E7D32),
                    minimumSize: const Size(double.infinity, 56),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(AppRadius.md),
                    ),
                  ),
                  child: Text(
                    isEditing ? 'Save Changes' : 'Save Expense',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
