import '../../domain/entities/dashboard_entities.dart';
import '../models/dashboard_models.dart';

class DashboardMapper {
  static DashboardData fromModel(DashboardDataModel model) {
    return DashboardData(
      summary: _mapSummary(model.summary),
      metrics: model.metrics.map(_mapMetric).toList(),
      quickActions: model.quickActions.map(_mapQuickAction).toList(),
      recentActivities: model.recentActivities.map(_mapRecentActivity).toList(),
      chartSummary: _mapChartSummary(model.chartSummary),
    );
  }

  static DashboardSummary _mapSummary(DashboardSummaryModel model) {
    return DashboardSummary(
      activeBatches: model.activeBatches,
      todaysTasks: model.todaysTasks,
      netIncome: model.netIncome,
    );
  }

  static MetricCardData _mapMetric(MetricCardModel model) {
    return MetricCardData(
      title: model.title,
      value: model.value,
      iconType: model.iconType,
    );
  }

  static QuickActionData _mapQuickAction(QuickActionModel model) {
    return QuickActionData(
      id: model.id,
      label: model.label,
      iconType: model.iconType,
    );
  }

  static RecentActivity _mapRecentActivity(RecentActivityModel model) {
    return RecentActivity(
      id: model.id,
      title: model.title,
      subtitle: model.subtitle,
      timestamp: DateTime.parse(model.timestamp),
      activityType: model.activityType,
    );
  }

  static ChartSummary _mapChartSummary(ChartSummaryModel model) {
    return ChartSummary(
      incomeDataPoints: model.incomeDataPoints,
      expenseDataPoints: model.expenseDataPoints,
      labels: model.labels,
    );
  }
}
