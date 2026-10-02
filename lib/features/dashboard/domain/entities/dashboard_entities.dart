import 'package:freezed_annotation/freezed_annotation.dart';

part 'dashboard_entities.freezed.dart';

@freezed
abstract class DashboardData with _$DashboardData {
  const factory DashboardData({
    required DashboardSummary summary,
    required List<MetricCardData> metrics,
    required List<QuickActionData> quickActions,
    required List<RecentActivity> recentActivities,
    required ChartSummary chartSummary,
  }) = _DashboardData;
}

@freezed
abstract class DashboardSummary with _$DashboardSummary {
  const factory DashboardSummary({
    required int activeBatches,
    required int todaysTasks,
    required double netIncome,
  }) = _DashboardSummary;
}

@freezed
abstract class MetricCardData with _$MetricCardData {
  const factory MetricCardData({
    required String title,
    required String value,
    required String iconType,
  }) = _MetricCardData;
}

@freezed
abstract class QuickActionData with _$QuickActionData {
  const factory QuickActionData({
    required String id,
    required String label,
    required String iconType,
  }) = _QuickActionData;
}

@freezed
abstract class RecentActivity with _$RecentActivity {
  const factory RecentActivity({
    required String id,
    required String title,
    required String subtitle,
    required DateTime timestamp,
    required String activityType, // e.g., 'expense', 'income', 'batch'
  }) = _RecentActivity;
}

@freezed
abstract class ChartSummary with _$ChartSummary {
  const factory ChartSummary({
    required List<double> incomeDataPoints,
    required List<double> expenseDataPoints,
    required List<String> labels,
  }) = _ChartSummary;
}
