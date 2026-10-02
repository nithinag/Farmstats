import '../../../reports/application/providers/reports_notifier.dart';
import '../../../dashboard/application/providers/dashboard_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/repositories/i_inventory_repository.dart';
import '../../data/repositories/inventory_repository_impl.dart';
import '../../data/datasources/i_inventory_datasource.dart';
import '../../data/datasources/inventory_drift_datasource.dart';
import '../../../../data/providers/database_provider.dart';
import '../usecases/inventory_usecases.dart';
import '../../domain/entities/inventory_entities.dart';
import 'inventory_state.dart';

final inventoryDataSourceProvider = Provider<IInventoryDataSource>((ref) {
  return InventoryDriftDataSourceImpl(ref.watch(appDatabaseProvider).inventoryDao);
});

final inventoryRepositoryProvider = Provider<IInventoryRepository>((ref) {
  return InventoryRepositoryImpl(ref.watch(inventoryDataSourceProvider));
});

final getInventoryUseCaseProvider = Provider((ref) => GetInventoryUseCase(ref.watch(inventoryRepositoryProvider)));
final addInventoryUseCaseProvider = Provider((ref) => AddInventoryItemUseCase(ref.watch(inventoryRepositoryProvider)));
final consumeStockUseCaseProvider = Provider((ref) => ConsumeStockUseCase(ref.watch(inventoryRepositoryProvider)));
final getStockHistoryUseCaseProvider = Provider((ref) => GetStockHistoryUseCase(ref.watch(inventoryRepositoryProvider)));

final inventoryNotifierProvider = NotifierProvider<InventoryNotifier, InventoryState>(() {
  return InventoryNotifier();
});

class InventoryNotifier extends Notifier<InventoryState> {
  @override
  InventoryState build() {
    loadInventory();
    return const InventoryState.initial();
  }

  Future<void> loadInventory({InventoryFilter? filter}) async {
    state = const InventoryState.loading();
    final result = await ref.read(getInventoryUseCaseProvider).execute(filter: filter);
    state = result.fold(
      (failure) => InventoryState.error(failure.message),
      (items) => InventoryState.data(items),
    );
  }

  Future<bool> addItem(InventoryItem item) async {
    final result = await ref.read(addInventoryUseCaseProvider).execute(item);
    return result.fold((failure) => false, (_) {
      loadInventory();
      ref.read(dashboardAggregatorProvider.notifier).loadDashboard();
      ref.read(reportsNotifierProvider.notifier).loadReports();
      return true;
    });
  }

  Future<bool> consumeStock(InventoryItem item, InventoryTransaction transaction) async {
    final result = await ref.read(consumeStockUseCaseProvider).execute(item, transaction);
    return result.fold((failure) => false, (_) {
      loadInventory();
      ref.read(dashboardAggregatorProvider.notifier).loadDashboard();
      ref.read(reportsNotifierProvider.notifier).loadReports();
      return true;
    });
  }
}
