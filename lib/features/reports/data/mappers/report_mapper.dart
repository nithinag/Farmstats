import '../../domain/entities/report_entities.dart';
import '../models/report_models.dart';

class ReportMapper {
  static FinancialReport fromFinancialModel(FinancialReportModel model) {
    return FinancialReport(
      totalIncome: model.totalIncome,
      totalExpenses: model.totalExpenses,
      netProfit: model.netProfit,
      expensesByCategory: model.expensesByCategory,
      incomeByBuyer: model.incomeByBuyer,
    );
  }

  static ProductionReport fromProductionModel(ProductionReportModel model) {
    return ProductionReport(
      averageYieldPercentage: model.averageYieldPercentage,
      averageSurvivalRate: model.averageSurvivalRate,
      totalGrossWeight: model.totalGrossWeight,
      totalNetSaleableWeight: model.totalNetSaleableWeight,
      gradeDistribution: model.gradeDistribution,
    );
  }
}
