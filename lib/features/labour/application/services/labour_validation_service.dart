class LabourValidationService {
  /// Validates a worker profile.
  static List<String> validateWorker({
    required String fullName,
    required String phoneNumber,
    required double dailyWage,
  }) {
    final errors = <String>[];
    if (fullName.trim().isEmpty) {
      errors.add('Full name cannot be empty');
    }
    if (phoneNumber.trim().isEmpty) {
      errors.add('Phone number cannot be empty');
    }
    if (dailyWage < 0) {
      errors.add('Daily wage cannot be negative');
    }
    return errors;
  }

  /// Validates attendance recording.
  static List<String> validateAttendance({
    required DateTime? checkIn,
    required DateTime? checkOut,
    required double hoursWorked,
    required double overtimeHours,
  }) {
    final errors = <String>[];
    if (checkIn != null && checkOut != null && checkOut.isBefore(checkIn)) {
      errors.add('Check-out time cannot be before check-in time');
    }
    if (hoursWorked < 0 || hoursWorked > 24) {
      errors.add('Hours worked must be between 0 and 24');
    }
    if (overtimeHours < 0 || overtimeHours > 24) {
      errors.add('Overtime hours must be between 0 and 24');
    }
    return errors;
  }

  /// Validates a wage payment calculation.
  static List<String> validateWageRecord({
    required double baseWage,
    required double overtimePay,
    required double bonuses,
    required double deductions,
    required double netPay,
  }) {
    final errors = <String>[];
    
    if (baseWage < 0) errors.add('Base wage cannot be negative');
    if (overtimePay < 0) errors.add('Overtime pay cannot be negative');
    if (bonuses < 0) errors.add('Bonuses cannot be negative');
    if (deductions < 0) errors.add('Deductions cannot be negative');
    
    // Check if the math adds up correctly
    final calculatedNet = baseWage + overtimePay + bonuses - deductions;
    // Using a tiny epsilon for double comparison
    if ((calculatedNet - netPay).abs() > 0.01) {
      errors.add('Net pay calculation is mathematically incorrect');
    }

    if (netPay < 0) {
      errors.add('Total net pay cannot be negative after deductions');
    }

    return errors;
  }
}
