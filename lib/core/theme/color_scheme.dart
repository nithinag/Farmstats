import 'package:flutter/material.dart';

class AppColorScheme {
  // Primary Forest & Agricultural Greens (Figma Reference)
  static const Color primary = Color(0xFF1B4332);
  static const Color forestGreen = Color(0xFF1B4332);
  static const Color primaryDark = Color(0xFF081C15);
  static const Color primaryLight = Color(0xFF2D6A4F);
  static const Color primaryAccent = Color(0xFF40916C);
  static const Color onPrimary = Color(0xFFFFFFFF);
  static const Color primaryContainer = Color(0xFFD8F3DC);
  static const Color onPrimaryContainer = Color(0xFF1B4332);

  static const Color secondary = Color(0xFF2D6A4F);
  static const Color onSecondary = Color(0xFFFFFFFF);
  static const Color secondaryContainer = Color(0xFFE8F5E9);
  static const Color onSecondaryContainer = Color(0xFF1B4332);

  static const Color tertiary = Color(0xFFE65100);
  static const Color onTertiary = Color(0xFFFFFFFF);
  static const Color tertiaryContainer = Color(0xFFFFE0B2);
  static const Color onTertiaryContainer = Color(0xFFE65100);

  // Status Colors
  static const Color error = Color(0xFFD32F2F);
  static const Color onError = Color(0xFFFFFFFF);
  static const Color errorContainer = Color(0xFFFFEBEE);
  static const Color onErrorContainer = Color(0xFFC62828);

  static const Color success = Color(0xFF2E7D32);
  static const Color successContainer = Color(0xFFE8F5E9);
  static const Color onSuccessContainer = Color(0xFF1B4332);

  static const Color info = Color(0xFF0277BD);
  static const Color infoContainer = Color(0xFFE1F5FE);
  static const Color onInfoContainer = Color(0xFF01579B);

  static const Color warning = Color(0xFFF57F17);
  static const Color warningContainer = Color(0xFFFFF9C4);
  static const Color onWarningContainer = Color(0xFFF57F17);
  
  // Surfaces & Backgrounds
  static const Color backgroundLight = Color(0xFFF7F9F8);
  static const Color surfaceLight = Color(0xFFFFFFFF);
  static const Color surfaceContainerLight = Color(0xFFF0F4F1);
  static const Color cardBorderLight = Color(0xFFE5E9E6);

  static const Color backgroundDark = Color(0xFF111411);
  static const Color surfaceDark = Color(0xFF191D19);
  static const Color surfaceContainerDark = Color(0xFF222722);
  static const Color cardBorderDark = Color(0xFF2E352D);

  static const Color outline = Color(0xFF737971);
  static const Color outlineVariant = Color(0xFFDDE2DC);

  // Category & Activity Pastels (Matching Reference Image)
  static const Color pastelRed = Color(0xFFFFF1F0);
  static const Color pastelRedIcon = Color(0xFFE53935);
  static const Color pastelBlue = Color(0xFFF0F7FF);
  static const Color pastelBlueIcon = Color(0xFF1E88E5);
  static const Color pastelGreen = Color(0xFFF0FDF4);
  static const Color pastelGreenIcon = Color(0xFF2E7D32);
  static const Color pastelAmber = Color(0xFFFEF9C3);
  static const Color pastelAmberIcon = Color(0xFFF59E0B);
  static const Color pastelOrange = Color(0xFFFFF7ED);
  static const Color pastelOrangeIcon = Color(0xFFEA580C);
  static const Color pastelPurple = Color(0xFFFAF5FF);
  static const Color pastelPurpleIcon = Color(0xFF9333EA);

  // Gradient definitions
  static const LinearGradient heroCardGradient = LinearGradient(
    colors: [Color(0xFF1B4332), Color(0xFF2D6A4F)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}

