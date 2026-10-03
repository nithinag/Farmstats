import '../../domain/entities/batch_entities.dart';

class BatchValidationService {
  /// Validates a batch creation or update attempt.
  static List<String> validate({
    required DateTime startDate,
    required DateTime expectedHarvestDate,
    required int numberOfDfls,
    required double temperature,
    required double humidity,
  }) {
    final errors = <String>[];
    if (startDate.isAfter(expectedHarvestDate)) {
      errors.add('Start date cannot be after expected harvest date');
    }
    if (numberOfDfls <= 0) {
      errors.add('Number of DFLs must be greater than 0');
    }
    if (temperature < 15 || temperature > 40) {
      errors.add('Temperature should typically be between 15°C and 40°C');
    }
    if (humidity < 30 || humidity > 100) {
      errors.add('Humidity should be between 30% and 100%');
    }
    return errors;
  }

  /// Ensures that state transitions are logically valid.
  static bool canTransitionStatus(BatchStatus current, BatchStatus next) {
    if (current == next) return true;
    
    switch (current) {
      case BatchStatus.planned:
        // From planned, can only go to active or cancelled.
        return next == BatchStatus.active || next == BatchStatus.cancelled;
      case BatchStatus.active:
        // From active, can go to harvested, completed, or cancelled.
        return next == BatchStatus.harvested || next == BatchStatus.completed || next == BatchStatus.cancelled;
      case BatchStatus.harvested:
        // From harvested, can go to completed or cancelled.
        return next == BatchStatus.completed || next == BatchStatus.cancelled;
      case BatchStatus.completed:
      case BatchStatus.cancelled:
        // Terminal states
        return false;
    }
  }
}
