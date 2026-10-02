class SettingsValidatorService {
  static bool isValidEmail(String email) {
    if (email.isEmpty) return true; // Optional field
    final regex = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    return regex.hasMatch(email);
  }

  static bool isValidPhone(String phone) {
    if (phone.isEmpty) return true; // Optional field
    final regex = RegExp(r'^\+?[\d\s-]{10,14}$');
    return regex.hasMatch(phone);
  }

  static String? validateFarmName(String? name) {
    if (name == null || name.trim().isEmpty) {
      return 'Farm name cannot be empty';
    }
    return null;
  }
}
