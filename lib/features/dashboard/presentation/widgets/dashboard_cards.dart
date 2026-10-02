import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../../../../core/theme/spacing.dart';
import '../../../../core/theme/radius.dart';
import '../../../../core/theme/color_scheme.dart';
import '../../../expenses/application/providers/expense_notifier.dart';
import '../../../expenses/application/providers/expense_state.dart';
import '../../../expenses/domain/entities/expense_entities.dart';
import '../../../income/application/providers/income_notifier.dart';
import '../../../income/application/providers/income_state.dart';
import '../../../income/domain/entities/income_entities.dart';

/// Hero Financial Overview Card for Tier 1 KPIs
class DashboardHeroFinancialCard extends StatelessWidget {
  final double totalIncome;
  final double totalExpenses;
  final double netProfit;

  const DashboardHeroFinancialCard({
    super.key,
    required this.totalIncome,
    required this.totalExpenses,
    required this.netProfit,
  });

  @override
  Widget build(BuildContext context) {
    final currencyFormatter = NumberFormat.currency(symbol: '₹', decimalDigits: 0, locale: 'en_IN');
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final isPositiveProfit = netProfit >= 0;
    final margin = totalIncome > 0 ? (netProfit / totalIncome * 100) : 0.0;

    return Container(
      decoration: BoxDecoration(
        color: isDark ? AppColorScheme.surfaceDark : Colors.white,
        borderRadius: BorderRadius.circular(AppRadius.lg),
        border: Border.all(
          color: isDark ? AppColorScheme.cardBorderDark : AppColorScheme.cardBorderLight,
          width: 1,
        ),
        boxShadow: isDark
            ? null
            : [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.04),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
      ),
      padding: const EdgeInsets.all(AppSpacing.lg),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      color: AppColorScheme.primaryLight.withValues(alpha: 0.12),
                      borderRadius: BorderRadius.circular(AppRadius.xs),
                    ),
                    child: const Icon(
                      Icons.account_balance_wallet_outlined,
                      size: 16,
                      color: AppColorScheme.primaryLight,
                    ),
                  ),
                  const SizedBox(width: AppSpacing.sm),
                  Text(
                    'Financial Health',
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          fontWeight: FontWeight.w700,
                          letterSpacing: 0.2,
                        ),
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: isPositiveProfit
                      ? const Color(0xFFE8F5E9)
                      : const Color(0xFFFFEBEE),
                  borderRadius: BorderRadius.circular(AppRadius.pill),
                  border: Border.all(
                    color: isPositiveProfit
                        ? const Color(0xFF81C784).withValues(alpha: 0.5)
                        : const Color(0xFFE57373).withValues(alpha: 0.5),
                    width: 0.8,
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      isPositiveProfit ? Icons.trending_up : Icons.trending_down,
                      size: 13,
                      color: isPositiveProfit ? const Color(0xFF2E7D32) : const Color(0xFFC62828),
                    ),
                    const SizedBox(width: 4),
                    Text(
                      '${margin >= 0 ? '+' : ''}${margin.toStringAsFixed(1)}% margin',
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                        color: isPositiveProfit ? const Color(0xFF2E7D32) : const Color(0xFFC62828),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.md),
          const Divider(height: 1),
          const SizedBox(height: AppSpacing.md),

          // 2x2 Financial Metric Matrix
          Row(
            children: [
              Expanded(
                child: _buildMetricBlock(
                  context: context,
                  label: 'Revenue (This Month)',
                  value: currencyFormatter.format(totalIncome),
                  valueColor: const Color(0xFF2E7D32),
                  icon: Icons.arrow_downward,
                  iconColor: const Color(0xFF2E7D32),
                ),
              ),
              Container(
                width: 1,
                height: 48,
                color: Theme.of(context).colorScheme.outlineVariant.withValues(alpha: 0.4),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: AppSpacing.md),
                  child: _buildMetricBlock(
                    context: context,
                    label: 'Expenses (This Month)',
                    value: currencyFormatter.format(totalExpenses),
                    valueColor: const Color(0xFFC62828),
                    icon: Icons.arrow_upward,
                    iconColor: const Color(0xFFC62828),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.md),
          Container(
            padding: const EdgeInsets.all(AppSpacing.md),
            decoration: BoxDecoration(
              color: isDark
                  ? AppColorScheme.surfaceContainerDark
                  : AppColorScheme.surfaceContainerLight,
              borderRadius: BorderRadius.circular(AppRadius.md),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Net Profit',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.7),
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      currencyFormatter.format(netProfit),
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: isPositiveProfit
                                ? const Color(0xFF2E7D32)
                                : const Color(0xFFC62828),
                          ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'Profit Margin',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.7),
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      '${margin.toStringAsFixed(2)}%',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.onSurface,
                          ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMetricBlock({
    required BuildContext context,
    required String label,
    required String value,
    required Color valueColor,
    required IconData icon,
    required Color iconColor,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(icon, size: 13, color: iconColor),
            const SizedBox(width: 4),
            Expanded(
              child: Text(
                label,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.65),
                      fontWeight: FontWeight.w600,
                      fontSize: 11,
                    ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w800,
                color: valueColor,
                fontSize: 18,
              ),
        ),
      ],
    );
  }
}

/// Tier 2 Operational KPI Card
class DashboardOperationalKpiCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  final Color accentColor;
  final String? subtitle;

  const DashboardOperationalKpiCard({
    super.key,
    required this.title,
    required this.value,
    required this.icon,
    required this.accentColor,
    this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: isDark ? AppColorScheme.surfaceDark : Colors.white,
        borderRadius: BorderRadius.circular(AppRadius.md),
        border: Border.all(
          color: isDark ? AppColorScheme.cardBorderDark : AppColorScheme.cardBorderLight,
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  title,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.7),
                        fontWeight: FontWeight.w600,
                        fontSize: 11,
                      ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: accentColor.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(AppRadius.xs),
                ),
                child: Icon(icon, color: accentColor, size: 15),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.sm),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                value,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.w800,
                      color: Theme.of(context).colorScheme.onSurface,
                      fontSize: 17,
                    ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              if (subtitle != null) ...[
                const SizedBox(height: 2),
                Text(
                  subtitle!,
                  style: Theme.of(context).textTheme.labelSmall?.copyWith(
                        color: Colors.grey[500],
                        fontSize: 10,
                      ),
                ),
              ],
            ],
          ),
        ],
      ),
    );
  }
}

/// Modern Financial Trends Chart
class DashboardLineChart extends ConsumerWidget {
  const DashboardLineChart({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final expenseState = ref.watch(expenseNotifierProvider);
    final incomeState = ref.watch(incomeNotifierProvider);

    final expenses = expenseState.maybeWhen(
      data: (list) => list,
      orElse: () => <Expense>[],
    );
    final incomes = incomeState.maybeWhen(
      data: (list) => list,
      orElse: () => <Income>[],
    );

    final hasData = expenses.isNotEmpty || incomes.isNotEmpty;
    if (!hasData) {
      return Container(
        height: 160,
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.show_chart, size: 36, color: Colors.grey[400]),
            const SizedBox(height: AppSpacing.xs),
            Text(
              'No financial transactions recorded yet',
              style: TextStyle(color: Colors.grey[600], fontSize: 12, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      );
    }

    final now = DateTime.now();
    final months = List.generate(6, (i) {
      return DateTime(now.year, now.month - (5 - i), 1);
    });

    final revenueSpots = <FlSpot>[];
    final expenseSpots = <FlSpot>[];

    for (int i = 0; i < months.length; i++) {
      final m = months[i];
      final monthIncomes = incomes.where((item) => item.saleDate.year == m.year && item.saleDate.month == m.month);
      final monthExpenses = expenses.where((item) => item.date.year == m.year && item.date.month == m.month);
      
      final rev = monthIncomes.fold(0.0, (sum, item) => sum + item.netAmount);
      final exp = monthExpenses.fold(0.0, (sum, item) => sum + item.amount);
      
      revenueSpots.add(FlSpot(i.toDouble(), rev));
      expenseSpots.add(FlSpot(i.toDouble(), exp));
    }

    final allValues = [...revenueSpots.map((s) => s.y), ...expenseSpots.map((s) => s.y)];
    final maxVal = allValues.isEmpty ? 1000.0 : allValues.reduce((a, b) => a > b ? a : b);
    final chartMaxY = maxVal > 0 ? maxVal * 1.25 : 1000.0;
    final intervalY = chartMaxY / 3;

    return Column(
      children: [
        // Legend
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            _buildChartLegend(color: const Color(0xFF2E7D32), label: 'Revenue'),
            const SizedBox(width: AppSpacing.md),
            _buildChartLegend(color: const Color(0xFFD32F2F), label: 'Expenses'),
          ],
        ),
        const SizedBox(height: AppSpacing.md),
        AspectRatio(
          aspectRatio: 1.8,
          child: LineChart(
            LineChartData(
              gridData: FlGridData(
                show: true,
                drawVerticalLine: false,
                getDrawingHorizontalLine: (value) => FlLine(
                  color: Colors.grey.withValues(alpha: 0.12),
                  strokeWidth: 1,
                ),
              ),
              titlesData: FlTitlesData(
                show: true,
                rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                leftTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    interval: intervalY > 0 ? intervalY : 1,
                    getTitlesWidget: (value, meta) {
                      if (value == 0) return const Text('0', style: TextStyle(fontSize: 10, color: Colors.grey));
                      if (value >= 1000) {
                        return Text('${(value / 1000).toStringAsFixed(0)}k', style: const TextStyle(fontSize: 10, color: Colors.grey));
                      }
                      return Text(value.toStringAsFixed(0), style: const TextStyle(fontSize: 10, color: Colors.grey));
                    },
                    reservedSize: 32,
                  ),
                ),
                bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    reservedSize: 24,
                    interval: 1,
                    getTitlesWidget: (value, meta) {
                      final idx = value.toInt();
                      if (idx >= 0 && idx < months.length) {
                        return Text(
                          DateFormat('MMM').format(months[idx]),
                          style: const TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.w600,
                            fontSize: 10,
                          ),
                        );
                      }
                      return const Text('');
                    },
                  ),
                ),
              ),
              borderData: FlBorderData(show: false),
              minX: 0,
              maxX: 5,
              minY: 0,
              maxY: chartMaxY,
              lineBarsData: [
                LineChartBarData(
                  spots: revenueSpots,
                  isCurved: true,
                  color: const Color(0xFF2E7D32),
                  barWidth: 2.5,
                  isStrokeCapRound: true,
                  dotData: const FlDotData(show: true),
                  belowBarData: BarAreaData(
                    show: true,
                    color: const Color(0xFF2E7D32).withValues(alpha: 0.08),
                  ),
                ),
                LineChartBarData(
                  spots: expenseSpots,
                  isCurved: true,
                  color: const Color(0xFFD32F2F),
                  barWidth: 2.5,
                  isStrokeCapRound: true,
                  dotData: const FlDotData(show: true),
                  belowBarData: BarAreaData(
                    show: true,
                    color: const Color(0xFFD32F2F).withValues(alpha: 0.05),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildChartLegend({required Color color, required String label}) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 10,
          height: 10,
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        ),
        const SizedBox(width: 4),
        Text(
          label,
          style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w600, color: Colors.grey),
        ),
      ],
    );
  }
}

/// Modern Quick Action Button
class DashboardQuickActionItem extends StatelessWidget {
  final String label;
  final IconData icon;
  final Color color;
  final VoidCallback onTap;

  const DashboardQuickActionItem({
    super.key,
    required this.label,
    required this.icon,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(AppRadius.md),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: AppSpacing.sm, horizontal: AppSpacing.xs),
        decoration: BoxDecoration(
          color: isDark ? AppColorScheme.surfaceDark : Colors.white,
          borderRadius: BorderRadius.circular(AppRadius.md),
          border: Border.all(
            color: isDark ? AppColorScheme.cardBorderDark : AppColorScheme.cardBorderLight,
            width: 1,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: color.withValues(alpha: 0.12),
                shape: BoxShape.circle,
              ),
              child: Icon(icon, color: color, size: 20),
            ),
            const SizedBox(height: 6),
            Text(
              label,
              style: Theme.of(context).textTheme.labelSmall?.copyWith(
                    fontWeight: FontWeight.w700,
                    fontSize: 11,
                  ),
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}

/// Alert Card with clean border
class AlertCard extends StatelessWidget {
  final String message;
  const AlertCard({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: AppSpacing.sm),
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md, vertical: AppSpacing.sm),
      decoration: BoxDecoration(
        color: const Color(0xFFFFF3E0),
        borderRadius: BorderRadius.circular(AppRadius.sm),
        border: Border.all(
          color: const Color(0xFFFFB74D).withValues(alpha: 0.6),
          width: 1,
        ),
      ),
      child: Row(
        children: [
          const Icon(Icons.warning_amber_rounded, color: Color(0xFFE65100), size: 18),
          const SizedBox(width: AppSpacing.sm),
          Expanded(
            child: Text(
              message,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: const Color(0xFFBF360C),
                    fontWeight: FontWeight.w600,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}

