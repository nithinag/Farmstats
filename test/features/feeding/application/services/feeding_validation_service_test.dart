import 'package:flutter_test/flutter_test.dart';
import 'package:farmstats/features/feeding/application/services/feeding_validation_service.dart';

void main() {
  group('FeedingValidationService Tests', () {
    test('validateFeeding prevents zero leaf quantity', () {
      final errors = FeedingValidationService.validateFeeding(
        leafQuantity: 0.0,
        feedingRound: 1,
      );

      expect(errors.contains('Leaf quantity must be greater than zero'), true);
    });

    test('validateFeeding prevents invalid rounds', () {
      final errors = FeedingValidationService.validateFeeding(
        leafQuantity: 50.0,
        feedingRound: 0,
      );

      expect(errors.contains('Feeding round must be 1 or higher'), true);
    });
  });

  group('HealthValidationService Tests', () {
    test('validateMortality prevents negative dead count', () {
      final errors = HealthValidationService.validateMortality(deadCount: -5);
      expect(errors.contains('Dead count cannot be negative'), true);
    });

    test('validateEnvironment prevents invalid temperatures', () {
      final errors = HealthValidationService.validateEnvironment(
        temperature: 55.0,
        humidity: 50.0,
      );
      expect(errors.contains('Temperature must be between 0 and 50 °C'), true);
    });

    test('validateEnvironment prevents invalid humidity', () {
      final errors = HealthValidationService.validateEnvironment(
        temperature: 25.0,
        humidity: 105.0,
      );
      expect(errors.contains('Humidity must be between 0 and 100 %'), true);
    });
  });
}
