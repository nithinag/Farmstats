class FeedingValidationService {
  static List<String> validateFeeding({
    required double leafQuantity,
    required int feedingRound,
  }) {
    final errors = <String>[];
    if (leafQuantity <= 0) {
      errors.add('Leaf quantity must be greater than zero');
    }
    if (feedingRound < 1) {
      errors.add('Feeding round must be 1 or higher');
    }
    return errors;
  }
}

class HealthValidationService {
  static List<String> validateMortality({
    required int deadCount,
  }) {
    final errors = <String>[];
    if (deadCount < 0) {
      errors.add('Dead count cannot be negative');
    }
    return errors;
  }

  static List<String> validateEnvironment({
    required double temperature,
    required double humidity,
  }) {
    final errors = <String>[];
    if (temperature < 0 || temperature > 50) {
      errors.add('Temperature must be between 0 and 50 °C');
    }
    if (humidity < 0 || humidity > 100) {
      errors.add('Humidity must be between 0 and 100 %');
    }
    return errors;
  }
}
