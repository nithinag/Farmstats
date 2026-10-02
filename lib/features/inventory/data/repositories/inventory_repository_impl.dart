import 'package:fpdart/fpdart.dart';
import '../../../../core/errors/failure.dart';
import '../../domain/entities/inventory_entities.dart';
import '../../domain/repositories/i_inventory_repository.dart';
import '../datasources/i_inventory_datasource.dart';
import '../mappers/inventory_mapper.dart';

class InventoryRepositoryImpl implements IInventoryRepository {
  final IInventoryDataSource _dataSource;

  InventoryRepositoryImpl(this._dataSource);

  @override
  Future<Either<Failure, List<InventoryItem>>> getInventoryItems(InventoryFilter? filter) async {
    try {
      final models = await _dataSource.getInventoryItems();
      final items = models.map(InventoryMapper.fromModel).toList();
      
      if (filter == null) return Right(items);

      final filtered = items.where((e) {
        if (filter.categoryId != null && e.category.id != filter.categoryId) return false;
        if (filter.status != null && e.status != filter.status) return false;
        if (filter.lowStockOnly == true && e.currentQuantity > e.minimumQuantity) return false;
        if (filter.expiringSoonOnly == true) {
          if (e.expiryDate == null) return false;
          final daysToExpiry = e.expiryDate!.difference(DateTime.now()).inDays;
          if (daysToExpiry > 30 || daysToExpiry < 0) return false;
        }
        return true;
      }).toList();

      return Right(filtered);
    } catch (e) {
      return Left(Failure('Failed to load inventory items: $e'));
    }
  }

  @override
  Future<Either<Failure, InventoryItem>> getItemById(String id) async {
    try {
      final model = await _dataSource.getItemById(id);
      if (model != null) {
        return Right(InventoryMapper.fromModel(model));
      }
      return const Left(Failure('Item not found'));
    } catch (e) {
      return Left(Failure('Failed to load item: $e'));
    }
  }

  @override
  Future<Either<Failure, Unit>> addItem(InventoryItem item) async {
    try {
      final model = InventoryMapper.toModel(item);
      await _dataSource.addItem(model);
      return const Right(unit);
    } catch (e) {
      return Left(Failure('Failed to add item: $e'));
    }
  }

  @override
  Future<Either<Failure, Unit>> updateItem(InventoryItem item) async {
    try {
      final model = InventoryMapper.toModel(item);
      await _dataSource.updateItem(model);
      return const Right(unit);
    } catch (e) {
      return Left(Failure('Failed to update item: $e'));
    }
  }

  @override
  Future<Either<Failure, Unit>> deleteItem(String id) async {
    try {
      await _dataSource.deleteItem(id);
      return const Right(unit);
    } catch (e) {
      return Left(Failure('Failed to delete item: $e'));
    }
  }

  @override
  Future<Either<Failure, List<InventoryCategory>>> getCategories() async {
    try {
      final models = await _dataSource.getCategories();
      return Right(models.map(InventoryMapper.categoryFromModel).toList());
    } catch (e) {
      return Left(Failure('Failed to load categories: $e'));
    }
  }

  @override
  Future<Either<Failure, Unit>> performTransaction(InventoryTransaction transaction) async {
    try {
      final model = InventoryMapper.transactionToModel(transaction);
      await _dataSource.performTransaction(model);
      return const Right(unit);
    } catch (e) {
      return Left(Failure('Failed to perform transaction: $e'));
    }
  }

  @override
  Future<Either<Failure, List<InventoryTransaction>>> getStockHistory(String itemId) async {
    try {
      final models = await _dataSource.getStockHistory(itemId);
      return Right(models.map(InventoryMapper.transactionFromModel).toList());
    } catch (e) {
      return Left(Failure('Failed to load stock history: $e'));
    }
  }
}
