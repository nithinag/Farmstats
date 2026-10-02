import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import '../../../../shared/widgets/layout_components.dart';
import '../../../../shared/widgets/navigation_shell.dart';
import '../../../../core/theme/spacing.dart';
import '../../../../core/theme/radius.dart';
import '../../../../core/theme/color_scheme.dart';
import '../../application/providers/dashboard_notifier.dart';
import '../../application/providers/dashboard_state.dart';
import '../widgets/dashboard_cards.dart';
import '../../../notifications/presentation/widgets/notification_badge_widget.dart';
import '../../../expenses/application/providers/expense_notifier.dart';
import '../../../expenses/application/providers/expense_state.dart';

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
    final state = ref.watch(dashboardAggregatorProvider);
    final expenseState = ref.watch(expenseNotifierProvider);
    final isDark = Theme.of(context).brightness == Brightness.dark;
    
    final totalDfls = expenseState.maybeWhen(
      data: (list) {
        return list
            .where((e) => (e.category.id == 'c1' || e.category.name.toLowerCase().contains('dfl')) && e.quantity != null)
            .fold<double>(0.0, (sum, e) => sum + e.quantity!)
            .toInt();
      },
      orElse: () => 0,
    );

    final currencyFormatter = NumberFormat.currency(
      symbol: '₹',
      decimalDigits: 0,
      locale: 'en_IN',
    );
    final numberFormatter = NumberFormat.decimalPattern('en_IN');

    return BaseScaffold(
      appBar: AppBar(
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.eco, color: AppColorScheme.primaryLight, size: 20),
            const SizedBox(width: 6),
            Text(
              'FARMSTATS',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w800,
                    letterSpacing: 1.1,
                  ),
            ),
          ],
        ),
        actions: [
          const NotificationBadgeWidget(),
          IconButton(
            icon: const Icon(Icons.refresh),
            tooltip: 'Refresh Dashboard',
            onPressed: () =>
                ref.read(dashboardAggregatorProvider.notifier).loadDashboard(),
          ),
          const SizedBox(width: AppSpacing.xs),
        ],
      ),
      body: switch (state) {
        DashboardStateInitial() => const Center(child: Text('Initializing...')),
        DashboardStateLoading() => const Center(child: CircularProgressIndicator()),
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
                  ElevatedButton(
                    onPressed: () => ref.read(dashboardAggregatorProvider.notifier).loadDashboard(),
                    child: const Text('Try Again'),
                  ),
                ],
              ),
            ),
          ),
        DashboardStateData(
          financial: final fin,
          production: final prod,
          recentActivities: final activities,
          alerts: final alerts
        ) => RefreshIndicator(
            onRefresh: () =>
                ref.read(dashboardAggregatorProvider.notifier).loadDashboard(),
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md, vertical: AppSpacing.sm),
              children: [
                // Top Welcome / Date Header
                Container(
                  padding: const EdgeInsets.symmetric(vertical: AppSpacing.xs),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${_getGreeting()}!',
                            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                                  fontWeight: FontWeight.w800,
                                  color: Theme.of(context).colorScheme.onSurface,
                                ),
                          ),
                          const SizedBox(height: 2),
                          Row(
                            children: [
                              Text(
                                'Sericulture Business Operations',
                                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                      color: Colors.grey[600],
                                      fontWeight: FontWeight.w500,
                                    ),
                              ),
                              const SizedBox(width: 4),
                              const Text('🌿', style: TextStyle(fontSize: 12)),
                            ],
                          ),
                        ],
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                        decoration: BoxDecoration(
                          color: isDark ? AppColorScheme.surfaceContainerDark : AppColorScheme.surfaceContainerLight,
                          borderRadius: BorderRadius.circular(AppRadius.sm),
                          border: Border.all(
                            color: isDark ? AppColorScheme.cardBorderDark : AppColorScheme.cardBorderLight,
                            width: 1,
                          ),
                        ),
                        child: Text(
                          DateFormat('dd MMM yyyy').format(DateTime.now()),
                          style: Theme.of(context).textTheme.labelSmall?.copyWith(
                                fontWeight: FontWeight.w700,
                                color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.8),
                              ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: AppSpacing.md),

                // Alerts Banner (if any)
                if (alerts.isNotEmpty) ...[
                  ...alerts.map((alert) => AlertCard(message: alert)),
                  const SizedBox(height: AppSpacing.xs),
                ],

                // TIER 1: Hero Financial Health
                DashboardHeroFinancialCard(
                  totalIncome: fin.totalIncome,
                  totalExpenses: fin.totalExpenses,
                  netProfit: fin.netProfit,
                ),
                const SizedBox(height: AppSpacing.lg),

                // TIER 2: Operations & Cash Management
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Operational Metrics',
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                            fontWeight: FontWeight.w700,
                            letterSpacing: 0.1,
                          ),
                    ),
                    Text(
                      'Season to date',
                      style: Theme.of(context).textTheme.labelSmall?.copyWith(
                            color: Colors.grey[500],
                          ),
                    ),
                  ],
                ),
                const SizedBox(height: AppSpacing.sm),
                GridView.count(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisCount: 2,
                  childAspectRatio: 1.55,
                  mainAxisSpacing: AppSpacing.sm,
                  crossAxisSpacing: AppSpacing.sm,
                  children: [
                    DashboardOperationalKpiCard(
                      title: 'Cash Balance',
                      value: currencyFormatter.format(fin.totalIncome - fin.totalExpenses),
                      icon: Icons.account_balance_outlined,
                      accentColor: const Color(0xFF0277BD),
                      subtitle: 'Net available funds',
                    ),
                    DashboardOperationalKpiCard(
                      title: 'DFLs Purchased',
                      value: '${numberFormatter.format(totalDfls)} DFLs',
                      icon: Icons.egg_outlined,
                      accentColor: const Color(0xFF2E7D32),
                      subtitle: 'Silkworm inventory',
                    ),
                    DashboardOperationalKpiCard(
                      title: 'Cocoon Yield',
                      value: '${prod.totalNetSaleableWeight.toStringAsFixed(0)} kg',
                      icon: Icons.agriculture_outlined,
                      accentColor: const Color(0xFFE65100),
                      subtitle: 'Total production',
                    ),
                    DashboardOperationalKpiCard(
                      title: 'Avg. Revenue / kg',
                      value: currencyFormatter.format(
                        (prod.totalNetSaleableWeight > 0)
                            ? (fin.totalIncome / prod.totalNetSaleableWeight)
                            : 0.0,
                      ),
                      icon: Icons.price_check_outlined,
                      accentColor: const Color(0xFF6A1B9A),
                      subtitle: 'Sale price realization',
                    ),
                  ],
                ),
                const SizedBox(height: AppSpacing.lg),

                // TIER 3: Quick Action Grid
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Quick Actions',
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                            fontWeight: FontWeight.w700,
                            letterSpacing: 0.1,
                          ),
                    ),
                    InkWell(
                      onTap: () => NavigationShell.showQuickActions(context),
                      child: Text(
                        'View all',
                        style: Theme.of(context).textTheme.labelSmall?.copyWith(
                              color: AppColorScheme.primaryLight,
                              fontWeight: FontWeight.w700,
                            ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: AppSpacing.sm),
                Row(
                  children: [
                    Expanded(
                      child: DashboardQuickActionItem(
                        label: 'Expense',
                        icon: Icons.receipt_long,
                        color: const Color(0xFFD32F2F),
                        onTap: () => context.push('/expenses/add'),
                      ),
                    ),
                    const SizedBox(width: AppSpacing.sm),
                    Expanded(
                      child: DashboardQuickActionItem(
                        label: 'Revenue',
                        icon: Icons.payments,
                        color: const Color(0xFF2E7D32),
                        onTap: () => context.push('/income/add'),
                      ),
                    ),
                    const SizedBox(width: AppSpacing.sm),
                    Expanded(
                      child: DashboardQuickActionItem(
                        label: 'Worker',
                        icon: Icons.people_outline,
                        color: const Color(0xFF1565C0),
                        onTap: () => context.push('/labour/add'),
                      ),
                    ),
                    const SizedBox(width: AppSpacing.sm),
                    Expanded(
                      child: DashboardQuickActionItem(
                        label: 'Harvest',
                        icon: Icons.agriculture,
                        color: const Color(0xFFE65100),
                        onTap: () => context.push('/harvest/add'),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: AppSpacing.lg),

                // TIER 4: Monthly Financial Trends Chart
                Text(
                  'Monthly Trends (6 Months)',
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.w700,
                        letterSpacing: 0.1,
                      ),
                ),
                const SizedBox(height: AppSpacing.sm),
                Container(
                  padding: const EdgeInsets.all(AppSpacing.md),
                  decoration: BoxDecoration(
                    color: isDark ? AppColorScheme.surfaceDark : Colors.white,
                    borderRadius: BorderRadius.circular(AppRadius.md),
                    border: Border.all(
                      color: isDark ? AppColorScheme.cardBorderDark : AppColorScheme.cardBorderLight,
                      width: 1,
                    ),
                  ),
                  child: const DashboardLineChart(),
                ),
                const SizedBox(height: AppSpacing.lg),

                // TIER 5: Recent Activity
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Recent Activity',
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                            fontWeight: FontWeight.w700,
                            letterSpacing: 0.1,
                          ),
                    ),
                    Text(
                      'Latest records',
                      style: Theme.of(context).textTheme.labelSmall?.copyWith(
                            color: Colors.grey[500],
                          ),
                    ),
                  ],
                ),
                const SizedBox(height: AppSpacing.sm),
                Container(
                  decoration: BoxDecoration(
                    color: isDark ? AppColorScheme.surfaceDark : Colors.white,
                    borderRadius: BorderRadius.circular(AppRadius.md),
                    border: Border.all(
                      color: isDark ? AppColorScheme.cardBorderDark : AppColorScheme.cardBorderLight,
                      width: 1,
                    ),
                  ),
                  child: activities.isEmpty
                      ? Padding(
                          padding: const EdgeInsets.all(AppSpacing.lg),
                          child: Center(
                            child: Text(
                              'No recent activities recorded',
                              style: TextStyle(color: Colors.grey[500], fontSize: 12),
                            ),
                          ),
                        )
                      : ListView.separated(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: activities.length,
                          separatorBuilder: (context, index) => Divider(
                            height: 1,
                            color: isDark ? AppColorScheme.cardBorderDark : AppColorScheme.cardBorderLight,
                          ),
                          itemBuilder: (context, index) {
                            final act = activities[index];
                            final isIncome = act.toLowerCase().contains('income');
                            final isHarvest = act.toLowerCase().contains('harvest');

                            return ListTile(
                              dense: true,
                              contentPadding: const EdgeInsets.symmetric(horizontal: AppSpacing.md, vertical: 2),
                              leading: CircleAvatar(
                                radius: 14,
                                backgroundColor: isIncome
                                    ? const Color(0xFFE8F5E9)
                                    : (isHarvest ? const Color(0xFFFFF3E0) : const Color(0xFFFFEBEE)),
                                child: Icon(
                                  isIncome
                                      ? Icons.arrow_downward
                                      : (isHarvest ? Icons.agriculture : Icons.arrow_upward),
                                  size: 14,
                                  color: isIncome
                                      ? const Color(0xFF2E7D32)
                                      : (isHarvest ? const Color(0xFFE65100) : const Color(0xFFC62828)),
                                ),
                              ),
                              title: Text(
                                act,
                                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                      fontWeight: FontWeight.w600,
                                      color: Theme.of(context).colorScheme.onSurface,
                                    ),
                              ),
                              trailing: Text(
                                'Recent',
                                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                                      color: Colors.grey[500],
                                      fontSize: 10,
                                    ),
                              ),
                            );
                          },
                        ),
                ),
                const SizedBox(height: AppSpacing.xl),
              ],
            ),
          ),
        _ => const SizedBox.shrink(),
      },
    );
  }
}

