import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import '../../../../shared/widgets/layout_components.dart';
import '../../../../shared/extensions/extensions.dart';
import '../../../../core/theme/spacing.dart';
import '../../../../core/theme/radius.dart';
import '../../../../core/theme/color_scheme.dart';
import '../../domain/entities/labour_entities.dart';
import '../../../expenses/application/providers/expense_notifier.dart';
import '../../../expenses/application/providers/expense_state.dart';
import '../../../expenses/domain/entities/expense_entities.dart';

class WorkerDetailsScreen extends ConsumerWidget {
  final LabourWorker worker;
  const WorkerDetailsScreen({super.key, required this.worker});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final expenseState = ref.watch(expenseNotifierProvider);
    final currency = NumberFormat.currency(symbol: '₹', decimalDigits: 0, locale: 'en_IN');

    // Find all expenses recorded for this worker
    final List<Expense> workerExpenses = (expenseState is ExpenseStateData)
        ? expenseState.expenses.where((e) => e.description.toLowerCase().contains(worker.fullName.toLowerCase())).toList()
        : <Expense>[];

    final totalEarned = workerExpenses.fold(0.0, (sum, e) => sum + e.amount);
    final totalPaid = workerExpenses
        .where((e) => !e.description.toLowerCase().contains('unpaid') && e.paymentMethod.toLowerCase() != 'pending')
        .fold(0.0, (sum, e) => sum + e.amount);
    final outstanding = (totalEarned - totalPaid).clamp(0.0, double.infinity);

    return BaseScaffold(
      appBar: AppBar(
        title: Text(worker.fullName),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            tooltip: 'Edit Worker',
            onPressed: () => context.push('/labour/${worker.id}/edit', extra: worker),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => context.push('/labour/attendance'),
        backgroundColor: AppColorScheme.primary,
        foregroundColor: Colors.white,
        icon: const Icon(Icons.add_task),
        label: const Text('Log Labour'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(AppSpacing.md),
        children: [
          // 1. Worker Profile Card
          Card(
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppRadius.md),
              side: BorderSide(color: Colors.grey.shade300),
            ),
            child: Padding(
              padding: const EdgeInsets.all(AppSpacing.md),
              child: Column(
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 28,
                        backgroundColor: AppColorScheme.primary,
                        child: Text(
                          worker.fullName.isNotEmpty ? worker.fullName[0].toUpperCase() : 'W',
                          style: const TextStyle(fontSize: 22, color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(width: AppSpacing.md),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              worker.fullName,
                              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'Role: ${worker.role.name.toUpperCase()}',
                              style: TextStyle(color: Colors.grey.shade600, fontSize: 13),
                            ),
                            const SizedBox(height: 2),
                            Text(
                              'Daily Wage: ₹${worker.dailyWage.toStringAsFixed(0)}/day',
                              style: const TextStyle(color: AppColorScheme.primary, fontWeight: FontWeight.w600, fontSize: 13),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                        decoration: BoxDecoration(
                          color: worker.status == WorkerStatus.active ? const Color(0xFFE8F5E9) : Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(AppRadius.pill),
                        ),
                        child: Text(
                          worker.status.name.toUpperCase(),
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                            color: worker.status == WorkerStatus.active ? const Color(0xFF2E7D32) : Colors.grey,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Divider(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _kpiItem('Total Earned', currency.format(totalEarned)),
                      _kpiItem('Paid', currency.format(totalPaid), color: AppColorScheme.success),
                      _kpiItem('Outstanding', currency.format(outstanding), color: outstanding > 0 ? AppColorScheme.error : Colors.grey),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: AppSpacing.md),

          // 2. Contact Details
          Card(
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppRadius.md),
              side: BorderSide(color: Colors.grey.shade300),
            ),
            child: Column(
              children: [
                ListTile(
                  leading: const Icon(Icons.phone_outlined, color: AppColorScheme.primaryLight),
                  title: const Text('Phone Number', style: TextStyle(fontSize: 12, color: Colors.grey)),
                  subtitle: Text(worker.phoneNumber.isNotEmpty ? worker.phoneNumber : 'Not provided', style: const TextStyle(fontWeight: FontWeight.w600)),
                ),
                if (worker.address != null && worker.address!.isNotEmpty) ...[
                  const Divider(height: 1),
                  ListTile(
                    leading: const Icon(Icons.location_on_outlined, color: AppColorScheme.primaryLight),
                    title: const Text('Address', style: TextStyle(fontSize: 12, color: Colors.grey)),
                    subtitle: Text(worker.address!, style: const TextStyle(fontWeight: FontWeight.w600)),
                  ),
                ],
                const Divider(height: 1),
                ListTile(
                  leading: const Icon(Icons.calendar_today_outlined, color: AppColorScheme.primaryLight),
                  title: const Text('Joining Date', style: TextStyle(fontSize: 12, color: Colors.grey)),
                  subtitle: Text(worker.joiningDate.toShortDate(), style: const TextStyle(fontWeight: FontWeight.w600)),
                ),
              ],
            ),
          ),
          const SizedBox(height: AppSpacing.lg),

          // 3. Labour Activities & Wages History
          Text(
            'Labour & Wage Activity History (${workerExpenses.length})',
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
          const SizedBox(height: AppSpacing.sm),

          if (workerExpenses.isEmpty)
            Card(
              elevation: 0,
              color: Colors.grey.shade50,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppRadius.md),
                side: BorderSide(color: Colors.grey.shade200),
              ),
              child: const Padding(
                padding: EdgeInsets.all(AppSpacing.xl),
                child: Center(
                  child: Column(
                    children: [
                      Icon(Icons.history, color: Colors.grey, size: 36),
                      SizedBox(height: AppSpacing.xs),
                      Text('No labour activity logged yet for this worker.', style: TextStyle(color: Colors.grey, fontSize: 13)),
                    ],
                  ),
                ),
              ),
            )
          else
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: workerExpenses.length,
              separatorBuilder: (ctx, i) => const SizedBox(height: AppSpacing.xs),
              itemBuilder: (context, index) {
                final exp = workerExpenses[index];
                return Card(
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(AppRadius.sm),
                    side: BorderSide(color: Colors.grey.shade200),
                  ),
                  child: ListTile(
                    leading: const CircleAvatar(
                      backgroundColor: Color(0xFFE3F2FD),
                      child: Icon(Icons.work_outline, color: Color(0xFF1565C0), size: 18),
                    ),
                    title: Text(exp.description, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13)),
                    subtitle: Text(
                      '${DateFormat('dd MMM yyyy').format(exp.date)} • Mode: ${exp.paymentMethod}',
                      style: TextStyle(color: Colors.grey.shade600, fontSize: 11),
                    ),
                    trailing: Text(
                      currency.format(exp.amount),
                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: AppColorScheme.primary),
                    ),
                  ),
                );
              },
            ),
          const SizedBox(height: AppSpacing.xxl),
        ],
      ),
    );
  }

  Widget _kpiItem(String label, String value, {Color? color}) {
    return Column(
      children: [
        Text(label, style: TextStyle(fontSize: 11, color: Colors.grey.shade600)),
        const SizedBox(height: 2),
        Text(
          value,
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: color ?? Colors.black87),
        ),
      ],
    );
  }
}
