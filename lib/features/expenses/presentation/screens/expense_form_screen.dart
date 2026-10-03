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

    final isDark = Theme.of(context).brightness == Brightness.dark;

    return BaseScaffold(
      appBar: AppBar(
        title: Text(
          isEditing ? 'Edit Expense' : 'Add Expense',
          style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 18),
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
            child: FilledButton(
              onPressed: _save,
              style: FilledButton.styleFrom(
                backgroundColor: AppColorScheme.primary,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppRadius.sm)),
              ),
              child: const Text('Save Expense', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            ),
          ),
        ),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.fromLTRB(AppSpacing.md, AppSpacing.xs, AppSpacing.md, 40),
          children: [
            // Batch Dropdown Selector
            Text('Batch', style: TextStyle(fontSize: 12, color: Colors.grey.shade700, fontWeight: FontWeight.w600)),
            const SizedBox(height: 4),
            DropdownButtonFormField<String>(
              initialValue: _selectedBatchId,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                prefixIcon: const Icon(Icons.layers_outlined, size: 20),
                contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(AppRadius.sm), borderSide: const BorderSide(color: AppColorScheme.cardBorderLight)),
                enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(AppRadius.sm), borderSide: const BorderSide(color: AppColorScheme.cardBorderLight)),
              ),
              items: allBatches.map((b) {
                final isCurrent = activeBatch?.id == b.id;
                return DropdownMenuItem(
                  value: b.id,
                  child: Text('${b.batchName} (${b.numberOfDfls} DFLs) ${isCurrent ? '• Active' : ''}', style: const TextStyle(fontSize: 13)),
                );
              }).toList(),
              onChanged: (v) => setState(() => _selectedBatchId = v),
              validator: (v) => v == null ? 'Please select a batch' : null,
            ),
            const SizedBox(height: AppSpacing.md),

            // Category Selection Grid (Matching Screen 6)
            Text('Category', style: TextStyle(fontSize: 12, color: Colors.grey.shade700, fontWeight: FontWeight.w600)),
            const SizedBox(height: 6),
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 3,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              childAspectRatio: 1.25,
              children: [
                _categoryTile('c1', 'DFL', Icons.egg_outlined, const Color(0xFFF0FDF4), const Color(0xFF2E7D32)),
                _categoryTile('c2', 'Feed', Icons.eco_outlined, const Color(0xFFE8F8F5), const Color(0xFF00897B)),
                _categoryTile('c6', 'Medicine', Icons.medication_outlined, const Color(0xFFFEF9C3), const Color(0xFFD97706)),
                _categoryTile('c4', 'Labour', Icons.people_outline, const Color(0xFFF0F7FF), const Color(0xFF1E88E5)),
                _categoryTile('c7', 'Transport', Icons.local_shipping_outlined, const Color(0xFFFFF7ED), const Color(0xFFEA580C)),
                _categoryTile('c10', 'Other', Icons.more_horiz, const Color(0xFFFAF5FF), const Color(0xFF9333EA)),
              ],
            ),
            const SizedBox(height: AppSpacing.md),

            // Worker selection if Labour category chosen
            if (isLabour && workers.isNotEmpty) ...[
              Text('Worker', style: TextStyle(fontSize: 12, color: Colors.grey.shade700, fontWeight: FontWeight.w600)),
              const SizedBox(height: 4),
              DropdownButtonFormField<LabourWorker>(
                initialValue: _selectedWorker ?? workers.first,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  prefixIcon: const Icon(Icons.person_outline, size: 20),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(AppRadius.sm), borderSide: const BorderSide(color: AppColorScheme.cardBorderLight)),
                  enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(AppRadius.sm), borderSide: const BorderSide(color: AppColorScheme.cardBorderLight)),
                ),
                hint: const Text('Select Worker', style: TextStyle(fontSize: 13)),
                items: workers.map((w) => DropdownMenuItem(value: w, child: Text(w.fullName, style: const TextStyle(fontSize: 13)))).toList(),
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

            // Amount & Date Side-by-Side
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Amount (₹)', style: TextStyle(fontSize: 12, color: Colors.grey.shade700, fontWeight: FontWeight.w600)),
                      const SizedBox(height: 4),
                      TextFormField(
                        controller: _amountController,
                        keyboardType: const TextInputType.numberWithOptions(decimal: true),
                        decoration: InputDecoration(
                          hintText: '0',
                          prefixText: '₹ ',
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(AppRadius.sm), borderSide: const BorderSide(color: AppColorScheme.cardBorderLight)),
                          enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(AppRadius.sm), borderSide: const BorderSide(color: AppColorScheme.cardBorderLight)),
                        ),
                        validator: (v) => (double.tryParse(v ?? '') ?? 0) <= 0 ? 'Enter amount' : null,
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: AppSpacing.md),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Date', style: TextStyle(fontSize: 12, color: Colors.grey.shade700, fontWeight: FontWeight.w600)),
                      const SizedBox(height: 4),
                      InkWell(
                        onTap: () async {
                          final d = await showDatePicker(
                            context: context,
                            initialDate: _selectedDate,
                            firstDate: DateTime(2020),
                            lastDate: DateTime.now().add(const Duration(days: 30)),
                          );
                          if (d != null) setState(() => _selectedDate = d);
                        },
                        child: Container(
                          height: 48,
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(AppRadius.sm),
                            border: Border.all(color: AppColorScheme.cardBorderLight),
                          ),
                          child: Row(
                            children: [
                              const Icon(Icons.calendar_today_outlined, size: 16, color: Colors.grey),
                              const SizedBox(width: 8),
                              Text(DateFormat('dd MMM yyyy').format(_selectedDate), style: const TextStyle(fontSize: 13)),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: AppSpacing.md),

            // Notes (Optional)
            Text('Notes (Optional)', style: TextStyle(fontSize: 12, color: Colors.grey.shade700, fontWeight: FontWeight.w600)),
            const SizedBox(height: 4),
            TextFormField(
              controller: _descController,
              decoration: InputDecoration(
                hintText: 'e.g. 300 DFLs purchased from Mandi',
                filled: true,
                fillColor: Colors.white,
                contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(AppRadius.sm), borderSide: const BorderSide(color: AppColorScheme.cardBorderLight)),
                enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(AppRadius.sm), borderSide: const BorderSide(color: AppColorScheme.cardBorderLight)),
              ),
            ),
            const SizedBox(height: AppSpacing.xxl),
          ],
        ),
      ),
    );
  }

  Widget _categoryTile(String id, String label, IconData icon, Color bgColor, Color iconColor) {
    final isSelected = _selectedCategory?.id == id;

    return InkWell(
      onTap: () {
        final cat = _categories.firstWhere((c) => c.id == id, orElse: () => _categories[0]);
        setState(() => _selectedCategory = cat);
      },
      borderRadius: BorderRadius.circular(14),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: isSelected ? iconColor : Colors.transparent,
            width: isSelected ? 2.0 : 1.0,
          ),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: iconColor.withValues(alpha: 0.2),
                    blurRadius: 6,
                    offset: const Offset(0, 2),
                  )
                ]
              : null,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: iconColor, size: 22),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                fontSize: 12,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.w600,
                color: isSelected ? iconColor : Colors.grey.shade800,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
