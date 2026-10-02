import 'package:freezed_annotation/freezed_annotation.dart';

part 'dashboard_models.freezed.dart';
part 'dashboard_models.g.dart';

@freezed
abstract class DashboardDataModel with _$DashboardDataModel {
  const factory DashboardDataModel({
    @JsonKey(name: 'summary') required DashboardSummaryModel summary,
    @JsonKey(name: 'metrics') required List<MetricCardModel> metrics,
    @JsonKey(name: 'quick_actions') required List<QuickActionModel> quickActions,
    @JsonKey(name: 'recent_activities') required List<RecentActivityModel> recentActivities,
    @JsonKey(name: 'chart_summary') required ChartSummaryModel chartSummary,
  }) = _DashboardDataModel;

  factory DashboardDataModel.fromJson(Map<String, dynamic> json) => _$DashboardDataModelFromJson(json);
}

@freezed
abstract class DashboardSummaryModel with _$DashboardSummaryModel {
  const factory DashboardSummaryModel({
    @JsonKey(name: 'active_batches') required int activeBatches,
    @JsonKey(name: 'todays_tasks') required int todaysTasks,
    @JsonKey(name: 'net_income') required double netIncome,
  }) = _DashboardSummaryModel;

  factory DashboardSummaryModel.fromJson(Map<String, dynamic> json) => _$DashboardSummaryModelFromJson(json);
}

@freezed
abstract class MetricCardModel with _$MetricCardModel {
  const factory MetricCardModel({
    @JsonKey(name: 'title') required String title,
    @JsonKey(name: 'value') required String value,
    @JsonKey(name: 'icon_type') required String iconType,
  }) = _MetricCardModel;

  factory MetricCardModel.fromJson(Map<String, dynamic> json) => _$MetricCardModelFromJson(json);
}

@freezed
abstract class QuickActionModel with _$QuickActionModel {
  const factory QuickActionModel({
    @JsonKey(name: 'id') required String id,
    @JsonKey(name: 'label') required String label,
    @JsonKey(name: 'icon_type') required String iconType,
  }) = _QuickActionModel;

  factory QuickActionModel.fromJson(Map<String, dynamic> json) => _$QuickActionModelFromJson(json);
}

@freezed
abstract class RecentActivityModel with _$RecentActivityModel {
  const factory RecentActivityModel({
    @JsonKey(name: 'id') required String id,
    @JsonKey(name: 'title') required String title,
    @JsonKey(name: 'subtitle') required String subtitle,
    @JsonKey(name: 'timestamp') required String timestamp,
    @JsonKey(name: 'activity_type') required String activityType,
  }) = _RecentActivityModel;

  factory RecentActivityModel.fromJson(Map<String, dynamic> json) => _$RecentActivityModelFromJson(json);
}

@freezed
abstract class ChartSummaryModel with _$ChartSummaryModel {
  const factory ChartSummaryModel({
    @JsonKey(name: 'income_data_points') required List<double> incomeDataPoints,
    @JsonKey(name: 'expense_data_points') required List<double> expenseDataPoints,
    @JsonKey(name: 'labels') required List<String> labels,
  }) = _ChartSummaryModel;

  factory ChartSummaryModel.fromJson(Map<String, dynamic> json) => _$ChartSummaryModelFromJson(json);
}
