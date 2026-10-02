import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../utils/logger.dart';

class ErrorHandler {
  static void init() {
    FlutterError.onError = (details) {
      FlutterError.presentError(details);
      AppLogger.e('Flutter Error', error: details.exception, stackTrace: details.stack);
    };

    PlatformDispatcher.instance.onError = (error, stack) {
      AppLogger.e('Platform Error', error: error, stackTrace: stack);
      return true;
    };

    ErrorWidget.builder = (FlutterErrorDetails details) {
      return Material(
        child: Container(
          color: Colors.white,
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.error_outline, color: Colors.red, size: 64),
              const SizedBox(height: 16),
              const Text('A critical rendering error occurred.', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              Text(details.exceptionAsString(), textAlign: TextAlign.center, style: const TextStyle(color: Colors.grey)),
            ],
          ),
        ),
      );
    };
  }
}
