import 'package:drift/drift.dart';
import '../../../../data/database/app_database.dart';
import '../../../../data/database/tables/expense_tables.dart';
import '../../../../data/database/tables/income_tables.dart';
import '../../../../data/database/tables/harvest_tables.dart';

part 'reports_dao.g.dart';

@DriftAccessor(tables: [ExpensesTable, IncomesTable, HarvestsTable])
class ReportsDao extends DatabaseAccessor<AppDatabase> with _$ReportsDaoMixin {
  ReportsDao(super.db);

  /// Computes financial totals between two dates
  Future<(double totalIncome, double totalExpenses)> getFinancialTotals(DateTime start, DateTime end) async {
    final incomeSum = incomesTable.netAmount.sum();
    final expenseSum = expensesTable.amount.sum();

    final incomeQuery = selectOnly(incomesTable)
      ..addColumns([incomeSum])
      ..where(incomesTable.saleDate.isBetweenValues(start, end));
      
    final expenseQuery = selectOnly(expensesTable)
      ..addColumns([expenseSum])
      ..where(expensesTable.date.isBetweenValues(start, end));

    final incResult = await incomeQuery.getSingle();
    final expResult = await expenseQuery.getSingle();

    return (
      incResult.read(incomeSum) ?? 0.0,
      expResult.read(expenseSum) ?? 0.0
    );
  }

  /// Computes production aggregates between two dates
  Future<(double avgYield, double avgSurvival, double totalNetWeight)> getProductionAggregates(DateTime start, DateTime end) async {
    final avgYield = harvestsTable.yieldPercentage.avg();
    final avgSurvival = harvestsTable.survivalRate.avg();
    final sumNet = harvestsTable.netSaleableWeight.sum();

    final query = selectOnly(harvestsTable)
      ..addColumns([avgYield, avgSurvival, sumNet])
      ..where(harvestsTable.harvestDate.isBetweenValues(start, end));

    final result = await query.getSingle();

    return (
      result.read(avgYield) ?? 0.0,
      result.read(avgSurvival) ?? 0.0,
      result.read(sumNet) ?? 0.0
    );
  }
}
