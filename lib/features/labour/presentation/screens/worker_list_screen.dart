import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:drift/drift.dart' hide Column;
import '../../../../core/theme/color_scheme.dart';
import '../../../../data/database/app_database.dart';
import '../../application/providers/labour_notifier.dart';
import '../../application/providers/labour_state.dart';
import '../../domain/entities/labour_entities.dart';
import '../../../../data/providers/database_provider.dart';
import '../../../expenses/application/providers/expense_notifier.dart';
import '../../../expenses/application/providers/expense_state.dart';
import '../../../expenses/domain/entities/expense_entities.dart';

class WorkerListScreen extends ConsumerStatefulWidget {
  const WorkerListScreen({super.key});

  @override
  ConsumerState<WorkerListScreen> createState() => _WorkerListScreenState();
}

class _WorkerListScreenState extends ConsumerState<WorkerListScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  Future<void> _markExpensePaid(Expense expense) async {
    try {
      final db = ref.read(appDatabaseProvider);
      final updatedDesc = expense.description.replaceAll('(Unpaid)', '(Paid)').replaceAll('(Pending)', '(Paid)');
      
      await (db.update(db.expensesTable)..where((t) => t.id.equals(expense.id))).write(
        ExpensesTableCompanion(
          paymentMethod: const Value('Cash'),
          description: Value(updatedDesc),
        ),
      );

      await ref.read(expenseNotifierProvider.notifier).loadExpenses();
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('✓ Marked ${expense.description} as Paid (₹${expense.amount.toStringAsFixed(0)})'),
            backgroundColor: AppColorScheme.forestGreen,
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to update status: $e'), backgroundColor: AppColorScheme.error),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final labourState = ref.watch(labourNotifierProvider);
    final expenseState = ref.watch(expenseNotifierProvider);
    final currency = NumberFormat.currency(symbol: '₹', decimalDigits: 0, locale: 'en_IN');

    final workers = switch (labourState) {
      LabourStateData(workers: final list) => list,
      _ => <LabourWorker>[],
    };

    final allExpenses = switch (expenseState) {
      ExpenseStateData(expenses: final list) => list,
      _ => <Expense>[],
    };

    // Filter Labour Expenses
    final labourExpenses = allExpenses.where((e) => e.category.id == 'c4' || e.description.toLowerCase().contains('labour')).toList();
    final unpaidExpenses = labourExpenses.where((e) => e.description.contains('(Unpaid)') || e.paymentMethod == 'Pending' || e.description.contains('(Pending)')).toList();
    final paidExpenses = labourExpenses.where((e) => !unpaidExpenses.contains(e)).toList();

    final totalLabourPaid = paidExpenses.fold(0.0, (sum, e) => sum + e.amount);
    final totalLabourUnpaid = unpaidExpenses.fold(0.0, (sum, e) => sum + e.amount);

    return Scaffold(
      backgroundColor: const Color(0xFFF8FAF8),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF1E293B)),
          onPressed: () {
            if (context.canPop()) {
              context.pop();
            } else {
              context.go('/');
            }
          },
        ),
        title: const Text(
          'Labour & Wages',
          style: TextStyle(
            color: Color(0xFF1E293B),
            fontWeight: FontWeight.w700,
            fontSize: 18,
          ),
        ),
        centerTitle: true,
        bottom: TabBar(
          controller: _tabController,
          labelColor: AppColorScheme.primary,
          unselectedLabelColor: const Color(0xFF64748B),
          indicatorColor: AppColorScheme.primary,
          indicatorWeight: 3,
          tabs: [
            Tab(text: 'Workers (${workers.length})'),
            Tab(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text('Wage Logs'),
                  if (unpaidExpenses.isNotEmpty) ...[
                    const SizedBox(width: 6),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                      decoration: BoxDecoration(
                        color: const Color(0xFFEF4444),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        '${unpaidExpenses.length}',
                        style: const TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          if (_tabController.index == 0) {
            context.push('/labour/add');
          } else {
            context.push('/labour/attendance');
          }
        },
        backgroundColor: AppColorScheme.primary,
        icon: Icon(_tabController.index == 0 ? Icons.person_add : Icons.add_task),
        label: Text(_tabController.index == 0 ? 'Add Worker' : 'Log Daily Labour'),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          // Tab 1: Workers List & Summary
          RefreshIndicator(
            onRefresh: () async {
              await ref.read(labourNotifierProvider.notifier).loadWorkers();
              await ref.read(expenseNotifierProvider.notifier).loadExpenses();
            },
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                // Summary Liability Banner
                Row(
                  children: [
                    Expanded(
                      child: _summaryBox(
                        title: 'Total Paid Wages',
                        amount: currency.format(totalLabourPaid),
                        icon: Icons.check_circle_outline,
                        iconColor: const Color(0xFF16A34A),
                        bgColor: const Color(0xFFF0FDF4),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: _summaryBox(
                        title: 'Pending Dues',
                        amount: currency.format(totalLabourUnpaid),
                        icon: Icons.pending_actions_outlined,
                        iconColor: const Color(0xFFDC2626),
                        bgColor: const Color(0xFFFEF2F2),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),

                const Text(
                  'Farm Workers',
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 15, color: Color(0xFF1E293B)),
                ),
                const SizedBox(height: 10),

                if (workers.isEmpty)
                  Container(
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: const Color(0xFFE2E8F0)),
                    ),
                    child: Center(
                      child: Column(
                        children: [
                          const Icon(Icons.people_outline, size: 40, color: Color(0xFF94A3B8)),
                          const SizedBox(height: 8),
                          const Text('No farm workers added yet', style: TextStyle(fontWeight: FontWeight.w600, color: Color(0xFF334155))),
                          const SizedBox(height: 4),
                          const Text('Add workers to track daily attendance, tasks and wages.', style: TextStyle(fontSize: 12, color: Color(0xFF64748B))),
                          const SizedBox(height: 14),
                          FilledButton.icon(
                            onPressed: () => context.push('/labour/add'),
                            style: FilledButton.styleFrom(backgroundColor: AppColorScheme.primary),
                            icon: const Icon(Icons.add, size: 16),
                            label: const Text('Add First Worker'),
                          ),
                        ],
                      ),
                    ),
                  )
                else
                  ...workers.map((worker) {
                    final workerExpenses = labourExpenses.where((e) => e.description.contains(worker.fullName)).toList();
                    final workerTotalEarned = workerExpenses.fold(0.0, (sum, e) => sum + e.amount);

                    return Container(
                      margin: const EdgeInsets.only(bottom: 10),
                      padding: const EdgeInsets.all(14),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: const Color(0xFFE2E8F0)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.02),
                            blurRadius: 6,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: 44,
                            height: 44,
                            decoration: const BoxDecoration(
                              color: Color(0xFFEFF6FF),
                              shape: BoxShape.circle,
                            ),
                            child: Center(
                              child: Text(
                                worker.fullName.isNotEmpty ? worker.fullName[0].toUpperCase() : 'W',
                                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Color(0xFF2563EB)),
                              ),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  worker.fullName,
                                  style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 14.5, color: Color(0xFF1E293B)),
                                ),
                                const SizedBox(height: 2),
                                Text(
                                  'Daily Wage: ₹${worker.dailyWage.toStringAsFixed(0)} • ${worker.phoneNumber.isNotEmpty ? worker.phoneNumber : "No Phone"}',
                                  style: const TextStyle(fontSize: 11.5, color: Color(0xFF64748B)),
                                ),
                                const SizedBox(height: 3),
                                Text(
                                  'Total Earned: ${currency.format(workerTotalEarned)}',
                                  style: const TextStyle(fontSize: 11.5, fontWeight: FontWeight.w600, color: Color(0xFF16A34A)),
                                ),
                              ],
                            ),
                          ),
                          IconButton(
                            icon: const Icon(Icons.add_task, color: AppColorScheme.primary),
                            tooltip: 'Log Labour for this worker',
                            onPressed: () => context.push('/labour/attendance', extra: worker.id),
                          ),
                        ],
                      ),
                    );
                  }),
                const SizedBox(height: 70),
              ],
            ),
          ),

          // Tab 2: Wage & Attendance Logs with Instant "Mark Paid"
          RefreshIndicator(
            onRefresh: () async {
              await ref.read(expenseNotifierProvider.notifier).loadExpenses();
            },
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                if (labourExpenses.isEmpty)
                  Container(
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: const Color(0xFFE2E8F0)),
                    ),
                    child: const Center(
                      child: Text('No labour wage logs recorded yet.', style: TextStyle(color: Color(0xFF64748B))),
                    ),
                  )
                else
                  ...labourExpenses.map((entry) {
                    final isUnpaid = entry.description.contains('(Unpaid)') || entry.paymentMethod == 'Pending' || entry.description.contains('(Pending)');
                    return Container(
                      margin: const EdgeInsets.only(bottom: 10),
                      padding: const EdgeInsets.all(14),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(14),
                        border: Border.all(
                          color: isUnpaid ? const Color(0xFFFCA5A5) : const Color(0xFFE2E8F0),
                          width: isUnpaid ? 1.2 : 0.8,
                        ),
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: 38,
                            height: 38,
                            decoration: BoxDecoration(
                              color: isUnpaid ? const Color(0xFFFEF2F2) : const Color(0xFFF0FDF4),
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              isUnpaid ? Icons.pending_actions : Icons.check_circle_outline,
                              size: 20,
                              color: isUnpaid ? const Color(0xFFDC2626) : const Color(0xFF16A34A),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  entry.description.replaceAll(' (Unpaid)', '').replaceAll(' (Paid)', ''),
                                  style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 13.5, color: Color(0xFF1E293B)),
                                ),
                                const SizedBox(height: 2),
                                Text(
                                  DateFormat('dd MMM yyyy').format(entry.date),
                                  style: const TextStyle(fontSize: 11, color: Color(0xFF64748B)),
                                ),
                              ],
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                currency.format(entry.amount),
                                style: TextStyle(
                                  fontWeight: FontWeight.w800,
                                  fontSize: 14,
                                  color: isUnpaid ? const Color(0xFFDC2626) : const Color(0xFF1E293B),
                                ),
                              ),
                              const SizedBox(height: 4),
                              if (isUnpaid)
                                InkWell(
                                  onTap: () => _markExpensePaid(entry),
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                                    decoration: BoxDecoration(
                                      color: const Color(0xFF16A34A),
                                      borderRadius: BorderRadius.circular(6),
                                    ),
                                    child: const Text(
                                      'Mark Paid',
                                      style: TextStyle(color: Colors.white, fontSize: 10.5, fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                )
                              else
                                Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFF0FDF4),
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                  child: const Text(
                                    'Paid',
                                    style: TextStyle(color: Color(0xFF16A34A), fontSize: 10, fontWeight: FontWeight.bold),
                                  ),
                                ),
                            ],
                          ),
                        ],
                      ),
                    );
                  }),
                const SizedBox(height: 70),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _summaryBox({
    required String title,
    required String amount,
    required IconData icon,
    required Color iconColor,
    required Color bgColor,
  }) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: iconColor.withValues(alpha: 0.2)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, size: 16, color: iconColor),
              const SizedBox(width: 4),
              Text(
                title,
                style: TextStyle(fontSize: 11, fontWeight: FontWeight.w600, color: iconColor),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            amount,
            style: TextStyle(fontWeight: FontWeight.w800, fontSize: 16, color: iconColor),
          ),
        ],
      ),
    );
  }
}
