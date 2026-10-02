import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';
import '../../../../shared/widgets/layout_components.dart';
import '../../../../core/theme/spacing.dart';
import '../../../../core/theme/radius.dart';
import '../../domain/entities/income_entities.dart';
import '../../application/services/income_validation_service.dart';
import '../../application/providers/income_notifier.dart';

class IncomeFormScreen extends ConsumerStatefulWidget {
  final Income? income;
  final String? initialBatchId;
  const IncomeFormScreen({super.key, this.income, this.initialBatchId});

  @override
  ConsumerState<IncomeFormScreen> createState() => _IncomeFormScreenState();
}

class _IncomeFormScreenState extends ConsumerState<IncomeFormScreen> {
  final _formKey = GlobalKey<FormState>();

  late TextEditingController _buyerController;
  late TextEditingController _qtyController;
  late TextEditingController _rateController;
  late TextEditingController _transportController;
  late TextEditingController _commissionController;
  late TextEditingController _remarksController;

  DateTime _selectedDate = DateTime.now();
  String _paymentMethod = 'Cash';
  String _paymentStatus = 'Paid';
  String _cocoonGrade = 'Bivoltine';
  IncomeCategory? _selectedCategory;

  final _paymentMethods = ['Cash', 'Bank Transfer', 'UPI'];
  final _paymentStatuses = ['Paid', 'Pending'];
  final _grades = ['Bivoltine', 'Multivoltine', 'Crossbreed'];

  final _categories = const [
    IncomeCategory(id: 'ic1', name: 'Cocoon Sales', colorCode: '#4CAF50', iconName: 'egg'),
    IncomeCategory(id: 'ic2', name: 'Silkworm Sales', colorCode: '#8BC34A', iconName: 'eco'),
    IncomeCategory(id: 'ic3', name: 'Govt. Subsidy', colorCode: '#FF9800', iconName: 'agriculture'),
    IncomeCategory(id: 'ic4', name: 'Other', colorCode: '#000000', iconName: 'monetization_on'),
  ];

  double _netAmount = 0.0;

  @override
  void initState() {
    super.initState();
    _buyerController = TextEditingController(text: widget.income?.buyer.name ?? '');
    _qtyController = TextEditingController(text: widget.income?.quantity.toString() ?? '');
    _rateController = TextEditingController(text: widget.income?.rate.toString() ?? '');
    _transportController = TextEditingController(text: widget.income?.transportCharges.toString() ?? '');
    _commissionController = TextEditingController(text: widget.income?.commission.toString() ?? '');
    _remarksController = TextEditingController(text: widget.income?.remarks ?? '');

    if (widget.income != null) {
      _selectedDate = widget.income!.saleDate;
      _paymentMethod = widget.income!.paymentMethod;
      _paymentStatus = widget.income!.paymentStatus;
      _cocoonGrade = widget.income!.cocoonGrade;
      _selectedCategory = _categories.firstWhere(
        (c) => c.id == widget.income!.category.id,
        orElse: () => _categories[0],
      );
    } else {
      _selectedCategory = _categories[0];
    }

    _qtyController.addListener(_calculateNet);
    _rateController.addListener(_calculateNet);
    _transportController.addListener(_calculateNet);
    _commissionController.addListener(_calculateNet);
    _calculateNet();
  }

  @override
  void dispose() {
    _buyerController.dispose();
    _qtyController.dispose();
    _rateController.dispose();
    _transportController.dispose();
    _commissionController.dispose();
    _remarksController.dispose();
    super.dispose();
  }

  void _calculateNet() {
    final qty = double.tryParse(_qtyController.text) ?? 0.0;
    final rate = double.tryParse(_rateController.text) ?? 0.0;
    final transport = double.tryParse(_transportController.text) ?? 0.0;
    final commission = double.tryParse(_commissionController.text) ?? 0.0;

    setState(() {
      _netAmount = IncomeValidationService.calculateNetAmount(
        quantity: qty,
        rate: rate,
        transportCharges: transport,
        commission: commission,
      );
    });
  }

  void _save() async {
    if (_formKey.currentState!.validate()) {
      final qty = double.tryParse(_qtyController.text) ?? 0.0;
      final rate = double.tryParse(_rateController.text) ?? 0.0;
      final transport = double.tryParse(_transportController.text) ?? 0.0;
      final commission = double.tryParse(_commissionController.text) ?? 0.0;

      final income = Income(
        id: widget.income?.id ?? const Uuid().v4(),
        saleDate: _selectedDate,
        category: _selectedCategory!,
        batchId: widget.income?.batchId ?? widget.initialBatchId ?? 'batch_1',
        buyer: Buyer(
          id: widget.income?.buyer.id ?? const Uuid().v4(),
          name: _buyerController.text,
          contact: widget.income?.buyer.contact ?? 'Direct',
        ),
        cocoonGrade: _cocoonGrade,
        quantity: qty,
        rate: rate,
        grossAmount: qty * rate,
        transportCharges: transport,
        commission: commission,
        netAmount: _netAmount,
        paymentMethod: _paymentMethod,
        paymentStatus: _paymentStatus,
        invoiceNumber: widget.income?.invoiceNumber ?? 'INV-${DateTime.now().millisecondsSinceEpoch ~/ 1000}',
        remarks: _remarksController.text.isEmpty ? null : _remarksController.text,
      );

      final error = await ref.read(incomeNotifierProvider.notifier).addIncome(income);
      if (mounted) {
        if (error == null) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Income saved successfully!')),
          );
          context.pop();
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Failed to save: $error')),
          );
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final isEditing = widget.income != null;
    final isWide = MediaQuery.of(context).size.width > 600;

    return BaseScaffold(
      appBar: AppBar(
        title: Text(isEditing ? 'Edit Income' : 'Record Income'),
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
                DropdownButtonFormField<IncomeCategory>(
                  initialValue: _selectedCategory,
                  decoration: const InputDecoration(
                    labelText: 'Revenue Category',
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

                // Buyer
                TextFormField(
                  controller: _buyerController,
                  decoration: const InputDecoration(
                    labelText: 'Buyer Name',
                    border: OutlineInputBorder(),
                  ),
                  validator: (val) => val == null || val.isEmpty ? 'Required' : null,
                ),
                const SizedBox(height: AppSpacing.md),

                // Cocoon Grade
                DropdownButtonFormField<String>(
                  initialValue: _cocoonGrade,
                  decoration: const InputDecoration(
                    labelText: 'Cocoon Grade',
                    border: OutlineInputBorder(),
                  ),
                  items: _grades.map((g) => DropdownMenuItem(value: g, child: Text(g))).toList(),
                  onChanged: (val) {
                    if (val != null) setState(() => _cocoonGrade = val);
                  },
                ),
                const SizedBox(height: AppSpacing.md),

                // Quantity and Rate
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: _qtyController,
                        decoration: const InputDecoration(
                          labelText: 'Quantity (kg)',
                          border: OutlineInputBorder(),
                        ),
                        keyboardType: const TextInputType.numberWithOptions(decimal: true),
                        validator: (val) => val == null || val.isEmpty ? 'Required' : null,
                      ),
                    ),
                    const SizedBox(width: AppSpacing.md),
                    Expanded(
                      child: TextFormField(
                        controller: _rateController,
                        decoration: const InputDecoration(
                          labelText: 'Rate (₹/kg)',
                          border: OutlineInputBorder(),
                        ),
                        keyboardType: const TextInputType.numberWithOptions(decimal: true),
                        validator: (val) => val == null || val.isEmpty ? 'Required' : null,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: AppSpacing.md),

                // Deductions (Transport & Commission)
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: _transportController,
                        decoration: const InputDecoration(
                          labelText: 'Transport (Ded. ₹)',
                          border: OutlineInputBorder(),
                        ),
                        keyboardType: const TextInputType.numberWithOptions(decimal: true),
                      ),
                    ),
                    const SizedBox(width: AppSpacing.md),
                    Expanded(
                      child: TextFormField(
                        controller: _commissionController,
                        decoration: const InputDecoration(
                          labelText: 'Commission (Ded. ₹)',
                          border: OutlineInputBorder(),
                        ),
                        keyboardType: const TextInputType.numberWithOptions(decimal: true),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: AppSpacing.lg),

                // Net Amount display
                Container(
                  padding: const EdgeInsets.all(AppSpacing.md),
                  decoration: BoxDecoration(
                    color: const Color(0xFFE8F5E9),
                    borderRadius: BorderRadius.circular(AppRadius.md),
                    border: Border.all(color: const Color(0xFFC8E6C9)),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Net Amount',
                        style: TextStyle(
                          color: Color(0xFF2E7D32),
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        '₹ ${NumberFormat('#,##,##0.00', 'en_IN').format(_netAmount)}',
                        style: const TextStyle(
                          color: Color(0xFF2E7D32),
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: AppSpacing.lg),

                // Payment Mode & Payment Status
                Row(
                  children: [
                    Expanded(
                      child: DropdownButtonFormField<String>(
                        initialValue: _paymentMethod,
                        decoration: const InputDecoration(
                          labelText: 'Payment Mode',
                          border: OutlineInputBorder(),
                        ),
                        items: _paymentMethods.map((m) => DropdownMenuItem(value: m, child: Text(m))).toList(),
                        onChanged: (val) {
                          if (val != null) setState(() => _paymentMethod = val);
                        },
                      ),
                    ),
                    const SizedBox(width: AppSpacing.md),
                    Expanded(
                      child: DropdownButtonFormField<String>(
                        initialValue: _paymentStatus,
                        decoration: const InputDecoration(
                          labelText: 'Payment Status',
                          border: OutlineInputBorder(),
                        ),
                        items: _paymentStatuses.map((s) => DropdownMenuItem(value: s, child: Text(s))).toList(),
                        onChanged: (val) {
                          if (val != null) setState(() => _paymentStatus = val);
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: AppSpacing.md),

                // Remarks
                TextFormField(
                  controller: _remarksController,
                  decoration: const InputDecoration(
                    labelText: 'Remarks (Optional)',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: AppSpacing.xl),

                // Confirm button
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
                    isEditing ? 'Save Changes' : 'Confirm Sale',
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
