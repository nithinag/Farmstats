import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTypography {
  static TextTheme get textTheme {
    return GoogleFonts.interTextTheme(
      const TextTheme(
        displayLarge: TextStyle(fontSize: 57, fontWeight: FontWeight.w400, letterSpacing: -0.25, height: 1.12),
        displayMedium: TextStyle(fontSize: 45, fontWeight: FontWeight.w400, letterSpacing: 0.0, height: 1.15),
        headlineLarge: TextStyle(fontSize: 32, fontWeight: FontWeight.w600, letterSpacing: 0.0, height: 1.25),
        headlineMedium: TextStyle(fontSize: 28, fontWeight: FontWeight.w600, letterSpacing: 0.0, height: 1.28),
        titleLarge: TextStyle(fontSize: 22, fontWeight: FontWeight.w500, letterSpacing: 0.0, height: 1.27),
        titleMedium: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, letterSpacing: 0.15, height: 1.5),
        bodyLarge: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, letterSpacing: 0.5, height: 1.5),
        bodyMedium: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, letterSpacing: 0.25, height: 1.42),
        labelLarge: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, letterSpacing: 0.1, height: 1.42),
        labelMedium: TextStyle(fontSize: 12, fontWeight: FontWeight.w500, letterSpacing: 0.5, height: 1.33),
        bodySmall: TextStyle(fontSize: 11, fontWeight: FontWeight.w400, letterSpacing: 0.4, height: 1.45),
      ),
    );
  }
}
