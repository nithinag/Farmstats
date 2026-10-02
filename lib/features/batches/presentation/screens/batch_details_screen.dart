import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../shared/widgets/buttons_and_cards.dart';
import '../../../../shared/extensions/extensions.dart';
import '../../../../core/theme/spacing.dart';
import '../../domain/entities/batch_entities.dart';
import '../../application/providers/batch_notifier.dart';
import '../../../income/application/providers/income_notifier.dart';
import '../../../income/application/providers/income_state.dart';
import '../../../expenses/application/providers/expense_notifier.dart';
import '../../../expenses/application/providers/expense_state.dart';

class BatchDetailsScreen extends ConsumerWidget {
  final Batch batch;
  const BatchDetailsScreen({super.key, required this.batch});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final expensesState = ref.watch(expenseNotifierProvider);
    final incomesState = ref.watch(incomeNotifierProvider);

    double totalExpenses = 0;
    if (expensesState is ExpenseStateData) {
      totalExpenses = expensesState.expenses.where((e) => e.batchId == batch.id).fold(0, (sum, e) => sum + e.amount);
    }

    double totalRevenue = 0;
    if (incomesState is IncomeStateData) {
      totalRevenue = incomesState.incomes.where((i) => i.batchId == batch.id).fold(0, (sum, i) => sum + i.netAmount);
    }

    final double profit = totalRevenue - totalExpenses;

    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: const Text('Batch Dashboard'),
        backgroundColor: Colors.green[800],
        foregroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () => context.push('/batch/${batch.id}/edit', extra: batch),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildHeader(context),
            Padding(
              padding: const EdgeInsets.all(AppSpacing.md),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildFinancialOverview(context, totalExpenses, totalRevenue, profit),
                  const SizedBox(height: AppSpacing.lg),
                  Text('Quick Actions', style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold)),
                  const SizedBox(height: AppSpacing.md),
                  _buildQuickActions(context),
                  const SizedBox(height: AppSpacing.lg),
                  Text('Batch Statistics', style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold)),
                  const SizedBox(height: AppSpacing.md),
                  _buildStatsGrid(context),
                  const SizedBox(height: AppSpacing.lg),
                  _buildTimeline(context, ref),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(AppSpacing.lg),
      decoration: BoxDecoration(
        color: Colors.green[800],
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(32),
          bottomRight: Radius.circular(32),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.green.withValues(alpha: 0.3),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                batch.batchName,
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  batch.status.name.toUpperCase(),
                  style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.sm),
          Text(
            'Day ${batch.currentAgeDays} - ${batch.currentStage.name.capitalize()} Instar',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.white70),
          ),
          const SizedBox(height: AppSpacing.lg),
          Row(
            children: [
              const Text('Progress', style: TextStyle(color: Colors.white70)),
              const Spacer(),
              Text('${((batch.currentAgeDays / 28) * 100).toStringAsFixed(0)}%', style: const TextStyle(color: Colors.white)),
            ],
          ),
          const SizedBox(height: 8),
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: LinearProgressIndicator(
              value: (batch.currentAgeDays / 28).clamp(0.0, 1.0),
              backgroundColor: Colors.white.withValues(alpha: 0.2),
              valueColor: const AlwaysStoppedAnimation<Color>(Colors.lightGreenAccent),
              minHeight: 8,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFinancialOverview(BuildContext context, double expenses, double revenue, double profit) {
    return AppCard(
      padding: EdgeInsets.zero,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(
            colors: [Colors.white, Colors.green.shade50],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        padding: const EdgeInsets.all(AppSpacing.md),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildFinStat('Revenue', revenue, Colors.green[700]!),
                Container(width: 1, height: 40, color: Colors.grey[300]),
                _buildFinStat('Expenses', expenses, Colors.red[600]!),
              ],
            ),
            const Divider(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Total Profit: ', style: Theme.of(context).textTheme.titleMedium),
                Text(
                  '₹${profit.toStringAsFixed(2)}',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: profit >= 0 ? Colors.green[700] : Colors.red[600],
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFinStat(String label, double value, Color color) {
    return Column(
      children: [
        Text(label, style: const TextStyle(color: Colors.grey, fontWeight: FontWeight.w500)),
        const SizedBox(height: 4),
        Text(
          '₹${value.toStringAsFixed(0)}',
          style: TextStyle(color: color, fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  Widget _buildQuickActions(BuildContext context) {
    return GridView.count(
      crossAxisCount: 3,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      mainAxisSpacing: 12,
      crossAxisSpacing: 12,
      children: [
        _buildActionTile(context, 'Add Feeding', Icons.eco, Colors.green, () => context.push('/feeding/add', extra: batch.id)),
        _buildActionTile(context, 'Add Labour', Icons.people, Colors.blue, () => context.push('/labour/attendance')),
        _buildActionTile(context, 'Add Expense', Icons.money_off, Colors.red, () => context.push('/expenses/add', extra: batch.id)),
        _buildActionTile(context, 'Add Medicine', Icons.medical_services, Colors.teal, () => context.push('/feeding/health')),
        _buildActionTile(context, 'Add Mortality', Icons.warning_amber, Colors.orange, () => context.push('/feeding/health')),
        _buildActionTile(context, 'Add Revenue', Icons.attach_money, Colors.greenAccent[700]!, () => context.push('/income/add', extra: batch.id)),
      ],
    );
  }

  Widget _buildActionTile(BuildContext context, String title, IconData icon, Color color, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(color: Colors.grey.withValues(alpha: 0.1), blurRadius: 10, offset: const Offset(0, 4)),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: color.withValues(alpha: 0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(icon, color: color, size: 28),
            ),
            const SizedBox(height: 8),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatsGrid(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      mainAxisSpacing: 12,
      crossAxisSpacing: 12,
      childAspectRatio: 2.5,
      children: [
        _buildStatCard('DFL Qty', batch.numberOfDfls.toString(), Icons.egg_alt),
        _buildStatCard('Survival Rate', '96.5%', Icons.favorite),
        _buildStatCard('Avg Temp', '${batch.temperature}°C', Icons.thermostat),
        _buildStatCard('Humidity', '${batch.humidity}%', Icons.water_drop),
        _buildStatCard('Mortality', '3.5%', Icons.trending_down),
        _buildStatCard('Workers', '4 Active', Icons.engineering),
      ],
    );
  }

  Widget _buildStatCard(String title, String value, IconData icon) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Row(
        children: [
          Icon(icon, color: Colors.grey[600], size: 24),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(title, style: TextStyle(color: Colors.grey[500], fontSize: 12)),
                Text(value, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTimeline(BuildContext context, WidgetRef ref) {
    final timelineAsyncValue = ref.watch(getBatchTimelineUseCaseProvider).execute(batch.id);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Timeline History', style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold)),
        const SizedBox(height: AppSpacing.md),
        FutureBuilder(
          future: timelineAsyncValue,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            final result = snapshot.data;
            if (result == null || result.isLeft()) {
              return const Text('Failed to load timeline');
            }
            final timeline = result.getOrElse((_) => []);
            
            if (timeline.isEmpty) return const Text('No history events recorded.');

            return Column(
              children: timeline.map((event) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: AppCard(
                    child: ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: CircleAvatar(
                        backgroundColor: Colors.green[100],
                        child: Icon(Icons.timeline, color: Colors.green[700]),
                      ),
                      title: Text(event.eventType, style: const TextStyle(fontWeight: FontWeight.bold)),
                      subtitle: Text(event.description),
                      trailing: Text(event.timestamp.toShortDate(), style: const TextStyle(color: Colors.grey)),
                    ),
                  ),
                );
              }).toList(),
            );
          },
        ),
      ],
    );
  }
}

extension StringExtension on String {
  String capitalize() {
    if (isEmpty) return this;
    return "${this[0].toUpperCase()}${substring(1)}";
  }
}
