import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:drift/drift.dart' hide Column;
import '../theme/labour_theme.dart';
import '../widgets/labour_components.dart';
import '../../domain/entities/labour_entities.dart';
import '../../application/providers/labour_notifier.dart';
import '../../application/services/labour_calculation_service.dart';
import '../../../expenses/application/providers/expense_notifier.dart';
import '../../../expenses/application/providers/expense_state.dart';
import '../../../expenses/domain/entities/expense_entities.dart';
import '../../../../data/providers/database_provider.dart';
import '../../../../data/database/app_database.dart';

class WorkerDetailsScreen extends ConsumerStatefulWidget {
  final LabourWorker worker;
  const WorkerDetailsScreen({super.key, required this.worker});

  @override
  ConsumerState<WorkerDetailsScreen> createState() => _WorkerDetailsScreenState();
}

class _WorkerDetailsScreenState extends ConsumerState<WorkerDetailsScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late DateTime _selectedMonth;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _selectedMonth = DateTime.now();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  Future<void> _markPaymentStatus(Expense expense, bool makePaid) async {
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
          subtitle: '₹${expense.amount.toStringAsFixed(0)} for ${widget.worker.fullName} updated.',
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

  Future<void> _togglePaymentStatus(Expense expense) async {
    final desc = expense.description.toLowerCase();
    final isCurrentlyPending = desc.contains('(pending)') ||
        desc.contains('(unpaid)') ||
        desc.contains('(overdue)') ||
        expense.paymentMethod == 'Pending';
    await _markPaymentStatus(expense, isCurrentlyPending);
  }

  Future<void> _deleteWageLog(Expense expense) async {
    final info = WageLogInfo.parse(expense.description, defaultWorker: widget.worker.fullName);
    final formattedDate = DateFormat('d MMM yyyy').format(expense.date);

    final confirmed = await DeleteWageLogDialog.show(
      context,
      taskTitle: info.taskTitle,
      workerName: widget.worker.fullName,
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
          subtitle: 'Removed wage log of ₹${expense.amount.toStringAsFixed(0)} for ${widget.worker.fullName}',
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

  Future<void> _handleRemoveWorker() async {
    DeleteWorkerDialog.show(
      context,
      workerName: widget.worker.fullName,
      onConfirm: () async {
        // Soft delete: set status to inactive to preserve all historical wage records and financial logs
        final updatedWorker = widget.worker.copyWith(status: WorkerStatus.inactive);
        final success = await ref.read(labourNotifierProvider.notifier).updateWorker(updatedWorker);
        if (success && mounted) {
          showLabourSuccessFeedback(
            context,
            title: 'Worker Removed',
            subtitle: '${widget.worker.fullName} was removed. Historical wage logs have been preserved.',
          );
          if (Navigator.maybeOf(context)?.canPop() == true) {
            context.pop();
          } else {
            context.go('/labour');
          }
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final currency = NumberFormat.currency(symbol: '₹', decimalDigits: 0, locale: 'en_IN');
    final expenseState = ref.watch(expenseNotifierProvider);

    final allExpenses = switch (expenseState) {
      ExpenseStateData(expenses: final list) => list,
      _ => <Expense>[],
    };

    // Filter expenses belonging to this worker
    final workerExpenses = allExpenses.where((e) {
      return e.description.toLowerCase().contains(widget.worker.fullName.toLowerCase());
    }).toList();

    // Calculate all-time summaries using LabourCalculationService
    final allTimeSummary = LabourCalculationService.calculateWorkerAllTime(allExpenses, widget.worker.fullName);
    final totalEarned = allTimeSummary.totalEarned;
    final totalDays = allTimeSummary.totalDays;

    // Filter and calculate period summary for selected month using LabourCalculationService
    final periodSummary = LabourCalculationService.calculateWorkerPeriodSummary(allExpenses, widget.worker.fullName, _selectedMonth);

    // Month expenses
    final monthExpenses = workerExpenses.where((e) {
      return e.date.year == _selectedMonth.year && e.date.month == _selectedMonth.month;
    }).toList();

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
        title: const Text(
          'Worker Details',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: LabourColors.primaryText,
          ),
        ),
        centerTitle: true,
        actions: [
          PopupMenuButton<String>(
            icon: const Icon(Icons.more_vert, color: LabourColors.primaryText),
            onSelected: (val) {
              if (val == 'edit') {
                context.push('/labour/${widget.worker.id}/edit', extra: widget.worker);
              } else if (val == 'remove') {
                _handleRemoveWorker();
              }
            },
            itemBuilder: (ctx) => [
              const PopupMenuItem(
                value: 'edit',
                child: Row(
                  children: [
                    Icon(Icons.edit_outlined, size: 18, color: LabourColors.primaryText),
                    SizedBox(width: 8),
                    Text('Edit Worker'),
                  ],
                ),
              ),
              const PopupMenuItem(
                value: 'remove',
                child: Row(
                  children: [
                    Icon(Icons.delete_outline_rounded, size: 18, color: LabourColors.error),
                    SizedBox(width: 8),
                    Text('Remove Worker', style: TextStyle(color: LabourColors.error)),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            // Profile Header
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              child: Column(
                children: [
                  WorkerAvatar(worker: widget.worker, size: 68),
                  const SizedBox(height: 10),
                  Text(
                    widget.worker.fullName,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: LabourColors.primaryText,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    widget.worker.phoneNumber,
                    style: const TextStyle(
                      fontSize: 13,
                      color: LabourColors.secondaryText,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: widget.worker.status == WorkerStatus.active
                          ? LabourColors.softGreenSurface
                          : LabourColors.softRedSurface,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      widget.worker.status == WorkerStatus.active ? 'Active' : 'Inactive',
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w700,
                        color: widget.worker.status == WorkerStatus.active
                            ? LabourColors.forestGreen
                            : LabourColors.error,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // 3 Stat Cards Row
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Expanded(
                    child: _buildMetricCard(
                      value: currency.format(widget.worker.dailyWage),
                      label: 'Daily Wage',
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: _buildMetricCard(
                      value: currency.format(totalEarned),
                      label: 'Total Earned',
                      valueColor: LabourColors.forestGreen,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: _buildMetricCard(
                      value: '$totalDays',
                      label: 'Total Days',
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Sub-tabs: Exactly 2 tabs (Overview & Wage Logs)
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              decoration: const BoxDecoration(
                border: Border(bottom: BorderSide(color: LabourColors.border)),
              ),
              child: TabBar(
                controller: _tabController,
                indicatorColor: LabourColors.forestGreen,
                indicatorWeight: 3,
                labelColor: LabourColors.forestGreen,
                unselectedLabelColor: LabourColors.secondaryText,
                labelStyle: const TextStyle(fontWeight: FontWeight.w700, fontSize: 14),
                unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
                tabs: const [
                  Tab(text: 'Overview'),
                  Tab(text: 'Wage Logs'),
                ],
              ),
            ),

            // Tab Views
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  // Tab 1: Overview
                  _buildOverviewTab(
                    currency: currency,
                    monthTotalPaid: periodSummary.paid,
                    monthPaidCount: periodSummary.paidCount,
                    monthTotalPending: periodSummary.pending,
                    monthPendingCount: periodSummary.pendingCount,
                    monthTotal: periodSummary.total,
                    monthTotalCount: periodSummary.totalCount,
                    recentExpenses: workerExpenses.take(5).toList(),
                  ),

                  // Tab 2: Wage Logs
                  _buildWageLogsTab(
                    currency: currency,
                    monthExpenses: monthExpenses,
                  ),
                ],
              ),
            ),

            // Fixed Bottom Action: + Add Wage Log
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              decoration: const BoxDecoration(
                color: LabourColors.cardSurface,
                border: Border(top: BorderSide(color: LabourColors.border)),
              ),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: () => context.push(
                    '/labour/attendance',
                    extra: {'workerId': widget.worker.id},
                  ),
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
        ),
      ),
    );
  }

  Widget _buildMetricCard({required String value, required String label, Color? valueColor}) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
      decoration: BoxDecoration(
        color: LabourColors.cardSurface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: LabourColors.border),
      ),
      child: Column(
        children: [
          Text(
            value,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: valueColor ?? LabourColors.primaryText,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            label,
            style: const TextStyle(
              fontSize: 11,
              color: LabourColors.secondaryText,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMonthSelector() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 4),
      decoration: BoxDecoration(
        color: LabourColors.cardSurface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: LabourColors.border),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<int>(
          value: _selectedMonth.month,
          isExpanded: true,
          icon: const Icon(Icons.keyboard_arrow_down_rounded, color: LabourColors.secondaryText),
          items: List.generate(12, (i) {
            final m = i + 1;
            final date = DateTime(_selectedMonth.year, m);
            return DropdownMenuItem(
              value: m,
              child: Row(
                children: [
                  const Icon(Icons.calendar_today_outlined, size: 16, color: LabourColors.forestGreen),
                  const SizedBox(width: 10),
                  Text(
                    DateFormat('MMMM yyyy').format(date),
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: LabourColors.primaryText,
                    ),
                  ),
                ],
              ),
            );
          }),
          onChanged: (newM) {
            if (newM != null) {
              setState(() => _selectedMonth = DateTime(_selectedMonth.year, newM));
            }
          },
        ),
      ),
    );
  }

  Widget _buildOverviewTab({
    required NumberFormat currency,
    required double monthTotalPaid,
    required int monthPaidCount,
    required double monthTotalPending,
    required int monthPendingCount,
    required double monthTotal,
    required int monthTotalCount,
    required List<Expense> recentExpenses,
  }) {
    return ListView(
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 24),
      children: [
        // Month Selector Dropdown
        _buildMonthSelector(),
        const SizedBox(height: 14),

        // 3 Summary Cards
        Row(
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: LabourColors.softGreenSurface,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Paid', style: TextStyle(fontSize: 11, color: LabourColors.secondaryText)),
                    const SizedBox(height: 4),
                    Text(
                      currency.format(monthTotalPaid),
                      style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w700, color: LabourColors.forestGreen),
                    ),
                    const SizedBox(height: 2),
                    Text('$monthPaidCount ${monthPaidCount == 1 ? "log" : "logs"}', style: const TextStyle(fontSize: 11, color: LabourColors.secondaryText)),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: LabourColors.softAmberSurface,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Pending', style: TextStyle(fontSize: 11, color: LabourColors.secondaryText)),
                    const SizedBox(height: 4),
                    Text(
                      currency.format(monthTotalPending),
                      style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w700, color: Color(0xFFD97706)),
                    ),
                    const SizedBox(height: 2),
                    Text('$monthPendingCount ${monthPendingCount == 1 ? "log" : "logs"}', style: const TextStyle(fontSize: 11, color: LabourColors.secondaryText)),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: LabourColors.secondarySurface,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Total', style: TextStyle(fontSize: 11, color: LabourColors.secondaryText)),
                    const SizedBox(height: 4),
                    Text(
                      currency.format(monthTotal),
                      style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w700, color: LabourColors.primaryText),
                    ),
                    const SizedBox(height: 2),
                    Text('$monthTotalCount ${monthTotalCount == 1 ? "log" : "logs"}', style: const TextStyle(fontSize: 11, color: LabourColors.secondaryText)),
                  ],
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),

        // Recent Wage Logs Header
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Recent Wage Logs',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700, color: LabourColors.primaryText),
            ),
            TextButton(
              onPressed: () => _tabController.animateTo(1),
              child: const Text(
                'View All',
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: LabourColors.forestGreen),
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),

        // Recent Wage Logs List
        if (recentExpenses.isEmpty)
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: LabourColors.cardSurface,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: LabourColors.border),
            ),
            alignment: Alignment.center,
            child: const Text('No recent wage logs for this worker', style: TextStyle(fontSize: 13, color: LabourColors.secondaryText)),
          )
        else
          ...recentExpenses.map((e) => _buildWageLogCard(e, currency)),
      ],
    );
  }

  Widget _buildWageLogsTab({required NumberFormat currency, required List<Expense> monthExpenses}) {
    // Sort descending by date
    final sorted = List<Expense>.from(monthExpenses)..sort((a, b) => b.date.compareTo(a.date));

    // Group logs by Date
    final Map<String, List<Expense>> groupedByDate = {};
    for (final exp in sorted) {
      final key = DateFormat('d MMM yyyy').format(exp.date);
      groupedByDate.putIfAbsent(key, () => []).add(exp);
    }

    return ListView(
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 24),
      children: [
        // Month Selector Dropdown
        _buildMonthSelector(),
        const SizedBox(height: 14),

        if (sorted.isEmpty)
          Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: LabourColors.cardSurface,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: LabourColors.border),
            ),
            alignment: Alignment.center,
            child: const Text('No wage logs recorded for this month', style: TextStyle(fontSize: 13, color: LabourColors.secondaryText)),
          )
        else
          ...groupedByDate.keys.map((dateKey) {
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
                ...entries.map((e) => _buildWageLogCard(e, currency)),
              ],
            );
          }),
      ],
    );
  }

  Widget _buildWageLogCard(Expense e, NumberFormat currency) {
    final info = WageLogInfo.parse(e.description, defaultWorker: widget.worker.fullName);
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
          showWageLogActionSheet(
            context: context,
            taskTitle: info.taskTitle,
            workerName: widget.worker.fullName,
            worker: widget.worker,
            shiftName: info.shiftName,
            formattedDate: DateFormat('d MMM yyyy').format(e.date),
            amount: e.amount,
            status: info.status,
            onEdit: () => context.push('/labour/attendance', extra: e),
            onMarkPaid: () => _markPaymentStatus(e, true),
            onMarkPending: () => _markPaymentStatus(e, false),
            onToggleStatus: () => _togglePaymentStatus(e),
            onDelete: () => _deleteWageLog(e),
          );
        },
        borderRadius: BorderRadius.circular(14),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            children: [
              // Far Left: Worker Avatar
              WorkerAvatar(worker: widget.worker, size: 40),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Line 1: Task title on left, amount on right, chevron >
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            info.taskTitle,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: LabourColors.primaryText),
                          ),
                        ),
                        Text(
                          currency.format(e.amount),
                          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w800, color: LabourColors.primaryText),
                        ),
                        const SizedBox(width: 4),
                        const Icon(Icons.chevron_right_rounded, color: LabourColors.secondaryText, size: 18),
                      ],
                    ),
                    const SizedBox(height: 2),
                    // Line 2: Shift info
                    Text(
                      info.shiftCardDisplay,
                      style: const TextStyle(fontSize: 11, color: LabourColors.secondaryText),
                    ),
                    const SizedBox(height: 4),
                    // Line 3: Date on left, status pill on right
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          DateFormat('d MMM yyyy').format(e.date),
                          style: const TextStyle(fontSize: 11, color: LabourColors.secondaryText),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                          decoration: BoxDecoration(
                            color: statusBg,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            info.status,
                            style: TextStyle(fontSize: 10, fontWeight: FontWeight.w700, color: statusColor),
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
}
