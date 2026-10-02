import 'package:flutter_test/flutter_test.dart';
import 'package:farmstats/features/income/application/services/income_validation_service.dart';

void main() {
  group('IncomeValidationService Tests', () {
    test('calculateNetAmount computes correctly', () {
      final net = IncomeValidationService.calculateNetAmount(
        quantity: 100, // 100 kg
        rate: 500,     // 500/kg => 50000 gross
        transportCharges: 2000,
        commission: 1000,
      ); // 50000 - 3000 = 47000

      expect(net, 47000.0);
    });

    test('validate returns errors when invalid', () {
      final errors = IncomeValidationService.validate(
        quantity: -5,
        rate: 0,
        buyerId: '',
      );

      expect(errors.length, 3);
      expect(errors.contains('Quantity must be greater than 0'), true);
      expect(errors.contains('Rate must be greater than 0'), true);
      expect(errors.contains('Buyer is mandatory'), true);
    });

    test('validate returns empty when valid', () {
      final errors = IncomeValidationService.validate(
        quantity: 10,
        rate: 100,
        buyerId: 'b1',
      );

      expect(errors.isEmpty, true);
    });
  });
}
