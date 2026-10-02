import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:fl_chart/fl_chart.dart';
import '../../../../shared/widgets/buttons_and_cards.dart';
import '../../../../shared/extensions/extensions.dart';
import '../../domain/entities/dashboard_entities.dart';
import '../../../../core/theme/spacing.dart';

class DashboardGreeting extends StatelessWidget {
  const DashboardGreeting({super.key});

  @override
  Widget build(BuildContext context) {
    final hour = DateTime.now().hour;
    String greeting = 'Good Evening';
    if (hour < 12) {
      greeting = 'Good Morning';
    } else if (hour < 17) {
      greeting = 'Good Afternoon';
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md, vertical: AppSpacing.sm),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Semantics(
            header: true,
            child: Text(greeting, style: Theme.of(context).textTheme.headlineSmall),
          ),
          const SizedBox(height: AppSpacing.xs),
          Text('Welcome back to your farm!', style: Theme.of(context).textTheme.bodyMedium),
        ],
      ),
    ).animate().fadeIn(duration: 400.ms).slideX(begin: -0.05, end: 0);
  }
}

class FarmSummaryCard extends StatelessWidget {
  final DashboardSummary data;
  const FarmSummaryCard({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
      child: AppCard(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Farm Summary', style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: AppSpacing.md),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildMetric(context, 'Active Batches', data.activeBatches.toString(), Icons.bug_report),
                _buildMetric(context, 'Today\'s Tasks', data.todaysTasks.toString(), Icons.task_alt),
                _buildMetric(context, 'Net Income', data.netIncome.toCurrency(), Icons.account_balance_wallet),
              ],
            )
          ],
        ),
      ).animate().fadeIn(duration: 500.ms, delay: 100.ms).slideY(begin: 0.1, end: 0),
    );
  }

  Widget _buildMetric(BuildContext context, String label, String value, IconData icon) {
    return Semantics(
      label: '$label: $value',
      child: ExcludeSemantics(
        child: Column(
          children: [
            Icon(icon, color: Theme.of(context).colorScheme.primary),
            const SizedBox(height: AppSpacing.xs),
            Text(value, style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
            Text(label, style: Theme.of(context).textTheme.bodySmall),
          ],
        ),
      ),
    );
  }
}

class MetricCardsGrid extends StatelessWidget {
  final List<MetricCardData> metrics;
  const MetricCardsGrid({super.key, required this.metrics});

  @override
  Widget build(BuildContext context) {
    final bool isWide = MediaQuery.of(context).size.width > 600;
    
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: isWide ? 4 : 2,
          childAspectRatio: 1.5,
          crossAxisSpacing: AppSpacing.sm,
          mainAxisSpacing: AppSpacing.sm,
        ),
        itemCount: metrics.length,
        itemBuilder: (context, index) {
          final metric = metrics[index];
          IconData icon;
          switch (metric.iconType) {
            case 'income': icon = Icons.trending_up; break;
            case 'expense': icon = Icons.trending_down; break;
            default: icon = Icons.analytics;
          }
          return AppCard(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(icon, color: Theme.of(context).colorScheme.primary),
                const SizedBox(height: AppSpacing.xs),
                Text(metric.value, style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
                Text(metric.title, style: Theme.of(context).textTheme.bodySmall, textAlign: TextAlign.center),
              ],
            ),
          ).animate().fadeIn(duration: 400.ms, delay: (200 + (index * 100)).ms).scale(begin: const Offset(0.9, 0.9));
        },
      ),
    );
  }
}

class QuickActionGrid extends StatelessWidget {
  final List<QuickActionData> actions;
  const QuickActionGrid({super.key, required this.actions});

  @override
  Widget build(BuildContext context) {
    final bool isWide = MediaQuery.of(context).size.width > 600;

    return Padding(
      padding: const EdgeInsets.all(AppSpacing.md),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: isWide ? 8 : 4,
          childAspectRatio: 0.8,
        ),
        itemCount: actions.length,
        itemBuilder: (context, index) {
          final action = actions[index];
          IconData icon;
          switch (action.iconType) {
            case 'batch': icon = Icons.add_circle; break;
            case 'expense': icon = Icons.remove_circle; break;
            case 'income': icon = Icons.monetization_on; break;
            case 'report': icon = Icons.bar_chart; break;
            default: icon = Icons.widgets;
          }
          return _buildAction(context, action.label, icon)
            .animate().fadeIn(duration: 400.ms, delay: (300 + (index * 50)).ms);
        },
      ),
    );
  }

  Widget _buildAction(BuildContext context, String label, IconData icon) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Semantics(
          button: true,
          label: label,
          child: InkWell(
            onTap: () {},
            borderRadius: BorderRadius.circular(32),
            child: CircleAvatar(
              radius: 28,
              backgroundColor: Theme.of(context).colorScheme.primaryContainer,
              child: Icon(icon, color: Theme.of(context).colorScheme.onPrimaryContainer),
            ),
          ),
        ),
        const SizedBox(height: AppSpacing.xs),
        Text(label, style: Theme.of(context).textTheme.bodySmall, overflow: TextOverflow.ellipsis, maxLines: 1),
      ],
    );
  }
}

class RecentActivityCard extends StatelessWidget {
  final List<RecentActivity> activities;
  const RecentActivityCard({super.key, required this.activities});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
      child: AppCard(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Recent Activity', style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: AppSpacing.md),
            if (activities.isEmpty)
              const Text('No recent activities.')
            else
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: activities.length,
                separatorBuilder: (_, __) => const Divider(),
                itemBuilder: (context, index) {
                  final activity = activities[index];
                  return Semantics(
                    label: 'Activity: ${activity.title}, ${activity.subtitle}',
                    child: ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: CircleAvatar(
                        backgroundColor: activity.activityType == 'expense' 
                            ? Theme.of(context).colorScheme.errorContainer 
                            : Theme.of(context).colorScheme.primaryContainer,
                        child: Icon(
                          activity.activityType == 'expense' ? Icons.money_off :
                          activity.activityType == 'income' ? Icons.attach_money : Icons.event,
                          color: activity.activityType == 'expense' 
                            ? Theme.of(context).colorScheme.onErrorContainer 
                            : Theme.of(context).colorScheme.onPrimaryContainer,
                        ),
                      ),
                      title: Text(activity.title, style: const TextStyle(fontWeight: FontWeight.bold)),
                      subtitle: Text(activity.subtitle),
                      trailing: Text(activity.timestamp.toShortDate(), style: Theme.of(context).textTheme.bodySmall),
                    ),
                  ).animate().fadeIn(duration: 400.ms, delay: (400 + (index * 100)).ms).slideX(begin: 0.1, end: 0);
                },
              ),
          ],
        ),
      ),
    );
  }
}

class DashboardChartCard extends StatelessWidget {
  final ChartSummary chartData;
  const DashboardChartCard({super.key, required this.chartData});

  @override
  Widget build(BuildContext context) {
    if (chartData.labels.isEmpty) return const SizedBox.shrink();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
      child: AppCard(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Financial Overview', style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: AppSpacing.xl),
            SizedBox(
              height: 250,
              child: LineChart(
                LineChartData(
                  gridData: const FlGridData(show: false),
                  titlesData: FlTitlesData(
                    rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                    topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: (value, meta) {
                          final index = value.toInt();
                          if (index >= 0 && index < chartData.labels.length) {
                            return Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Text(chartData.labels[index], style: const TextStyle(fontSize: 10)),
                            );
                          }
                          return const Text('');
                        },
                      ),
                    ),
                  ),
                  borderData: FlBorderData(show: false),
                  lineBarsData: [
                    LineChartBarData(
                      spots: chartData.incomeDataPoints.asMap().entries
                          .map((e) => FlSpot(e.key.toDouble(), e.value)).toList(),
                      isCurved: true,
                      color: Colors.green,
                      barWidth: 3,
                      isStrokeCapRound: true,
                      dotData: const FlDotData(show: false),
                      belowBarData: BarAreaData(show: true, color: Colors.green.withValues(alpha: 0.1)),
                    ),
                    LineChartBarData(
                      spots: chartData.expenseDataPoints.asMap().entries
                          .map((e) => FlSpot(e.key.toDouble(), e.value)).toList(),
                      isCurved: true,
                      color: Colors.red,
                      barWidth: 3,
                      isStrokeCapRound: true,
                      dotData: const FlDotData(show: false),
                      belowBarData: BarAreaData(show: true, color: Colors.red.withValues(alpha: 0.1)),
                    ),
                  ],
                ),
              ).animate().fadeIn(duration: 800.ms),
            ),
          ],
        ),
      ),
    );
  }
}
