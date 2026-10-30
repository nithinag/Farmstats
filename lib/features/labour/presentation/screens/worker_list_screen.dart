import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:drift/drift.dart' hide Column, Batch;
import '../theme/labour_theme.dart';
import '../widgets/labour_components.dart';
import 'wage_log_details_screen.dart';
import '../../domain/entities/labour_entities.dart';
import '../../application/providers/labour_notifier.dart';
import '../../application/providers/labour_state.dart';
import '../../application/services/labour_calculation_service.dart';
import '../../../batches/domain/entities/batch_entities.dart';
import '../../../batches/application/providers/batch_notifier.dart';
import '../../../batches/application/providers/batch_state.dart';
import '../../../expenses/application/providers/expense_notifier.dart';
import '../../../expenses/application/providers/expense_state.dart';
import '../../../expenses/domain/entities/expense_entities.dart';
import '../../../../core/services/export_service.dart';
import '../../../../data/providers/database_provider.dart';
import '../../../../data/database/app_database.dart';

enum WorkerSort {
  name,
  dailyWageHighToLow,
  dailyWageLowToHigh,
  totalEarned,
}

class WorkerListScreen extends ConsumerStatefulWidget {
  const WorkerListScreen({super.key});

  @override
  ConsumerState<WorkerListScreen> createState() => _WorkerListScreenState();
}

class _WorkerListScreenState extends ConsumerState<WorkerListScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final TextEditingController _workerSearchController = TextEditingController();
  
  bool _isSearching = false;
  String _workerSearchQuery = '';

  // Workers filtering state (Screen 2 & Screen 6)
  String _workerStatusFilter = 'All'; // 'All', 'Active', 'Inactive'
  String _workerTodayStatusFilter = 'All'; // 'All', 'Added Today', 'Not Added'
  WorkerSort _workerSort = WorkerSort.name;

  bool get _isWorkersFiltered =>
      _workerStatusFilter != 'All' ||
      _workerTodayStatusFilter != 'All' ||
      _workerSort != WorkerSort.name;

  // Wage Logs filtering state (Screen 11)
  String _wageLogScope = 'current_batch'; // 'current_batch', 'select_batch'
  String? _selectedBatchId;
  String _wageLogPeriod = 'this_month'; // 'this_month', 'select_month', 'this_year', 'select_year', 'entire_history'
  DateTime _wageLogDate = DateTime.now();
  String _wageLogStatusFilter = 'All'; // 'All', 'Paid', 'Unpaid'
  String _wageLogSort = 'Newest First';
  String? _filterWorkerId;
  String? _filterWorkType;

  bool get _isWageLogsFiltered =>
      _wageLogScope != 'current_batch' ||
      _selectedBatchId != null ||
      _wageLogPeriod != 'this_month' ||
      _wageLogStatusFilter != 'All' ||
      _wageLogSort != 'Newest First' ||
      _filterWorkerId != null ||
      _filterWorkType != null;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    // Listen to tab controller and animation to reactively sync tabs on drag/swipe
    _tabController.addListener(_onTabChanged);
    _tabController.animation?.addListener(_onTabAnimation);
  }

  void _onTabChanged() {
    if (mounted) setState(() {});
  }

  void _onTabAnimation() {
    if (mounted) setState(() {});
  }

  @override
  void dispose() {
    _tabController.removeListener(_onTabChanged);
    _tabController.animation?.removeListener(_onTabAnimation);
    _tabController.dispose();
    _workerSearchController.dispose();
    super.dispose();
  }

  Future<void> _markExpenseStatus(Expense expense, bool makePaid) async {
    try {
      final db = ref.read(appDatabaseProvider);
      final newPaymentMethod = makePaid ? 'Cash' : 'Pending';
      final updatedDesc = makePaid
          ? expense.description
              .replaceAll('(Pending)', '(Paid)')
              .replaceAll('(Unpaid)', '(Paid)')
              .replaceAll('(Overdue)', '(Paid)')
          : expense.description.replaceAll('(Paid)', '(Pending)');

      await db.transaction(() async {
        await (db.update(db.expensesTable)..where((t) => t.id.equals(expense.id))).write(
          ExpensesTableCompanion(
            paymentMethod: Value(newPaymentMethod),
            description: Value(updatedDesc),
          ),
        );

        final matchingWages = await (db.select(db.wagesTable)
          ..where((t) => t.netPay.equals(expense.amount) &
            t.paymentDate.year.equals(expense.date.year) &
            t.paymentDate.month.equals(expense.date.month) &
            t.paymentDate.day.equals(expense.date.day)))
          .get();
        for (final w in matchingWages) {
          await (db.update(db.wagesTable)..where((t) => t.id.equals(w.id))).write(
            WagesTableCompanion(
              paymentMethod: Value(newPaymentMethod),
            ),
          );
        }
      });

      await ref.read(expenseNotifierProvider.notifier).loadExpenses();
      await ref.read(labourNotifierProvider.notifier).loadWorkers();
      if (mounted) {
        showLabourSuccessFeedback(
          context,
          title: makePaid ? 'Marked as Paid' : 'Marked as Pending',
          subtitle: '₹${expense.amount.toStringAsFixed(0)} status updated successfully.',
        );
      }
    } catch (e) {
      if (mounted) {
        showLabourErrorFeedback(
          context,
          title: 'Update Failed',
          subtitle: e.toString(),
        );
      }
    }
  }

  Future<void> _deleteWageLog(Expense expense) async {
    final info = WageLogInfo.parse(expense.description);
    final formattedDate = DateFormat('d MMM yyyy').format(expense.date);

    final confirmed = await DeleteWageLogDialog.show(
      context,
      taskTitle: info.taskTitle,
      workerName: info.workerName,
      amount: expense.amount,
      formattedDate: formattedDate,
      shiftName: info.shiftName,
      onConfirm: () {},
    );

    if (confirmed != true) return;

    try {
      final db = ref.read(appDatabaseProvider);
      await db.transaction(() async {
        // 1. Delete from expensesTable
        await (db.delete(db.expensesTable)..where((t) => t.id.equals(expense.id))).go();

        // 2. Delete matching wage from wagesTable
        final matchingWages = await (db.select(db.wagesTable)
          ..where((t) => t.netPay.equals(expense.amount) &
            t.paymentDate.year.equals(expense.date.year) &
            t.paymentDate.month.equals(expense.date.month) &
            t.paymentDate.day.equals(expense.date.day)))
          .get();
        for (final w in matchingWages) {
          await (db.delete(db.wagesTable)..where((t) => t.id.equals(w.id))).go();
        }

        // 3. Delete matching attendance if linked
        final matchingAttendance = await (db.select(db.attendanceTable)
          ..where((t) => t.date.year.equals(expense.date.year) &
            t.date.month.equals(expense.date.month) &
            t.date.day.equals(expense.date.day)))
          .get();
        for (final a in matchingAttendance) {
          if (a.remarks != null && expense.description.contains(a.remarks!)) {
            await (db.delete(db.attendanceTable)..where((t) => t.id.equals(a.id))).go();
          }
        }
      });

      await ref.read(expenseNotifierProvider.notifier).loadExpenses();
      await ref.read(labourNotifierProvider.notifier).loadWorkers();

      if (mounted) {
        showLabourSuccessFeedback(
          context,
          title: 'Wage Log Deleted',
          subtitle: 'Removed wage log of ₹${expense.amount.toStringAsFixed(0)} for ${info.workerName}',
        );
      }
    } catch (e) {
      if (mounted) {
        showLabourErrorFeedback(
          context,
          title: 'Failed to Delete Wage Log',
          subtitle: e.toString(),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final currency = NumberFormat.currency(symbol: '₹', decimalDigits: 0, locale: 'en_IN');
    final labourState = ref.watch(labourNotifierProvider);
    final expenseState = ref.watch(expenseNotifierProvider);
    final batchState = ref.watch(batchNotifierProvider);

    final allWorkers = switch (labourState) {
      LabourStateData(workers: final list) => list,
      _ => <LabourWorker>[],
    };

    final allBatches = switch (batchState) {
      BatchStateData(batches: final list) => list,
      _ => <Batch>[],
    };

    final activeBatch = allBatches.where((b) => b.status == BatchStatus.active).firstOrNull ?? allBatches.firstOrNull;

    final allExpenses = switch (expenseState) {
      ExpenseStateData(expenses: final list) => list,
      _ => <Expense>[],
    };

    // Labour expenses
    final labourExpenses = allExpenses.where((e) {
      return e.category.id == 'c4' || e.description.toLowerCase().contains('labour');
    }).toList();

    final today = DateTime.now();
    final todayExpenses = labourExpenses.where((e) {
      return e.date.year == today.year && e.date.month == today.month && e.date.day == today.day;
    }).toList();

    final recordedWorkerNamesToday = <String>{};
    for (final e in todayExpenses) {
      final info = WageLogInfo.parse(e.description);
      recordedWorkerNamesToday.add(info.workerName.toLowerCase().trim());
    }

    // Filter workers by status (Screen 2 Reference)
    var displayedWorkers = allWorkers.where((w) {
      if (_workerStatusFilter == 'Active') return w.status == WorkerStatus.active;
      if (_workerStatusFilter == 'Inactive') return w.status == WorkerStatus.inactive;
      return true;
    }).toList();

    // Filter workers by Today's Status (Screen 2 Reference)
    if (_workerTodayStatusFilter == 'Added Today') {
      displayedWorkers = displayedWorkers.where((w) {
        return recordedWorkerNamesToday.contains(w.fullName.toLowerCase().trim()) ||
            todayExpenses.any((e) => e.description.toLowerCase().contains(w.fullName.toLowerCase().trim()));
      }).toList();
    } else if (_workerTodayStatusFilter == 'Not Added') {
      displayedWorkers = displayedWorkers.where((w) {
        return !recordedWorkerNamesToday.contains(w.fullName.toLowerCase().trim()) &&
            !todayExpenses.any((e) => e.description.toLowerCase().contains(w.fullName.toLowerCase().trim()));
      }).toList();
    }

    // Filter workers by search query
    if (_workerSearchQuery.isNotEmpty) {
      final q = _workerSearchQuery.toLowerCase();
      displayedWorkers = displayedWorkers.where((w) {
        return w.fullName.toLowerCase().contains(q) || w.phoneNumber.contains(q);
      }).toList();
    }

    // Sort workers (Screen 2 Reference)
    switch (_workerSort) {
      case WorkerSort.name:
        displayedWorkers.sort((a, b) => a.fullName.toLowerCase().compareTo(b.fullName.toLowerCase()));
        break;
      case WorkerSort.dailyWageHighToLow:
        displayedWorkers.sort((a, b) => b.dailyWage.compareTo(a.dailyWage));
        break;
      case WorkerSort.dailyWageLowToHigh:
        displayedWorkers.sort((a, b) => a.dailyWage.compareTo(b.dailyWage));
        break;
      case WorkerSort.totalEarned:
        displayedWorkers.sort((a, b) {
          final aEarned = LabourCalculationService.calculateWorkerAllTime(labourExpenses, a.fullName).totalEarned;
          final bEarned = LabourCalculationService.calculateWorkerAllTime(labourExpenses, b.fullName).totalEarned;
          return bEarned.compareTo(aEarned);
        });
        break;
    }

    // Determine current selected tab reactively from animation/index for seamless swipe feedback
    final animValue = _tabController.animation?.value ?? _tabController.index.toDouble();
    final isWorkersSelected = animValue < 0.5;

    return Scaffold(
      backgroundColor: LabourColors.background,
      appBar: _isSearching
          ? AppBar(
              backgroundColor: LabourColors.background,
              elevation: 0,
              leading: IconButton(
                icon: const Icon(Icons.arrow_back_rounded, color: LabourColors.primaryText),
                onPressed: () {
                  setState(() {
                    _isSearching = false;
                    _workerSearchQuery = '';
                    _workerSearchController.clear();
                  });
                },
              ),
              title: TextField(
                controller: _workerSearchController,
                autofocus: true,
                decoration: const InputDecoration(
                  hintText: 'Search workers or phone...',
                  hintStyle: TextStyle(fontSize: 14, color: LabourColors.mutedText),
                  border: InputBorder.none,
                ),
                onChanged: (val) => setState(() => _workerSearchQuery = val.trim()),
              ),
              actions: [
                if (_workerSearchQuery.isNotEmpty)
                  IconButton(
                    icon: const Icon(Icons.clear_rounded, color: LabourColors.secondaryText),
                    onPressed: () {
                      setState(() {
                        _workerSearchQuery = '';
                        _workerSearchController.clear();
                      });
                    },
                  ),
              ],
            )
          : AppBar(
              backgroundColor: LabourColors.background,
              elevation: 0,
              leading: IconButton(
                icon: const Icon(Icons.arrow_back_rounded, color: LabourColors.primaryText),
                onPressed: () {
                  if (Navigator.maybeOf(context)?.canPop() == true) {
                    context.pop();
                  } else {
                    context.go('/');
                  }
                },
              ),
              title: const Text(
                'Labour & Wages',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: LabourColors.primaryText,
                ),
              ),
              centerTitle: true,
              actions: [
                IconButton(
                  icon: const Icon(Icons.search, color: LabourColors.primaryText),
                  onPressed: () => setState(() => _isSearching = true),
                ),
                IconButton(
                  icon: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      const Icon(Icons.tune_rounded, color: LabourColors.primaryText),
                      if ((_tabController.index == 0 && _isWorkersFiltered) ||
                          (_tabController.index == 1 && _isWageLogsFiltered))
                        Positioned(
                          right: -2,
                          top: -2,
                          child: Container(
                            width: 8,
                            height: 8,
                            decoration: const BoxDecoration(
                              color: LabourColors.forestGreen,
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                    ],
                  ),
                  tooltip: 'Filter',
                  onPressed: () {
                    if (_tabController.index == 0) {
                      _showWorkersFilterSheet();
                    } else {
                      _showWageLogFilterSheet(allWorkers.where((w) => w.status == WorkerStatus.active).toList(), allBatches, activeBatch);
                    }
                  },
                ),
              ],
            ),
      body: SafeArea(
        child: Column(
          children: [
            // Top Row: Full-width [ Workers | Wage Logs ] Pill Tabs
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              child: Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: LabourColors.cardSurface,
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(color: LabourColors.border),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: _buildTopPillTab(
                        title: 'Workers',
                        isSelected: isWorkersSelected,
                        onTap: () {
                          _tabController.animateTo(0);
                        },
                      ),
                    ),
                    Expanded(
                      child: _buildTopPillTab(
                        title: 'Wage Logs',
                        isSelected: !isWorkersSelected,
                        onTap: () {
                          _tabController.animateTo(1);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Tab Views (Swipeable left and right)
            Expanded(
              child: TabBarView(
                controller: _tabController,
                physics: const AlwaysScrollableScrollPhysics(),
                children: [
                  // Tab 1: Screen 1 — Workers Overview
                  _buildWorkersOverviewTab(
                    currency: currency,
                    workers: displayedWorkers,
                    labourExpenses: labourExpenses,
                  ),

                  // Tab 2: Screen 7 — Wage Logs List
                  _buildWageLogsTab(
                    currency: currency,
                    activeWorkers: allWorkers.where((w) => w.status == WorkerStatus.active).toList(),
                    batches: allBatches,
                    activeBatch: activeBatch,
                    labourExpenses: labourExpenses,
                    isFiltered: _isWageLogsFiltered,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTopPillTab({
    required String title,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: isSelected ? LabourColors.forestGreen : Colors.transparent,
          borderRadius: BorderRadius.circular(10),
        ),
        alignment: Alignment.center,
        child: Text(
          title,
          style: TextStyle(
            fontSize: 14,
            fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
            color: isSelected ? Colors.white : LabourColors.secondaryText,
          ),
        ),
      ),
    );
  }

  // -------------------------------------------------------------
  // SCREEN 1 & SCREEN 5: WORKERS OVERVIEW (HOME)
  // -------------------------------------------------------------
  Widget _buildWorkersOverviewTab({
    required NumberFormat currency,
    required List<LabourWorker> workers,
    required List<Expense> labourExpenses,
  }) {
    final today = DateTime.now();
    final todayExpenses = labourExpenses.where((e) {
      return e.date.year == today.year && e.date.month == today.month && e.date.day == today.day;
    }).toList();

    final recordedWorkerNamesToday = <String>{};
    for (final e in todayExpenses) {
      final info = WageLogInfo.parse(e.description);
      recordedWorkerNamesToday.add(info.workerName.toLowerCase().trim());
    }

    return RefreshIndicator(
      color: LabourColors.forestGreen,
      onRefresh: () async {
        await ref.read(labourNotifierProvider.notifier).loadWorkers();
        await ref.read(expenseNotifierProvider.notifier).loadExpenses();
      },
      child: ListView(
        padding: const EdgeInsets.fromLTRB(20, 10, 20, 24),
        children: [
          // 1. Hero Attendance Card (Screen 1 & Screen 5 Reference)
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: LabourColors.cardSurface,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: LabourColors.border),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Today',
                  style: TextStyle(fontSize: 12, color: LabourColors.secondaryText),
                ),
                const SizedBox(height: 2),
                Text(
                  DateFormat('E, d MMM yyyy').format(today),
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: LabourColors.primaryText,
                  ),
                ),
                const SizedBox(height: 14),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    onPressed: () => context.push('/labour/multi-add'),
                    icon: const Icon(Icons.add, size: 18, color: Colors.white),
                    label: const Text(
                      "Add Today's Wages",
                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: LabourColors.forestGreen,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      elevation: 0,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),

          // Section Header: Farm Workers (N) + Add Button
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Farm Workers (${workers.length})',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: LabourColors.primaryText,
                ),
              ),
              ElevatedButton.icon(
                onPressed: () => context.push('/labour/add'),
                icon: const Icon(Icons.add, size: 16, color: Colors.white),
                label: const Text('Add', style: TextStyle(fontWeight: FontWeight.w700, fontSize: 13, color: Colors.white)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: LabourColors.forestGreen,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  elevation: 0,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),

          // Workers List
          if (workers.isEmpty)
            Container(
              padding: const EdgeInsets.symmetric(vertical: 36, horizontal: 20),
              decoration: BoxDecoration(
                color: LabourColors.cardSurface,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: LabourColors.border),
              ),
              child: Column(
                children: [
                  const Icon(Icons.people_outline_rounded, size: 44, color: LabourColors.mutedText),
                  const SizedBox(height: 10),
                  const Text(
                    'No farm workers found',
                    style: TextStyle(fontWeight: FontWeight.w600, color: LabourColors.primaryText),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    'Add workers to track daily attendance, tasks, and wages.',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 12, color: LabourColors.secondaryText),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton.icon(
                    onPressed: () => context.push('/labour/add'),
                    icon: const Icon(Icons.add, size: 16, color: Colors.white),
                    label: const Text('Add First Worker'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: LabourColors.forestGreen,
                      foregroundColor: Colors.white,
                    ),
                  ),
                ],
              ),
            )
          else
            ...workers.map((worker) {
              final isRecordedToday = recordedWorkerNamesToday.contains(worker.fullName.toLowerCase().trim()) ||
                  todayExpenses.any((e) => e.description.toLowerCase().contains(worker.fullName.toLowerCase().trim()));

              return Container(
                margin: const EdgeInsets.only(bottom: 10),
                decoration: BoxDecoration(
                  color: LabourColors.cardSurface,
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(color: LabourColors.border),
                ),
                child: InkWell(
                  onTap: () => context.push('/labour/${worker.id}', extra: worker),
                  borderRadius: BorderRadius.circular(14),
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Row(
                      children: [
                        WorkerAvatar(worker: worker, size: 46),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                worker.fullName,
                                style: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w700,
                                  color: LabourColors.primaryText,
                                ),
                              ),
                              const SizedBox(height: 2),
                              Text(
                                worker.phoneNumber,
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: LabourColors.secondaryText,
                                ),
                              ),
                              const SizedBox(height: 2),
                              Text(
                                '${currency.format(worker.dailyWage)} / day',
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: LabourColors.secondaryText,
                                ),
                              ),
                            ],
                          ),
                        ),
                        // Screen 1 & Screen 5 Action: 'Added' chip or '+ Add Today' button
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            if (isRecordedToday)
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                                decoration: BoxDecoration(
                                  color: LabourColors.softGreenSurface,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: const Text(
                                  'Added',
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w700,
                                    color: LabourColors.forestGreen,
                                  ),
                                ),
                              )
                            else
                              InkWell(
                                onTap: () => context.push('/labour/quick-add', extra: worker),
                                borderRadius: BorderRadius.circular(8),
                                child: Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                                  decoration: BoxDecoration(
                                    color: LabourColors.forestGreen,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: const Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Icon(Icons.add, size: 14, color: Colors.white),
                                      SizedBox(width: 2),
                                      Text(
                                        'Add Today',
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w700,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            const SizedBox(width: 4),
                            const Icon(
                              Icons.chevron_right_rounded,
                              color: LabourColors.secondaryText,
                              size: 20,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }),

          // Screen 6: Workers Filter Toast Result Banner
          if (_isWorkersFiltered)
            Container(
              margin: const EdgeInsets.only(top: 14),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                color: const Color(0xFF1B3D2F),
                borderRadius: BorderRadius.circular(14),
              ),
              child: Row(
                children: [
                  const Icon(Icons.check_circle_rounded, color: Colors.white, size: 20),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      'Filters applied • Showing ${workers.length} active workers',
                      style: const TextStyle(color: Colors.white, fontSize: 13, fontWeight: FontWeight.w600),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.close_rounded, color: Colors.white, size: 18),
                    onPressed: () {
                      setState(() {
                        _workerStatusFilter = 'All';
                        _workerTodayStatusFilter = 'All';
                        _workerSort = WorkerSort.name;
                      });
                    },
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }

  // -------------------------------------------------------------
  // SCREEN 7: WAGE LOGS LIST
  // -------------------------------------------------------------
  Widget _buildWageLogsTab({
    required NumberFormat currency,
    required List<LabourWorker> activeWorkers,
    required List<Batch> batches,
    required Batch? activeBatch,
    required List<Expense> labourExpenses,
    required bool isFiltered,
  }) {
    var filtered = List<Expense>.from(labourExpenses);

    // 1. Data Scope Filter
    if (_wageLogScope == 'current_batch') {
      if (activeBatch != null) {
        filtered = filtered.where((e) => e.batchId == activeBatch.id).toList();
      }
    } else if (_wageLogScope == 'select_batch' && _selectedBatchId != null) {
      filtered = filtered.where((e) => e.batchId == _selectedBatchId).toList();
    }

    // 2. Period Filter
    final now = DateTime.now();
    if (_wageLogPeriod == 'this_month') {
      filtered = filtered.where((e) => e.date.year == now.year && e.date.month == now.month).toList();
    } else if (_wageLogPeriod == 'select_month') {
      filtered = filtered.where((e) => e.date.year == _wageLogDate.year && e.date.month == _wageLogDate.month).toList();
    } else if (_wageLogPeriod == 'this_year') {
      filtered = filtered.where((e) => e.date.year == now.year).toList();
    } else if (_wageLogPeriod == 'select_year') {
      filtered = filtered.where((e) => e.date.year == _wageLogDate.year).toList();
    }
    // If 'entire_history', no date filter

    // 3. Payment Status Filter
    if (_wageLogStatusFilter == 'Paid') {
      filtered = filtered.where((e) {
        final d = e.description.toLowerCase();
        final isPending = d.contains('(pending)') ||
            d.contains('(unpaid)') ||
            d.contains('(overdue)') ||
            e.paymentMethod == 'Pending';
        return !isPending;
      }).toList();
    } else if (_wageLogStatusFilter == 'Unpaid' || _wageLogStatusFilter == 'Pending') {
      filtered = filtered.where((e) {
        final d = e.description.toLowerCase();
        final isPending = d.contains('(pending)') ||
            d.contains('(unpaid)') ||
            d.contains('(overdue)') ||
            e.paymentMethod == 'Pending';
        return isPending;
      }).toList();
    }

    // 4. Worker filter
    if (_filterWorkerId != null) {
      final worker = activeWorkers.firstWhere(
        (w) => w.id == _filterWorkerId,
        orElse: () => activeWorkers.first,
      );
      filtered = filtered.where((e) {
        return e.description.toLowerCase().contains(worker.fullName.toLowerCase());
      }).toList();
    }

    // 5. Work type filter
    if (_filterWorkType != null) {
      filtered = filtered.where((e) {
        final info = WageLogInfo.parse(e.description);
        return info.taskTitle.toLowerCase() == _filterWorkType!.toLowerCase();
      }).toList();
    }

    // 6. Sort
    if (_wageLogSort == 'Oldest First') {
      filtered.sort((a, b) => a.date.compareTo(b.date));
    } else if (_wageLogSort == 'Highest Amount') {
      filtered.sort((a, b) => b.amount.compareTo(a.amount));
    } else if (_wageLogSort == 'Lowest Amount') {
      filtered.sort((a, b) => a.amount.compareTo(b.amount));
    } else if (_wageLogSort == 'Worker Name') {
      filtered.sort((a, b) {
        final nameA = WageLogInfo.parse(a.description).workerName.toLowerCase();
        final nameB = WageLogInfo.parse(b.description).workerName.toLowerCase();
        return nameA.compareTo(nameB);
      });
    } else {
      // Newest First (default)
      filtered.sort((a, b) => b.date.compareTo(a.date));
    }

    // Group logs by Date
    final Map<String, List<Expense>> groupedByDate = {};
    for (final exp in filtered) {
      final key = DateFormat('d MMM yyyy').format(exp.date);
      groupedByDate.putIfAbsent(key, () => []).add(exp);
    }

    return Column(
      children: [
        // Active Filter Banner (if non-default filters applied)
        if (isFiltered)
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 8, 20, 4),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
              decoration: BoxDecoration(
                color: LabourColors.softGreenSurface,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: const Color(0xFFC8E6C9)),
              ),
              child: Row(
                children: [
                  const Icon(Icons.tune_rounded, size: 16, color: LabourColors.forestGreen),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      'Filtered: ${_wageLogScope == "current_batch" ? "Current Batch" : "All/Selected Batches"} • $_wageLogSort',
                      style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: LabourColors.forestGreen),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        _wageLogScope = 'current_batch';
                        _selectedBatchId = null;
                        _wageLogPeriod = 'this_month';
                        _wageLogDate = DateTime.now();
                        _wageLogStatusFilter = 'All';
                        _wageLogSort = 'Newest First';
                        _filterWorkerId = null;
                        _filterWorkType = null;
                      });
                    },
                    child: const Icon(Icons.close_rounded, size: 16, color: LabourColors.forestGreen),
                  ),
                ],
              ),
            ),
          ),

        // Chronological Wage Logs List
        Expanded(
          child: filtered.isEmpty
              ? const Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.receipt_long_outlined, size: 44, color: LabourColors.mutedText),
                      SizedBox(height: 10),
                      Text(
                        'No wage logs found',
                        style: TextStyle(fontWeight: FontWeight.w600, color: LabourColors.primaryText),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'Tap + Add Wage Log to record daily labour entries.',
                        style: TextStyle(fontSize: 12, color: LabourColors.secondaryText),
                      ),
                    ],
                  ),
                )
              : ListView.builder(
                  padding: const EdgeInsets.fromLTRB(20, 8, 20, 20),
                  itemCount: groupedByDate.keys.length,
                  itemBuilder: (ctx, dateIndex) {
                    final dateKey = groupedByDate.keys.elementAt(dateIndex);
                    final entries = groupedByDate[dateKey]!;

                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: Text(
                            dateKey,
                            style: const TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                              color: LabourColors.secondaryText,
                            ),
                          ),
                        ),
                        ...entries.map((entry) => _buildWageLogCard(entry, currency, activeWorkers)),
                      ],
                    );
                  },
                ),
        ),

        // Bottom Sticky Action Button: Add Wage Log (Screen 7 Reference)
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          decoration: const BoxDecoration(
            color: LabourColors.cardSurface,
            border: Border(top: BorderSide(color: LabourColors.border)),
          ),
          child: SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: () => context.push('/labour/attendance'),
              icon: const Icon(Icons.add, color: Colors.white, size: 18),
              label: const Text(
                'Add Wage Log',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700, color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: LabourColors.forestGreen,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                elevation: 0,
              ),
            ),
          ),
        ),
      ],
    );
  }

  /// Worker-First Wage Log Card Hierarchy with Screen 8 Swipe-Left to Mark as Paid
  Widget _buildWageLogCard(Expense e, NumberFormat currency, List<LabourWorker> activeWorkers) {
    final info = WageLogInfo.parse(e.description);
    final isPaid = info.status.toLowerCase() == 'paid';
    final isOverdue = info.status.toLowerCase() == 'overdue';

    final statusBg = isOverdue
        ? LabourColors.softRedSurface
        : (isPaid ? LabourColors.softGreenSurface : LabourColors.softAmberSurface);
    final statusColor = isOverdue
        ? LabourColors.error
        : (isPaid ? LabourColors.forestGreen : const Color(0xFFD97706));

    final matchedWorker = activeWorkers.firstWhere(
      (w) => w.fullName.toLowerCase().trim() == info.workerName.toLowerCase().trim(),
      orElse: () => LabourWorker(
        id: '',
        fullName: info.workerName,
        phoneNumber: '',
        role: WorkerRole.feeder,
        dailyWage: e.amount,
        joiningDate: e.date,
        status: WorkerStatus.active,
      ),
    );

    final displayStatus = isPaid ? 'Paid' : 'Unpaid';

    return Dismissible(
      key: Key('wage_log_${e.id}'),
      direction: isPaid ? DismissDirection.none : DismissDirection.endToStart,
      confirmDismiss: (direction) async {
        final confirmed = await ConfirmMarkPaidDialog.show(
          context,
          workerName: info.workerName,
          amount: e.amount,
          formattedDate: DateFormat('d MMM yyyy').format(e.date),
          shiftName: info.shiftName,
          onConfirm: () {},
        );
        if (confirmed == true) {
          await _markExpenseStatus(e, true);
        }
        return false;
      },
      background: const SizedBox.shrink(),
      secondaryBackground: Container(
        margin: const EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
          color: LabourColors.forestGreen,
          borderRadius: BorderRadius.circular(14),
        ),
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Icon(Icons.check_circle_outline_rounded, color: Colors.white, size: 22),
            SizedBox(width: 8),
            Text(
              'Mark as Paid',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
          color: LabourColors.cardSurface,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: LabourColors.border),
        ),
        child: InkWell(
          onTap: () {
            // Navigates to Screen 9: Wage Log Details
            if (GoRouter.maybeOf(context) != null) {
              context.push('/labour/wage-log-details', extra: {
                'expense': e,
                'worker': matchedWorker,
              });
            } else {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => WageLogDetailsScreen(
                    expense: e,
                    worker: matchedWorker,
                  ),
                ),
              );
            }
          },
          onLongPress: () {
            // Contextual Action Bottom Sheet (Screen 10)
            showWageLogActionSheet(
              context: context,
              taskTitle: info.taskTitle,
              workerName: info.workerName,
              worker: matchedWorker,
              shiftName: info.shiftName,
              formattedDate: DateFormat('d MMM yyyy').format(e.date),
              amount: e.amount,
              status: displayStatus,
              onEdit: () => context.push('/labour/attendance', extra: e),
              onMarkPaid: () => _markExpenseStatus(e, true),
              onToggleStatus: () => _markExpenseStatus(e, true),
              onDelete: () => _deleteWageLog(e),
            );
          },
          borderRadius: BorderRadius.circular(14),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Far Left: Worker Avatar (Screen 7 reference image)
                WorkerAvatar(worker: matchedWorker, name: info.workerName, size: 42),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Line 1: Worker Name on Left, Amount on Right, Chevron >
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              info.workerName,
                              style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w700,
                                color: LabourColors.primaryText,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Text(
                            currency.format(e.amount),
                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w800,
                              color: LabourColors.primaryText,
                            ),
                          ),
                          const SizedBox(width: 4),
                          const Icon(Icons.chevron_right_rounded, color: LabourColors.secondaryText, size: 18),
                        ],
                      ),
                      const SizedBox(height: 2),
                      // Line 2: Work Type
                      Text(
                        info.taskTitle,
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: LabourColors.secondaryText,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 3),
                      // Line 3: Shift info on Left, Status Pill on Right
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            info.shiftCardDisplay,
                            style: const TextStyle(
                              fontSize: 11,
                              color: LabourColors.secondaryText,
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                            decoration: BoxDecoration(
                              color: statusBg,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              displayStatus,
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w700,
                                color: statusColor,
                              ),
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
        ),
      ),
    );
  }

  void _showWorkersFilterSheet() {
    FilterWorkersSheet.show(
      context,
      currentWorkerStatus: _workerStatusFilter,
      currentTodayStatus: _workerTodayStatusFilter,
      currentSort: switch (_workerSort) {
        WorkerSort.name => 'Name (A - Z)',
        WorkerSort.dailyWageHighToLow => 'Daily Wage (High to Low)',
        WorkerSort.dailyWageLowToHigh => 'Daily Wage (Low to High)',
        WorkerSort.totalEarned => 'Total Earned (High to Low)',
      },
      onExport: () async {
        try {
          final db = ref.read(appDatabaseProvider);
          final exportService = ExportService(db);
          final path = await exportService.exportWorkersToCsv();
          if (mounted && context.mounted) {
            if (path != null) {
              showLabourSuccessFeedback(
                context,
                title: 'Workers Exported',
                subtitle: 'Saved CSV of workers and wage data.',
              );
            } else {
              showLabourErrorFeedback(
                context,
                title: 'Export Failed',
                subtitle: 'Could not export workers data.',
              );
            }
          }
        } catch (e) {
          if (mounted && context.mounted) {
            showLabourErrorFeedback(
              context,
              title: 'Export Failed',
              subtitle: e.toString(),
            );
          }
        }
      },
      onApply: (workerStatus, todayStatus, sort) {
        setState(() {
          _workerStatusFilter = workerStatus;
          _workerTodayStatusFilter = todayStatus;
          _workerSort = switch (sort) {
            'Daily Wage (High to Low)' => WorkerSort.dailyWageHighToLow,
            'Daily Wage (Low to High)' => WorkerSort.dailyWageLowToHigh,
            'Total Earned (High to Low)' => WorkerSort.totalEarned,
            _ => WorkerSort.name,
          };
        });
      },
    );
  }

  void _showWageLogFilterSheet(List<LabourWorker> activeWorkers, List<Batch> batches, Batch? activeBatch) {
    FilterWageLogsSheet.show(
      context,
      initialMonth: _wageLogDate,
      batches: batches,
      currentBatchId: _selectedBatchId,
      currentBatchName: activeBatch?.batchName,
      workers: activeWorkers,
      currentWorkerId: _filterWorkerId,
      currentWorkType: _filterWorkType,
      currentStatus: _wageLogStatusFilter,
      currentSort: _wageLogSort,
      dataScope: _wageLogScope,
      period: _wageLogPeriod,
      onApplyDetailed: ({
        required String dataScope,
        required String? batchId,
        required String period,
        required DateTime selectedDate,
        required String status,
        required String sort,
        String? workerId,
        String? workType,
      }) {
        setState(() {
          _wageLogScope = dataScope;
          _selectedBatchId = batchId;
          _wageLogPeriod = period;
          _wageLogDate = selectedDate;
          _wageLogStatusFilter = status;
          _wageLogSort = sort;
          _filterWorkerId = workerId;
          _filterWorkType = workType;
        });
      },
    );
  }
}
