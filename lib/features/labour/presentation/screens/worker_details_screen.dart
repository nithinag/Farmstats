import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:drift/drift.dart' hide Column;
import '../theme/labour_theme.dart';
import '../widgets/labour_components.dart';
import '../../domain/entities/labour_entities.dart';
import '../../application/providers/labour_notifier.dart';
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
    _tabController = TabController(length: 3, vsync: this);
    _selectedMonth = DateTime.now();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  Future<void> _markAsPaid(Expense expense) async {
    try {
      final db = ref.read(appDatabaseProvider);
      final updatedDesc = expense.description
          .replaceAll('(Pending)', '(Paid)')
          .replaceAll('(Unpaid)', '(Paid)')
          .replaceAll('(Overdue)', '(Paid)');

      await (db.update(db.expensesTable)..where((t) => t.id.equals(expense.id))).write(
        ExpensesTableCompanion(
          paymentMethod: const Value('Cash'),
          description: Value(updatedDesc),
        ),
      );

      await ref.read(expenseNotifierProvider.notifier).loadExpenses();
      if (mounted) {
        showLabourSuccessFeedback(
          context,
          title: 'Marked as Paid',
          subtitle: '₹${expense.amount.toStringAsFixed(0)} paid to ${widget.worker.fullName}',
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

    // Calculate all-time summaries
    final totalEarned = workerExpenses.fold(0.0, (sum, e) => sum + e.amount);
    
    // Total days: distinct dates with wage logs
    final distinctDates = workerExpenses.map((e) => DateFormat('yyyy-MM-dd').format(e.date)).toSet();
    final totalDays = distinctDates.length;

    // Filter for selected month
    final monthExpenses = workerExpenses.where((e) {
      return e.date.year == _selectedMonth.year && e.date.month == _selectedMonth.month;
    }).toList();

    final monthPaidExpenses = monthExpenses.where((e) {
      final desc = e.description.toLowerCase();
      final isPending = desc.contains('(pending)') || desc.contains('(unpaid)') || desc.contains('(overdue)') || e.paymentMethod == 'Pending';
      return !isPending;
    }).toList();

    final monthPendingExpenses = monthExpenses.where((e) => !monthPaidExpenses.contains(e)).toList();

    final monthTotalPaid = monthPaidExpenses.fold(0.0, (sum, e) => sum + e.amount);
    final monthTotalPending = monthPendingExpenses.fold(0.0, (sum, e) => sum + e.amount);
    final monthTotal = monthTotalPaid + monthTotalPending;

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

            // Sub-tabs (Overview, Wage Logs, Edit)
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
                  Tab(text: 'Edit'),
                ],
                onTap: (index) {
                  if (index == 2) {
                    // Navigate to Edit Worker screen
                    context.push('/labour/${widget.worker.id}/edit', extra: widget.worker);
                    // Revert tab back to Overview
                    _tabController.index = 0;
                  }
                },
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
                    monthTotalPaid: monthTotalPaid,
                    monthPaidCount: monthPaidExpenses.length,
                    monthTotalPending: monthTotalPending,
                    monthPendingCount: monthPendingExpenses.length,
                    monthTotal: monthTotal,
                    monthTotalCount: monthExpenses.length,
                    recentExpenses: workerExpenses.take(5).toList(),
                  ),

                  // Tab 2: Wage Logs
                  _buildWageLogsTab(
                    currency: currency,
                    expenses: workerExpenses,
                  ),

                  // Tab 3: Placeholder (handled by onTap)
                  const SizedBox.shrink(),
                ],
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
        // Month Selector
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const Icon(Icons.calendar_today_outlined, size: 16, color: LabourColors.forestGreen),
                const SizedBox(width: 6),
                Text(
                  _selectedMonth.month == DateTime.now().month && _selectedMonth.year == DateTime.now().year
                      ? 'This Month'
                      : DateFormat('MMMM yyyy').format(_selectedMonth),
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: LabourColors.forestGreen,
                  ),
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                color: LabourColors.cardSurface,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: LabourColors.border),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<int>(
                  value: _selectedMonth.month,
                  isDense: true,
                  icon: const Icon(Icons.arrow_drop_down, color: LabourColors.secondaryText),
                  items: List.generate(12, (i) {
                    final m = i + 1;
                    return DropdownMenuItem(
                      value: m,
                      child: Text(DateFormat('MMM yyyy').format(DateTime(_selectedMonth.year, m))),
                    );
                  }),
                  onChanged: (newM) {
                    if (newM != null) {
                      setState(() => _selectedMonth = DateTime(_selectedMonth.year, newM));
                    }
                  },
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),

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

        const SizedBox(height: 24),

        // Bottom Actions (Edit Worker & Remove Worker)
        Row(
          children: [
            Expanded(
              child: OutlinedButton.icon(
                onPressed: () => context.push('/labour/${widget.worker.id}/edit', extra: widget.worker),
                icon: const Icon(Icons.edit_outlined, size: 16, color: LabourColors.primaryText),
                label: const Text('Edit Worker', style: TextStyle(fontWeight: FontWeight.w600, color: LabourColors.primaryText)),
                style: OutlinedButton.styleFrom(
                  backgroundColor: LabourColors.cardSurface,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  side: const BorderSide(color: LabourColors.border),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: ElevatedButton.icon(
                onPressed: _handleRemoveWorker,
                icon: const Icon(Icons.delete_outline_rounded, size: 16, color: LabourColors.error),
                label: const Text('Remove Worker', style: TextStyle(fontWeight: FontWeight.w600, color: LabourColors.error)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: LabourColors.softRedSurface,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  elevation: 0,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildWageLogsTab({required NumberFormat currency, required List<Expense> expenses}) {
    if (expenses.isEmpty) {
      return const Center(
        child: Text('No wage logs recorded for this worker yet', style: TextStyle(fontSize: 13, color: LabourColors.secondaryText)),
      );
    }

    return ListView(
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 24),
      children: expenses.map((e) => _buildWageLogCard(e, currency)).toList(),
    );
  }

  Widget _buildWageLogCard(Expense e, NumberFormat currency) {
    final type = LabourWorkType.findForTask(e.description);
    final desc = e.description.toLowerCase();
    final isPending = desc.contains('(pending)') || desc.contains('(unpaid)') || e.paymentMethod == 'Pending';
    final isOverdue = desc.contains('(overdue)');

    final statusText = isOverdue ? 'Overdue' : (isPending ? 'Pending' : 'Paid');
    final statusBg = isOverdue
        ? LabourColors.softRedSurface
        : (isPending ? LabourColors.softAmberSurface : LabourColors.softGreenSurface);
    final statusColor = isOverdue
        ? LabourColors.error
        : (isPending ? const Color(0xFFD97706) : LabourColors.forestGreen);

    // Clean task title
    var title = e.description;
    if (title.toLowerCase().startsWith('labour:')) {
      final parts = title.split('-');
      if (parts.length > 1) {
        title = parts.sublist(1).join('-').replaceAll(RegExp(r'\((Paid|Pending|Unpaid|Overdue)\)'), '').trim();
      }
    }

    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: LabourColors.cardSurface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: LabourColors.border),
      ),
      child: InkWell(
        onTap: isPending || isOverdue
            ? () {
                showDialog(
                  context: context,
                  builder: (ctx) => AlertDialog(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                    title: const Text('Update Payment Status', style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16)),
                    content: Text('Mark wage of ${currency.format(e.amount)} as Paid?'),
                    actions: [
                      TextButton(onPressed: () => Navigator.pop(ctx), child: const Text('Cancel')),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(backgroundColor: LabourColors.forestGreen),
                        onPressed: () {
                          Navigator.pop(ctx);
                          _markAsPaid(e);
                        },
                        child: const Text('Mark as Paid', style: TextStyle(color: Colors.white)),
                      ),
                    ],
                  ),
                );
              }
            : null,
        child: Row(
          children: [
            Container(
              width: 38,
              height: 38,
              decoration: BoxDecoration(
                color: type.bgColor,
                borderRadius: BorderRadius.circular(10),
              ),
              alignment: Alignment.center,
              child: Icon(type.icon, color: type.iconColor, size: 20),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: LabourColors.primaryText),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    DateFormat('d MMM yyyy').format(e.date),
                    style: const TextStyle(fontSize: 12, color: LabourColors.secondaryText),
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  currency.format(e.amount),
                  style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: LabourColors.primaryText),
                ),
                const SizedBox(height: 4),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                  decoration: BoxDecoration(
                    color: statusBg,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    statusText,
                    style: TextStyle(fontSize: 10, fontWeight: FontWeight.w700, color: statusColor),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
