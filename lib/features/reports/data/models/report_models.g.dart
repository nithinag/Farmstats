// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'report_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_FinancialReportModel _$FinancialReportModelFromJson(
        Map<String, dynamic> json) =>
    _FinancialReportModel(
      totalIncome: (json['totalIncome'] as num).toDouble(),
      totalExpenses: (json['totalExpenses'] as num).toDouble(),
      netProfit: (json['netProfit'] as num).toDouble(),
      expensesByCategory:
          (json['expensesByCategory'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(k, (e as num).toDouble()),
      ),
      incomeByBuyer: (json['incomeByBuyer'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(k, (e as num).toDouble()),
      ),
    );

Map<String, dynamic> _$FinancialReportModelToJson(
        _FinancialReportModel instance) =>
    <String, dynamic>{
      'totalIncome': instance.totalIncome,
      'totalExpenses': instance.totalExpenses,
      'netProfit': instance.netProfit,
      'expensesByCategory': instance.expensesByCategory,
      'incomeByBuyer': instance.incomeByBuyer,
    };

_ProductionReportModel _$ProductionReportModelFromJson(
        Map<String, dynamic> json) =>
    _ProductionReportModel(
      averageYieldPercentage:
          (json['averageYieldPercentage'] as num).toDouble(),
      averageSurvivalRate: (json['averageSurvivalRate'] as num).toDouble(),
      totalGrossWeight: (json['totalGrossWeight'] as num).toDouble(),
      totalNetSaleableWeight:
          (json['totalNetSaleableWeight'] as num).toDouble(),
      gradeDistribution:
          (json['gradeDistribution'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(k, (e as num).toDouble()),
      ),
    );

Map<String, dynamic> _$ProductionReportModelToJson(
        _ProductionReportModel instance) =>
    <String, dynamic>{
      'averageYieldPercentage': instance.averageYieldPercentage,
      'averageSurvivalRate': instance.averageSurvivalRate,
      'totalGrossWeight': instance.totalGrossWeight,
      'totalNetSaleableWeight': instance.totalNetSaleableWeight,
      'gradeDistribution': instance.gradeDistribution,
    };
