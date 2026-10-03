import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';
import 'package:drift/drift.dart' hide Column, Table, Batch;
import '../../../../shared/widgets/layout_components.dart';
import '../../../../core/theme/spacing.dart';
import '../../../../core/theme/radius.dart';
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
  String _paymentStatus = 'Paid'; // Paid, Partially Paid, Unpaid
  String _paymentMethod = 'Cash';

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

  final _paymentStatuses = ['Paid', 'Partially Paid', 'Unpaid'];
  final _paymentMethods = ['Cash', 'UPI', 'Bank Transfer'];

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

    return BaseScaffold(
      appBar: AppBar(
        title: const Text('Log Labour & Attendance'),
        elevation: 0,
      ),
      body: workers.isEmpty
          ? Center(
              child: Padding(
                padding: const EdgeInsets.all(AppSpacing.xl),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.people_outline, size: 56, color: Colors.grey),
                    const SizedBox(height: AppSpacing.md),
                    const Text(
                      'No Workers Added Yet',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: AppSpacing.xs),
                    const Text(
                      'Add your farm workers first before logging daily labour activities and wages.',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.grey),
                    ),
                    const SizedBox(height: AppSpacing.lg),
                    FilledButton.icon(
                      onPressed: () => context.push('/labour/add'),
                      icon: const Icon(Icons.person_add),
                      label: const Text('Add Worker'),
                      style: FilledButton.styleFrom(backgroundColor: AppColorScheme.primary),
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
                  // 1. Worker Selection Card
                  Card(
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(AppRadius.md),
                      side: BorderSide(color: Colors.grey.shade300),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(AppSpacing.md),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'FARM WORKER',
                                style: TextStyle(fontSize: 11, fontWeight: FontWeight.w700, color: Colors.grey),
                              ),
                              TextButton.icon(
                                onPressed: () => context.push('/labour/add'),
                                icon: const Icon(Icons.add, size: 14),
                                label: const Text('New Worker', style: TextStyle(fontSize: 12)),
                              ),
                            ],
                          ),
                          DropdownButtonFormField<LabourWorker>(
                            initialValue: _selectedWorker,
                            decoration: const InputDecoration(
                              prefixIcon: Icon(Icons.person, color: AppColorScheme.primaryLight),
                              border: OutlineInputBorder(),
                            ),
                            items: workers.map((w) {
                              return DropdownMenuItem(
                                value: w,
                                child: Text('${w.fullName} • ₹${w.dailyWage.toStringAsFixed(0)}/day'),
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
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: AppSpacing.md),

                  // 2. Batch Association & Date
                  Card(
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(AppRadius.md),
                      side: BorderSide(color: Colors.grey.shade300),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(AppSpacing.md),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'BATCH & DATE',
                            style: TextStyle(fontSize: 11, fontWeight: FontWeight.w700, color: Colors.grey),
                          ),
                          const SizedBox(height: AppSpacing.sm),
                          DropdownButtonFormField<String>(
                            initialValue: _selectedBatchId,
                            decoration: const InputDecoration(
                              labelText: 'Associated Batch',
                              prefixIcon: Icon(Icons.layers_outlined),
                              border: OutlineInputBorder(),
                            ),
                            items: allBatches.map((b) {
                              final isCurrent = activeBatch?.id == b.id;
                              return DropdownMenuItem(
                                value: b.id,
                                child: Text('${b.batchName} (${b.numberOfDfls} DFLs) ${isCurrent ? '• Active' : ''}'),
                              );
                            }).toList(),
                            onChanged: (b) => setState(() => _selectedBatchId = b),
                          ),
                          const SizedBox(height: AppSpacing.md),
                          ListTile(
                            contentPadding: EdgeInsets.zero,
                            leading: const Icon(Icons.calendar_today, color: AppColorScheme.primaryLight),
                            title: const Text('Activity Date'),
                            subtitle: Text(DateFormat('dd MMMM yyyy').format(_selectedDate)),
                            trailing: OutlinedButton(
                              onPressed: () async {
                                final d = await showDatePicker(
                                  context: context,
                                  initialDate: _selectedDate,
                                  firstDate: DateTime(2020),
                                  lastDate: DateTime.now().add(const Duration(days: 30)),
                                );
                                if (d != null) setState(() => _selectedDate = d);
                              },
                              child: const Text('Change'),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: AppSpacing.md),

                  // 3. Task & Wage
                  Card(
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(AppRadius.md),
                      side: BorderSide(color: Colors.grey.shade300),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(AppSpacing.md),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'WORK & WAGE DETAILS',
                            style: TextStyle(fontSize: 11, fontWeight: FontWeight.w700, color: Colors.grey),
                          ),
                          const SizedBox(height: AppSpacing.sm),
                          DropdownButtonFormField<String>(
                            initialValue: _task,
                            decoration: const InputDecoration(
                              labelText: 'Work / Task Type',
                              prefixIcon: Icon(Icons.work_outline),
                              border: OutlineInputBorder(),
                            ),
                            items: _tasks.map((t) => DropdownMenuItem(value: t, child: Text(t))).toList(),
                            onChanged: (t) => setState(() => _task = t ?? _tasks[0]),
                          ),
                          const SizedBox(height: AppSpacing.md),
                          TextFormField(
                            controller: _wageController,
                            keyboardType: const TextInputType.numberWithOptions(decimal: true),
                            decoration: const InputDecoration(
                              labelText: 'Wage / Amount to Pay (₹) *',
                              prefixIcon: Icon(Icons.currency_rupee),
                              border: OutlineInputBorder(),
                            ),
                            validator: (v) => (double.tryParse(v ?? '') ?? 0) <= 0 ? 'Enter valid wage amount' : null,
                          ),
                          const SizedBox(height: AppSpacing.md),
                          Row(
                            children: [
                              Expanded(
                                child: DropdownButtonFormField<String>(
                                  initialValue: _paymentStatus,
                                  decoration: const InputDecoration(
                                    labelText: 'Payment Status',
                                    border: OutlineInputBorder(),
                                  ),
                                  items: _paymentStatuses.map((s) => DropdownMenuItem(value: s, child: Text(s))).toList(),
                                  onChanged: (s) => setState(() => _paymentStatus = s ?? 'Paid'),
                                ),
                              ),
                              const SizedBox(width: AppSpacing.sm),
                              Expanded(
                                child: DropdownButtonFormField<String>(
                                  initialValue: _paymentMethod,
                                  decoration: const InputDecoration(
                                    labelText: 'Payment Mode',
                                    border: OutlineInputBorder(),
                                  ),
                                  items: _paymentMethods.map((m) => DropdownMenuItem(value: m, child: Text(m))).toList(),
                                  onChanged: (m) => setState(() => _paymentMethod = m ?? 'Cash'),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: AppSpacing.lg),

                  // Submit Button
                  SizedBox(
                    height: 50,
                    child: FilledButton.icon(
                      onPressed: _isSaving ? null : _saveLabour,
                      style: FilledButton.styleFrom(
                        backgroundColor: AppColorScheme.primary,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppRadius.md)),
                      ),
                      icon: _isSaving
                          ? const SizedBox(width: 20, height: 20, child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2))
                          : const Icon(Icons.check),
                      label: Text(
                        _isSaving ? 'Saving...' : 'RECORD LABOUR ENTRY',
                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                    ),
                  ),
                  const SizedBox(height: AppSpacing.xl),
                ],
              ),
            ),
    );
  }
}
