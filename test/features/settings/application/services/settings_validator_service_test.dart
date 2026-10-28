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
      expect(SettingsValidatorService.isValidPhone('9876543210'), isTrue);
      expect(SettingsValidatorService.isValidPhone(''), isTrue); // Optional
    });

    test('isValidPhone returns false for invalid phones', () {
      expect(SettingsValidatorService.isValidPhone('123'), isFalse);
      expect(SettingsValidatorService.isValidPhone('abcde12345'), isFalse);
    });

    test('validateCountryPhone accepts empty phone numbers as optional', () {
      expect(SettingsValidatorService.validateCountryPhone(null), isNull);
      expect(SettingsValidatorService.validateCountryPhone(''), isNull);
      expect(SettingsValidatorService.validateCountryPhone('   '), isNull);
    });

    test('validateCountryPhone enforces Indian mobile numbering rules', () {
      // Valid Indian 10-digit mobile numbers starting with 6, 7, 8, 9
      expect(SettingsValidatorService.validateCountryPhone('9876543210', countryCode: 'IN', dialCode: '+91'), isNull);
      expect(SettingsValidatorService.validateCountryPhone('8123456789', countryCode: 'IN', dialCode: '+91'), isNull);
      expect(SettingsValidatorService.validateCountryPhone('7001234567', countryCode: 'IN', dialCode: '+91'), isNull);
      expect(SettingsValidatorService.validateCountryPhone('6998877665', countryCode: 'IN', dialCode: '+91'), isNull);
      expect(SettingsValidatorService.validateCountryPhone('+91 98765 43210', countryCode: 'IN', dialCode: '+91'), isNull);

      // Invalid length
      final tooShort = SettingsValidatorService.validateCountryPhone('987654321', countryCode: 'IN');
      expect(tooShort, contains('10 digits'));

      final tooLong = SettingsValidatorService.validateCountryPhone('98765432101', countryCode: 'IN');
      expect(tooLong, contains('10 digits'));

      // Invalid prefix (e.g. starts with 1-5)
      final invalidPrefix = SettingsValidatorService.validateCountryPhone('5876543210', countryCode: 'IN');
      expect(invalidPrefix, contains('start with 6, 7, 8, or 9'));
    });

    test('validateCountryPhone validates international phone numbers', () {
      // Valid US mobile number
      expect(SettingsValidatorService.validateCountryPhone('2025550125', countryCode: 'US', dialCode: '+1'), isNull);

      // Invalid US phone number
      final invalidUs = SettingsValidatorService.validateCountryPhone('12345', countryCode: 'US', dialCode: '+1');
      expect(invalidUs, isNotNull);

      // Valid UK mobile number
      expect(SettingsValidatorService.validateCountryPhone('7911123456', countryCode: 'GB', dialCode: '+44'), isNull);
    });

    test('validateFarmName and validateOwnerName require non-empty names', () {
      expect(SettingsValidatorService.validateFarmName('My Farm'), isNull);
      expect(SettingsValidatorService.validateFarmName(''), isNotNull);
      expect(SettingsValidatorService.validateFarmName('   '), isNotNull);
      expect(SettingsValidatorService.validateFarmName(null), isNotNull);

      expect(SettingsValidatorService.validateOwnerName('Farmer Name'), isNull);
      expect(SettingsValidatorService.validateOwnerName(''), isNotNull);
      expect(SettingsValidatorService.validateOwnerName(null), isNotNull);
    });
  });
}
