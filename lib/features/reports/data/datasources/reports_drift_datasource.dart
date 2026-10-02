import '../models/report_models.dart';
import 'i_reports_datasource.dart';
import '../../../../data/database/daos/reports_dao.dart';

class ReportsDriftDataSourceImpl implements IReportsDataSource {
  final ReportsDao _dao;

  ReportsDriftDataSourceImpl(this._dao);

  @override
  Future<FinancialReportModel> getFinancialReport(DateTime start, DateTime end) async {
    final (inc, exp) = await _dao.getFinancialTotals(start, end);
    
    return FinancialReportModel(
      totalIncome: inc,
      totalExpenses: exp,
      netProfit: inc - exp,
      expensesByCategory: {}, // Mocked for simplicity
      incomeByBuyer: {}, // Mocked for simplicity
    );
  }

  @override
  Future<ProductionReportModel> getProductionReport(DateTime start, DateTime end) async {
    final (avgYield, avgSurvival, totalNet) = await _dao.getProductionAggregates(start, end);
    
    return ProductionReportModel(
      averageYieldPercentage: avgYield,
      averageSurvivalRate: avgSurvival,
      totalGrossWeight: 0, // Mocked sum
      totalNetSaleableWeight: totalNet,
      gradeDistribution: {}, // Mocked distribution
    );
  }
}
