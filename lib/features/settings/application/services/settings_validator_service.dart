import 'package:phone_numbers_parser/phone_numbers_parser.dart';

class SettingsValidatorService {
  static bool isValidEmail(String email) {
    if (email.isEmpty) return true; // Optional field
    final regex = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    return regex.hasMatch(email);
  }

  /// Validates a phone number based on the selected country numbering rules.
  /// If empty/null, returns null (valid since phone is optional).
  /// If invalid, returns a clear, concise error message.
  static String? validateCountryPhone(
    String? phone, {
    String countryCode = 'IN',
    String dialCode = '+91',
  }) {
    if (phone == null || phone.trim().isEmpty) {
      return null; // Phone number is optional
    }

    final trimmed = phone.trim();
    final cleanDigits = trimmed.replaceAll(RegExp(r'[\s\-\(\)]'), '');
    final iso = countryCode.trim().toUpperCase();

    // 1. India specific national mobile numbering rules
    if (iso == 'IN' || dialCode == '+91' || cleanDigits.startsWith('+91')) {
      String nationalDigits = cleanDigits;
      if (nationalDigits.startsWith('+91')) {
        nationalDigits = nationalDigits.substring(3);
      } else if (nationalDigits.startsWith('91') && nationalDigits.length == 12) {
        nationalDigits = nationalDigits.substring(2);
      } else if (nationalDigits.startsWith('0') && nationalDigits.length == 11) {
        nationalDigits = nationalDigits.substring(1);
      }

      if (nationalDigits.length != 10) {
        return 'Indian mobile number must be exactly 10 digits';
      }
      if (!RegExp(r'^[6-9]\d{9}$').hasMatch(nationalDigits)) {
        return 'Indian mobile number must start with 6, 7, 8, or 9';
      }
      return null;
    }

    // 2. International country validation via phone_numbers_parser
    try {
      final isoEnum = IsoCode.values.firstWhere(
        (e) => e.name.toUpperCase() == iso,
        orElse: () => IsoCode.IN,
      );
      String fullNumber = cleanDigits;
      if (!fullNumber.startsWith('+') && dialCode.isNotEmpty) {
        final prefix = dialCode.startsWith('+') ? dialCode : '+$dialCode';
        fullNumber = '$prefix$cleanDigits';
      }
      final parsed = PhoneNumber.parse(fullNumber, callerCountry: isoEnum);
      if (!parsed.isValid()) {
        return 'Please enter a valid phone number for $iso';
      }
      return null;
    } catch (_) {
      final digitsOnly = cleanDigits.replaceAll('+', '');
      if (digitsOnly.length < 7 || digitsOnly.length > 15 || !RegExp(r'^\d+$').hasMatch(digitsOnly)) {
        return 'Please enter a valid phone number for $iso';
      }
      return null;
    }
  }

  /// General boolean validator for backwards compatibility
  static bool isValidPhone(String phone) {
    if (phone.isEmpty) return true; // Optional field
    if (phone.startsWith('+')) {
      try {
        final parsed = PhoneNumber.parse(phone);
        if (parsed.isValid()) return true;
      } catch (_) {}
    }
    return validateCountryPhone(phone) == null || RegExp(r'^\+?[\d\s-]{10,14}$').hasMatch(phone);
  }

  static String? validateFarmName(String? name) {
    if (name == null || name.trim().isEmpty) {
      return 'Farm name cannot be empty';
    }
    return null;
  }

  static String? validateOwnerName(String? name) {
    if (name == null || name.trim().isEmpty) {
      return 'Farmer name cannot be empty';
    }
    return null;
  }
}
