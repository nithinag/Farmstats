import 'package:freezed_annotation/freezed_annotation.dart';

part 'report_models.freezed.dart';
part 'report_models.g.dart';

@freezed
abstract class FinancialReportModel with _$FinancialReportModel {
  const factory FinancialReportModel({
    required double totalIncome,
    required double totalExpenses,
    required double netProfit,
    required Map<String, double> expensesByCategory,
    required Map<String, double> incomeByBuyer,
  }) = _FinancialReportModel;

  factory FinancialReportModel.fromJson(Map<String, dynamic> json) => _$FinancialReportModelFromJson(json);
}

@freezed
abstract class ProductionReportModel with _$ProductionReportModel {
  const factory ProductionReportModel({
    required double averageYieldPercentage,
    required double averageSurvivalRate,
    required double totalGrossWeight,
    required double totalNetSaleableWeight,
    required Map<String, double> gradeDistribution,
  }) = _ProductionReportModel;

  factory ProductionReportModel.fromJson(Map<String, dynamic> json) => _$ProductionReportModelFromJson(json);
}
