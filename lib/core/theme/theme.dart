import 'package:flutter/material.dart';
import 'color_scheme.dart';
import 'typography.dart';
import 'radius.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      colorScheme: const ColorScheme(
        brightness: Brightness.light,
        primary: AppColorScheme.primaryLight,
        onPrimary: AppColorScheme.onPrimary,
        primaryContainer: AppColorScheme.primaryContainer,
        onPrimaryContainer: AppColorScheme.onPrimaryContainer,
        secondary: AppColorScheme.secondary,
        onSecondary: AppColorScheme.onSecondary,
        secondaryContainer: AppColorScheme.secondaryContainer,
        onSecondaryContainer: AppColorScheme.onSecondaryContainer,
        tertiary: AppColorScheme.tertiary,
        onTertiary: AppColorScheme.onTertiary,
        tertiaryContainer: AppColorScheme.tertiaryContainer,
        onTertiaryContainer: AppColorScheme.onTertiaryContainer,
        error: AppColorScheme.error,
        onError: AppColorScheme.onError,
        surface: AppColorScheme.surfaceLight,
        onSurface: Color(0xFF1E241E),
        surfaceContainer: AppColorScheme.surfaceContainerLight,
        outline: AppColorScheme.outline,
        outlineVariant: AppColorScheme.cardBorderLight,
      ),
      scaffoldBackgroundColor: AppColorScheme.backgroundLight,
      textTheme: AppTypography.textTheme,
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColorScheme.backgroundLight,
        foregroundColor: Color(0xFF1E241E),
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: true,
      ),
      cardTheme: CardThemeData(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppRadius.md),
          side: const BorderSide(color: AppColorScheme.cardBorderLight, width: 1),
        ),
        elevation: 0,
        color: AppColorScheme.surfaceLight,
        margin: EdgeInsets.zero,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColorScheme.primaryLight,
          foregroundColor: Colors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppRadius.sm)),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColorScheme.surfaceContainerLight,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppRadius.sm),
          borderSide: const BorderSide(color: AppColorScheme.cardBorderLight, width: 1),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppRadius.sm),
          borderSide: const BorderSide(color: AppColorScheme.cardBorderLight, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppRadius.sm),
          borderSide: const BorderSide(color: AppColorScheme.primaryLight, width: 1.5),
        ),
      ),
      chipTheme: ChipThemeData(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppRadius.pill)),
        side: const BorderSide(color: AppColorScheme.cardBorderLight, width: 1),
      ),
      dividerTheme: const DividerThemeData(
        color: AppColorScheme.cardBorderLight,
        thickness: 1,
        space: 1,
      ),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      colorScheme: const ColorScheme(
        brightness: Brightness.dark,
        primary: AppColorScheme.primaryContainer,
        onPrimary: AppColorScheme.onPrimaryContainer,
        primaryContainer: AppColorScheme.primary,
        onPrimaryContainer: AppColorScheme.onPrimary,
        secondary: AppColorScheme.secondaryContainer,
        onSecondary: AppColorScheme.onSecondaryContainer,
        secondaryContainer: AppColorScheme.secondary,
        onSecondaryContainer: AppColorScheme.onSecondary,
        tertiary: AppColorScheme.tertiaryContainer,
        onTertiary: AppColorScheme.onTertiaryContainer,
        tertiaryContainer: AppColorScheme.tertiary,
        onTertiaryContainer: AppColorScheme.onTertiary,
        error: AppColorScheme.error,
        onError: AppColorScheme.onError,
        surface: AppColorScheme.surfaceDark,
        onSurface: Color(0xFFF1F5EE),
        surfaceContainer: AppColorScheme.surfaceContainerDark,
        outline: AppColorScheme.outline,
        outlineVariant: AppColorScheme.cardBorderDark,
      ),
      scaffoldBackgroundColor: AppColorScheme.backgroundDark,
      textTheme: AppTypography.textTheme.apply(
        bodyColor: const Color(0xFFF1F5EE),
        displayColor: const Color(0xFFF1F5EE),
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColorScheme.backgroundDark,
        foregroundColor: Color(0xFFF1F5EE),
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: true,
      ),
      cardTheme: CardThemeData(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppRadius.md),
          side: const BorderSide(color: AppColorScheme.cardBorderDark, width: 1),
        ),
        elevation: 0,
        color: AppColorScheme.surfaceDark,
        margin: EdgeInsets.zero,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColorScheme.primaryContainer,
          foregroundColor: AppColorScheme.onPrimaryContainer,
          elevation: 0,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppRadius.sm)),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColorScheme.surfaceContainerDark,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppRadius.sm),
          borderSide: const BorderSide(color: AppColorScheme.cardBorderDark, width: 1),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppRadius.sm),
          borderSide: const BorderSide(color: AppColorScheme.cardBorderDark, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppRadius.sm),
          borderSide: const BorderSide(color: AppColorScheme.primaryContainer, width: 1.5),
        ),
      ),
      chipTheme: ChipThemeData(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppRadius.pill)),
        side: const BorderSide(color: AppColorScheme.cardBorderDark, width: 1),
      ),
      dividerTheme: const DividerThemeData(
        color: AppColorScheme.cardBorderDark,
        thickness: 1,
        space: 1,
      ),
    );
  }
}

