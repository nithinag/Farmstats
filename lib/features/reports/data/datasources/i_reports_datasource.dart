import '../models/report_models.dart';

abstract class IReportsDataSource {
  Future<FinancialReportModel> getFinancialReport(DateTime start, DateTime end);
  Future<ProductionReportModel> getProductionReport(DateTime start, DateTime end);
}
