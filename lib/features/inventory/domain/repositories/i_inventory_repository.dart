import 'package:fpdart/fpdart.dart';
import '../../../../core/errors/failure.dart';
import '../entities/inventory_entities.dart';

abstract class IInventoryRepository {
  Future<Either<Failure, List<InventoryItem>>> getInventoryItems(InventoryFilter? filter);
  Future<Either<Failure, InventoryItem>> getItemById(String id);
  Future<Either<Failure, Unit>> addItem(InventoryItem item);
  Future<Either<Failure, Unit>> updateItem(InventoryItem item);
  Future<Either<Failure, Unit>> deleteItem(String id);
  Future<Either<Failure, List<InventoryCategory>>> getCategories();
  
  /// Performs a stock transaction (consume/add) and updates the item's balance transactionally.
  Future<Either<Failure, Unit>> performTransaction(InventoryTransaction transaction);
  Future<Either<Failure, List<InventoryTransaction>>> getStockHistory(String itemId);
}
