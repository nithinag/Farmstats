import 'package:flutter_test/flutter_test.dart';
import 'package:farmstats/features/inventory/application/services/inventory_validation_service.dart';
import 'package:farmstats/features/inventory/domain/entities/inventory_entities.dart';

void main() {
  group('InventoryValidationService Tests', () {
    test('validateItem checks for negative values', () {
      final errors = InventoryValidationService.validateItem(
        name: 'Mulberry Leaves',
        currentQuantity: -10.0,
        minimumQuantity: -5.0,
        maximumQuantity: -100.0,
        purchasePrice: -50.0,
      );

      expect(errors.contains('Current quantity cannot be negative'), true);
      expect(errors.contains('Minimum quantity cannot be negative'), true);
      expect(errors.contains('Purchase price cannot be negative'), true);
    });

    test('validateTransaction prevents consuming more than available', () {
      final item = InventoryItem(
        id: '1',
        name: 'Item',
        category: const InventoryCategory(id: '1', name: 'Cat', colorCode: 'C', iconName: 'I'),
        unit: 'kg',
        currentQuantity: 10.0,
        minimumQuantity: 5.0,
        purchasePrice: 100.0,
        purchaseDate: DateTime.now(),
        status: InventoryStatus.active,
      );

      final errors = InventoryValidationService.validateTransaction(
        item: item,
        transactionQuantity: 15.0,
        type: TransactionType.consume,
      );

      expect(errors.contains('Cannot consume more than available stock (10.0 kg available)'), true);
    });
  });
}
