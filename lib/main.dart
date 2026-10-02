import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'app/app.dart';
import 'core/errors/error_handler.dart';
import 'features/settings/application/providers/settings_notifier.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  ErrorHandler.init();

  final sharedPreferences = await SharedPreferences.getInstance();

  runApp(
    ProviderScope(
      overrides: [
        sharedPreferencesProvider.overrideWithValue(sharedPreferences),
      ],
      child: const FarmOSApp(),
    ),
  );
}
