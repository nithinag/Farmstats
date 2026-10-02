import 'package:flutter_test/flutter_test.dart';
import 'package:farmstats/features/settings/application/services/settings_validator_service.dart';

void main() {
  group('SettingsValidatorService', () {
    test('isValidEmail returns true for valid emails', () {
      expect(SettingsValidatorService.isValidEmail('test@example.com'), isTrue);
      expect(SettingsValidatorService.isValidEmail('user.name+tag@domain.co.uk'), isTrue);
      expect(SettingsValidatorService.isValidEmail(''), isTrue); // Optional
    });

    test('isValidEmail returns false for invalid emails', () {
      expect(SettingsValidatorService.isValidEmail('test@'), isFalse);
      expect(SettingsValidatorService.isValidEmail('test@domain'), isFalse);
      expect(SettingsValidatorService.isValidEmail('test.com'), isFalse);
    });

    test('isValidPhone returns true for valid phones', () {
      expect(SettingsValidatorService.isValidPhone('+1234567890'), isTrue);
      expect(SettingsValidatorService.isValidPhone('1234567890'), isTrue);
      expect(SettingsValidatorService.isValidPhone(''), isTrue); // Optional
    });

    test('isValidPhone returns false for invalid phones', () {
      expect(SettingsValidatorService.isValidPhone('123'), isFalse);
      expect(SettingsValidatorService.isValidPhone('abcde12345'), isFalse);
    });

    test('validateFarmName requires non-empty name', () {
      expect(SettingsValidatorService.validateFarmName('My Farm'), isNull);
      expect(SettingsValidatorService.validateFarmName(''), isNotNull);
      expect(SettingsValidatorService.validateFarmName('   '), isNotNull);
      expect(SettingsValidatorService.validateFarmName(null), isNotNull);
    });
  });
}
