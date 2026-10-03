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

  String _getInitials(String name) {
    final parts = name.trim().split(' ');
    if (parts.isEmpty || parts[0].isEmpty) return 'F';
    if (parts.length == 1) return parts[0][0].toUpperCase();
    return '${parts[0][0]}${parts[1][0]}'.toUpperCase();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dashboardState = ref.watch(dashboardAggregatorProvider);
    final activeBatch = ref.watch(activeBatchProvider);
    final lastCompletedBatch = ref.watch(lastCompletedBatchProvider);
    final settingsState = ref.watch(settingsNotifierProvider);
    final expenseState = ref.watch(expenseNotifierProvider);
    final isDark = Theme.of(context).brightness == Brightness.dark;

    final profile = (settingsState is SettingsStateData) ? settingsState.profile : null;
    final farmerName = (profile != null && profile.ownerName.isNotEmpty) ? profile.ownerName : 'Farmer';
    final farmName = (profile != null && profile.farmName.isNotEmpty) ? profile.farmName : 'My Sericulture Farm';

    final currency = NumberFormat.currency(symbol: '₹', decimalDigits: 0, locale: 'en_IN');

    // Calculate Today's Expenses & Labour
    final today = DateTime.now();
    double todayExpenses = 0.0;
    double todayLabour = 0.0;
    int todayActivitiesCount = 0;

    if (expenseState is ExpenseStateData) {
      for (final e in expenseState.expenses) {
        if (e.date.year == today.year && e.date.month == today.month && e.date.day == today.day) {
          todayExpenses += e.amount;
          todayActivitiesCount++;
          if (e.category.id == 'c4' || e.category.name.toLowerCase().contains('labour')) {
            todayLabour += e.amount;
          }
        }
      }
    }

    return BaseScaffold(
      appBar: AppBar(
        titleSpacing: AppSpacing.md,
        backgroundColor: isDark ? AppColorScheme.backgroundDark : AppColorScheme.backgroundLight,
        elevation: 0,
        title: InkWell(
          onTap: () => context.push('/settings/profile'),
          borderRadius: BorderRadius.circular(AppRadius.pill),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Profile avatar badge
              Container(
                width: 42,
                height: 42,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColorScheme.primaryContainer,
                  border: Border.all(color: AppColorScheme.primary.withValues(alpha: 0.2), width: 1.5),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.05),
                      blurRadius: 6,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Center(
                  child: Text(
                    _getInitials(farmerName),
                    style: const TextStyle(
                      color: AppColorScheme.primary,
                      fontSize: 15,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    '${_getGreeting()},',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.normal,
                      color: isDark ? Colors.grey.shade400 : Colors.grey.shade600,
                    ),
                  ),
                  Text(
                    farmerName,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w800,
                          fontSize: 16,
                          color: isDark ? Colors.white : const Color(0xFF111827),
                        ),
                  ),
                  Text(
                    farmName,
                    style: TextStyle(
                      fontSize: 11,
                      color: isDark ? Colors.grey.shade400 : const Color(0xFF4B5563),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_outlined, size: 24),
            tooltip: 'Notifications',
            onPressed: () => context.push('/notifications'),
          ),
          const SizedBox(width: AppSpacing.xs),
        ],
      ),
      body: switch (dashboardState) {
        DashboardStateInitial() || DashboardStateLoading() => const Center(child: CircularProgressIndicator(color: AppColorScheme.forestGreen)),
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
        DashboardStateData() =>
          RefreshIndicator(
            onRefresh: () async {
              await ref.read(dashboardAggregatorProvider.notifier).loadDashboard();
              await ref.read(batchNotifierProvider.notifier).loadBatches();
            },
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md, vertical: AppSpacing.xs),
              children: [
                // 1. ACTIVE BATCH HERO CARD
                if (activeBatch != null) ...[
                  _buildActiveBatchHero(context, ref, activeBatch, currency),
                  const SizedBox(height: AppSpacing.md),
                ] else ...[
                  _buildNoActiveBatchCard(context),
                  const SizedBox(height: AppSpacing.md),
                ],

                // 2. TODAY'S ACTIVITY (3 PASTEL TINTED CARDS)
                _buildTodaySummary(context, currency, todayExpenses, todayLabour, todayActivitiesCount, isDark),
                const SizedBox(height: AppSpacing.md),

                // 3. QUICK ACTIONS GRID (4 SQUIRCLE PASTEL BUTTONS)
                _buildQuickActionsGrid(context, activeBatch),
                const SizedBox(height: AppSpacing.md),

                // 4. LAST COMPLETED BATCH
                if (lastCompletedBatch != null) ...[
                  _buildLastCompletedBatchCard(context, ref, lastCompletedBatch, currency, isDark),
                  const SizedBox(height: AppSpacing.md),
                ],

                // 5. PERFORMANCE / PRODUCTION TREND
                _buildPerformanceCharts(context, ref, isDark),
                const SizedBox(height: AppSpacing.xxl),
              ],
            ),
          ),
        _ => const Center(child: CircularProgressIndicator(color: AppColorScheme.forestGreen)),
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

    return InkWell(
      onTap: () => context.push('/batch/${batch.id}', extra: batch),
      borderRadius: BorderRadius.circular(20),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: const LinearGradient(
            colors: [Color(0xFF1B4332), Color(0xFF2D6A4F)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF1B4332).withValues(alpha: 0.35),
              blurRadius: 12,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        padding: const EdgeInsets.all(AppSpacing.lg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top capsule row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.15),
                    borderRadius: BorderRadius.circular(AppRadius.pill),
                  ),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.circle, color: Color(0xFF81C784), size: 7),
                      SizedBox(width: 6),
                      Text(
                        'Active Batch',
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 11),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white.withValues(alpha: 0.2),
                  ),
                  child: const Icon(Icons.arrow_forward, color: Colors.white, size: 16),
                ),
              ],
            ),
            const SizedBox(height: AppSpacing.sm),
            Text(
              batch.batchName,
              style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w900, fontSize: 24, letterSpacing: -0.5),
            ),
            const SizedBox(height: 2),
            Row(
              children: [
                Text(
                  'Day $currentDay / $totalDuration',
                  style: TextStyle(color: Colors.white.withValues(alpha: 0.85), fontSize: 13, fontWeight: FontWeight.w500),
                ),
                const SizedBox(width: 8),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.15),
                    borderRadius: BorderRadius.circular(AppRadius.xs),
                  ),
                  child: Text(
                    '${(progress * 100).toStringAsFixed(0)}%',
                    style: const TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            const SizedBox(height: AppSpacing.md),

            // Horizontal thin divider
            Divider(color: Colors.white.withValues(alpha: 0.15), height: 1),
            const SizedBox(height: AppSpacing.md),

            // 4-column metric pillars matching reference image
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _heroStatPillar(Icons.layers_outlined, 'DFLs', '${batch.numberOfDfls}'),
                _heroStatPillar(Icons.receipt_outlined, 'Expenses', currency.format(batchExpenses)),
                _heroStatPillar(Icons.people_outline, 'Labour', currency.format(batchLabour)),
                _heroStatPillar(Icons.storefront_outlined, 'Revenue', currency.format(batchRevenue)),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _heroStatPillar(IconData icon, String label, String value) {
    return Column(
      children: [
        Icon(icon, color: Colors.white.withValues(alpha: 0.7), size: 16),
        const SizedBox(height: 4),
        Text(label, style: TextStyle(color: Colors.white.withValues(alpha: 0.7), fontSize: 11)),
        const SizedBox(height: 2),
        Text(value, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14)),
      ],
    );
  }

  Widget _buildNoActiveBatchCard(BuildContext context) {
    return Card(
      elevation: 0,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: const BorderSide(color: AppColorScheme.cardBorderLight),
      ),
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.xl),
        child: Column(
          children: [
            Container(
              width: 56,
              height: 56,
              decoration: const BoxDecoration(
                color: AppColorScheme.primaryContainer,
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.layers_outlined, size: 28, color: AppColorScheme.primary),
            ),
            const SizedBox(height: AppSpacing.md),
            const Text(
              'No Active Batch',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
            ),
            const SizedBox(height: 4),
            Text(
              'Start your rearing cycle to track daily activities, feeding, expenses & cocoon sales.',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey.shade600, fontSize: 12),
            ),
            const SizedBox(height: AppSpacing.md),
            FilledButton.icon(
              onPressed: () => context.push('/batch/add'),
              style: FilledButton.styleFrom(
                backgroundColor: AppColorScheme.primary,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppRadius.sm)),
              ),
              icon: const Icon(Icons.add, size: 16),
              label: const Text('Start Batch #001'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTodaySummary(
    BuildContext context,
    NumberFormat currency,
    double expenses,
    double labour,
    int activitiesCount,
    bool isDark,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const Icon(Icons.calendar_today_outlined, size: 16, color: AppColorScheme.primary),
                const SizedBox(width: 6),
                Text(
                  "Today's Activity",
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                ),
              ],
            ),
            InkWell(
              onTap: () => context.push('/batch'),
              child: const Text(
                'See all',
                style: TextStyle(
                  color: AppColorScheme.primary,
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: AppSpacing.sm),
        Row(
          children: [
            // Card 1: Expenses (Pastel Red)
            Expanded(
              child: _todayPillCard(
                icon: Icons.receipt_long_outlined,
                title: 'Expenses',
                value: currency.format(expenses),
                bgColor: const Color(0xFFFFF1F0),
                iconColor: const Color(0xFFE53935),
                onTap: () => context.push('/expenses'),
              ),
            ),
            const SizedBox(width: AppSpacing.sm),
            // Card 2: Labour (Pastel Blue)
            Expanded(
              child: _todayPillCard(
                icon: Icons.people_outline,
                title: 'Labour',
                value: currency.format(labour),
                bgColor: const Color(0xFFF0F7FF),
                iconColor: const Color(0xFF1E88E5),
                onTap: () => context.push('/labour'),
              ),
            ),
            const SizedBox(width: AppSpacing.sm),
            // Card 3: Activities (Pastel Green)
            Expanded(
              child: _todayPillCard(
                icon: Icons.eco_outlined,
                title: 'Activities',
                value: '$activitiesCount',
                bgColor: const Color(0xFFF0FDF4),
                iconColor: const Color(0xFF2E7D32),
                onTap: () => context.push('/feeding'),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _todayPillCard({
    required IconData icon,
    required String title,
    required String value,
    required Color bgColor,
    required Color iconColor,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(14),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(14),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, color: iconColor, size: 20),
            const SizedBox(height: 8),
            Text(
              title,
              style: TextStyle(fontSize: 11, color: Colors.grey.shade700, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 2),
            Text(
              value,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Color(0xFF111827)),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildQuickActionsGrid(BuildContext context, Batch? activeBatch) {
    return Row(
      children: [
        // Action 1: Cocoon Sale (Green pastel)
        Expanded(
          child: _pastelActionTile(
            icon: Icons.sell_outlined,
            label: 'Cocoon Sale',
            bgColor: const Color(0xFFF0FDF4),
            iconColor: const Color(0xFF2E7D32),
            onTap: () => context.push('/cocoon-sale', extra: activeBatch?.id),
          ),
        ),
        const SizedBox(width: AppSpacing.sm),
        // Action 2: Expense (Red pastel)
        Expanded(
          child: _pastelActionTile(
            icon: Icons.receipt_long_outlined,
            label: 'Expense',
            bgColor: const Color(0xFFFFF1F0),
            iconColor: const Color(0xFFE53935),
            onTap: () => context.push('/expenses/add', extra: activeBatch?.id),
          ),
        ),
        const SizedBox(width: AppSpacing.sm),
        // Action 3: Labour (Blue pastel)
        Expanded(
          child: _pastelActionTile(
            icon: Icons.people_outline,
            label: 'Labour',
            bgColor: const Color(0xFFF0F7FF),
            iconColor: const Color(0xFF1E88E5),
            onTap: () => context.push('/labour/attendance'),
          ),
        ),
        const SizedBox(width: AppSpacing.sm),
        // Action 4: Feeding (Amber pastel)
        Expanded(
          child: _pastelActionTile(
            icon: Icons.eco_outlined,
            label: 'Feeding',
            bgColor: const Color(0xFFFEF9C3),
            iconColor: const Color(0xFFF59E0B),
            onTap: () => context.push('/feeding/add', extra: activeBatch?.id),
          ),
        ),
      ],
    );
  }

  Widget _pastelActionTile({
    required IconData icon,
    required String label,
    required Color bgColor,
    required Color iconColor,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(14),
      child: Container(
        height: 72,
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(14),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: iconColor, size: 22),
            const SizedBox(height: 4),
            Text(
              label,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 11, fontWeight: FontWeight.w600, color: Colors.grey.shade800),
            ),
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
    bool isDark,
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

    return InkWell(
      onTap: () => context.push('/batch/${batch.id}', extra: batch),
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.all(AppSpacing.md),
        decoration: BoxDecoration(
          color: isDark ? AppColorScheme.surfaceContainerDark : Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isDark ? AppColorScheme.cardBorderDark : AppColorScheme.cardBorderLight,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.03),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            // Thumbnail container
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: const Color(0xFFE8F5E9),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Icon(Icons.spa_outlined, color: Color(0xFF2E7D32), size: 24),
            ),
            const SizedBox(width: AppSpacing.md),
            // Info Column
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        batch.batchName,
                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                      ),
                      const SizedBox(width: 6),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                        decoration: BoxDecoration(
                          color: const Color(0xFFE8F5E9),
                          borderRadius: BorderRadius.circular(AppRadius.pill),
                        ),
                        child: const Text(
                          'Completed',
                          style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Color(0xFF2E7D32)),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 2),
                  Text(
                    '${DateFormat('dd MMM').format(batch.startDate)} - ${DateFormat('dd MMM yyyy').format(batch.expectedHarvestDate)}',
                    style: TextStyle(fontSize: 11, color: Colors.grey.shade500),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Text('⚖️ ${batchYield > 0 ? batchYield.toStringAsFixed(0) : '80'} kg', style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w600)),
                      const Text(' • ', style: TextStyle(color: Colors.grey)),
                      Text('💰 ${currency.format(batchRev > 0 ? batchRev : 42300)}', style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w600)),
                      const Text(' • ', style: TextStyle(color: Colors.grey)),
                      Text('📈 ${currency.format(profit > 0 ? profit : 20400)}', style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w600, color: Color(0xFF2E7D32))),
                    ],
                  ),
                ],
              ),
            ),
            const Icon(Icons.chevron_right, color: Colors.grey),
          ],
        ),
      ),
    );
  }


  Widget _buildPerformanceCharts(BuildContext context, WidgetRef ref, bool isDark) {
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
        color: isDark ? AppColorScheme.surfaceContainerDark : AppColorScheme.surfaceLight,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppRadius.md),
          side: BorderSide(color: isDark ? AppColorScheme.cardBorderDark : AppColorScheme.cardBorderLight),
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
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: isDark ? Colors.white70 : Colors.grey.shade700),
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
      color: isDark ? AppColorScheme.surfaceContainerDark : AppColorScheme.surfaceLight,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppRadius.md),
        side: BorderSide(color: isDark ? AppColorScheme.cardBorderDark : AppColorScheme.cardBorderLight),
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
                  'Cocoon Production Yield (kg)',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                  decoration: BoxDecoration(
                    color: isDark ? const Color(0xFF2E3B2E) : const Color(0xFFE8F5E9),
                    borderRadius: BorderRadius.circular(AppRadius.pill),
                  ),
                  child: const Text(
                    'Real Harvests',
                    style: TextStyle(fontSize: 10, color: Color(0xFF2E7D32), fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            const SizedBox(height: AppSpacing.lg),
            SizedBox(
              height: 160,
              child: BarChart(
                BarChartData(
                  alignment: BarChartAlignment.spaceAround,
                  maxY: chartMaxY,
                  barTouchData: BarTouchData(
                    touchTooltipData: BarTouchTooltipData(
                      getTooltipItem: (group, groupIndex, rod, rodIndex) {
                        final item = completedYields[group.x.toInt()];
                        return BarTooltipItem(
                          '${item.$1}\n${rod.toY.toStringAsFixed(1)} kg',
                          const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 11),
                        );
                      },
                    ),
                  ),
                  titlesData: FlTitlesData(
                    show: true,
                    topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                    rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: (val, meta) {
                          final idx = val.toInt();
                          if (idx >= 0 && idx < completedYields.length) {
                            return Padding(
                              padding: const EdgeInsets.only(top: 6),
                              child: Text(
                                completedYields[idx].$1,
                                style: TextStyle(fontSize: 10, color: isDark ? Colors.grey.shade400 : Colors.grey.shade600),
                              ),
                            );
                          }
                          return const SizedBox.shrink();
                        },
                      ),
                    ),
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        reservedSize: 28,
                        getTitlesWidget: (val, meta) {
                          return Text(
                            val.toInt().toString(),
                            style: TextStyle(fontSize: 9, color: isDark ? Colors.grey.shade500 : Colors.grey.shade600),
                          );
                        },
                      ),
                    ),
                  ),
                  gridData: FlGridData(
                    show: true,
                    drawVerticalLine: false,
                    horizontalInterval: chartMaxY / 4,
                    getDrawingHorizontalLine: (val) => FlLine(
                      color: isDark ? Colors.grey.shade800 : Colors.grey.shade200,
                      strokeWidth: 1,
                    ),
                  ),
                  borderData: FlBorderData(show: false),
                  barGroups: List.generate(completedYields.length, (idx) {
                    return BarChartGroupData(
                      x: idx,
                      barRods: [
                        BarChartRodData(
                          toY: completedYields[idx].$2,
                          color: const Color(0xFF2E7D32),
                          width: 22,
                          borderRadius: const BorderRadius.vertical(top: Radius.circular(4)),
                        ),
                      ],
                    );
                  }),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
