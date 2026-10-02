import 'package:flutter_test/flutter_test.dart';
import 'package:farmstats/features/harvest/application/services/harvest_validation_service.dart';

void main() {
  group('HarvestValidationService Tests', () {
    test('validateHarvest prevents gross weight less than zero', () {
      final errors = HarvestValidationService.validateHarvest(
        grossWeight: 0,
        netSaleableWeight: 0,
        rejectedWeight: 0,
        moisturePercentage: 12,
        wastePercentage: 2,
        gradeA: 0,
        gradeB: 0,
        gradeC: 0,
      );

      expect(errors.contains('Gross weight must be greater than zero'), true);
    });

    test('validateHarvest ensures net + rejected = gross', () {
      final errors = HarvestValidationService.validateHarvest(
        grossWeight: 100,
        netSaleableWeight: 90,
        rejectedWeight: 5,
        moisturePercentage: 12,
        wastePercentage: 2,
        gradeA: 50,
        gradeB: 30,
        gradeC: 10,
      );

      expect(errors.contains('Net weight and rejected weight must sum up to gross weight'), true);
    });

    test('validateHarvest ensures sum of grades equals net weight', () {
      final errors = HarvestValidationService.validateHarvest(
        grossWeight: 100,
        netSaleableWeight: 95,
        rejectedWeight: 5,
        moisturePercentage: 12,
        wastePercentage: 2,
        gradeA: 50,
        gradeB: 30,
        gradeC: 10, // Sums to 90, not 95
      );

      expect(errors.contains('Sum of A, B, and C grades must equal net saleable weight'), true);
    });

    test('validateHarvest accepts valid input', () {
      final errors = HarvestValidationService.validateHarvest(
        grossWeight: 100,
        netSaleableWeight: 95,
        rejectedWeight: 5,
        moisturePercentage: 12,
        wastePercentage: 2,
        gradeA: 50,
        gradeB: 35,
        gradeC: 10,
      );

      expect(errors.isEmpty, true);
    });
  });
}
