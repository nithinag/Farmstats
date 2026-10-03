import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';
import 'package:drift/drift.dart' hide Column, Table, Batch;
import '../../../../core/theme/spacing.dart';
import '../../../../core/theme/color_scheme.dart';
import '../../domain/entities/labour_entities.dart';
import '../../application/providers/labour_notifier.dart';
import '../../application/providers/labour_state.dart';
import '../../../batches/application/providers/batch_notifier.dart';
import '../../../batches/application/providers/batch_state.dart';
import '../../../batches/domain/entities/batch_entities.dart';
import '../../../expenses/application/providers/expense_notifier.dart';
import '../../../../data/providers/database_provider.dart';
import '../../../../data/database/app_database.dart';

class AttendanceScreen extends ConsumerStatefulWidget {
  final String? initialBatchId;
  final String? initialWorkerId;

  const AttendanceScreen({super.key, this.initialBatchId, this.initialWorkerId});

  @override
  ConsumerState<AttendanceScreen> createState() => _AttendanceScreenState();
}

class _AttendanceScreenState extends ConsumerState<AttendanceScreen> {
  final _formKey = GlobalKey<FormState>();

  LabourWorker? _selectedWorker;
  String? _selectedBatchId;
  DateTime _selectedDate = DateTime.now();
  String _task = 'Silkworm Feeding & Bed Cleaning';
  String _paymentStatus = 'Paid'; // Paid, Unpaid, Partial
  final String _paymentMethod = 'Cash';

  late TextEditingController _wageController;
  late TextEditingController _remarksController;
  bool _isSaving = false;

  final _tasks = [
    'Silkworm Feeding & Bed Cleaning',
    'Mulberry Leaf Harvesting',
    'Rearing House Disinfection',
    'Mountage & Spinning Setup',
    'Cocoon Harvesting & Sorting',
    'General Farm Maintenance',
    'Other Task',
  ];

  @override
  void initState() {
    super.initState();
    _wageController = TextEditingController(text: '600');
    _remarksController = TextEditingController();
    _selectedBatchId = widget.initialBatchId;
  }

  @override
  void dispose() {
    _wageController.dispose();
    _remarksController.dispose();
    super.dispose();
  }

  Future<void> _saveLabour() async {
    if (_selectedWorker == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please select a worker first.'),
          backgroundColor: AppColorScheme.error,
        ),
      );
      return;
    }

    if (_formKey.currentState!.validate()) {
      setState(() => _isSaving = true);
      try {
        final db = ref.read(appDatabaseProvider);
        final wageAmount = double.tryParse(_wageController.text) ?? _selectedWorker!.dailyWage;
        final entryId = const Uuid().v4();

        await db.transaction(() async {
          // 1. Insert Attendance Record
          await db.into(db.attendanceTable).insert(
                AttendanceTableCompanion.insert(
                  id: entryId,
                  workerId: _selectedWorker!.id,
                  date: _selectedDate,
                  hoursWorked: const Value(8.0),
                  overtimeHours: const Value(0.0),
                  leaveStatus: 'none',
                  remarks: Value('$_task - $_paymentStatus'),
                ),
                mode: InsertMode.replace,
              );

          // 2. Insert Assignment Record with Batch Linkage
          await db.into(db.assignmentsTable).insert(
                AssignmentsTableCompanion.insert(
                  id: const Uuid().v4(),
                  workerId: _selectedWorker!.id,
                  batchId: Value(_selectedBatchId),
                  task: _task,
                  startTime: _selectedDate,
                  status: 'completed',
                ),
                mode: InsertMode.replace,
              );

          // 3. Insert Wage Record
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
                  paymentMethod: _paymentMethod,
                  referenceNotes: Value('Batch: ${_selectedBatchId ?? "General"} | Status: $_paymentStatus'),
                ),
                mode: InsertMode.replace,
              );

          // 4. Automatically Create Labour Expense Record
          final expenseId = const Uuid().v4();
          await db.into(db.expensesTable).insert(
                ExpensesTableCompanion.insert(
                  id: expenseId,
                  amount: wageAmount,
                  date: _selectedDate,
                  categoryId: 'c4', // Labour Wages
                  paymentMethod: _paymentStatus == 'Unpaid' ? 'Pending' : _paymentMethod,
                  description: 'Labour: ${_selectedWorker!.fullName} - $_task ($_paymentStatus)',
                  batchId: Value(_selectedBatchId),
                ),
                mode: InsertMode.replace,
              );
        });

        // Refresh all relevant providers
        await ref.read(expenseNotifierProvider.notifier).loadExpenses();
        await ref.read(labourNotifierProvider.notifier).loadWorkers();
        await ref.read(batchNotifierProvider.notifier).loadBatches();

        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('✓ Labour entry of ₹${wageAmount.toStringAsFixed(0)} recorded for ${_selectedWorker!.fullName}'),
              backgroundColor: AppColorScheme.primary,
            ),
          );
          context.pop();
        }
      } catch (e) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Failed to save labour entry: $e'),
              backgroundColor: AppColorScheme.error,
            ),
          );
        }
      } finally {
        if (mounted) setState(() => _isSaving = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final labourState = ref.watch(labourNotifierProvider);
    final activeBatch = ref.watch(activeBatchProvider);
    final batchState = ref.watch(batchNotifierProvider);

    final workers = switch (labourState) {
      LabourStateData(workers: final list) => list,
      _ => <LabourWorker>[],
    };

    final allBatches = switch (batchState) {
      BatchStateData(batches: final list) => list,
      _ => <Batch>[],
    };

    if (_selectedBatchId == null && activeBatch != null) {
      _selectedBatchId = activeBatch.id;
    }

    if (_selectedWorker == null && workers.isNotEmpty) {
      if (widget.initialWorkerId != null) {
        _selectedWorker = workers.where((w) => w.id == widget.initialWorkerId).firstOrNull ?? workers.first;
      } else {
        _selectedWorker = workers.first;
      }
      _wageController.text = _selectedWorker!.dailyWage.toStringAsFixed(0);
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF1E293B)),
          onPressed: () => context.pop(),
        ),
        title: const Text(
          'Add Labour',
          style: TextStyle(
            color: Color(0xFF1E293B),
            fontWeight: FontWeight.w700,
            fontSize: 18,
          ),
        ),
        centerTitle: true,
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.fromLTRB(AppSpacing.md, AppSpacing.sm, AppSpacing.md, AppSpacing.lg),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              blurRadius: 10,
              offset: const Offset(0, -4),
            ),
          ],
        ),
        child: SizedBox(
          height: 52,
          child: ElevatedButton(
            onPressed: (_isSaving || workers.isEmpty) ? null : _saveLabour,
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColorScheme.forestGreen,
              foregroundColor: Colors.white,
              elevation: 0,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
            ),
            child: _isSaving
                ? const SizedBox(
                    width: 22,
                    height: 22,
                    child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2),
                  )
                : const Text(
                    'Save Labour',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
          ),
        ),
      ),
      body: workers.isEmpty
          ? Center(
              child: Padding(
                padding: const EdgeInsets.all(AppSpacing.xl),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 72,
                      height: 72,
                      decoration: BoxDecoration(
                        color: AppColorScheme.pastelBlue,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Icon(Icons.people_outline, size: 36, color: Color(0xFF0369A1)),
                    ),
                    const SizedBox(height: AppSpacing.md),
                    const Text(
                      'No Workers Added Yet',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: Color(0xFF1E293B)),
                    ),
                    const SizedBox(height: AppSpacing.xs),
                    const Text(
                      'Add your farm workers first to log daily labour activities and wages.',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Color(0xFF64748B), fontSize: 13),
                    ),
                    const SizedBox(height: AppSpacing.lg),
                    FilledButton.icon(
                      onPressed: () => context.push('/labour/add'),
                      icon: const Icon(Icons.person_add, size: 18),
                      label: const Text('Add Worker'),
                      style: FilledButton.styleFrom(
                        backgroundColor: AppColorScheme.forestGreen,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      ),
                    ),
                  ],
                ),
              ),
            )
          : Form(
              key: _formKey,
              child: ListView(
                padding: const EdgeInsets.all(AppSpacing.md),
                children: [
                  // 1. Batch Selection
                  const Text(
                    'Batch',
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: Color(0xFF64748B)),
                  ),
                  const SizedBox(height: 6),
                  Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFFF8FAFC),
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(color: const Color(0xFFE2E8F0)),
                    ),
                    child: DropdownButtonFormField<String>(
                      initialValue: _selectedBatchId,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.layers_outlined, color: AppColorScheme.forestGreen, size: 20),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                      ),
                      icon: const Icon(Icons.keyboard_arrow_down, color: Color(0xFF64748B)),
                      items: allBatches.map((b) {
                        final isCurrent = activeBatch?.id == b.id;
                        return DropdownMenuItem(
                          value: b.id,
                          child: Text(
                            '${b.batchName}${isCurrent ? ' (Active)' : ''}',
                            style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14, color: Color(0xFF1E293B)),
                          ),
                        );
                      }).toList(),
                      onChanged: (b) => setState(() => _selectedBatchId = b),
                    ),
                  ),
                  const SizedBox(height: AppSpacing.md),

                  // 2. Worker & Work Type
                  Row(
                    children: [
                      // Worker Selector
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'Worker',
                                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: Color(0xFF64748B)),
                                ),
                                GestureDetector(
                                  onTap: () => context.push('/labour/add'),
                                  child: const Icon(Icons.add_circle_outline, size: 18, color: AppColorScheme.forestGreen),
                                ),
                              ],
                            ),
                            const SizedBox(height: 6),
                            Container(
                              decoration: BoxDecoration(
                                color: const Color(0xFFF8FAFC),
                                borderRadius: BorderRadius.circular(14),
                                border: Border.all(color: const Color(0xFFE2E8F0)),
                              ),
                              child: DropdownButtonFormField<LabourWorker>(
                                initialValue: _selectedWorker,
                                decoration: const InputDecoration(
                                  prefixIcon: Icon(Icons.person_outline, color: Color(0xFF64748B), size: 18),
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 12),
                                ),
                                isExpanded: true,
                                icon: const Icon(Icons.keyboard_arrow_down, color: Color(0xFF64748B)),
                                items: workers.map((w) {
                                  return DropdownMenuItem(
                                    value: w,
                                    child: Text(
                                      w.fullName,
                                      style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: Color(0xFF1E293B)),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  );
                                }).toList(),
                                onChanged: (w) {
                                  if (w != null) {
                                    setState(() {
                                      _selectedWorker = w;
                                      _wageController.text = w.dailyWage.toStringAsFixed(0);
                                    });
                                  }
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: AppSpacing.sm),
                      // Work Type Selector
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Work Type',
                              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: Color(0xFF64748B)),
                            ),
                            const SizedBox(height: 6),
                            Container(
                              decoration: BoxDecoration(
                                color: const Color(0xFFF8FAFC),
                                borderRadius: BorderRadius.circular(14),
                                border: Border.all(color: const Color(0xFFE2E8F0)),
                              ),
                              child: DropdownButtonFormField<String>(
                                initialValue: _task,
                                decoration: const InputDecoration(
                                  prefixIcon: Icon(Icons.work_outline, color: Color(0xFF64748B), size: 18),
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 12),
                                ),
                                isExpanded: true,
                                icon: const Icon(Icons.keyboard_arrow_down, color: Color(0xFF64748B)),
                                items: _tasks.map((t) {
                                  final shortLabel = t.length > 18 ? '${t.substring(0, 16)}...' : t;
                                  return DropdownMenuItem(
                                    value: t,
                                    child: Text(
                                      shortLabel,
                                      style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: Color(0xFF1E293B)),
                                    ),
                                  );
                                }).toList(),
                                onChanged: (t) => setState(() => _task = t ?? _tasks[0]),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: AppSpacing.md),

                  // 3. Date & Amount (Side-by-side)
                  Row(
                    children: [
                      // Date Selector
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Date',
                              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: Color(0xFF64748B)),
                            ),
                            const SizedBox(height: 6),
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
                                height: 50,
                                padding: const EdgeInsets.symmetric(horizontal: 12),
                                decoration: BoxDecoration(
                                  color: const Color(0xFFF8FAFC),
                                  borderRadius: BorderRadius.circular(14),
                                  border: Border.all(color: const Color(0xFFE2E8F0)),
                                ),
                                child: Row(
                                  children: [
                                    const Icon(Icons.calendar_today_outlined, size: 18, color: Color(0xFF64748B)),
                                    const SizedBox(width: 8),
                                    Text(
                                      DateFormat('dd MMM yyyy').format(_selectedDate),
                                      style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: Color(0xFF1E293B)),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: AppSpacing.sm),
                      // Wage Amount
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Amount (₹)',
                              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: Color(0xFF64748B)),
                            ),
                            const SizedBox(height: 6),
                            Container(
                              height: 50,
                              decoration: BoxDecoration(
                                color: const Color(0xFFF8FAFC),
                                borderRadius: BorderRadius.circular(14),
                                border: Border.all(color: const Color(0xFFE2E8F0)),
                              ),
                              child: TextFormField(
                                controller: _wageController,
                                keyboardType: const TextInputType.numberWithOptions(decimal: true),
                                decoration: const InputDecoration(
                                  prefixIcon: Icon(Icons.currency_rupee, size: 18, color: Color(0xFF64748B)),
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 14),
                                ),
                                style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 15, color: Color(0xFF1E293B)),
                                validator: (v) => (double.tryParse(v ?? '') ?? 0) <= 0 ? 'Enter valid wage' : null,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: AppSpacing.md),

                  // 4. Payment Status Segmented Control
                  const Text(
                    'Payment Status',
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: Color(0xFF64748B)),
                  ),
                  const SizedBox(height: 6),
                  Container(
                    height: 44,
                    decoration: BoxDecoration(
                      color: const Color(0xFFF1F5F9),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      children: ['Paid', 'Unpaid', 'Partial'].map((status) {
                        final isSelected = _paymentStatus == status;
                        return Expanded(
                          child: GestureDetector(
                            onTap: () => setState(() => _paymentStatus = status),
                            child: Container(
                              margin: const EdgeInsets.all(3),
                              decoration: BoxDecoration(
                                color: isSelected ? Colors.white : Colors.transparent,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: isSelected
                                    ? [
                                        BoxShadow(
                                          color: Colors.black.withValues(alpha: 0.06),
                                          blurRadius: 4,
                                          offset: const Offset(0, 1),
                                        )
                                      ]
                                    : null,
                              ),
                              alignment: Alignment.center,
                              child: Text(
                                status,
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
                                  color: isSelected ? const Color(0xFF1E293B) : const Color(0xFF64748B),
                                ),
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                  const SizedBox(height: AppSpacing.md),

                  // 5. Notes (Optional)
                  const Text(
                    'Notes (Optional)',
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: Color(0xFF64748B)),
                  ),
                  const SizedBox(height: 6),
                  Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFFF8FAFC),
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(color: const Color(0xFFE2E8F0)),
                    ),
                    child: TextFormField(
                      controller: _remarksController,
                      maxLines: 2,
                      decoration: const InputDecoration(
                        hintText: 'Add notes...',
                        hintStyle: TextStyle(color: Color(0xFF94A3B8), fontSize: 13),
                        prefixIcon: Icon(Icons.edit_note, color: Color(0xFF94A3B8), size: 20),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.all(12),
                      ),
                      style: const TextStyle(fontSize: 13, color: Color(0xFF1E293B)),
                    ),
                  ),
                  const SizedBox(height: AppSpacing.xl),
                ],
              ),
            ),
    );
  }
}
