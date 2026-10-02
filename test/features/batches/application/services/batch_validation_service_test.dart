import 'package:flutter_test/flutter_test.dart';
import 'package:farmstats/features/batches/application/services/batch_validation_service.dart';
import 'package:farmstats/features/batches/domain/entities/batch_entities.dart';

void main() {
  group('BatchValidationService Tests', () {
    test('validate checks dates properly', () {
      final errors = BatchValidationService.validate(
        startDate: DateTime.now().add(const Duration(days: 5)),
        expectedHarvestDate: DateTime.now(),
        numberOfDfls: 100,
        temperature: 25.0,
        humidity: 60.0,
      );

      expect(errors.contains('Start date cannot be after expected harvest date'), true);
    });

    test('validate checks logic thresholds', () {
      final errors = BatchValidationService.validate(
        startDate: DateTime.now(),
        expectedHarvestDate: DateTime.now().add(const Duration(days: 25)),
        numberOfDfls: 0,
        temperature: 50.0,
        humidity: 20.0,
      );

      expect(errors.contains('Number of DFLs must be greater than 0'), true);
      expect(errors.contains('Temperature should typically be between 15°C and 40°C'), true);
      expect(errors.contains('Humidity should be between 30% and 100%'), true);
    });

    test('canTransitionStatus enforces logic', () {
      expect(BatchValidationService.canTransitionStatus(BatchStatus.planned, BatchStatus.active), true);
      expect(BatchValidationService.canTransitionStatus(BatchStatus.planned, BatchStatus.harvested), false);
      expect(BatchValidationService.canTransitionStatus(BatchStatus.active, BatchStatus.harvested), true);
      expect(BatchValidationService.canTransitionStatus(BatchStatus.harvested, BatchStatus.completed), true);
      expect(BatchValidationService.canTransitionStatus(BatchStatus.completed, BatchStatus.active), false);
    });
  });
}
