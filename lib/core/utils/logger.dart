import 'package:flutter/foundation.dart';

class AppLogger {
  static void d(String message, {Object? error, StackTrace? stackTrace}) {
    if (kDebugMode) {
      print('💡 DEBUG: $message');
      if (error != null) print('Error: $error');
      if (stackTrace != null) print('StackTrace: $stackTrace');
    }
  }

  static void e(String message, {Object? error, StackTrace? stackTrace}) {
    if (kDebugMode) {
      print('🔴 ERROR: $message');
      if (error != null) print('Error: $error');
      if (stackTrace != null) print('StackTrace: $stackTrace');
    }
  }

  static void i(String message) {
    if (kDebugMode) {
      print('🟢 INFO: $message');
    }
  }
}
