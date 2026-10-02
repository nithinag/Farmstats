class IncomeValidationService {
  /// Validates an Income creation attempt.
  /// Returns a list of error messages, or an empty list if valid.
  static List<String> validate({
    required double quantity,
    required double rate,
    required String buyerId,
  }) {
    final errors = <String>[];
    if (quantity <= 0) errors.add('Quantity must be greater than 0');
    if (rate <= 0) errors.add('Rate must be greater than 0');
    if (buyerId.isEmpty) errors.add('Buyer is mandatory');
    return errors;
  }

  /// Calculates the Net Amount from gross and deductions.
  static double calculateNetAmount({
    required double quantity,
    required double rate,
    required double transportCharges,
    required double commission,
  }) {
    final gross = quantity * rate;
    return gross - (transportCharges + commission);
  }
}
