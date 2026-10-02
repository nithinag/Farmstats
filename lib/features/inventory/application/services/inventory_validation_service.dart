import '../../domain/entities/inventory_entities.dart';

class InventoryValidationService {
  /// Validates an inventory item before creation or update.
  static List<String> validateItem({
    required String name,
    required double currentQuantity,
    required double minimumQuantity,
    double? maximumQuantity,
    required double purchasePrice,
  }) {
    final errors = <String>[];
    if (name.trim().isEmpty) {
      errors.add('Name cannot be empty');
    }
    if (currentQuantity < 0) {
      errors.add('Current quantity cannot be negative');
    }
    if (minimumQuantity < 0) {
      errors.add('Minimum quantity cannot be negative');
    }
    if (maximumQuantity != null && minimumQuantity > maximumQuantity) {
      errors.add('Minimum quantity cannot be greater than maximum quantity');
    }
    if (purchasePrice < 0) {
      errors.add('Purchase price cannot be negative');
    }
    return errors;
  }

  /// Validates a stock transaction (consume/add)
  static List<String> validateTransaction({
    required InventoryItem item,
    required double transactionQuantity,
    required TransactionType type,
  }) {
    final errors = <String>[];
    
    if (transactionQuantity <= 0) {
      errors.add('Transaction quantity must be greater than zero');
    }

    if (type == TransactionType.consume || type == TransactionType.transfer) {
      if (item.currentQuantity < transactionQuantity) {
        errors.add('Cannot consume more than available stock (${item.currentQuantity} ${item.unit} available)');
      }
    }
    
    return errors;
  }
}
