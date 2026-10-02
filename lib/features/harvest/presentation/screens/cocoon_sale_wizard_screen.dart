import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';
import 'package:drift/drift.dart' hide Column, Batch;
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
      Buyer(id: 'b1', name: 'ABC Silk Traders', contact: '+91 98765 43210'),
      Buyer(id: 'b2', name: 'Govt Cocoon Market (Ramanagara)', contact: '080-27271234'),
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
  int _currentStep = 0;
  final _formKey = GlobalKey<FormState>();

  // Step 1: Batch & Buyer
  String? _selectedBatchId;
  Buyer? _selectedBuyer;
  DateTime _saleDate = DateTime.now();
  final _referenceController = TextEditingController();

  // Step 2: Harvest Weights
  final _grossWeightController = TextEditingController(text: '82.5');
  final _tareWeightController = TextEditingController(text: '2.5');

  // Step 3: Grade & Rate
  final _gradeAWeightController = TextEditingController(text: '35.0');
  final _gradeARateController = TextEditingController(text: '620.0');
  final _gradeBWeightController = TextEditingController(text: '30.0');
  final _gradeBRateController = TextEditingController(text: '560.0');
  final _gradeCWeightController = TextEditingController(text: '10.0');
  final _gradeCRateController = TextEditingController(text: '480.0');
  final _rejectWeightController = TextEditingController(text: '5.0');
  final _rejectRateController = TextEditingController(text: '300.0');

  // Step 4: Deductions
  final _commissionController = TextEditingController(text: '1500.0');
  final _transportController = TextEditingController(text: '600.0');
  final _marketChargesController = TextEditingController(text: '400.0');
  final _otherDeductionsController = TextEditingController(text: '0.0');

  // Step 5: Payment
  String _paymentStatus = 'Paid'; // Paid, Partially Paid, Pending
  String _paymentMode = 'Cash'; // Cash, UPI, Bank Transfer, Cheque
  final _amountReceivedController = TextEditingController();

  bool _isSaving = false;

  @override
  void initState() {
    super.initState();
    _selectedBatchId = widget.initialBatchId;
    _recalculatePaymentReceived();
  }

  @override
  void dispose() {
    _referenceController.dispose();
    _grossWeightController.dispose();
    _tareWeightController.dispose();
    _gradeAWeightController.dispose();
    _gradeARateController.dispose();
    _gradeBWeightController.dispose();
    _gradeBRateController.dispose();
    _gradeCWeightController.dispose();
    _gradeCRateController.dispose();
    _rejectWeightController.dispose();
    _rejectRateController.dispose();
    _commissionController.dispose();
    _transportController.dispose();
    _marketChargesController.dispose();
    _otherDeductionsController.dispose();
    _amountReceivedController.dispose();
    super.dispose();
  }

  double get _grossWeight => double.tryParse(_grossWeightController.text) ?? 0.0;
  double get _tareWeight => double.tryParse(_tareWeightController.text) ?? 0.0;
  double get _netWeight => (_grossWeight - _tareWeight).clamp(0.0, 99999.0);

  double get _gradeAQty => double.tryParse(_gradeAWeightController.text) ?? 0.0;
  double get _gradeARate => double.tryParse(_gradeARateController.text) ?? 0.0;
  double get _gradeBQty => double.tryParse(_gradeBWeightController.text) ?? 0.0;
  double get _gradeBRate => double.tryParse(_gradeBRateController.text) ?? 0.0;
  double get _gradeCQty => double.tryParse(_gradeCWeightController.text) ?? 0.0;
  double get _gradeCRate => double.tryParse(_gradeCRateController.text) ?? 0.0;
  double get _rejectQty => double.tryParse(_rejectWeightController.text) ?? 0.0;
  double get _rejectRate => double.tryParse(_rejectRateController.text) ?? 0.0;

  double get _totalGradeQty => _gradeAQty + _gradeBQty + _gradeCQty + _rejectQty;

  double get _grossSale =>
      (_gradeAQty * _gradeARate) +
      (_gradeBQty * _gradeBRate) +
      (_gradeCQty * _gradeCRate) +
      (_rejectQty * _rejectRate);

  double get _commission => double.tryParse(_commissionController.text) ?? 0.0;
  double get _transport => double.tryParse(_transportController.text) ?? 0.0;
  double get _marketCharges => double.tryParse(_marketChargesController.text) ?? 0.0;
  double get _otherDeductions => double.tryParse(_otherDeductionsController.text) ?? 0.0;

  double get _totalDeductions => _commission + _transport + _marketCharges + _otherDeductions;
  double get _netRevenue => (_grossSale - _totalDeductions).clamp(0.0, 9999999.0);

  double get _amountReceived {
    if (_paymentStatus == 'Paid') return _netRevenue;
    if (_paymentStatus == 'Pending') return 0.0;
    return double.tryParse(_amountReceivedController.text) ?? 0.0;
  }

  double get _outstandingBalance => (_netRevenue - _amountReceived).clamp(0.0, 9999999.0);

  void _recalculatePaymentReceived() {
    if (_paymentStatus == 'Paid') {
      _amountReceivedController.text = _netRevenue.toStringAsFixed(0);
    } else if (_paymentStatus == 'Pending') {
      _amountReceivedController.text = '0';
    }
  }

  Future<void> _confirmSale() async {
    if (_selectedBatchId == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please select a batch first')),
      );
      setState(() => _currentStep = 0);
      return;
    }

    setState(() => _isSaving = true);
    try {
      final db = ref.read(appDatabaseProvider);
      final saleId = const Uuid().v4();
      final harvestId = const Uuid().v4();

      final buyer = _selectedBuyer ??
          const Buyer(id: 'b1', name: 'ABC Silk Traders', contact: '+91 98765 43210');

      // 1. Harvest Db Model
      final harvestDb = HarvestRecordDbModel(
        id: harvestId,
        batchId: _selectedBatchId!,
        harvestDate: _saleDate,
        actualHarvestDuration: 4.0,
        grossWeight: _grossWeight,
        netSaleableWeight: _netWeight,
        rejectedWeight: _rejectQty,
        moisturePercentage: 11.5,
        wastePercentage: 1.5,
        averageCocoonSize: 1.8,
        gradeAWeight: _gradeAQty,
        gradeBWeight: _gradeBQty,
        gradeCWeight: _gradeCQty,
        yieldPercentage: 92.0,
        survivalRate: 94.0,
        feedConversionRatio: 2.1,
        mortalityPercentage: 6.0,
        harvestEfficiency: 95.0,
        harvestedBy: buyer.name,
        remarks: 'Cocoon Sale - ${_referenceController.text}',
      );

      // 2. Income Db Model
      final incomeDb = IncomeDbModel(
        id: saleId,
        saleDate: _saleDate,
        batchId: _selectedBatchId,
        buyerId: buyer.id,
        categoryId: 'sales_cat_id',
        cocoonGrade: _gradeAQty > 0 ? 'Grade A (${_gradeAQty.toInt()}kg)' : 'Mixed',
        quantity: _netWeight,
        rate: _netWeight > 0 ? (_grossSale / _netWeight) : 0.0,
        grossAmount: _grossSale,
        transportCharges: _transport,
        commission: _commission,
        netAmount: _netRevenue,
        paymentMethod: _paymentMode,
        paymentStatus: _paymentStatus,
        invoiceNumber: _referenceController.text.isNotEmpty ? _referenceController.text : null,
        remarks: 'Harvest sale of ${_netWeight.toStringAsFixed(1)} kg (${buyer.name})',
      );

      // 3. Save atomically in database
      await db.harvestDao.insertHarvestTransaction(
        harvestDb,
        generatedIncome: incomeDb,
      );

      // 4. Save buyer record if new
      await db.into(db.buyersTable).insert(
        BuyerDbModel(id: buyer.id, name: buyer.name, contact: buyer.contact),
        mode: InsertMode.insertOrIgnore,
      );

      // 5. Add Batch Timeline Event
      await db.batchDao.insertTimelineEvent(
        BatchTimelineDbModel(
          id: const Uuid().v4(),
          batchId: _selectedBatchId!,
          timestamp: _saleDate,
          eventType: 'Cocoon Sale',
          description: 'Harvested ${_netWeight.toStringAsFixed(1)} kg. Sold to ${buyer.name} for ₹${_netRevenue.toStringAsFixed(0)} (Gross ₹${_grossSale.toStringAsFixed(0)} - Deductions ₹${_totalDeductions.toStringAsFixed(0)}).',
        ),
      );

      // 6. Refresh state providers
      ref.read(harvestNotifierProvider.notifier).loadHarvests();
      ref.read(incomeNotifierProvider.notifier).loadIncomes();
      ref.read(batchNotifierProvider.notifier).loadBatches();
      ref.read(dashboardAggregatorProvider.notifier).loadDashboard();
      ref.read(reportsNotifierProvider.notifier).loadReports();

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: AppColorScheme.success,
            content: Text('🎉 Cocoon Sale Recorded Successfully! Net: ₹${_netRevenue.toStringAsFixed(0)}'),
          ),
        );
        context.pop();
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error saving sale: $e')),
        );
      }
    } finally {
      if (mounted) setState(() => _isSaving = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final currency = NumberFormat.currency(symbol: '₹', decimalDigits: 0, locale: 'en_IN');
    final activeBatch = ref.watch(activeBatchProvider);
    final batchState = ref.watch(batchNotifierProvider);
    final allBatches = switch (batchState) {
      BatchStateData(batches: final list) => list,
      _ => <Batch>[],
    };

    if (_selectedBatchId == null && activeBatch != null) {
      _selectedBatchId = activeBatch.id;
    }

    final buyersAsync = ref.watch(buyersListProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Record Cocoon Sale'),
        backgroundColor: AppColorScheme.primary,
        foregroundColor: Colors.white,
      ),
      body: Form(
        key: _formKey,
        child: Stepper(
          type: StepperType.vertical,
          currentStep: _currentStep,
          onStepTapped: (step) => setState(() => _currentStep = step),
          onStepContinue: () {
            if (_currentStep < 4) {
              setState(() {
                _currentStep += 1;
                _recalculatePaymentReceived();
              });
            } else {
              _confirmSale();
            }
          },
          onStepCancel: () {
            if (_currentStep > 0) {
              setState(() => _currentStep -= 1);
            } else {
              context.pop();
            }
          },
          controlsBuilder: (context, details) {
            final isLast = _currentStep == 4;
            return Padding(
              padding: const EdgeInsets.only(top: AppSpacing.md),
              child: Row(
                children: [
                  FilledButton(
                    onPressed: _isSaving ? null : details.onStepContinue,
                    style: FilledButton.styleFrom(
                      backgroundColor: isLast ? AppColorScheme.primaryLight : null,
                      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    ),
                    child: _isSaving
                        ? const SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2),
                          )
                        : Text(isLast ? 'CONFIRM SALE' : 'Next Step'),
                  ),
                  const SizedBox(width: AppSpacing.sm),
                  if (_currentStep > 0)
                    OutlinedButton(
                      onPressed: details.onStepCancel,
                      child: const Text('Back'),
                    ),
                ],
              ),
            );
          },
          steps: [
            // STEP 1: BATCH & BUYER
            Step(
              title: const Text('Batch & Buyer Details', style: TextStyle(fontWeight: FontWeight.bold)),
              isActive: _currentStep >= 0,
              state: _currentStep > 0 ? StepState.complete : StepState.indexed,
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Batch Picker
                  DropdownButtonFormField<String>(
                    initialValue: _selectedBatchId,
                    decoration: const InputDecoration(
                      labelText: 'Batch',
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
                    validator: (v) => v == null ? 'Please select a batch' : null,
                  ),
                  const SizedBox(height: AppSpacing.md),

                  // Buyer Picker
                  buyersAsync.when(
                    data: (buyers) {
                      _selectedBuyer ??= buyers.isNotEmpty ? buyers.first : null;
                      return DropdownButtonFormField<Buyer>(
                        initialValue: _selectedBuyer,
                        decoration: const InputDecoration(
                          labelText: 'Buyer / Market',
                          prefixIcon: Icon(Icons.storefront),
                          border: OutlineInputBorder(),
                        ),
                        items: buyers.map((b) {
                          return DropdownMenuItem(
                            value: b,
                            child: Text(b.name),
                          );
                        }).toList(),
                        onChanged: (v) => setState(() => _selectedBuyer = v),
                      );
                    },
                    loading: () => const LinearProgressIndicator(),
                    error: (_, __) => const SizedBox(),
                  ),
                  const SizedBox(height: AppSpacing.md),

                  // Sale Date
                  ListTile(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(AppRadius.md),
                      side: BorderSide(color: Colors.grey.shade300),
                    ),
                    leading: const Icon(Icons.calendar_today, color: AppColorScheme.primaryLight),
                    title: const Text('Sale Date'),
                    subtitle: Text(DateFormat('dd MMMM yyyy').format(_saleDate)),
                    trailing: const Icon(Icons.edit, size: 18),
                    onTap: () async {
                      final picked = await showDatePicker(
                        context: context,
                        initialDate: _saleDate,
                        firstDate: DateTime(2020),
                        lastDate: DateTime.now().add(const Duration(days: 30)),
                      );
                      if (picked != null) setState(() => _saleDate = picked);
                    },
                  ),
                  const SizedBox(height: AppSpacing.md),

                  // Invoice / Reference
                  TextFormField(
                    controller: _referenceController,
                    decoration: const InputDecoration(
                      labelText: 'Invoice / Market Lot # (Optional)',
                      prefixIcon: Icon(Icons.tag),
                      border: OutlineInputBorder(),
                    ),
                  ),
                ],
              ),
            ),

            // STEP 2: HARVEST WEIGHTS
            Step(
              title: const Text('Harvest Weight (kg)', style: TextStyle(fontWeight: FontWeight.bold)),
              isActive: _currentStep >= 1,
              state: _currentStep > 1 ? StepState.complete : StepState.indexed,
              content: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: _grossWeightController,
                          decoration: const InputDecoration(
                            labelText: 'Gross Weight (kg)',
                            border: OutlineInputBorder(),
                          ),
                          keyboardType: const TextInputType.numberWithOptions(decimal: true),
                          onChanged: (_) => setState(() {}),
                        ),
                      ),
                      const SizedBox(width: AppSpacing.md),
                      Expanded(
                        child: TextFormField(
                          controller: _tareWeightController,
                          decoration: const InputDecoration(
                            labelText: 'Tare / Box (kg)',
                            border: OutlineInputBorder(),
                          ),
                          keyboardType: const TextInputType.numberWithOptions(decimal: true),
                          onChanged: (_) => setState(() {}),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: AppSpacing.md),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(AppSpacing.md),
                    decoration: BoxDecoration(
                      color: AppColorScheme.primaryContainer.withValues(alpha: 0.5),
                      borderRadius: BorderRadius.circular(AppRadius.md),
                      border: Border.all(color: AppColorScheme.primaryLight.withValues(alpha: 0.3)),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Calculated Net Weight:',
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                        Text(
                          '${_netWeight.toStringAsFixed(2)} kg',
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w900,
                            color: AppColorScheme.primary,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // STEP 3: GRADE & RATE
            Step(
              title: const Text('Grade & Rate Breakdown', style: TextStyle(fontWeight: FontWeight.bold)),
              isActive: _currentStep >= 2,
              state: _currentStep > 2 ? StepState.complete : StepState.indexed,
              content: Column(
                children: [
                  _buildGradeRow('Grade A', _gradeAWeightController, _gradeARateController),
                  const SizedBox(height: AppSpacing.sm),
                  _buildGradeRow('Grade B', _gradeBWeightController, _gradeBRateController),
                  const SizedBox(height: AppSpacing.sm),
                  _buildGradeRow('Grade C', _gradeCWeightController, _gradeCRateController),
                  const SizedBox(height: AppSpacing.sm),
                  _buildGradeRow('Double / Rejects', _rejectWeightController, _rejectRateController),
                  const SizedBox(height: AppSpacing.md),
                  Container(
                    padding: const EdgeInsets.all(AppSpacing.md),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(AppRadius.md),
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Graded Qty: ${_totalGradeQty.toStringAsFixed(1)} kg'),
                            Text('Net Target: ${_netWeight.toStringAsFixed(1)} kg'),
                          ],
                        ),
                        const Divider(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('Gross Sale Total:', style: TextStyle(fontWeight: FontWeight.bold)),
                            Text(
                              currency.format(_grossSale),
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: AppColorScheme.success,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // STEP 4: DEDUCTIONS
            Step(
              title: const Text('Deductions', style: TextStyle(fontWeight: FontWeight.bold)),
              isActive: _currentStep >= 3,
              state: _currentStep > 3 ? StepState.complete : StepState.indexed,
              content: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: _commissionController,
                          decoration: const InputDecoration(labelText: 'Commission (₹)', border: OutlineInputBorder()),
                          keyboardType: const TextInputType.numberWithOptions(decimal: true),
                          onChanged: (_) => setState(() {}),
                        ),
                      ),
                      const SizedBox(width: AppSpacing.sm),
                      Expanded(
                        child: TextFormField(
                          controller: _transportController,
                          decoration: const InputDecoration(labelText: 'Transport (₹)', border: OutlineInputBorder()),
                          keyboardType: const TextInputType.numberWithOptions(decimal: true),
                          onChanged: (_) => setState(() {}),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: AppSpacing.sm),
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: _marketChargesController,
                          decoration: const InputDecoration(labelText: 'Market Fee (₹)', border: OutlineInputBorder()),
                          keyboardType: const TextInputType.numberWithOptions(decimal: true),
                          onChanged: (_) => setState(() {}),
                        ),
                      ),
                      const SizedBox(width: AppSpacing.sm),
                      Expanded(
                        child: TextFormField(
                          controller: _otherDeductionsController,
                          decoration: const InputDecoration(labelText: 'Other (₹)', border: OutlineInputBorder()),
                          keyboardType: const TextInputType.numberWithOptions(decimal: true),
                          onChanged: (_) => setState(() {}),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: AppSpacing.md),
                  Container(
                    padding: const EdgeInsets.all(AppSpacing.md),
                    decoration: BoxDecoration(
                      color: AppColorScheme.primaryContainer.withValues(alpha: 0.3),
                      borderRadius: BorderRadius.circular(AppRadius.md),
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('Total Deductions:'),
                            Text(currency.format(_totalDeductions), style: const TextStyle(color: AppColorScheme.error, fontWeight: FontWeight.bold)),
                          ],
                        ),
                        const SizedBox(height: 6),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('Net Revenue to Farm:', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                            Text(currency.format(_netRevenue), style: const TextStyle(fontWeight: FontWeight.w900, fontSize: 18, color: AppColorScheme.primary)),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // STEP 5: PAYMENT & REVIEW
            Step(
              title: const Text('Payment & Final Review', style: TextStyle(fontWeight: FontWeight.bold)),
              isActive: _currentStep >= 4,
              state: StepState.indexed,
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: DropdownButtonFormField<String>(
                          initialValue: _paymentStatus,
                          decoration: const InputDecoration(labelText: 'Payment Status', border: OutlineInputBorder()),
                          items: ['Paid', 'Partially Paid', 'Pending']
                              .map((s) => DropdownMenuItem(value: s, child: Text(s)))
                              .toList(),
                          onChanged: (v) {
                            setState(() {
                              _paymentStatus = v!;
                              _recalculatePaymentReceived();
                            });
                          },
                        ),
                      ),
                      const SizedBox(width: AppSpacing.sm),
                      Expanded(
                        child: DropdownButtonFormField<String>(
                          initialValue: _paymentMode,
                          decoration: const InputDecoration(labelText: 'Payment Mode', border: OutlineInputBorder()),
                          items: ['Cash', 'UPI', 'Bank Transfer', 'Cheque']
                              .map((m) => DropdownMenuItem(value: m, child: Text(m)))
                              .toList(),
                          onChanged: (v) => setState(() => _paymentMode = v!),
                        ),
                      ),
                    ],
                  ),
                  if (_paymentStatus == 'Partially Paid') ...[
                    const SizedBox(height: AppSpacing.sm),
                    TextFormField(
                      controller: _amountReceivedController,
                      decoration: const InputDecoration(labelText: 'Amount Received (₹)', border: OutlineInputBorder()),
                      keyboardType: const TextInputType.numberWithOptions(decimal: true),
                      onChanged: (_) => setState(() {}),
                    ),
                  ],
                  const SizedBox(height: AppSpacing.md),

                  // Review Summary Box
                  Card(
                    color: Colors.green.shade50,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(AppRadius.md),
                      side: BorderSide(color: Colors.green.shade200),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(AppSpacing.md),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('SALE SUMMARY', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w800, color: Colors.green.shade900)),
                          const Divider(),
                          _summaryRow('Buyer', _selectedBuyer?.name ?? 'Market Buyer'),
                          _summaryRow('Net Cocoon Weight', '${_netWeight.toStringAsFixed(1)} kg'),
                          _summaryRow('Gross Sale', currency.format(_grossSale)),
                          _summaryRow('Total Deductions', '- ${currency.format(_totalDeductions)}'),
                          const Divider(),
                          _summaryRow('Net Revenue', currency.format(_netRevenue), isBold: true),
                          _summaryRow('Payment', '$_paymentStatus via $_paymentMode', isBold: false),
                          if (_outstandingBalance > 0)
                            _summaryRow('Pending Balance', currency.format(_outstandingBalance), isAlert: true),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGradeRow(String label, TextEditingController qtyCtrl, TextEditingController rateCtrl) {
    return Row(
      children: [
        SizedBox(
          width: 100,
          child: Text(label, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13)),
        ),
        Expanded(
          child: TextFormField(
            controller: qtyCtrl,
            decoration: const InputDecoration(labelText: 'Qty (kg)', isDense: true, border: OutlineInputBorder()),
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            onChanged: (_) => setState(() {}),
          ),
        ),
        const SizedBox(width: AppSpacing.xs),
        Expanded(
          child: TextFormField(
            controller: rateCtrl,
            decoration: const InputDecoration(labelText: 'Rate (₹/kg)', isDense: true, border: OutlineInputBorder()),
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            onChanged: (_) => setState(() {}),
          ),
        ),
      ],
    );
  }

  Widget _summaryRow(String label, String value, {bool isBold = false, bool isAlert = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: TextStyle(fontSize: 13, color: Colors.grey.shade800, fontWeight: isBold ? FontWeight.bold : FontWeight.normal)),
          Text(
            value,
            style: TextStyle(
              fontSize: 14,
              fontWeight: isBold || isAlert ? FontWeight.bold : FontWeight.w500,
              color: isAlert ? AppColorScheme.error : (isBold ? AppColorScheme.primary : Colors.black87),
            ),
          ),
        ],
      ),
    );
  }
}
