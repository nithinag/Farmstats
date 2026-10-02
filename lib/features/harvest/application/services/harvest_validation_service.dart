class HarvestValidationService {
  /// Validates weights and distribution for a harvest record
  static List<String> validateHarvest({
    required double grossWeight,
    required double netSaleableWeight,
    required double rejectedWeight,
    required double moisturePercentage,
    required double wastePercentage,
    required double gradeA,
    required double gradeB,
    required double gradeC,
  }) {
    final errors = <String>[];

    if (grossWeight <= 0) {
      errors.add('Gross weight must be greater than zero');
    }

    if (netSaleableWeight < 0) {
      errors.add('Net saleable weight cannot be negative');
    }

    if (rejectedWeight < 0) {
      errors.add('Rejected weight cannot be negative');
    }

    // Using a tiny epsilon for float comparison
    final calculatedGross = netSaleableWeight + rejectedWeight;
    if ((grossWeight - calculatedGross).abs() > 0.01) {
      errors.add('Net weight and rejected weight must sum up to gross weight');
    }

    if (moisturePercentage < 0 || moisturePercentage > 100) {
      errors.add('Moisture percentage must be between 0 and 100');
    }

    if (wastePercentage < 0 || wastePercentage > 100) {
      errors.add('Waste percentage must be between 0 and 100');
    }

    final totalGrades = gradeA + gradeB + gradeC;
    if ((netSaleableWeight - totalGrades).abs() > 0.01) {
      errors.add('Sum of A, B, and C grades must equal net saleable weight');
    }

    return errors;
  }
}
