import 'package:fpdart/fpdart.dart';
import '../../../../core/errors/failure.dart';
import '../../domain/entities/inventory_entities.dart';
import '../../domain/repositories/i_inventory_repository.dart';
import '../services/inventory_validation_service.dart';

class GetInventoryUseCase {
  final IInventoryRepository _repository;
  GetInventoryUseCase(this._repository);

  Future<Either<Failure, List<InventoryItem>>> execute({InventoryFilter? filter}) {
    return _repository.getInventoryItems(filter);
  }
}

class AddInventoryItemUseCase {
  final IInventoryRepository _repository;
  AddInventoryItemUseCase(this._repository);

  Future<Either<Failure, Unit>> execute(InventoryItem item) async {
    final errors = InventoryValidationService.validateItem(
      name: item.name,
      currentQuantity: item.currentQuantity,
      minimumQuantity: item.minimumQuantity,
      maximumQuantity: item.maximumQuantity,
      purchasePrice: item.purchasePrice,
    );

    if (errors.isNotEmpty) {
      return Left(Failure(errors.join(', ')));
    }

    return _repository.addItem(item);
  }
}

class ConsumeStockUseCase {
  final IInventoryRepository _repository;
  ConsumeStockUseCase(this._repository);

  Future<Either<Failure, Unit>> execute(InventoryItem item, InventoryTransaction transaction) async {
    final errors = InventoryValidationService.validateTransaction(
      item: item,
      transactionQuantity: transaction.quantity,
      type: transaction.type,
    );

    if (errors.isNotEmpty) {
      return Left(Failure(errors.join(', ')));
    }

    return _repository.performTransaction(transaction);
  }
}

class GetStockHistoryUseCase {
  final IInventoryRepository _repository;
  GetStockHistoryUseCase(this._repository);

  Future<Either<Failure, List<InventoryTransaction>>> execute(String itemId) {
    return _repository.getStockHistory(itemId);
  }
}
