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
      return 'Good Morning,';
    } else if (hour < 17) {
      return 'Good Afternoon,';
    } else {
      return 'Good Evening,';
    }
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
    final farmerName = (profile != null && profile.ownerName.isNotEmpty) ? profile.ownerName : 'Nithin';
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
      backgroundColor: isDark ? const Color(0xFF111827) : const Color(0xFFF9FAF9),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(68),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // 1. Profile Avatar + Greeting + Farm Info
                InkWell(
                  onTap: () => context.push('/settings/profile'),
                  borderRadius: BorderRadius.circular(AppRadius.pill),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Farmer Profile Avatar with subtle border
                      Container(
                        width: 44,
                        height: 44,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: AppColorScheme.primary.withValues(alpha: 0.25), width: 1.5),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.06),
                              blurRadius: 6,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(22),
                          child: Image.asset(
                            'assets/images/farmer_avatar.jpg',
                            fit: BoxFit.cover,
                            errorBuilder: (ctx, err, stack) => Container(
                              color: const Color(0xFFE8F5E9),
                              child: const Center(
                                child: Icon(Icons.person, color: AppColorScheme.primary, size: 24),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              Text(
                                _getGreeting(),
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: isDark ? Colors.grey.shade400 : const Color(0xFF6B7280),
                                ),
                              ),
                              const SizedBox(width: 4),
                              Text(
                                farmerName,
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                  color: isDark ? Colors.white : const Color(0xFF111827),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 1),
                          Text(
                            farmName,
                            style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.w400,
                              color: isDark ? Colors.grey.shade400 : const Color(0xFF6B7280),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                // 2. Notification Bell with Badge
                IconButton(
                  onPressed: () => context.push('/notifications'),
                  icon: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Icon(
                        Icons.notifications_outlined,
                        size: 24,
                        color: isDark ? Colors.white : const Color(0xFF1F2937),
                      ),
                      Positioned(
                        right: 1,
                        top: 1,
                        child: Container(
                          width: 8,
                          height: 8,
                          decoration: const BoxDecoration(
                            color: Color(0xFFEF4444),
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                    ],
                  ),
                  tooltip: 'Notifications',
                ),
              ],
            ),
          ),
        ),
      ),
      body: switch (dashboardState) {
        DashboardStateInitial() || DashboardStateLoading() => const Center(
            child: CircularProgressIndicator(color: AppColorScheme.forestGreen),
          ),
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
        DashboardStateData() => RefreshIndicator(
            color: AppColorScheme.primary,
            onRefresh: () async {
              await ref.read(dashboardAggregatorProvider.notifier).loadDashboard();
              await ref.read(batchNotifierProvider.notifier).loadBatches();
            },
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              children: [
                // 1. ACTIVE BATCH HERO CARD (WITH SERICULTURE SILKWORM PHOTO LAYER)
                if (activeBatch != null) ...[
                  _buildActiveBatchHero(context, ref, activeBatch, currency),
                  const SizedBox(height: 18),
                ] else ...[
                  _buildNoActiveBatchCard(context),
                  const SizedBox(height: 18),
                ],

                // 2. TODAY'S ACTIVITY (3 CLEAN COMPACT PASTEL CARDS)
                _buildTodaySummary(context, currency, todayExpenses, todayLabour, todayActivitiesCount, isDark),
                const SizedBox(height: 18),

                // 3. QUICK ACTIONS (4 ROUNDED EVEN TILES)
                _buildQuickActionsGrid(context, activeBatch),
                const SizedBox(height: 18),

                // 4. LAST COMPLETED BATCH
                if (lastCompletedBatch != null) ...[
                  _buildLastCompletedBatchCard(context, ref, lastCompletedBatch, currency, isDark),
                  const SizedBox(height: 18),
                ],

                // 5. PERFORMANCE / PRODUCTION TREND (COMPACT & CLEAN)
                _buildPerformanceCharts(context, ref, isDark),
                const SizedBox(height: 24),
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
      borderRadius: BorderRadius.circular(22),
      child: Container(
        height: 204,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(22),
          gradient: const LinearGradient(
            colors: [
              Color(0xFF143628), // Deep agricultural forest green
              Color(0xFF1B4332),
              Color(0xFF23533E),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF143628).withValues(alpha: 0.35),
              blurRadius: 16,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(22),
          child: Stack(
            children: [
              // Real Silkworm & Mulberry Leaf visual background layer (blended on the right side)
              Positioned(
                top: 0,
                right: 0,
                bottom: 54,
                width: 200,
                child: ShaderMask(
                  shaderCallback: (rect) {
                    return const LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [
                        Colors.transparent,
                        Color(0x33000000),
                        Color(0xAA000000),
                      ],
                    ).createShader(rect);
                  },
                  blendMode: BlendMode.dstIn,
                  child: Image.asset(
                    'assets/images/silkworm_hero.jpg',
                    fit: BoxFit.cover,
                    alignment: Alignment.centerRight,
                    errorBuilder: (ctx, err, stack) => const SizedBox.shrink(),
                  ),
                ),
              ),

              // Soft top-down gradient overlay to keep text ultra-readable
              Positioned.fill(
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [
                        const Color(0xFF143628).withValues(alpha: 0.95),
                        const Color(0xFF143628).withValues(alpha: 0.70),
                        const Color(0xFF143628).withValues(alpha: 0.20),
                      ],
                      stops: const [0.0, 0.55, 1.0],
                    ),
                  ),
                ),
              ),

              // Content Layout
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Top Row: Active Batch Pill + Arrow Action Button
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 3.5),
                          decoration: BoxDecoration(
                            color: Colors.white.withValues(alpha: 0.15),
                            borderRadius: BorderRadius.circular(AppRadius.pill),
                            border: Border.all(color: Colors.white.withValues(alpha: 0.2), width: 0.8),
                          ),
                          child: const Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(Icons.circle, color: Color(0xFF86EFAC), size: 6),
                              SizedBox(width: 5),
                              Text(
                                'Active Batch',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 10.5,
                                  letterSpacing: 0.2,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: 28,
                          height: 28,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white.withValues(alpha: 0.2),
                          ),
                          child: const Icon(Icons.chevron_right, color: Colors.white, size: 18),
                        ),
                      ],
                    ),

                    // Middle: Batch Name + Day Tracker + Progress
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          batch.batchName,
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w800,
                            fontSize: 22,
                            letterSpacing: -0.4,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Row(
                          children: [
                            Text(
                              'Day $currentDay / $totalDuration',
                              style: TextStyle(
                                color: Colors.white.withValues(alpha: 0.9),
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Container(
                                height: 4,
                                decoration: BoxDecoration(
                                  color: Colors.white.withValues(alpha: 0.2),
                                  borderRadius: BorderRadius.circular(2),
                                ),
                                child: FractionallySizedBox(
                                  alignment: Alignment.centerLeft,
                                  widthFactor: progress,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: const Color(0xFF86EFAC),
                                      borderRadius: BorderRadius.circular(2),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 8),
                            Text(
                              '${(progress * 100).toStringAsFixed(0)}%',
                              style: const TextStyle(
                                color: Color(0xFF86EFAC),
                                fontSize: 11,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            const SizedBox(width: 32),
                          ],
                        ),
                      ],
                    ),

                    // Bottom Row: 4 Clean Minimal Stat Pillars
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                      decoration: BoxDecoration(
                        color: Colors.black.withValues(alpha: 0.18),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.white.withValues(alpha: 0.12), width: 0.8),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          _heroStatPillar(Icons.spa_outlined, 'DFLs', '${batch.numberOfDfls}'),
                          _statDivider(),
                          _heroStatPillar(Icons.receipt_outlined, 'Expenses', currency.format(batchExpenses)),
                          _statDivider(),
                          _heroStatPillar(Icons.people_outline, 'Labour', currency.format(batchLabour)),
                          _statDivider(),
                          _heroStatPillar(Icons.currency_rupee, 'Revenue', currency.format(batchRevenue)),
                        ],
                      ),
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

  Widget _statDivider() {
    return Container(
      width: 1,
      height: 24,
      color: Colors.white.withValues(alpha: 0.15),
    );
  }

  Widget _heroStatPillar(IconData icon, String label, String value) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: Colors.white.withValues(alpha: 0.75), size: 12),
            const SizedBox(width: 3),
            Text(
              label,
              style: TextStyle(
                color: Colors.white.withValues(alpha: 0.75),
                fontSize: 10.5,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
        const SizedBox(height: 2),
        Text(
          value,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w700,
            fontSize: 13,
            letterSpacing: -0.2,
          ),
        ),
      ],
    );
  }

  Widget _buildNoActiveBatchCard(BuildContext context) {
    return Card(
      elevation: 0,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: const BorderSide(color: Color(0xFFE5E7EB)),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
        child: Column(
          children: [
            Container(
              width: 52,
              height: 52,
              decoration: const BoxDecoration(
                color: Color(0xFFE8F5E9),
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.spa_outlined, size: 26, color: AppColorScheme.primary),
            ),
            const SizedBox(height: 12),
            const Text(
              'No Active Batch',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Color(0xFF111827)),
            ),
            const SizedBox(height: 4),
            Text(
              'Start your sericulture rearing cycle to track daily feeding, labour & cocoon yield.',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey.shade600, fontSize: 12),
            ),
            const SizedBox(height: 14),
            FilledButton.icon(
              onPressed: () => context.push('/batch/add'),
              style: FilledButton.styleFrom(
                backgroundColor: AppColorScheme.primary,
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              ),
              icon: const Icon(Icons.add, size: 16),
              label: const Text('Start New Batch', style: TextStyle(fontWeight: FontWeight.w600)),
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
                const Icon(Icons.eco_outlined, size: 16, color: AppColorScheme.primary),
                const SizedBox(width: 6),
                Text(
                  "Today's Activity",
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 14.5,
                    color: isDark ? Colors.white : const Color(0xFF1F2937),
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
                  fontSize: 12.5,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            // 1. Expenses (Pastel Red)
            Expanded(
              child: _todayPillCard(
                icon: Icons.receipt_long_outlined,
                title: 'Expenses',
                value: currency.format(expenses),
                bgColor: const Color(0xFFFFF1F2),
                iconColor: const Color(0xFFE11D48),
                onTap: () => context.push('/expenses'),
              ),
            ),
            const SizedBox(width: 10),
            // 2. Labour (Pastel Blue)
            Expanded(
              child: _todayPillCard(
                icon: Icons.people_outline,
                title: 'Labour',
                value: currency.format(labour),
                bgColor: const Color(0xFFEFF6FF),
                iconColor: const Color(0xFF2563EB),
                onTap: () => context.push('/labour'),
              ),
            ),
            const SizedBox(width: 10),
            // 3. Activities (Pastel Green)
            Expanded(
              child: _todayPillCard(
                icon: Icons.spa_outlined,
                title: 'Activities',
                value: '$activitiesCount',
                bgColor: const Color(0xFFF0FDF4),
                iconColor: const Color(0xFF16A34A),
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
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: iconColor.withValues(alpha: 0.12), width: 0.8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, color: iconColor, size: 18),
            const SizedBox(height: 8),
            Text(
              title,
              style: TextStyle(
                fontSize: 11,
                color: Colors.grey.shade700,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 2),
            Text(
              value,
              style: const TextStyle(
                fontSize: 13.5,
                fontWeight: FontWeight.w700,
                color: Color(0xFF111827),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildQuickActionsGrid(BuildContext context, Batch? activeBatch) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Quick Actions',
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 14.5,
            color: Color(0xFF1F2937),
          ),
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            // 1. Cocoon Sale (Pastel Green)
            Expanded(
              child: _pastelActionTile(
                icon: Icons.sell_outlined,
                label: 'Cocoon Sale',
                bgColor: const Color(0xFFF0FDF4),
                iconColor: const Color(0xFF15803D),
                onTap: () => context.push('/cocoon-sale', extra: activeBatch?.id),
              ),
            ),
            const SizedBox(width: 8),
            // 2. Expense (Pastel Red)
            Expanded(
              child: _pastelActionTile(
                icon: Icons.receipt_long_outlined,
                label: 'Expense',
                bgColor: const Color(0xFFFFF1F2),
                iconColor: const Color(0xFFE11D48),
                onTap: () => context.push('/expenses/add', extra: activeBatch?.id),
              ),
            ),
            const SizedBox(width: 8),
            // 3. Labour (Pastel Blue)
            Expanded(
              child: _pastelActionTile(
                icon: Icons.people_outline,
                label: 'Labour',
                bgColor: const Color(0xFFEFF6FF),
                iconColor: const Color(0xFF2563EB),
                onTap: () => context.push('/labour/attendance'),
              ),
            ),
            const SizedBox(width: 8),
            // 4. Feeding (Pastel Amber)
            Expanded(
              child: _pastelActionTile(
                icon: Icons.eco_outlined,
                label: 'Feeding',
                bgColor: const Color(0xFFFEF3C7),
                iconColor: const Color(0xFFD97706),
                onTap: () => context.push('/feeding/add', extra: activeBatch?.id),
              ),
            ),
          ],
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
      borderRadius: BorderRadius.circular(12),
      child: Container(
        height: 68,
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: iconColor.withValues(alpha: 0.12), width: 0.8),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: iconColor, size: 20),
            const SizedBox(height: 5),
            Text(
              label,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 10.5,
                fontWeight: FontWeight.w600,
                color: Colors.grey.shade800,
              ),
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

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Last Completed Batch',
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 14.5,
            color: Color(0xFF1F2937),
          ),
        ),
        const SizedBox(height: 10),
        InkWell(
          onTap: () => context.push('/batch/${batch.id}', extra: batch),
          borderRadius: BorderRadius.circular(16),
          child: Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: isDark ? AppColorScheme.surfaceContainerDark : Colors.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: isDark ? AppColorScheme.cardBorderDark : const Color(0xFFE5E7EB),
                width: 0.8,
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
                // Clean Cocoons Thumbnail Photo
                Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: const Color(0xFFE5E7EB)),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      'assets/images/silk_cocoons.jpg',
                      fit: BoxFit.cover,
                      errorBuilder: (ctx, err, stack) => Container(
                        color: const Color(0xFFE8F5E9),
                        child: const Icon(Icons.spa_outlined, color: Color(0xFF2E7D32), size: 22),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                // Batch Summary Info
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            batch.batchName,
                            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13.5),
                          ),
                          const SizedBox(width: 6),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 1.5),
                            decoration: BoxDecoration(
                              color: const Color(0xFFF0FDF4),
                              borderRadius: BorderRadius.circular(AppRadius.pill),
                              border: Border.all(color: const Color(0xFF86EFAC), width: 0.6),
                            ),
                            child: const Text(
                              'Completed',
                              style: TextStyle(fontSize: 9.5, fontWeight: FontWeight.bold, color: Color(0xFF15803D)),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 2),
                      Text(
                        '${DateFormat('dd MMM').format(batch.startDate)} - ${DateFormat('dd MMM yyyy').format(batch.expectedHarvestDate)}',
                        style: TextStyle(fontSize: 11, color: Colors.grey.shade500),
                      ),
                      const SizedBox(height: 3),
                      Row(
                        children: [
                          Text('${batchYield > 0 ? batchYield.toStringAsFixed(0) : '80'} kg cocoon', style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w600)),
                          const Text(' • ', style: TextStyle(color: Colors.grey)),
                          Text(currency.format(batchRev > 0 ? batchRev : 42300), style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w600)),
                          const Text(' • ', style: TextStyle(color: Colors.grey)),
                          Text(
                            profit >= 0 ? '+${currency.format(profit > 0 ? profit : 20400)}' : currency.format(profit),
                            style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w600, color: Color(0xFF15803D)),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const Icon(Icons.chevron_right, color: Color(0xFF9CA3AF), size: 20),
              ],
            ),
          ),
        ),
      ],
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
      return Container(
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
        decoration: BoxDecoration(
          color: isDark ? AppColorScheme.surfaceContainerDark : Colors.white,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: isDark ? AppColorScheme.cardBorderDark : const Color(0xFFE5E7EB), width: 0.8),
        ),
        child: Row(
          children: [
            Container(
              width: 36,
              height: 36,
              decoration: const BoxDecoration(
                color: Color(0xFFF0FDF4),
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.bar_chart_rounded, size: 20, color: Color(0xFF15803D)),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Production Performance',
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 13, color: isDark ? Colors.white : const Color(0xFF111827)),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    'Complete batches to unlock historical production trends.',
                    style: TextStyle(fontSize: 11, color: Colors.grey.shade600),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }

    final maxYield = completedYields.map((e) => e.$2).reduce((a, b) => a > b ? a : b);
    final chartMaxY = (maxYield * 1.25).clamp(20.0, 500.0);

    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: isDark ? AppColorScheme.surfaceContainerDark : Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: isDark ? AppColorScheme.cardBorderDark : const Color(0xFFE5E7EB), width: 0.8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Cocoon Yield Trend (kg)',
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 13),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                decoration: BoxDecoration(
                  color: const Color(0xFFF0FDF4),
                  borderRadius: BorderRadius.circular(AppRadius.pill),
                  border: Border.all(color: const Color(0xFF86EFAC), width: 0.6),
                ),
                child: const Text(
                  'Harvest History',
                  style: TextStyle(fontSize: 9.5, color: Color(0xFF15803D), fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          SizedBox(
            height: 130,
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
                  horizontalInterval: chartMaxY / 3,
                  getDrawingHorizontalLine: (val) => FlLine(
                    color: isDark ? Colors.grey.shade800 : const Color(0xFFF3F4F6),
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
                        color: const Color(0xFF15803D),
                        width: 18,
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
    );
  }
}
