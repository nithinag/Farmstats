import 'package:freezed_annotation/freezed_annotation.dart';

part 'report_entities.freezed.dart';

enum TimeFilter { daily, weekly, monthly, quarterly, yearly, custom }

@freezed
abstract class FinancialReport with _$FinancialReport {
  const factory FinancialReport({
    required double totalIncome,
    required double totalExpenses,
    required double netProfit,
    required Map<String, double> expensesByCategory,
    required Map<String, double> incomeByBuyer,
  }) = _FinancialReport;
}

@freezed
abstract class ProductionReport with _$ProductionReport {
  const factory ProductionReport({
    required double averageYieldPercentage,
    required double averageSurvivalRate,
    required double totalGrossWeight,
    required double totalNetSaleableWeight,
    required Map<String, double> gradeDistribution,
  }) = _ProductionReport;
}
