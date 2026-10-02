import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart' hide State;
import 'dashboard_state.dart';
import '../../../reports/application/providers/reports_notifier.dart';
import '../../../reports/application/services/report_services.dart';
import '../../../reports/domain/entities/report_entities.dart';
import '../../../../data/providers/database_provider.dart';

final dashboardAggregatorProvider = NotifierProvider<DashboardAggregatorNotifier, DashboardState>(() {
  return DashboardAggregatorNotifier();
});

class DashboardAggregatorNotifier extends Notifier<DashboardState> {
  @override
  DashboardState build() {
    loadDashboard();
    return const DashboardState.initial();
  }

  Future<void> loadDashboard() async {
    state = const DashboardState.loading();
    
    try {
      final db = ref.read(appDatabaseProvider);
      
      // Current Month
      final (start, end) = DateRangeService.getDateRangeForFilter(TimeFilter.monthly);
      
      final getFinancial = ref.read(getFinancialReportUseCaseProvider).execute(start, end);
      final getProduction = ref.read(getProductionReportUseCaseProvider).execute(start, end);
      
      // Wait for financials to load
      final results = await Future.wait([getFinancial, getProduction]);
      
      final finResult = results[0] as Either<dynamic, FinancialReport>;
      final prodResult = results[1] as Either<dynamic, ProductionReport>;
      
      if (finResult.isLeft() || prodResult.isLeft()) {
        state = const DashboardState.error('Failed to load financial or production data');
        return;
      }
      
      final financial = finResult.getRight().toNullable()!;
      final production = prodResult.getRight().toNullable()!;
      
      // Compute actual values from database tables
      final batches = await db.batchDao.getAllBatches();
      final activeBatchesCount = batches.where((b) => b.status.toLowerCase() == 'active').length;
      
      final inventoryItems = await db.inventoryDao.getAllInventoryItems();
      final lowStockItems = inventoryItems
          .map((row) => row.readTable(db.inventoryItemsTable))
          .where((item) => item.currentQuantity < item.minimumQuantity)
          .toList();
      final lowStockCount = lowStockItems.length;
      
      // Every active batch requires a feeding log
      final pendingFeedingsCount = activeBatchesCount;
      
      // Recent Activities
      final List<String> recentActivities = [];
      final expenses = await db.expenseDao.getAllExpenses();
      final incomes = await db.incomeDao.getAllIncomes();
      final harvests = await db.harvestDao.getAllHarvests();
      
      final allActs = <(String, DateTime)>[];
      for (var e in expenses) {
        allActs.add(('Expense: ${e.expense.description} (₹${e.expense.amount.toStringAsFixed(0)})', e.expense.date));
      }
      for (var i in incomes) {
        allActs.add(('Income recorded: ₹${i.income.netAmount.toStringAsFixed(0)}', i.income.saleDate));
      }
      for (var h in harvests) {
        allActs.add(('Harvest completed: ${h.netSaleableWeight.toStringAsFixed(0)} kg', h.harvestDate));
      }
      
      // Sort descending by date
      allActs.sort((a, b) => b.$2.compareTo(a.$2));
      recentActivities.addAll(allActs.take(3).map((act) => act.$1));
      
      // Alerts
      final List<String> alerts = [];
      for (var item in lowStockItems) {
        alerts.add('${item.name} running low (${item.currentQuantity.toStringAsFixed(1)} ${item.unit} remaining)');
      }
      
      state = DashboardState.data(
        financial: financial,
        production: production,
        activeBatchesCount: activeBatchesCount,
        lowStockCount: lowStockCount,
        pendingFeedingsCount: pendingFeedingsCount,
        recentActivities: recentActivities,
        alerts: alerts,
      );
      
    } catch (e) {
      state = DashboardState.error('Failed to aggregate dashboard: $e');
    }
  }
}
