import 'package:intl/intl.dart';

extension DateTimeX on DateTime {
  String toShortDate() {
    return DateFormat('MMM dd, yyyy').format(this);
  }
}

extension DoubleX on double {
  String toCurrency() {
    return NumberFormat.currency(symbol: '₹', decimalDigits: 2).format(this);
  }
}
