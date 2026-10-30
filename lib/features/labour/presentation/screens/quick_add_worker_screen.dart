import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';
import 'package:drift/drift.dart' hide Column, Batch;
import '../theme/labour_theme.dart';
import '../widgets/labour_components.dart';
import '../../domain/entities/labour_entities.dart';
import '../../application/providers/labour_notifier.dart';
import '../../../batches/application/providers/batch_notifier.dart';
import '../../../batches/application/providers/batch_state.dart';
import '../../../batches/domain/entities/batch_entities.dart';
import '../../../expenses/application/providers/expense_notifier.dart';
import '../../../../data/providers/database_provider.dart';
import '../../../../data/database/app_database.dart';

/// Screen 2: Quick Add Single Worker ("Add Today's Work")
class QuickAddWorkerScreen extends ConsumerStatefulWidget {
  final LabourWorker worker;

  const QuickAddWorkerScreen({super.key, required this.worker});

  @override
  ConsumerState<QuickAddWorkerScreen> createState() => _QuickAddWorkerScreenState();
}

class _QuickAddWorkerScreenState extends ConsumerState<QuickAddWorkerScreen> {
  final _formKey = GlobalKey<FormState>();

  late TextEditingController _wageController;
  late TextEditingController _notesController;

  String _selectedTask = 'Silkworm Feeding & Cleaning';
  FarmShift _selectedShift = FarmShift.earlyMorning;
  String? _selectedBatchId;
  String _paymentStatus = 'Unpaid'; // ONLY 'Unpaid' or 'Paid'
  final DateTime _selectedDate = DateTime.now();
  bool _isSaving = false;

  @override
  void initState() {
    super.initState();
    _wageController = TextEditingController(text: widget.worker.dailyWage.toStringAsFixed(0));
    _notesController = TextEditingController();
  }

  @override
  void dispose() {
    _wageController.dispose();
    _notesController.dispose();
    super.dispose();
  }

  Future<void> _handleSave() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isSaving = true);
    try {
      final db = ref.read(appDatabaseProvider);
      final wageAmount = double.tryParse(_wageController.text.trim()) ?? widget.worker.dailyWage;
      final hours = _selectedShift.defaultHours;
      final notes = _notesController.text.trim();
      final shiftDesc = '${_selectedShift.name} • ${_selectedShift.timeRange}';
      final statusTag = '($_paymentStatus)';
      final notesSuffix = notes.isNotEmpty ? ' | Notes: $notes' : '';
      final expenseDescription = 'Labour: ${widget.worker.fullName} | $shiftDesc | $_selectedTask $statusTag$notesSuffix';
      final expensePaymentMethod = _paymentStatus == 'Paid' ? 'Cash' : 'Pending';

      final entryId = const Uuid().v4();

      await db.transaction(() async {
        // 1. Attendance Record
        await db.into(db.attendanceTable).insert(
              AttendanceTableCompanion.insert(
                id: entryId,
                workerId: widget.worker.id,
                date: _selectedDate,
                hoursWorked: Value(hours),
                overtimeHours: const Value(0.0),
                leaveStatus: 'none',
                remarks: Value('$_selectedTask - $_paymentStatus$notesSuffix'),
              ),
              mode: InsertMode.replace,
            );

        // 2. Assignment Record
        await db.into(db.assignmentsTable).insert(
              AssignmentsTableCompanion.insert(
                id: const Uuid().v4(),
                workerId: widget.worker.id,
                batchId: Value(_selectedBatchId),
                task: _selectedTask,
                startTime: _selectedDate,
                durationHours: Value(hours),
                status: 'completed',
              ),
              mode: InsertMode.replace,
            );

        // 3. Wage Record
        await db.into(db.wagesTable).insert(
              WagesTableCompanion.insert(
                id: const Uuid().v4(),
                workerId: widget.worker.id,
                baseWage: wageAmount,
                overtimePay: 0.0,
                bonuses: 0.0,
                deductions: 0.0,
                netPay: wageAmount,
                paymentDate: _selectedDate,
                paymentMethod: expensePaymentMethod,
                referenceNotes: Value('Shift: $shiftDesc | Task: $_selectedTask | Status: $_paymentStatus$notesSuffix'),
              ),
              mode: InsertMode.replace,
            );

        // 4. Labour Expense Record
        await db.into(db.expensesTable).insert(
              ExpensesTableCompanion.insert(
                id: const Uuid().v4(),
                amount: wageAmount,
                date: _selectedDate,
                categoryId: 'c4', // Labour category ID
                paymentMethod: expensePaymentMethod,
                description: expenseDescription,
                batchId: Value(_selectedBatchId),
              ),
              mode: InsertMode.replace,
            );
      });

      // Refresh providers
      await ref.read(expenseNotifierProvider.notifier).loadExpenses();
      await ref.read(labourNotifierProvider.notifier).loadWorkers();
      await ref.read(batchNotifierProvider.notifier).loadBatches();

      if (mounted) {
        // Navigate to Screen 3: Success Screen
        context.pushReplacement('/labour/success', extra: {
          'workerName': widget.worker.fullName,
          'amount': wageAmount,
          'taskTitle': _selectedTask,
          'shiftName': _selectedShift.name,
          'worker': widget.worker,
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() => _isSaving = false);
        showLabourErrorFeedback(
          context,
          title: 'Failed to Save Wage Log',
          subtitle: e.toString(),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final currency = NumberFormat.currency(symbol: '₹', decimalDigits: 0, locale: 'en_IN');
    final batchState = ref.watch(batchNotifierProvider);
    final allBatches = switch (batchState) {
      BatchStateData(batches: final list) => list,
      _ => <Batch>[],
    };

    final selectedBatch = _selectedBatchId != null
        ? allBatches.where((b) => b.id == _selectedBatchId).firstOrNull
        : null;

    final dateDisplay = DateFormat('d MMM yyyy').format(_selectedDate);

    return Scaffold(
      backgroundColor: LabourColors.background,
      appBar: AppBar(
        backgroundColor: LabourColors.background,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_rounded, color: LabourColors.primaryText),
          onPressed: () => context.pop(),
        ),
        title: const Text(
          "Add Today's Work",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: LabourColors.primaryText,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(20, 10, 20, 24),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // 1. Worker Hero Card (Screen 2 Reference)
                      Container(
                        padding: const EdgeInsets.all(14),
                        decoration: BoxDecoration(
                          color: LabourColors.cardSurface,
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(color: LabourColors.border),
                        ),
                        child: Row(
                          children: [
                            WorkerAvatar(worker: widget.worker, size: 50),
                            const SizedBox(width: 14),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    widget.worker.fullName,
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                      color: LabourColors.primaryText,
                                    ),
                                  ),
                                  const SizedBox(height: 2),
                                  Text(
                                    '${currency.format(widget.worker.dailyWage)} / day',
                                    style: const TextStyle(
                                      fontSize: 13,
                                      color: LabourColors.secondaryText,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                              decoration: BoxDecoration(
                                color: LabourColors.background,
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: LabourColors.border),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  const Text(
                                    'Today',
                                    style: TextStyle(fontSize: 10, color: LabourColors.secondaryText),
                                  ),
                                  Text(
                                    dateDisplay,
                                    style: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w700,
                                      color: LabourColors.primaryText,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 18),

                      // 2. Work Type Selector
                      _buildSectionLabel('Work Type *'),
                      const SizedBox(height: 6),
                      InkWell(
                        onTap: () async {
                          final chosen = await SelectWorkTypeSheet.show(context, _selectedTask);
                          if (chosen != null) setState(() => _selectedTask = chosen);
                        },
                        borderRadius: BorderRadius.circular(14),
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
                          decoration: BoxDecoration(
                            color: LabourColors.cardSurface,
                            borderRadius: BorderRadius.circular(14),
                            border: Border.all(color: LabourColors.border),
                          ),
                          child: Row(
                            children: [
                              const Icon(Icons.eco_outlined, color: LabourColors.forestGreen, size: 20),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Text(
                                  _selectedTask,
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: LabourColors.primaryText,
                                  ),
                                ),
                              ),
                              const Icon(Icons.chevron_right_rounded, color: LabourColors.secondaryText),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 18),

                      // 3. Shift Selector
                      _buildSectionLabel('Shift *'),
                      const SizedBox(height: 6),
                      InkWell(
                        onTap: () async {
                          final chosen = await SelectShiftSheet.show(context, _selectedShift);
                          if (chosen != null) setState(() => _selectedShift = chosen);
                        },
                        borderRadius: BorderRadius.circular(14),
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                          decoration: BoxDecoration(
                            color: LabourColors.cardSurface,
                            borderRadius: BorderRadius.circular(14),
                            border: Border.all(color: LabourColors.border),
                          ),
                          child: Row(
                            children: [
                              const Icon(Icons.wb_sunny_outlined, color: Color(0xFFD97706), size: 20),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      _selectedShift.name,
                                      style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        color: LabourColors.primaryText,
                                      ),
                                    ),
                                    const SizedBox(height: 2),
                                    Text(
                                      _selectedShift.timeRange,
                                      style: const TextStyle(
                                        fontSize: 12,
                                        color: LabourColors.secondaryText,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const Icon(Icons.chevron_right_rounded, color: LabourColors.secondaryText),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 18),

                      // 4. Batch Selector (Optional)
                      _buildSectionLabel('Batch (Optional)'),
                      const SizedBox(height: 6),
                      InkWell(
                        onTap: () => _pickBatch(allBatches),
                        borderRadius: BorderRadius.circular(14),
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
                          decoration: BoxDecoration(
                            color: LabourColors.cardSurface,
                            borderRadius: BorderRadius.circular(14),
                            border: Border.all(color: LabourColors.border),
                          ),
                          child: Row(
                            children: [
                              const Icon(Icons.layers_outlined, color: LabourColors.forestGreen, size: 20),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Text(
                                  selectedBatch != null ? selectedBatch.batchName : 'No Batch (General)',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: selectedBatch != null ? LabourColors.primaryText : LabourColors.secondaryText,
                                  ),
                                ),
                              ),
                              const Icon(Icons.chevron_right_rounded, color: LabourColors.secondaryText),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 18),

                      // 5. Wage Amount
                      _buildSectionLabel('Wage Amount'),
                      const SizedBox(height: 6),
                      Container(
                        decoration: BoxDecoration(
                          color: LabourColors.cardSurface,
                          borderRadius: BorderRadius.circular(14),
                          border: Border.all(color: LabourColors.border),
                        ),
                        child: TextFormField(
                          controller: _wageController,
                          keyboardType: const TextInputType.numberWithOptions(decimal: true),
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: LabourColors.primaryText,
                          ),
                          decoration: const InputDecoration(
                            prefixIcon: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                              child: Text(
                                '₹',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w800,
                                  color: LabourColors.primaryText,
                                ),
                              ),
                            ),
                            prefixIconConstraints: BoxConstraints(minWidth: 0, minHeight: 0),
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(horizontal: 14, vertical: 14),
                          ),
                          validator: (val) {
                            if (val == null || val.trim().isEmpty) return 'Wage amount is required';
                            if (double.tryParse(val.trim()) == null) return 'Enter a valid amount';
                            return null;
                          },
                        ),
                      ),
                      const SizedBox(height: 4),
                      const Text(
                        "(Uses worker's daily wage. You can change)",
                        style: TextStyle(fontSize: 11, color: LabourColors.secondaryText),
                      ),
                      const SizedBox(height: 18),

                      // 6. Payment Status: ONLY Unpaid and Paid
                      _buildSectionLabel('Payment Status'),
                      const SizedBox(height: 6),
                      Container(
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: LabourColors.cardSurface,
                          borderRadius: BorderRadius.circular(14),
                          border: Border.all(color: LabourColors.border),
                        ),
                        child: Row(
                          children: [
                            // Option 1: Unpaid (Default)
                            Expanded(
                              child: GestureDetector(
                                onTap: () => setState(() => _paymentStatus = 'Unpaid'),
                                child: Container(
                                  padding: const EdgeInsets.symmetric(vertical: 12),
                                  decoration: BoxDecoration(
                                    color: _paymentStatus == 'Unpaid'
                                        ? const Color(0xFFD97706)
                                        : Colors.transparent,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  alignment: Alignment.center,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      if (_paymentStatus == 'Unpaid') ...[
                                        const Icon(Icons.check_circle_rounded, color: Colors.white, size: 16),
                                        const SizedBox(width: 6),
                                      ],
                                      Text(
                                        'Unpaid',
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w700,
                                          color: _paymentStatus == 'Unpaid'
                                              ? Colors.white
                                              : LabourColors.secondaryText,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            // Option 2: Paid
                            Expanded(
                              child: GestureDetector(
                                onTap: () => setState(() => _paymentStatus = 'Paid'),
                                child: Container(
                                  padding: const EdgeInsets.symmetric(vertical: 12),
                                  decoration: BoxDecoration(
                                    color: _paymentStatus == 'Paid'
                                        ? LabourColors.forestGreen
                                        : Colors.transparent,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  alignment: Alignment.center,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      if (_paymentStatus == 'Paid') ...[
                                        const Icon(Icons.check_circle_rounded, color: Colors.white, size: 16),
                                        const SizedBox(width: 6),
                                      ],
                                      Text(
                                        'Paid',
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w700,
                                          color: _paymentStatus == 'Paid'
                                              ? Colors.white
                                              : LabourColors.secondaryText,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 18),

                      // 7. Notes (Optional)
                      _buildSectionLabel('Notes (Optional)'),
                      const SizedBox(height: 6),
                      Container(
                        decoration: BoxDecoration(
                          color: LabourColors.cardSurface,
                          borderRadius: BorderRadius.circular(14),
                          border: Border.all(color: LabourColors.border),
                        ),
                        child: TextFormField(
                          controller: _notesController,
                          maxLines: 2,
                          style: const TextStyle(fontSize: 14, color: LabourColors.primaryText),
                          decoration: const InputDecoration(
                            hintText: 'Add a note...',
                            hintStyle: TextStyle(color: LabourColors.mutedText, fontSize: 13),
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.all(14),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // Fixed Bottom Button: Save Wage Log
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              decoration: const BoxDecoration(
                color: LabourColors.cardSurface,
                border: Border(top: BorderSide(color: LabourColors.border)),
              ),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _isSaving ? null : _handleSave,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: LabourColors.forestGreen,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    elevation: 0,
                  ),
                  child: _isSaving
                      ? const SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2),
                        )
                      : const Text(
                          'Save Wage Log',
                          style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700, color: Colors.white),
                        ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionLabel(String label) {
    return Text(
      label,
      style: const TextStyle(
        fontSize: 13,
        fontWeight: FontWeight.w600,
        color: LabourColors.secondaryText,
      ),
    );
  }

  void _pickBatch(List<Batch> batches) {
    showModalBottomSheet<void>(
      context: context,
      backgroundColor: LabourColors.cardSurface,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (ctx) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    'Select Batch (Optional)',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: LabourColors.primaryText),
                  ),
                ),
                const SizedBox(height: 12),
                ListTile(
                  leading: const Icon(Icons.do_not_disturb_alt_rounded, color: LabourColors.secondaryText),
                  title: const Text('No Batch (General Farm Work)'),
                  trailing: _selectedBatchId == null
                      ? const Icon(Icons.check_circle_rounded, color: LabourColors.forestGreen)
                      : null,
                  onTap: () {
                    setState(() => _selectedBatchId = null);
                    Navigator.pop(ctx);
                  },
                ),
                ...batches.map((b) => ListTile(
                      leading: const Icon(Icons.layers_outlined, color: LabourColors.forestGreen),
                      title: Text(b.batchName),
                      subtitle: Text('${b.currentStage.name} • ${b.silkwormVariety}'),
                      trailing: _selectedBatchId == b.id
                          ? const Icon(Icons.check_circle_rounded, color: LabourColors.forestGreen)
                          : null,
                      onTap: () {
                        setState(() => _selectedBatchId = b.id);
                        Navigator.pop(ctx);
                      },
                    )),
              ],
            ),
          ),
        );
      },
    );
  }
}
