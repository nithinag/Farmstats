import 'package:flutter_test/flutter_test.dart';
import 'package:farmstats/features/labour/application/services/labour_validation_service.dart';

void main() {
  group('LabourValidationService Tests', () {
    test('validateWorker prevents empty names and negative wages', () {
      final errors = LabourValidationService.validateWorker(
        fullName: '',
        phoneNumber: '',
        dailyWage: -100.0,
      );

      expect(errors.contains('Full name cannot be empty'), true);
      expect(errors.contains('Phone number cannot be empty'), true);
      expect(errors.contains('Daily wage cannot be negative'), true);
    });

    test('validateAttendance prevents invalid hours and negative hours', () {
      final errors = LabourValidationService.validateAttendance(
        checkIn: null,
        checkOut: null,
        hoursWorked: 25.0,
        overtimeHours: -2.0,
      );

      expect(errors.contains('Hours worked must be between 0 and 24'), true);
      expect(errors.contains('Overtime hours must be between 0 and 24'), true);
    });

    test('validateWageRecord prevents incorrect net pay math', () {
      final errors = LabourValidationService.validateWageRecord(
        baseWage: 500.0,
        overtimePay: 100.0,
        bonuses: 50.0,
        deductions: 20.0,
        netPay: 900.0, // Should be 630
      );

      expect(errors.contains('Net pay calculation is mathematically incorrect'), true);
    });
  });
}
