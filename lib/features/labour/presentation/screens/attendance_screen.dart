import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';
import 'package:drift/drift.dart' hide Column;
import '../theme/labour_theme.dart';
import '../widgets/labour_components.dart';
import '../../domain/entities/labour_entities.dart';
import '../../application/providers/labour_notifier.dart';
import '../../application/providers/labour_state.dart';
import '../../../batches/application/providers/batch_notifier.dart';
import '../../../expenses/application/providers/expense_notifier.dart';
import '../../../expenses/domain/entities/expense_entities.dart';
import '../../../../data/providers/database_provider.dart';
import '../../../../data/database/app_database.dart';

class AttendanceScreen extends ConsumerStatefulWidget {
  final String? initialBatchId;
  final String? initialWorkerId;
  final Expense? existingExpense;

  const AttendanceScreen({
    super.key,
    this.initialBatchId,
    this.initialWorkerId,
    this.existingExpense,
  });

  @override
  ConsumerState<AttendanceScreen> createState() => _AttendanceScreenState();
}

class _AttendanceScreenState extends ConsumerState<AttendanceScreen> {
  final _formKey = GlobalKey<FormState>();

  LabourWorker? _selectedWorker;
  String _selectedTask = 'Silkworm Feeding & Cleaning';
  FarmShift _selectedShift = FarmShift.dayShift;
  DateTime _selectedDate = DateTime.now();
  String _status = 'Paid'; // 'Paid', 'Pending', 'Overdue'
  
  late TextEditingController _amountController;
  late TextEditingController _notesController;
  bool _isSaving = false;
  bool _initializedFromExpense = false;

  bool get isEditing => widget.existingExpense != null;

  @override
  void initState() {
    super.initState();
    _amountController = TextEditingController(text: '500');
    _notesController = TextEditingController();

    if (widget.existingExpense != null) {
      final exp = widget.existingExpense!;
      _selectedDate = exp.date;
      _amountController.text = exp.amount.toStringAsFixed(0);
      
      final info = WageLogInfo.parse(exp.description);
      _selectedShift = FarmShift.findByNameOrId(info.shiftName);
      _selectedTask = info.taskTitle;
      _status = info.status;

      // Check for notes in description
      if (exp.description.contains('Notes:')) {
        final notesPart = exp.description.split('Notes:').last.trim();
        _notesController.text = notesPart;
      }
    }
  }

  @override
  void dispose() {
    _amountController.dispose();
    _notesController.dispose();
    super.dispose();
  }

  Future<void> _pickDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: LabourColors.forestGreen,
              onPrimary: Colors.white,
              onSurface: LabourColors.primaryText,
            ),
          ),
          child: child!,
        );
      },
    );
    if (picked != null) {
      setState(() => _selectedDate = picked);
    }
  }

  Future<void> _handleSave() async {
    if (_selectedWorker == null) {
      showLabourErrorFeedback(
        context,
        title: 'Worker Required',
        subtitle: 'Please select a worker for this wage log.',
      );
      return;
    }

    if (!_formKey.currentState!.validate()) return;

    setState(() => _isSaving = true);
    try {
      final db = ref.read(appDatabaseProvider);
      final wageAmount = double.tryParse(_amountController.text.trim()) ?? _selectedWorker!.dailyWage;
      final hours = _selectedShift.defaultHours;
      final notes = _notesController.text.trim();
      final shiftDesc = '${_selectedShift.name} • ${_selectedShift.timeRange}';
      final statusTag = '($_status)';
      final notesSuffix = notes.isNotEmpty ? ' | Notes: $notes' : '';
      final expenseDescription = 'Labour: ${_selectedWorker!.fullName} | $shiftDesc | $_selectedTask $statusTag$notesSuffix';
      final expensePaymentMethod = _status == 'Paid' ? 'Cash' : 'Pending';

      if (isEditing) {
        // Edit Mode: update existing records
        final expId = widget.existingExpense!.id;
        await db.transaction(() async {
          // 1. Update expense
          await (db.update(db.expensesTable)..where((t) => t.id.equals(expId))).write(
            ExpensesTableCompanion(
              amount: Value(wageAmount),
              date: Value(_selectedDate),
              paymentMethod: Value(expensePaymentMethod),
              description: Value(expenseDescription),
            ),
          );

          // 2. Update matching wage record if exists
          final matchingWages = await (db.select(db.wagesTable)
            ..where((t) => t.workerId.equals(_selectedWorker!.id) &
              t.paymentDate.year.equals(widget.existingExpense!.date.year) &
              t.paymentDate.month.equals(widget.existingExpense!.date.month) &
              t.paymentDate.day.equals(widget.existingExpense!.date.day)))
            .get();
          if (matchingWages.isNotEmpty) {
            for (final w in matchingWages) {
              await (db.update(db.wagesTable)..where((t) => t.id.equals(w.id))).write(
                WagesTableCompanion(
                  baseWage: Value(wageAmount),
                  netPay: Value(wageAmount),
                  paymentDate: Value(_selectedDate),
                  paymentMethod: Value(expensePaymentMethod),
                  referenceNotes: Value('Shift: $shiftDesc | Task: $_selectedTask | Status: $_status$notesSuffix'),
                ),
              );
            }
          }

          // 3. Update matching attendance
          final matchingAttendance = await (db.select(db.attendanceTable)
            ..where((t) => t.workerId.equals(_selectedWorker!.id) &
              t.date.year.equals(widget.existingExpense!.date.year) &
              t.date.month.equals(widget.existingExpense!.date.month) &
              t.date.day.equals(widget.existingExpense!.date.day)))
            .get();
          if (matchingAttendance.isNotEmpty) {
            for (final a in matchingAttendance) {
              await (db.update(db.attendanceTable)..where((t) => t.id.equals(a.id))).write(
                AttendanceTableCompanion(
                  date: Value(_selectedDate),
                  hoursWorked: Value(hours),
                  remarks: Value('$_selectedTask - $_status$notesSuffix'),
                ),
              );
            }
          }
        });
      } else {
        // Add Mode: insert new records
        final entryId = const Uuid().v4();
        await db.transaction(() async {
          // 1. Attendance Record
          await db.into(db.attendanceTable).insert(
                AttendanceTableCompanion.insert(
                  id: entryId,
                  workerId: _selectedWorker!.id,
                  date: _selectedDate,
                  hoursWorked: Value(hours),
                  overtimeHours: const Value(0.0),
                  leaveStatus: 'none',
                  remarks: Value('$_selectedTask - $_status$notesSuffix'),
                ),
                mode: InsertMode.replace,
              );

          // 2. Assignment Record
          await db.into(db.assignmentsTable).insert(
                AssignmentsTableCompanion.insert(
                  id: const Uuid().v4(),
                  workerId: _selectedWorker!.id,
                  batchId: Value(widget.initialBatchId),
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
                  workerId: _selectedWorker!.id,
                  baseWage: wageAmount,
                  overtimePay: 0.0,
                  bonuses: 0.0,
                  deductions: 0.0,
                  netPay: wageAmount,
                  paymentDate: _selectedDate,
                  paymentMethod: expensePaymentMethod,
                  referenceNotes: Value('Shift: $shiftDesc | Task: $_selectedTask | Status: $_status$notesSuffix'),
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
                  batchId: Value(widget.initialBatchId),
                ),
                mode: InsertMode.replace,
              );
        });
      }

      // Refresh providers
      await ref.read(expenseNotifierProvider.notifier).loadExpenses();
      await ref.read(labourNotifierProvider.notifier).loadWorkers();
      await ref.read(batchNotifierProvider.notifier).loadBatches();

      if (mounted) {
        showLabourSuccessFeedback(
          context,
          title: isEditing ? 'Wage Log Updated' : 'Wage log added successfully',
          subtitle: '₹${wageAmount.toStringAsFixed(0)} ${_status == "Paid" ? "paid to" : "pending for"} ${_selectedWorker!.fullName}',
        );
        if (Navigator.maybeOf(context)?.canPop() == true) {
          context.pop();
        } else {
          context.go('/labour');
        }
      }
    } catch (e) {
      if (mounted) {
        showLabourErrorFeedback(
          context,
          title: isEditing ? 'Failed to Update Wage Log' : 'Failed to save wage log',
          subtitle: e.toString(),
        );
      }
    } finally {
      if (mounted) setState(() => _isSaving = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final labourState = ref.watch(labourNotifierProvider);
    final allWorkers = switch (labourState) {
      LabourStateData(workers: final list) => list.where((w) => w.status == WorkerStatus.active).toList(),
      _ => <LabourWorker>[],
    };

    // Auto-select worker if editing or initialWorkerId provided
    if (!_initializedFromExpense && allWorkers.isNotEmpty) {
      _initializedFromExpense = true;
      if (widget.existingExpense != null) {
        final info = WageLogInfo.parse(widget.existingExpense!.description);
        _selectedWorker = allWorkers.firstWhere(
          (w) => w.fullName.toLowerCase().trim() == info.workerName.toLowerCase().trim(),
          orElse: () => allWorkers.first,
        );
      } else if (widget.initialWorkerId != null) {
        _selectedWorker = allWorkers.firstWhere(
          (w) => w.id == widget.initialWorkerId,
          orElse: () => allWorkers.first,
        );
        _amountController.text = _selectedWorker!.dailyWage.toStringAsFixed(0);
      } else {
        _selectedWorker = allWorkers.first;
        _amountController.text = _selectedWorker!.dailyWage.toStringAsFixed(0);
      }
    }

    final currentWorkType = LabourWorkType.findForTask(_selectedTask);

    return Scaffold(
      backgroundColor: LabourColors.background,
      appBar: AppBar(
        backgroundColor: LabourColors.background,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_rounded, color: LabourColors.primaryText),
          onPressed: () {
            if (Navigator.maybeOf(context)?.canPop() == true) {
              context.pop();
            } else {
              context.go('/labour');
            }
          },
        ),
        title: Text(
          isEditing ? 'Edit Wage Log' : 'Add Wage Log',
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: LabourColors.primaryText,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert, color: LabourColors.primaryText),
            onPressed: () {},
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // 1. Select Worker
                      _buildFieldLabel('Select Worker *'),
                      InkWell(
                        onTap: () async {
                          final chosen = await WorkerPickerSheet.show(
                            context,
                            workers: allWorkers,
                            currentWorker: _selectedWorker,
                          );
                          if (chosen != null) {
                            setState(() {
                              _selectedWorker = chosen;
                              if (!isEditing) {
                                _amountController.text = chosen.dailyWage.toStringAsFixed(0);
                              }
                            });
                          }
                        },
                        borderRadius: BorderRadius.circular(12),
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                          decoration: BoxDecoration(
                            color: LabourColors.cardSurface,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: LabourColors.border),
                          ),
                          child: Row(
                            children: [
                              if (_selectedWorker != null)
                                WorkerAvatar(worker: _selectedWorker, size: 40)
                              else
                                Container(
                                  width: 40,
                                  height: 40,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: LabourColors.softGreenSurface,
                                  ),
                                  child: const Icon(Icons.person_outline_rounded, color: LabourColors.forestGreen),
                                ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: _selectedWorker != null
                                    ? Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            _selectedWorker!.fullName,
                                            style: const TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w700,
                                              color: LabourColors.primaryText,
                                            ),
                                          ),
                                          const SizedBox(height: 2),
                                          Text(
                                            _selectedWorker!.phoneNumber,
                                            style: const TextStyle(
                                              fontSize: 12,
                                              color: LabourColors.secondaryText,
                                            ),
                                          ),
                                        ],
                                      )
                                    : const Text(
                                        'Choose a worker',
                                        style: TextStyle(fontSize: 14, color: LabourColors.mutedText),
                                      ),
                              ),
                              const Icon(Icons.arrow_drop_down, color: LabourColors.secondaryText),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),

                      // 2. Work Type
                      _buildFieldLabel('Work Type *'),
                      InkWell(
                        onTap: () async {
                          final chosen = await SelectWorkTypeSheet.show(context, _selectedTask);
                          if (chosen != null) {
                            setState(() => _selectedTask = chosen);
                          }
                        },
                        borderRadius: BorderRadius.circular(12),
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                          decoration: BoxDecoration(
                            color: LabourColors.cardSurface,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: LabourColors.border),
                          ),
                          child: Row(
                            children: [
                              Container(
                                width: 36,
                                height: 36,
                                decoration: BoxDecoration(
                                  color: currentWorkType.bgColor,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                alignment: Alignment.center,
                                child: Icon(currentWorkType.icon, color: currentWorkType.iconColor, size: 20),
                              ),
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
                              const Icon(Icons.arrow_drop_down, color: LabourColors.secondaryText),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),

                      // 3. Shift (Morning Shift vs Day Shift)
                      _buildFieldLabel('Shift *'),
                      InkWell(
                        onTap: () async {
                          final chosen = await SelectShiftSheet.show(context, _selectedShift);
                          if (chosen != null) {
                            setState(() => _selectedShift = chosen);
                          }
                        },
                        borderRadius: BorderRadius.circular(12),
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                          decoration: BoxDecoration(
                            color: LabourColors.cardSurface,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: LabourColors.border),
                          ),
                          child: Row(
                            children: [
                              Container(
                                width: 36,
                                height: 36,
                                decoration: BoxDecoration(
                                  color: _selectedShift.bgColor,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                alignment: Alignment.center,
                                child: Icon(_selectedShift.icon, color: _selectedShift.iconColor, size: 20),
                              ),
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
                              const Icon(Icons.arrow_drop_down, color: LabourColors.secondaryText),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),

                      // 4. Date
                      _buildFieldLabel('Date *'),
                      InkWell(
                        onTap: _pickDate,
                        borderRadius: BorderRadius.circular(12),
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
                          decoration: BoxDecoration(
                            color: LabourColors.cardSurface,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: LabourColors.border),
                          ),
                          child: Row(
                            children: [
                              const Icon(Icons.calendar_today_outlined, color: LabourColors.forestGreen, size: 20),
                              const SizedBox(width: 12),
                              Text(
                                DateFormat('d MMM yyyy').format(_selectedDate),
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: LabourColors.primaryText,
                                ),
                              ),
                              const Spacer(),
                              const Icon(Icons.arrow_drop_down, color: LabourColors.secondaryText),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),

                      // 5. Amount
                      _buildFieldLabel('Amount (₹) *'),
                      TextFormField(
                        controller: _amountController,
                        keyboardType: TextInputType.number,
                        style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: LabourColors.primaryText),
                        decoration: _inputDecoration(
                          hint: '500',
                          prefixIcon: const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                            child: Text(
                              '₹',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                color: LabourColors.secondaryText,
                              ),
                            ),
                          ),
                        ),
                        validator: (val) {
                          if (val == null || val.trim().isEmpty) {
                            return 'Amount is required';
                          }
                          final num = double.tryParse(val.trim());
                          if (num == null || num <= 0) {
                            return 'Enter a valid amount';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16),

                      // 6. Payment Status Chips
                      _buildFieldLabel('Payment Status *'),
                      Row(
                        children: [
                          _buildStatusChip(
                            label: 'Paid',
                            icon: Icons.check_circle_rounded,
                            activeColor: LabourColors.forestGreen,
                            activeBg: LabourColors.softGreenSurface,
                          ),
                          const SizedBox(width: 10),
                          _buildStatusChip(
                            label: 'Pending',
                            icon: null,
                            activeColor: const Color(0xFFD97706),
                            activeBg: LabourColors.softAmberSurface,
                          ),
                          const SizedBox(width: 10),
                          _buildStatusChip(
                            label: 'Overdue',
                            icon: Icons.error_rounded,
                            activeColor: LabourColors.error,
                            activeBg: LabourColors.softRedSurface,
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),

                      // 7. Notes (Optional)
                      _buildFieldLabel('Notes (Optional)'),
                      TextFormField(
                        controller: _notesController,
                        maxLines: 3,
                        style: const TextStyle(fontSize: 14, color: LabourColors.primaryText),
                        decoration: _inputDecoration(
                          hint: 'Additional notes',
                          prefixIcon: const Padding(
                            padding: EdgeInsets.only(left: 12, top: 12, right: 8),
                            child: Align(
                              alignment: Alignment.topCenter,
                              widthFactor: 1,
                              heightFactor: 1,
                              child: Icon(Icons.description_outlined, color: LabourColors.secondaryText, size: 20),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),
                    ],
                  ),
                ),
              ),
            ),

            // Bottom Actions (Cancel & Save Log / Update Log)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
              decoration: const BoxDecoration(
                color: LabourColors.cardSurface,
                border: Border(top: BorderSide(color: LabourColors.border)),
              ),
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: OutlinedButton(
                      onPressed: _isSaving
                          ? null
                          : () {
                              if (Navigator.maybeOf(context)?.canPop() == true) {
                                context.pop();
                              } else {
                                context.go('/labour');
                              }
                            },
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        side: const BorderSide(color: LabourColors.border),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      ),
                      child: const Text(
                        'Cancel',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: LabourColors.secondaryText,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    flex: 3,
                    child: ElevatedButton(
                      onPressed: _isSaving ? null : _handleSave,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: LabourColors.forestGreen,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        elevation: 0,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      ),
                      child: _isSaving
                          ? const SizedBox(
                              width: 20,
                              height: 20,
                              child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2),
                            )
                          : Text(
                              isEditing ? 'Update Log' : 'Save Log',
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
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
    );
  }

  Widget _buildFieldLabel(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w600,
          color: LabourColors.primaryText,
        ),
      ),
    );
  }

  Widget _buildStatusChip({
    required String label,
    IconData? icon,
    required Color activeColor,
    required Color activeBg,
  }) {
    final isSelected = _status.toLowerCase() == label.toLowerCase();
    return InkWell(
      onTap: () => setState(() => _status = label),
      borderRadius: BorderRadius.circular(10),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? activeBg : LabourColors.cardSurface,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: isSelected ? activeColor : LabourColors.border,
            width: isSelected ? 1.5 : 1,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (icon != null && isSelected) ...[
              Icon(icon, size: 16, color: activeColor),
              const SizedBox(width: 4),
            ],
            Text(
              label,
              style: TextStyle(
                fontSize: 13,
                fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
                color: isSelected ? activeColor : LabourColors.secondaryText,
              ),
            ),
          ],
        ),
      ),
    );
  }

  InputDecoration _inputDecoration({required String hint, Widget? prefixIcon}) {
    return InputDecoration(
      hintText: hint,
      hintStyle: const TextStyle(fontSize: 14, color: LabourColors.mutedText),
      filled: true,
      fillColor: LabourColors.cardSurface,
      prefixIcon: prefixIcon,
      contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: LabourColors.border),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: LabourColors.border),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: LabourColors.forestGreen, width: 1.5),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: LabourColors.error),
      ),
    );
  }
}
