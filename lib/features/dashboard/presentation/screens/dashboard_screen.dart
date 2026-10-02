import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:fl_chart/fl_chart.dart';
import '../../../../shared/widgets/layout_components.dart';
import '../../../../core/theme/spacing.dart';
import '../../../../core/theme/radius.dart';
import '../../../../core/theme/color_scheme.dart';
import '../../application/providers/dashboard_notifier.dart';
import '../../application/providers/dashboard_state.dart';
import '../../../notifications/presentation/widgets/notification_badge_widget.dart';
import '../../../batches/application/providers/batch_notifier.dart';
import '../../../batches/application/providers/batch_state.dart';
import '../../../batches/domain/entities/batch_entities.dart';
import '../../../settings/application/providers/settings_notifier.dart';
import '../../../settings/application/providers/settings_state.dart';
import '../../../expenses/application/providers/expense_notifier.dart';
import '../../../expenses/application/providers/expense_state.dart';
import '../../../harvest/application/providers/harvest_notifier.dart';
import '../../../harvest/application/providers/harvest_state.dart';
import '../../../income/application/providers/income_notifier.dart';
import '../../../income/application/providers/income_state.dart';

class DashboardScreen extends ConsumerWidget {
  const DashboardScreen({super.key});

  String _getGreeting() {
    final hour = DateTime.now().hour;
    if (hour < 12) {
      return 'Good Morning';
    } else if (hour < 17) {
      return 'Good Afternoon';
    } else {
      return 'Good Evening';
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dashboardState = ref.watch(dashboardAggregatorProvider);
    final activeBatch = ref.watch(activeBatchProvider);
    final lastCompletedBatch = ref.watch(lastCompletedBatchProvider);
    final settingsState = ref.watch(settingsNotifierProvider);
    final expenseState = ref.watch(expenseNotifierProvider);

    final farmName = switch (settingsState) {
      SettingsStateData(:final profile) => profile.farmName.isNotEmpty ? profile.farmName : 'My Sericulture Farm',
      _ => 'My Sericulture Farm',
    };

    final currency = NumberFormat.currency(symbol: '₹', decimalDigits: 0, locale: 'en_IN');

    // Calculate Today's Expenses & Labour
    final today = DateTime.now();
    double todayExpenses = 0.0;
    double todayLabour = 0.0;
    if (expenseState is ExpenseStateData) {
      for (final e in expenseState.expenses) {
        if (e.date.year == today.year && e.date.month == today.month && e.date.day == today.day) {
          todayExpenses += e.amount;
          if (e.category.id == 'c4' || e.category.name.toLowerCase().contains('labour')) {
            todayLabour += e.amount;
          }
        }
      }
    }

    return BaseScaffold(
      appBar: AppBar(
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.eco, color: AppColorScheme.primaryLight, size: 22),
            const SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'FARMSTATS',
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.w900,
                        letterSpacing: 1.2,
                        color: AppColorScheme.primary,
                      ),
                ),
                Text(
                  farmName,
                  style: TextStyle(fontSize: 11, color: Colors.grey.shade600, fontWeight: FontWeight.normal),
                ),
              ],
            ),
          ],
        ),
        actions: [
          const NotificationBadgeWidget(),
          IconButton(
            icon: const Icon(Icons.refresh),
            tooltip: 'Refresh',
            onPressed: () {
              ref.read(batchNotifierProvider.notifier).loadBatches();
              ref.read(dashboardAggregatorProvider.notifier).loadDashboard();
            },
          ),
          const SizedBox(width: AppSpacing.xs),
        ],
      ),
      body: switch (dashboardState) {
        DashboardStateInitial() || DashboardStateLoading() => const Center(child: CircularProgressIndicator()),
        DashboardStateError(message: final m) => Center(
            child: Padding(
              padding: const EdgeInsets.all(AppSpacing.lg),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.error_outline, color: AppColorScheme.error, size: 40),
                  const SizedBox(height: AppSpacing.sm),
                  Text('Failed to load dashboard', style: Theme.of(context).textTheme.titleSmall),
                  const SizedBox(height: 4),
                  Text(m, textAlign: TextAlign.center, style: TextStyle(color: Colors.grey[600], fontSize: 12)),
                  const SizedBox(height: AppSpacing.md),
                  FilledButton(
                    onPressed: () => ref.read(dashboardAggregatorProvider.notifier).loadDashboard(),
                    child: const Text('Try Again'),
                  ),
                ],
              ),
            ),
          ),
        DashboardStateData(
          lowStockCount: final lowStock,
          alerts: final alertList,
        ) =>
          RefreshIndicator(
            onRefresh: () async {
              await ref.read(batchNotifierProvider.notifier).loadBatches();
              await ref.read(dashboardAggregatorProvider.notifier).loadDashboard();
            },
            child: ListView(
              padding: const EdgeInsets.fromLTRB(AppSpacing.md, AppSpacing.sm, AppSpacing.md, AppSpacing.xxl),
              children: [
                // Greeting & Farm Header
                Text(
                  '${_getGreeting()}, Farmer',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: Colors.grey.shade700,
                      ),
                ),
                const SizedBox(height: AppSpacing.md),

                // 1. ACTIVE BATCH HERO CARD (or Empty State if none active)
                if (activeBatch != null)
                  _buildActiveBatchHero(context, ref, activeBatch, currency)
                else
                  _buildNoActiveBatchCard(context),

                const SizedBox(height: AppSpacing.lg),

                // 2. TODAY'S SUMMARY
                _buildTodaySummary(context, currency, todayExpenses, todayLabour),

                const SizedBox(height: AppSpacing.lg),

                // 3. QUICK ACTIONS
                Text(
                  'Quick Actions',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: AppSpacing.sm),
                _buildQuickActionsGrid(context, activeBatch),

                const SizedBox(height: AppSpacing.lg),

                // 4. LAST COMPLETED BATCH SUMMARY
                if (lastCompletedBatch != null) ...[
                  Text(
                    'Last Completed Batch',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: AppSpacing.sm),
                  _buildLastCompletedBatchCard(context, ref, lastCompletedBatch, currency),
                  const SizedBox(height: AppSpacing.lg),
                ],

                // 5. BATCH PERFORMANCE TREND CHARTS
                Text(
                  'Batch Performance Trends',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: AppSpacing.sm),
                _buildPerformanceCharts(context, ref),

                // 6. IMPORTANT ALERTS
                if (alertList.isNotEmpty || lowStock > 0) ...[
                  const SizedBox(height: AppSpacing.lg),
                  Text(
                    'Pending Items & Alerts',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: AppSpacing.sm),
                  ...alertList.map((a) => _buildAlertTile(a)),
                ],
              ],
            ),
          ),
        _ => const SizedBox.shrink(),
      },
    );
  }

  Widget _buildActiveBatchHero(BuildContext context, WidgetRef ref, Batch batch, NumberFormat currency) {
    final expensesState = ref.watch(expenseNotifierProvider);
    final incomesState = ref.watch(incomeNotifierProvider);

    // Calculate real batch financials
    double batchExpenses = 0.0;
    double batchLabour = 0.0;
    if (expensesState is ExpenseStateData) {
      for (final e in expensesState.expenses.where((e) => e.batchId == batch.id)) {
        batchExpenses += e.amount;
        if (e.category.id == 'c4' || e.category.name.toLowerCase().contains('labour')) {
          batchLabour += e.amount;
        }
      }
    }

    double batchRevenue = 0.0;
    if (incomesState is IncomeStateData) {
      batchRevenue = incomesState.incomes
          .where((i) => i.batchId == batch.id)
          .fold(0.0, (sum, i) => sum + i.netAmount);
    }

    // Configurable duration calculation
    final durationDays = batch.expectedHarvestDate.difference(batch.startDate).inDays;
    final totalDuration = durationDays > 0 ? durationDays : 30;
    final currentDay = batch.currentAgeDays > 0 ? batch.currentAgeDays : (DateTime.now().difference(batch.startDate).inDays + 1);
    final progress = (currentDay / totalDuration.toDouble()).clamp(0.0, 1.0);

    return Card(
      elevation: 3,
      shadowColor: AppColorScheme.primary.withValues(alpha: 0.2),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppRadius.lg)),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppRadius.lg),
          gradient: const LinearGradient(
            colors: [Color(0xFF1B5E20), Color(0xFF2E7D32)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        padding: const EdgeInsets.all(AppSpacing.lg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top capsule header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(AppRadius.pill),
                  ),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.circle, color: Color(0xFF81C784), size: 8),
                      SizedBox(width: 6),
                      Text(
                        'ACTIVE BATCH',
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.w800, fontSize: 11, letterSpacing: 0.8),
                      ),
                    ],
                  ),
                ),
                Text(
                  'Day ${currentDay.toString().padLeft(2, '0')} / $totalDuration',
                  style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w900, fontSize: 15),
                ),
              ],
            ),
            const SizedBox(height: AppSpacing.md),
            Text(
              batch.batchName,
              style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w900, fontSize: 24),
            ),
            const SizedBox(height: 4),
            Text(
              '${batch.numberOfDfls} DFLs • Stage: ${batch.currentStage.name.toUpperCase()} INSTAR',
              style: const TextStyle(color: Colors.white70, fontSize: 13, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 2),
            Text(
              'Started: ${DateFormat('dd MMM yyyy').format(batch.startDate)}',
              style: TextStyle(color: Colors.white.withValues(alpha: 0.6), fontSize: 11),
            ),
            const SizedBox(height: AppSpacing.md),

            // Progress bar
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Rearing Cycle Progress', style: TextStyle(color: Colors.white70, fontSize: 11)),
                Text('${(progress * 100).toInt()}%', style: const TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.bold)),
              ],
            ),
            const SizedBox(height: 6),
            ClipRRect(
              borderRadius: BorderRadius.circular(AppRadius.pill),
              child: LinearProgressIndicator(
                value: progress,
                minHeight: 8,
                backgroundColor: Colors.white.withValues(alpha: 0.25),
                valueColor: const AlwaysStoppedAnimation<Color>(Color(0xFF81C784)),
              ),
            ),
            const SizedBox(height: AppSpacing.md),

            // Real Current Batch Financial KPIs inside card
            Container(
              padding: const EdgeInsets.all(AppSpacing.sm),
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.12),
                borderRadius: BorderRadius.circular(AppRadius.md),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _capsuleMiniKpi('DFLs', '${batch.numberOfDfls}'),
                  _capsuleMiniKpi('Expenses', currency.format(batchExpenses)),
                  _capsuleMiniKpi('Labour', currency.format(batchLabour)),
                  _capsuleMiniKpi('Revenue', currency.format(batchRevenue)),
                ],
              ),
            ),
            const SizedBox(height: AppSpacing.md),

            // Action button
            SizedBox(
              width: double.infinity,
              height: 44,
              child: ElevatedButton.icon(
                onPressed: () => context.push('/batch/${batch.id}', extra: batch),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: const Color(0xFF1B5E20),
                  elevation: 0,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppRadius.md)),
                ),
                icon: const Icon(Icons.launch, size: 18),
                label: const Text('OPEN BATCH WORKSPACE', style: TextStyle(fontWeight: FontWeight.bold)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _capsuleMiniKpi(String label, String value) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(label, style: const TextStyle(color: Colors.white70, fontSize: 10)),
        const SizedBox(height: 2),
        Text(value, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 13)),
      ],
    );
  }

  Widget _buildNoActiveBatchCard(BuildContext context) {
    return Card(
      elevation: 0,
      color: Colors.grey.shade100,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppRadius.lg),
        side: BorderSide(color: Colors.grey.shade300),
      ),
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.xl),
        child: Column(
          children: [
            Icon(Icons.egg_outlined, size: 48, color: Colors.grey.shade600),
            const SizedBox(height: AppSpacing.sm),
            const Text(
              'No Active Batch',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            const SizedBox(height: 4),
            Text(
              'Start your next rearing cycle to begin tracking operations, feeding, and expenses.',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey.shade600, fontSize: 13),
            ),
            const SizedBox(height: AppSpacing.md),
            FilledButton.icon(
              onPressed: () => context.push('/batch/add'),
              style: FilledButton.styleFrom(backgroundColor: AppColorScheme.primary),
              icon: const Icon(Icons.add),
              label: const Text('Start New Batch'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTodaySummary(BuildContext context, NumberFormat currency, double expenses, double labour) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(AppRadius.md),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.today, size: 16, color: AppColorScheme.primary),
              const SizedBox(width: 6),
              Text(
                "TODAY'S FARM ACTIVITY",
                style: TextStyle(fontSize: 11, fontWeight: FontWeight.w800, color: Colors.grey.shade700, letterSpacing: 0.8),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.sm),
          Row(
            children: [
              Expanded(
                child: _miniMetricCard('Today Outflow', currency.format(expenses), AppColorScheme.error),
              ),
              const SizedBox(width: AppSpacing.sm),
              Expanded(
                child: _miniMetricCard('Labour Wages', currency.format(labour), const Color(0xFF1565C0)),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _miniMetricCard(String label, String value, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md, vertical: AppSpacing.sm),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(AppRadius.sm),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: TextStyle(fontSize: 11, color: Colors.grey.shade700)),
          const SizedBox(height: 2),
          Text(value, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: color)),
        ],
      ),
    );
  }

  Widget _buildQuickActionsGrid(BuildContext context, Batch? activeBatch) {
    return Column(
      children: [
        // Primary Hero Action: Record Cocoon Sale
        InkWell(
          onTap: () => context.push('/cocoon-sale', extra: activeBatch?.id),
          borderRadius: BorderRadius.circular(AppRadius.md),
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(AppSpacing.md),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFF2E7D32), Color(0xFF43A047)],
              ),
              borderRadius: BorderRadius.circular(AppRadius.md),
            ),
            child: const Row(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Icon(Icons.payments, color: Color(0xFF2E7D32)),
                ),
                SizedBox(width: AppSpacing.md),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '+ Record Cocoon Sale',
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      Text(
                        'Harvest weight, grading, deductions & payment in one step',
                        style: TextStyle(color: Colors.white70, fontSize: 11),
                      ),
                    ],
                  ),
                ),
                Icon(Icons.arrow_forward_ios, color: Colors.white, size: 16),
              ],
            ),
          ),
        ),
        const SizedBox(height: AppSpacing.sm),

        // Grid of 4 operational actions
        Row(
          children: [
            Expanded(
              child: _actionButton(
                icon: Icons.receipt_long,
                label: '+ Expense',
                color: AppColorScheme.error,
                onTap: () => context.push('/expenses/add', extra: activeBatch?.id),
              ),
            ),
            const SizedBox(width: AppSpacing.sm),
            Expanded(
              child: _actionButton(
                icon: Icons.people_outline,
                label: '+ Labour',
                color: const Color(0xFF1565C0),
                onTap: () => context.push('/labour/attendance'),
              ),
            ),
            const SizedBox(width: AppSpacing.sm),
            Expanded(
              child: _actionButton(
                icon: Icons.eco_outlined,
                label: '+ Feeding',
                color: const Color(0xFF2E7D32),
                onTap: () => context.push('/feeding/add', extra: activeBatch?.id),
              ),
            ),
            const SizedBox(width: AppSpacing.sm),
            Expanded(
              child: _actionButton(
                icon: Icons.inventory_2_outlined,
                label: '+ Stock',
                color: const Color(0xFFE65100),
                onTap: () => context.push('/inventory/add'),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _actionButton({
    required IconData icon,
    required String label,
    required Color color,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(AppRadius.md),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: AppSpacing.sm, horizontal: 4),
        decoration: BoxDecoration(
          color: color.withValues(alpha: 0.08),
          borderRadius: BorderRadius.circular(AppRadius.md),
          border: Border.all(color: color.withValues(alpha: 0.2)),
        ),
        child: Column(
          children: [
            Icon(icon, color: color, size: 22),
            const SizedBox(height: 4),
            Text(label, style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: color)),
          ],
        ),
      ),
    );
  }

  Widget _buildLastCompletedBatchCard(
    BuildContext context,
    WidgetRef ref,
    Batch batch,
    NumberFormat currency,
  ) {
    final expensesState = ref.watch(expenseNotifierProvider);
    final incomesState = ref.watch(incomeNotifierProvider);
    final harvestsState = ref.watch(harvestNotifierProvider);

    double batchExp = 0.0;
    if (expensesState is ExpenseStateData) {
      batchExp = expensesState.expenses
          .where((e) => e.batchId == batch.id)
          .fold(0.0, (sum, e) => sum + e.amount);
    }

    double batchRev = 0.0;
    if (incomesState is IncomeStateData) {
      batchRev = incomesState.incomes
          .where((i) => i.batchId == batch.id)
          .fold(0.0, (sum, i) => sum + i.netAmount);
    }

    double batchYield = 0.0;
    if (harvestsState is HarvestStateData) {
      final h = harvestsState.harvests.where((h) => h.batchId == batch.id).toList();
      if (h.isNotEmpty) {
        batchYield = h.fold(0.0, (sum, item) => sum + item.netSaleableWeight);
      }
    }

    final profit = batchRev - batchExp;

    return Card(
      elevation: 0,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppRadius.md),
        side: BorderSide(color: Colors.grey.shade200),
      ),
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(batch.batchName, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(AppRadius.pill),
                  ),
                  child: const Text('Completed', style: TextStyle(fontSize: 11, fontWeight: FontWeight.w600)),
                ),
              ],
            ),
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _batchSummaryItem('Total Yield', '${batchYield.toStringAsFixed(1)} kg'),
                _batchSummaryItem('Net Revenue', currency.format(batchRev)),
                _batchSummaryItem('Net Profit', currency.format(profit), isPositive: profit >= 0),
              ],
            ),
            const SizedBox(height: AppSpacing.sm),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton.icon(
                onPressed: () => context.push('/batch/${batch.id}', extra: batch),
                icon: const Icon(Icons.arrow_forward, size: 16),
                label: const Text('View Full Breakdown'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _batchSummaryItem(String label, String value, {bool? isPositive}) {
    return Column(
      children: [
        Text(label, style: TextStyle(fontSize: 11, color: Colors.grey.shade600)),
        const SizedBox(height: 2),
        Text(
          value,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: isPositive == null ? Colors.black87 : (isPositive ? AppColorScheme.success : AppColorScheme.error),
          ),
        ),
      ],
    );
  }

  Widget _buildPerformanceCharts(BuildContext context, WidgetRef ref) {
    final batchState = ref.watch(batchNotifierProvider);
    final harvestsState = ref.watch(harvestNotifierProvider);

    final batches = switch (batchState) {
      BatchStateData(batches: final list) => list.where((b) => b.status == BatchStatus.completed).toList(),
      _ => <Batch>[],
    };

    // Calculate real yields for completed batches
    final List<(String, double)> completedYields = [];
    if (harvestsState is HarvestStateData) {
      for (final b in batches) {
        final bYield = harvestsState.harvests
            .where((h) => h.batchId == b.id)
            .fold(0.0, (sum, h) => sum + h.netSaleableWeight);
        if (bYield > 0) {
          completedYields.add((b.batchName, bYield));
        }
      }
    }

    if (completedYields.isEmpty) {
      return Card(
        elevation: 0,
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppRadius.md),
          side: BorderSide(color: Colors.grey.shade200),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: AppSpacing.lg, horizontal: AppSpacing.md),
          child: Center(
            child: Column(
              children: [
                Icon(Icons.bar_chart_outlined, size: 36, color: Colors.grey.shade400),
                const SizedBox(height: AppSpacing.xs),
                Text(
                  'No Batch Trends Available',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: Colors.grey.shade700),
                ),
                const SizedBox(height: 2),
                Text(
                  'Complete batches and record cocoon sales to see historical performance trends.',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 11, color: Colors.grey.shade600),
                ),
              ],
            ),
          ),
        ),
      );
    }

    final maxYield = completedYields.map((e) => e.$2).reduce((a, b) => a > b ? a : b);
    final chartMaxY = (maxYield * 1.25).clamp(20.0, 500.0);

    return Card(
      elevation: 0,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppRadius.md),
        side: BorderSide(color: Colors.grey.shade200),
      ),
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Cocoon Production Yield (kg)', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
                Text('${completedYields.length} Batches', style: const TextStyle(fontSize: 11, color: Colors.grey)),
              ],
            ),
            const SizedBox(height: AppSpacing.md),
            SizedBox(
              height: 140,
              child: BarChart(
                BarChartData(
                  alignment: BarChartAlignment.spaceAround,
                  maxY: chartMaxY,
                  barTouchData: const BarTouchData(enabled: true),
                  titlesData: FlTitlesData(
                    show: true,
                    topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                    rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        reservedSize: 28,
                        getTitlesWidget: (v, _) => Text('${v.toInt()}', style: const TextStyle(fontSize: 10, color: Colors.grey)),
                      ),
                    ),
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: (val, _) {
                          final idx = val.toInt();
                          if (idx >= 0 && idx < completedYields.length) {
                            return Text(completedYields[idx].$1, style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold));
                          }
                          return const Text('');
                        },
                      ),
                    ),
                  ),
                  gridData: const FlGridData(show: false),
                  borderData: FlBorderData(show: false),
                  barGroups: completedYields.asMap().entries.map((entry) {
                    final idx = entry.key;
                    final item = entry.value;
                    return BarChartGroupData(
                      x: idx,
                      barRods: [
                        BarChartRodData(
                          toY: item.$2,
                          color: idx % 2 == 0 ? AppColorScheme.primary : AppColorScheme.primaryLight,
                          width: 18,
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ],
                    );
                  }).toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAlertTile(String alert) {
    return Container(
      margin: const EdgeInsets.only(bottom: AppSpacing.sm),
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: const Color(0xFFFFF3E0),
        borderRadius: BorderRadius.circular(AppRadius.sm),
        border: Border.all(color: const Color(0xFFFFB74D)),
      ),
      child: Row(
        children: [
          const Icon(Icons.warning_amber_rounded, color: Color(0xFFE65100), size: 20),
          const SizedBox(width: AppSpacing.sm),
          Expanded(
            child: Text(
              alert,
              style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: Color(0xFFE65100)),
            ),
          ),
        ],
      ),
    );
  }
}
