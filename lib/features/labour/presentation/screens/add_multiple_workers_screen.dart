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
import '../../application/providers/labour_state.dart';
import '../../../batches/application/providers/batch_notifier.dart';
import '../../../batches/application/providers/batch_state.dart';
import '../../../batches/domain/entities/batch_entities.dart';
import '../../../expenses/application/providers/expense_notifier.dart';
import '../../../../data/providers/database_provider.dart';
import '../../../../data/database/app_database.dart';

/// Screen 4: Add Multiple Workers ("Add Today's Wages")
class AddMultipleWorkersScreen extends ConsumerStatefulWidget {
  const AddMultipleWorkersScreen({super.key});

  @override
  ConsumerState<AddMultipleWorkersScreen> createState() => _AddMultipleWorkersScreenState();
}

class _AddMultipleWorkersScreenState extends ConsumerState<AddMultipleWorkersScreen> {
  final Set<String> _selectedWorkerIds = {};
  final Map<String, double> _workerCustomWages = {};

  String _selectedTask = 'Silkworm Feeding & Cleaning';
  FarmShift _selectedShift = FarmShift.earlyMorning;
  String? _selectedBatchId;
  String _paymentStatus = 'Unpaid'; // ONLY 'Unpaid' or 'Paid'
  final DateTime _selectedDate = DateTime.now();

  double _uniformWage = 500.0;
  bool _isSaving = false;
  bool _initializedSelection = false;

  Future<void> _handleSave(List<LabourWorker> allWorkers) async {
    final selectedWorkers = allWorkers.where((w) => _selectedWorkerIds.contains(w.id)).toList();
    if (selectedWorkers.isEmpty) {
      showLabourErrorFeedback(
        context,
        title: 'No Workers Selected',
        subtitle: 'Please select at least one worker to record wages.',
      );
      return;
    }

    setState(() => _isSaving = true);
    try {
      final db = ref.read(appDatabaseProvider);
      final hours = _selectedShift.defaultHours;
      final shiftDesc = '${_selectedShift.name} • ${_selectedShift.timeRange}';
      final statusTag = '($_paymentStatus)';
      final expensePaymentMethod = _paymentStatus == 'Paid' ? 'Cash' : 'Pending';

      double grandTotal = 0.0;

      await db.transaction(() async {
        for (final worker in selectedWorkers) {
          final wageAmount = _workerCustomWages[worker.id] ?? _uniformWage;
          grandTotal += wageAmount;
          final expenseDescription = 'Labour: ${worker.fullName} | $shiftDesc | $_selectedTask $statusTag';
          final entryId = const Uuid().v4();

          // 1. Attendance Record
          await db.into(db.attendanceTable).insert(
                AttendanceTableCompanion.insert(
                  id: entryId,
                  workerId: worker.id,
                  date: _selectedDate,
                  hoursWorked: Value(hours),
                  overtimeHours: const Value(0.0),
                  leaveStatus: 'none',
                  remarks: Value('$_selectedTask - $_paymentStatus'),
                ),
                mode: InsertMode.replace,
              );

          // 2. Assignment Record
          await db.into(db.assignmentsTable).insert(
                AssignmentsTableCompanion.insert(
                  id: const Uuid().v4(),
                  workerId: worker.id,
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
                  workerId: worker.id,
                  baseWage: wageAmount,
                  overtimePay: 0.0,
                  bonuses: 0.0,
                  deductions: 0.0,
                  netPay: wageAmount,
                  paymentDate: _selectedDate,
                  paymentMethod: expensePaymentMethod,
                  referenceNotes: Value('Shift: $shiftDesc | Task: $_selectedTask | Status: $_paymentStatus'),
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
        }
      });

      // Refresh providers
      await ref.read(expenseNotifierProvider.notifier).loadExpenses();
      await ref.read(labourNotifierProvider.notifier).loadWorkers();
      await ref.read(batchNotifierProvider.notifier).loadBatches();

      if (mounted) {
        showLabourSuccessFeedback(
          context,
          title: 'Wages Recorded',
          subtitle: 'Added ${selectedWorkers.length} wage logs (₹${grandTotal.toStringAsFixed(0)} total) for today.',
        );
        // Pop back to Screen 5: Workers Home (now updated)
        context.go('/labour');
      }
    } catch (e) {
      if (mounted) {
        setState(() => _isSaving = false);
        showLabourErrorFeedback(
          context,
          title: 'Failed to Save Wage Logs',
          subtitle: e.toString(),
        );
      }
    }
  }

  void _editUniformWage() {
    final controller = TextEditingController(text: _uniformWage.toStringAsFixed(0));
    showDialog<void>(
      context: context,
      builder: (ctx) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: const Text('Edit Wage Amount', style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16)),
        content: TextField(
          controller: controller,
          keyboardType: TextInputType.number,
          autofocus: true,
          decoration: const InputDecoration(
            prefixText: '₹ ',
            labelText: 'Wage amount per worker',
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('Cancel', style: TextStyle(color: LabourColors.secondaryText)),
          ),
          ElevatedButton(
            onPressed: () {
              final newWage = double.tryParse(controller.text.trim());
              if (newWage != null && newWage > 0) {
                setState(() {
                  _uniformWage = newWage;
                  // Update all currently selected
                  for (final id in _selectedWorkerIds) {
                    _workerCustomWages[id] = newWage;
                  }
                });
              }
              Navigator.pop(ctx);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: LabourColors.forestGreen,
              foregroundColor: Colors.white,
            ),
            child: const Text('Update'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final currency = NumberFormat.currency(symbol: '₹', decimalDigits: 0, locale: 'en_IN');
    final labourState = ref.watch(labourNotifierProvider);
    final batchState = ref.watch(batchNotifierProvider);

    final allWorkers = switch (labourState) {
      LabourStateData(workers: final list) => list.where((w) => w.status == WorkerStatus.active).toList(),
      _ => <LabourWorker>[],
    };

    final allBatches = switch (batchState) {
      BatchStateData(batches: final list) => list,
      _ => <Batch>[],
    };

    final selectedBatch = _selectedBatchId != null
        ? allBatches.where((b) => b.id == _selectedBatchId).firstOrNull
        : null;

    // Default select active workers on first load
    if (!_initializedSelection && allWorkers.isNotEmpty) {
      _initializedSelection = true;
      for (final w in allWorkers) {
        _selectedWorkerIds.add(w.id);
        _workerCustomWages[w.id] = w.dailyWage;
      }
      if (allWorkers.isNotEmpty) {
        _uniformWage = allWorkers.first.dailyWage;
      }
    }

    // Calculate total amount for selected workers
    double totalAmount = 0.0;
    for (final w in allWorkers) {
      if (_selectedWorkerIds.contains(w.id)) {
        totalAmount += _workerCustomWages[w.id] ?? _uniformWage;
      }
    }

    final dateDisplay = DateFormat('E, d MMM yyyy').format(_selectedDate);
    final allSelected = allWorkers.isNotEmpty && _selectedWorkerIds.length == allWorkers.length;

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
          "Add Today's Wages",
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Top Date Pill (Screen 4 Reference)
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                      decoration: BoxDecoration(
                        color: LabourColors.cardSurface,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: LabourColors.border),
                      ),
                      child: Row(
                        children: [
                          const Icon(Icons.calendar_today_outlined, size: 18, color: LabourColors.forestGreen),
                          const SizedBox(width: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('Today', style: TextStyle(fontSize: 10, color: LabourColors.secondaryText)),
                              Text(
                                dateDisplay,
                                style: const TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w700,
                                  color: LabourColors.primaryText,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 18),

                    // Section Header: Select Workers (N) + Select All
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Select Workers (${_selectedWorkerIds.length})',
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                            color: LabourColors.primaryText,
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              if (allSelected) {
                                _selectedWorkerIds.clear();
                              } else {
                                for (final w in allWorkers) {
                                  _selectedWorkerIds.add(w.id);
                                  _workerCustomWages[w.id] ??= w.dailyWage;
                                }
                              }
                            });
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                            child: Text(
                              allSelected ? 'Deselect All' : 'Select All',
                              style: const TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w700,
                                color: LabourColors.forestGreen,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),

                    // Workers Checklist (Screen 4 Reference)
                    Container(
                      decoration: BoxDecoration(
                        color: LabourColors.cardSurface,
                        borderRadius: BorderRadius.circular(14),
                        border: Border.all(color: LabourColors.border),
                      ),
                      child: ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: allWorkers.length,
                        separatorBuilder: (_, __) => const Divider(height: 1, color: LabourColors.borderLight),
                        itemBuilder: (ctx, idx) {
                          final worker = allWorkers[idx];
                          final isSelected = _selectedWorkerIds.contains(worker.id);

                          return InkWell(
                            onTap: () {
                              setState(() {
                                if (isSelected) {
                                  _selectedWorkerIds.remove(worker.id);
                                } else {
                                  _selectedWorkerIds.add(worker.id);
                                  _workerCustomWages[worker.id] ??= worker.dailyWage;
                                }
                              });
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                              child: Row(
                                children: [
                                  WorkerAvatar(worker: worker, size: 40),
                                  const SizedBox(width: 12),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          worker.fullName,
                                          style: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w700,
                                            color: LabourColors.primaryText,
                                          ),
                                        ),
                                        const SizedBox(height: 1),
                                        Text(
                                          '${currency.format(worker.dailyWage)} / day',
                                          style: const TextStyle(
                                            fontSize: 11,
                                            color: LabourColors.secondaryText,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  // Selection Checkbox
                                  Container(
                                    width: 22,
                                    height: 22,
                                    decoration: BoxDecoration(
                                      color: isSelected ? LabourColors.forestGreen : Colors.white,
                                      borderRadius: BorderRadius.circular(6),
                                      border: Border.all(
                                        color: isSelected ? LabourColors.forestGreen : LabourColors.border,
                                        width: 1.5,
                                      ),
                                    ),
                                    child: isSelected
                                        ? const Icon(Icons.check_rounded, size: 16, color: Colors.white)
                                        : null,
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 18),

                    // Work Type Selector
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

                    // Shift Selector
                    _buildSectionLabel('Shift *'),
                    const SizedBox(height: 6),
                    InkWell(
                      onTap: () async {
                        final chosen = await SelectShiftSheet.show(context, _selectedShift);
                        if (chosen != null) setState(() => _selectedShift = chosen);
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
                            const Icon(Icons.wb_sunny_outlined, color: Color(0xFFD97706), size: 20),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Text(
                                '${_selectedShift.name} (${_selectedShift.timeRange})',
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

                    // Batch Selector (Optional)
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

                    // Wage Amount for all selected
                    _buildSectionLabel('Wage Amount for all selected'),
                    const SizedBox(height: 6),
                    InkWell(
                      onTap: _editUniformWage,
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
                            Text(
                              currency.format(_uniformWage),
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w800,
                                color: LabourColors.primaryText,
                              ),
                            ),
                            const Spacer(),
                            const Icon(Icons.edit_outlined, color: LabourColors.forestGreen, size: 20),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 18),

                    // Payment Status: ONLY Unpaid and Paid
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
                  ],
                ),
              ),
            ),

            // Fixed Bottom Button: Add N Workers (₹Total)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              decoration: const BoxDecoration(
                color: LabourColors.cardSurface,
                border: Border(top: BorderSide(color: LabourColors.border)),
              ),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _isSaving ? null : () => _handleSave(allWorkers),
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
                      : Text(
                          'Add ${_selectedWorkerIds.length} ${_selectedWorkerIds.length == 1 ? "Worker" : "Workers"} (${currency.format(totalAmount)})',
                          style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w700, color: Colors.white),
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
