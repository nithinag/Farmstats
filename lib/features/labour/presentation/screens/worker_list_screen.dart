import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:drift/drift.dart' hide Column;
import '../theme/labour_theme.dart';
import '../widgets/labour_components.dart';
import '../../domain/entities/labour_entities.dart';
import '../../application/providers/labour_notifier.dart';
import '../../application/providers/labour_state.dart';
import '../../../expenses/application/providers/expense_notifier.dart';
import '../../../expenses/application/providers/expense_state.dart';
import '../../../expenses/domain/entities/expense_entities.dart';
import '../../../../data/providers/database_provider.dart';
import '../../../../data/database/app_database.dart';

class WorkerListScreen extends ConsumerStatefulWidget {
  const WorkerListScreen({super.key});

  @override
  ConsumerState<WorkerListScreen> createState() => _WorkerListScreenState();
}

class _WorkerListScreenState extends ConsumerState<WorkerListScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final TextEditingController _workerSearchController = TextEditingController();
  
  // Wage Logs filtering state
  DateTime _wageLogMonth = DateTime.now();
  String _wageLogStatusFilter = 'All'; // 'All', 'Paid', 'Pending'
  String? _filterWorkerId;
  String? _filterWorkType;
  String _workerSearchQuery = '';

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

  Future<void> _toggleExpensePaymentStatus(Expense expense) async {
    try {
      final db = ref.read(appDatabaseProvider);
      final desc = expense.description.toLowerCase();
      final isCurrentlyPending = desc.contains('(pending)') ||
          desc.contains('(unpaid)') ||
          desc.contains('(overdue)') ||
          expense.paymentMethod == 'Pending';

      final String newPaymentMethod;
      final String updatedDesc;

      if (isCurrentlyPending) {
        newPaymentMethod = 'Cash';
        updatedDesc = expense.description
            .replaceAll('(Pending)', '(Paid)')
            .replaceAll('(Unpaid)', '(Paid)')
            .replaceAll('(Overdue)', '(Paid)');
      } else {
        newPaymentMethod = 'Pending';
        updatedDesc = expense.description.replaceAll('(Paid)', '(Pending)');
      }

      await (db.update(db.expensesTable)..where((t) => t.id.equals(expense.id))).write(
        ExpensesTableCompanion(
          paymentMethod: Value(newPaymentMethod),
          description: Value(updatedDesc),
        ),
      );

      await ref.read(expenseNotifierProvider.notifier).loadExpenses();
      if (mounted) {
        showLabourSuccessFeedback(
          context,
          title: isCurrentlyPending ? 'Marked as Paid' : 'Marked as Pending',
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
    String workerName = 'Worker';
    String taskTitle = expense.description;
    if (expense.description.startsWith('Labour:')) {
      final afterPrefix = expense.description.substring(7).trim();
      final parts = afterPrefix.split('-');
      if (parts.isNotEmpty) workerName = parts[0].trim();
      if (parts.length > 1) {
        taskTitle = parts.sublist(1).join('-').replaceAll(RegExp(r'\((Paid|Pending|Unpaid|Overdue)\)'), '').trim();
      }
    }

    final confirmed = await DeleteWageLogDialog.show(
      context,
      taskTitle: taskTitle,
      workerName: workerName,
      amount: expense.amount,
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
          subtitle: 'Removed wage log of ₹${expense.amount.toStringAsFixed(0)} for $workerName',
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

    final allWorkers = switch (labourState) {
      LabourStateData(workers: final list) => list,
      _ => <LabourWorker>[],
    };

    // Filter active workers for overview
    final activeWorkers = allWorkers.where((w) => w.status == WorkerStatus.active).toList();

    final allExpenses = switch (expenseState) {
      ExpenseStateData(expenses: final list) => list,
      _ => <Expense>[],
    };

    // Labour expenses
    final labourExpenses = allExpenses.where((e) {
      return e.category.id == 'c4' || e.description.toLowerCase().contains('labour');
    }).toList();

    // Current month expenses for liabilities
    final now = DateTime.now();
    final currentMonthExpenses = labourExpenses.where((e) {
      return e.date.year == now.year && e.date.month == now.month;
    }).toList();

    final paidExpensesThisMonth = currentMonthExpenses.where((e) {
      final d = e.description.toLowerCase();
      final isPending = d.contains('(pending)') ||
          d.contains('(unpaid)') ||
          d.contains('(overdue)') ||
          e.paymentMethod == 'Pending';
      return !isPending;
    }).toList();

    final totalPaidThisMonth = paidExpensesThisMonth.fold(0.0, (sum, e) => sum + e.amount);

    // Pending dues across all months
    final allPendingExpenses = labourExpenses.where((e) {
      final d = e.description.toLowerCase();
      return d.contains('(pending)') ||
          d.contains('(unpaid)') ||
          d.contains('(overdue)') ||
          e.paymentMethod == 'Pending';
    }).toList();

    final totalPendingDues = allPendingExpenses.fold(0.0, (sum, e) => sum + e.amount);

    // Distinct workers with pending dues
    final workersWithPending = <String>{};
    for (final exp in allPendingExpenses) {
      for (final w in activeWorkers) {
        if (exp.description.toLowerCase().contains(w.fullName.toLowerCase())) {
          workersWithPending.add(w.id);
          break;
        }
      }
    }
    final pendingWorkersCount = workersWithPending.length;

    // Filtered workers list
    final filteredWorkers = activeWorkers.where((w) {
      if (_workerSearchQuery.isEmpty) return true;
      final q = _workerSearchQuery.toLowerCase();
      return w.fullName.toLowerCase().contains(q) || w.phoneNumber.contains(q);
    }).toList();

    // Determine current selected tab reactively from animation/index for seamless swipe feedback
    final animValue = _tabController.animation?.value ?? _tabController.index.toDouble();
    final isWorkersSelected = animValue < 0.5;

    final isFiltered = _filterWorkerId != null || _wageLogStatusFilter != 'All' || _filterWorkType != null;

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
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.more_vert, color: LabourColors.primaryText),
            onPressed: () {},
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
                    totalPaidThisMonth: totalPaidThisMonth,
                    totalPendingDues: totalPendingDues,
                    pendingWorkersCount: pendingWorkersCount,
                    workers: filteredWorkers,
                    labourExpenses: labourExpenses,
                  ),

                  // Tab 2: Screen 4 — Wage Logs List
                  _buildWageLogsTab(
                    currency: currency,
                    activeWorkers: activeWorkers,
                    labourExpenses: labourExpenses,
                    isFiltered: isFiltered,
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
  // SCREEN 1: WORKERS OVERVIEW (Banner card removed completely)
  // -------------------------------------------------------------
  Widget _buildWorkersOverviewTab({
    required NumberFormat currency,
    required double totalPaidThisMonth,
    required double totalPendingDues,
    required int pendingWorkersCount,
    required List<LabourWorker> workers,
    required List<Expense> labourExpenses,
  }) {
    return RefreshIndicator(
      color: LabourColors.forestGreen,
      onRefresh: () async {
        await ref.read(labourNotifierProvider.notifier).loadWorkers();
        await ref.read(expenseNotifierProvider.notifier).loadExpenses();
      },
      child: ListView(
        padding: const EdgeInsets.fromLTRB(20, 10, 20, 24),
        children: [
          // 2 KPI Summary Cards Row (Banner Card Removed Completely)
          Row(
            children: [
              // Total Paid Wages
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    color: LabourColors.softGreenSurface,
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(color: const Color(0xFFC8E6C9)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(6),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: const Icon(Icons.payments_rounded, color: LabourColors.forestGreen, size: 18),
                          ),
                          const SizedBox(width: 8),
                          const Expanded(
                            child: Text(
                              'Total Paid Wages',
                              style: TextStyle(fontSize: 11, fontWeight: FontWeight.w500, color: LabourColors.secondaryText),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Text(
                        currency.format(totalPaidThisMonth),
                        style: const TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w800,
                          color: LabourColors.forestGreen,
                        ),
                      ),
                      const SizedBox(height: 2),
                      const Text(
                        'This Month',
                        style: TextStyle(fontSize: 11, color: LabourColors.secondaryText),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 12),

              // Pending Dues
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    color: const Color(0xFFFBF3E7),
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(color: const Color(0xFFFFE0B2)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(6),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: const Icon(Icons.access_time_rounded, color: Color(0xFFD97706), size: 18),
                          ),
                          const SizedBox(width: 8),
                          const Expanded(
                            child: Text(
                              'Pending Dues',
                              style: TextStyle(fontSize: 11, fontWeight: FontWeight.w500, color: LabourColors.secondaryText),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Text(
                        currency.format(totalPendingDues),
                        style: const TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w800,
                          color: Color(0xFFD97706),
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        '$pendingWorkersCount ${pendingWorkersCount == 1 ? "worker" : "workers"}',
                        style: const TextStyle(fontSize: 11, color: LabourColors.secondaryText),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),

          // Search Field + Filter Button Row
          Row(
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: LabourColors.cardSurface,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: LabourColors.border),
                  ),
                  child: TextField(
                    controller: _workerSearchController,
                    onChanged: (val) => setState(() => _workerSearchQuery = val.trim()),
                    decoration: const InputDecoration(
                      hintText: 'Search workers...',
                      hintStyle: TextStyle(fontSize: 13, color: LabourColors.mutedText),
                      prefixIcon: Icon(Icons.search, color: LabourColors.secondaryText, size: 20),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Container(
                decoration: BoxDecoration(
                  color: LabourColors.cardSurface,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: LabourColors.border),
                ),
                child: IconButton(
                  icon: const Icon(Icons.tune_rounded, color: LabourColors.secondaryText, size: 20),
                  onPressed: () {},
                ),
              ),
            ],
          ),
          const SizedBox(height: 18),

          // Section Header: Farm Workers (X) + Add Button
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
                label: const Text('Add Worker', style: TextStyle(fontWeight: FontWeight.w700, fontSize: 13)),
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
              final wExpenses = labourExpenses.where((e) {
                return e.description.toLowerCase().contains(worker.fullName.toLowerCase());
              }).toList();
              final totalEarned = wExpenses.fold(0.0, (sum, e) => sum + e.amount);

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
                                'Daily Wage: ${currency.format(worker.dailyWage)}',
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: LabourColors.secondaryText,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            const Text(
                              'Total Earned',
                              style: TextStyle(
                                fontSize: 11,
                                color: LabourColors.secondaryText,
                              ),
                            ),
                            const SizedBox(height: 2),
                            Text(
                              currency.format(totalEarned),
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w800,
                                color: LabourColors.forestGreen,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(width: 8),
                        const Icon(
                          Icons.chevron_right_rounded,
                          color: LabourColors.secondaryText,
                          size: 20,
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }),
        ],
      ),
    );
  }

  // -------------------------------------------------------------
  // SCREEN 4: WAGE LOGS LIST
  // -------------------------------------------------------------
  Widget _buildWageLogsTab({
    required NumberFormat currency,
    required List<LabourWorker> activeWorkers,
    required List<Expense> labourExpenses,
    required bool isFiltered,
  }) {
    // Filter by selected month
    var filtered = labourExpenses.where((e) {
      return e.date.year == _wageLogMonth.year && e.date.month == _wageLogMonth.month;
    }).toList();

    // Filter by worker if set
    if (_filterWorkerId != null) {
      final worker = activeWorkers.firstWhere(
        (w) => w.id == _filterWorkerId,
        orElse: () => activeWorkers.first,
      );
      filtered = filtered.where((e) {
        return e.description.toLowerCase().contains(worker.fullName.toLowerCase());
      }).toList();
    }

    // Filter by work type if set
    if (_filterWorkType != null) {
      filtered = filtered.where((e) {
        final info = WageLogInfo.parse(e.description);
        return info.taskTitle.toLowerCase() == _filterWorkType!.toLowerCase();
      }).toList();
    }

    // Counts for filter chips
    final allMonthCount = filtered.length;
    final paidMonthExpenses = filtered.where((e) {
      final d = e.description.toLowerCase();
      final isPending = d.contains('(pending)') ||
          d.contains('(unpaid)') ||
          d.contains('(overdue)') ||
          e.paymentMethod == 'Pending';
      return !isPending;
    }).toList();
    final pendingMonthExpenses = filtered.where((e) => !paidMonthExpenses.contains(e)).toList();

    // Apply status chip filter
    if (_wageLogStatusFilter == 'Paid') {
      filtered = paidMonthExpenses;
    } else if (_wageLogStatusFilter == 'Pending') {
      filtered = pendingMonthExpenses;
    }

    // Sort descending by date
    filtered.sort((a, b) => b.date.compareTo(a.date));

    // Group logs by Date
    final Map<String, List<Expense>> groupedByDate = {};
    for (final exp in filtered) {
      final key = DateFormat('d MMM yyyy').format(exp.date);
      groupedByDate.putIfAbsent(key, () => []).add(exp);
    }

    return Column(
      children: [
        // Month Navigation Row with Filter Tag Button (Image 4)
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 8, 20, 6),
          child: Row(
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                  decoration: BoxDecoration(
                    color: LabourColors.cardSurface,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: LabourColors.border),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.chevron_left_rounded, color: LabourColors.primaryText, size: 22),
                        onPressed: () {
                          setState(() {
                            _wageLogMonth = DateTime(_wageLogMonth.year, _wageLogMonth.month - 1);
                          });
                        },
                      ),
                      Row(
                        children: [
                          const Icon(Icons.calendar_today_outlined, size: 16, color: LabourColors.forestGreen),
                          const SizedBox(width: 8),
                          Text(
                            DateFormat('MMMM yyyy').format(_wageLogMonth),
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              color: LabourColors.primaryText,
                            ),
                          ),
                        ],
                      ),
                      IconButton(
                        icon: const Icon(Icons.chevron_right_rounded, color: LabourColors.primaryText, size: 22),
                        onPressed: () {
                          setState(() {
                            _wageLogMonth = DateTime(_wageLogMonth.year, _wageLogMonth.month + 1);
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Container(
                height: 48,
                width: 48,
                decoration: BoxDecoration(
                  color: isFiltered ? LabourColors.softGreenSurface : LabourColors.cardSurface,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: isFiltered ? LabourColors.forestGreen : LabourColors.border,
                  ),
                ),
                child: IconButton(
                  icon: Icon(
                    Icons.tune_rounded,
                    color: isFiltered ? LabourColors.forestGreen : LabourColors.secondaryText,
                    size: 20,
                  ),
                  tooltip: 'Filter Wage Logs',
                  onPressed: () => _showWageLogFilterSheet(activeWorkers),
                ),
              ),
            ],
          ),
        ),

        // Status Filter Chips Row
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 4, 20, 6),
          child: Row(
            children: [
              _buildWageLogFilterChip(
                label: 'All ($allMonthCount)',
                value: 'All',
              ),
              const SizedBox(width: 10),
              _buildWageLogFilterChip(
                label: 'Paid (${paidMonthExpenses.length})',
                value: 'Paid',
              ),
              const SizedBox(width: 10),
              _buildWageLogFilterChip(
                label: 'Pending (${pendingMonthExpenses.length})',
                value: 'Pending',
              ),
            ],
          ),
        ),

        // Active Filter Chips indicator if worker or workType filter is active
        if (_filterWorkerId != null || _filterWorkType != null)
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 6),
            child: Row(
              children: [
                if (_filterWorkerId != null) ...[
                  Chip(
                    backgroundColor: LabourColors.softGreenSurface,
                    label: Text(
                      activeWorkers.firstWhere((w) => w.id == _filterWorkerId, orElse: () => activeWorkers.first).fullName,
                      style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w600, color: LabourColors.forestGreen),
                    ),
                    deleteIcon: const Icon(Icons.close, size: 14, color: LabourColors.forestGreen),
                    onDeleted: () => setState(() => _filterWorkerId = null),
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                  ),
                  const SizedBox(width: 6),
                ],
                if (_filterWorkType != null) ...[
                  Chip(
                    backgroundColor: LabourColors.softGreenSurface,
                    label: Text(
                      _filterWorkType!,
                      style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w600, color: LabourColors.forestGreen),
                    ),
                    deleteIcon: const Icon(Icons.close, size: 14, color: LabourColors.forestGreen),
                    onDeleted: () => setState(() => _filterWorkType = null),
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                  ),
                ],
              ],
            ),
          ),
        const SizedBox(height: 4),

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
                  padding: const EdgeInsets.fromLTRB(20, 4, 20, 80),
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
                        ...entries.map((entry) => _buildWageLogCard(entry, currency)),
                      ],
                    );
                  },
                ),
        ),

        // Bottom Fixed Action: Add Wage Log
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

  Widget _buildWageLogFilterChip({required String label, required String value}) {
    final isSelected = _wageLogStatusFilter == value;
    return ChoiceChip(
      label: Text(
        label,
        style: TextStyle(
          fontSize: 12,
          fontWeight: isSelected ? FontWeight.w700 : FontWeight.w600,
          color: isSelected ? Colors.white : LabourColors.secondaryText,
        ),
      ),
      selected: isSelected,
      selectedColor: LabourColors.forestGreen,
      backgroundColor: LabourColors.cardSurface,
      side: BorderSide(
        color: isSelected ? LabourColors.forestGreen : LabourColors.border,
      ),
      onSelected: (_) {
        setState(() => _wageLogStatusFilter = value);
      },
    );
  }

  /// Worker-First Wage Log Card Hierarchy (Image 4 & Section 3.D)
  Widget _buildWageLogCard(Expense e, NumberFormat currency) {
    final info = WageLogInfo.parse(e.description);
    final type = LabourWorkType.findForTask(info.taskTitle);
    final isPaid = info.status.toLowerCase() == 'paid';
    final isOverdue = info.status.toLowerCase() == 'overdue';

    final statusBg = isOverdue
        ? LabourColors.softRedSurface
        : (isPaid ? LabourColors.softGreenSurface : LabourColors.softAmberSurface);
    final statusColor = isOverdue
        ? LabourColors.error
        : (isPaid ? LabourColors.forestGreen : const Color(0xFFD97706));

    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: LabourColors.cardSurface,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: LabourColors.border),
      ),
      child: InkWell(
        onTap: () {
          // Open Wage Log Action Sheet: allows Editing, marking as Paid/Pending, and Deleting
          showWageLogActionSheet(
            context: context,
            taskTitle: info.taskTitle,
            workerName: info.workerName,
            formattedDate: DateFormat('d MMM yyyy').format(e.date),
            amount: e.amount,
            status: info.status,
            onEdit: () => context.push('/labour/attendance', extra: e),
            onToggleStatus: () => _toggleExpensePaymentStatus(e),
            onDelete: () => _deleteWageLog(e),
          );
        },
        borderRadius: BorderRadius.circular(14),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Far Left: Work type icon in soft circular/rounded container
              Container(
                width: 42,
                height: 42,
                decoration: BoxDecoration(
                  color: type.bgColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                alignment: Alignment.center,
                child: Icon(type.icon, color: type.iconColor, size: 22),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Line 1: Worker Name on Left, Amount on Right
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                      ],
                    ),
                    const SizedBox(height: 2),
                    // Line 2: Shift info (e.g. Day Shift • 10:00 AM - 6:00 PM)
                    Text(
                      info.shiftCardDisplay,
                      style: const TextStyle(
                        fontSize: 12,
                        color: LabourColors.secondaryText,
                      ),
                    ),
                    const SizedBox(height: 4),
                    // Line 3: Work Type on Left, Status Pill on Right
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            info.taskTitle,
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: LabourColors.secondaryText,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                          decoration: BoxDecoration(
                            color: statusBg,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            info.status,
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
    );
  }

  void _showWageLogFilterSheet(List<LabourWorker> activeWorkers) {
    FilterWageLogsSheet.show(
      context,
      initialMonth: _wageLogMonth,
      workers: activeWorkers,
      currentWorkerId: _filterWorkerId,
      currentWorkType: _filterWorkType,
      currentStatus: _wageLogStatusFilter,
      onApply: (month, workerId, workType, status) {
        setState(() {
          _wageLogMonth = month;
          _filterWorkerId = workerId;
          _filterWorkType = workType;
          _wageLogStatusFilter = status;
        });
      },
    );
  }
}
