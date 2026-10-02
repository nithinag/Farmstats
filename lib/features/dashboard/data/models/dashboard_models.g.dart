// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DashboardDataModel _$DashboardDataModelFromJson(Map<String, dynamic> json) =>
    _DashboardDataModel(
      summary: DashboardSummaryModel.fromJson(
          json['summary'] as Map<String, dynamic>),
      metrics: (json['metrics'] as List<dynamic>)
          .map((e) => MetricCardModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      quickActions: (json['quick_actions'] as List<dynamic>)
          .map((e) => QuickActionModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      recentActivities: (json['recent_activities'] as List<dynamic>)
          .map((e) => RecentActivityModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      chartSummary: ChartSummaryModel.fromJson(
          json['chart_summary'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DashboardDataModelToJson(_DashboardDataModel instance) =>
    <String, dynamic>{
      'summary': instance.summary,
      'metrics': instance.metrics,
      'quick_actions': instance.quickActions,
      'recent_activities': instance.recentActivities,
      'chart_summary': instance.chartSummary,
    };

_DashboardSummaryModel _$DashboardSummaryModelFromJson(
        Map<String, dynamic> json) =>
    _DashboardSummaryModel(
      activeBatches: (json['active_batches'] as num).toInt(),
      todaysTasks: (json['todays_tasks'] as num).toInt(),
      netIncome: (json['net_income'] as num).toDouble(),
    );

Map<String, dynamic> _$DashboardSummaryModelToJson(
        _DashboardSummaryModel instance) =>
    <String, dynamic>{
      'active_batches': instance.activeBatches,
      'todays_tasks': instance.todaysTasks,
      'net_income': instance.netIncome,
    };

_MetricCardModel _$MetricCardModelFromJson(Map<String, dynamic> json) =>
    _MetricCardModel(
      title: json['title'] as String,
      value: json['value'] as String,
      iconType: json['icon_type'] as String,
    );

Map<String, dynamic> _$MetricCardModelToJson(_MetricCardModel instance) =>
    <String, dynamic>{
      'title': instance.title,
      'value': instance.value,
      'icon_type': instance.iconType,
    };

_QuickActionModel _$QuickActionModelFromJson(Map<String, dynamic> json) =>
    _QuickActionModel(
      id: json['id'] as String,
      label: json['label'] as String,
      iconType: json['icon_type'] as String,
    );

Map<String, dynamic> _$QuickActionModelToJson(_QuickActionModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'label': instance.label,
      'icon_type': instance.iconType,
    };

_RecentActivityModel _$RecentActivityModelFromJson(Map<String, dynamic> json) =>
    _RecentActivityModel(
      id: json['id'] as String,
      title: json['title'] as String,
      subtitle: json['subtitle'] as String,
      timestamp: json['timestamp'] as String,
      activityType: json['activity_type'] as String,
    );

Map<String, dynamic> _$RecentActivityModelToJson(
        _RecentActivityModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'subtitle': instance.subtitle,
      'timestamp': instance.timestamp,
      'activity_type': instance.activityType,
    };

_ChartSummaryModel _$ChartSummaryModelFromJson(Map<String, dynamic> json) =>
    _ChartSummaryModel(
      incomeDataPoints: (json['income_data_points'] as List<dynamic>)
          .map((e) => (e as num).toDouble())
          .toList(),
      expenseDataPoints: (json['expense_data_points'] as List<dynamic>)
          .map((e) => (e as num).toDouble())
          .toList(),
      labels:
          (json['labels'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$ChartSummaryModelToJson(_ChartSummaryModel instance) =>
    <String, dynamic>{
      'income_data_points': instance.incomeDataPoints,
      'expense_data_points': instance.expenseDataPoints,
      'labels': instance.labels,
    };
