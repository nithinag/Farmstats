import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'router.dart';
import '../core/theme/theme.dart';
import '../core/constants/app_constants.dart';
import '../features/settings/application/providers/settings_notifier.dart';
import '../features/settings/application/providers/settings_state.dart';
import '../features/settings/domain/entities/settings_entities.dart';

class FarmOSApp extends ConsumerWidget {
  const FarmOSApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settingsState = ref.watch(settingsNotifierProvider);
    final themeModePref = settingsState.maybeWhen(
      data: (profile, preferences) => preferences.themeMode,
      orElse: () => ThemeModePreference.light,
    );

    final themeMode = switch (themeModePref) {
      ThemeModePreference.light => ThemeMode.light,
      ThemeModePreference.dark => ThemeMode.dark,
      ThemeModePreference.system => ThemeMode.light, // Default to light mode (white background)
    };

    return MaterialApp.router(
      title: AppConstants.appName,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: themeMode,
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
    );
  }
}
