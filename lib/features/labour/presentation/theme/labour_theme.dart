import 'package:flutter/material.dart';

class LabourColors {
  // Primary forest green
  static const Color forestGreen = Color(0xFF2E7D32);
  
  // Secondary earth brown — decorative accents only; never for primary buttons or selected chips
  static const Color earthBrown = Color(0xFF8B5E3C);
  
  // Tertiary sage
  static const Color sage = Color(0xFF6B8F71);
  
  // Surfaces & Backgrounds
  static const Color background = Color(0xFFFAF6EF);
  static const Color cardSurface = Color(0xFFFFFFFF);
  static const Color secondarySurface = Color(0xFFF4E9DB);
  static const Color softGreenSurface = Color(0xFFEAF1E8);
  static const Color softAmberSurface = Color(0xFFFEF3C7);
  static const Color softRedSurface = Color(0xFFFEE2E2);
  
  // Borders & Dividers
  static const Color border = Color(0xFFE6E0D7);
  static const Color borderLight = Color(0xFFF0EBE1);
  
  // Typography
  static const Color primaryText = Color(0xFF26332C);
  static const Color secondaryText = Color(0xFF756F67);
  static const Color mutedText = Color(0xFF9E978E);
  
  // Status Semantics
  static const Color success = Color(0xFF2E7D32);
  static const Color warning = Color(0xFFF59E0B);
  static const Color error = Color(0xFFDC3545);
  static const Color info = Color(0xFF3B82F6);
}

class LabourWorkType {
  final String id;
  final String title;
  final IconData icon;
  final Color iconColor;
  final Color bgColor;

  const LabourWorkType({
    required this.id,
    required this.title,
    required this.icon,
    this.iconColor = LabourColors.forestGreen,
    this.bgColor = LabourColors.softGreenSurface,
  });

  static const List<LabourWorkType> sericultureTypes = [
    LabourWorkType(
      id: 'feeding_cleaning',
      title: 'Silkworm Feeding & Cleaning',
      icon: Icons.eco_rounded,
      iconColor: Color(0xFF2E7D32),
      bgColor: Color(0xFFEAF1E8),
    ),
    LabourWorkType(
      id: 'bed_cleaning',
      title: 'Bed Cleaning',
      icon: Icons.cleaning_services_rounded,
      iconColor: Color(0xFF2E7D32),
      bgColor: Color(0xFFEAF1E8),
    ),
    LabourWorkType(
      id: 'mulberry_field',
      title: 'Mulberry Field Work',
      icon: Icons.park_rounded,
      iconColor: Color(0xFF8B5E3C),
      bgColor: Color(0xFFF4E9DB),
    ),
    LabourWorkType(
      id: 'house_cleaning',
      title: 'House Cleaning',
      icon: Icons.brush_rounded,
      iconColor: Color(0xFF8B5E3C),
      bgColor: Color(0xFFF4E9DB),
    ),
    LabourWorkType(
      id: 'tray_setup',
      title: 'Tray Setup',
      icon: Icons.layers_rounded,
      iconColor: Color(0xFFF59E0B),
      bgColor: Color(0xFFFEF3C7),
    ),
    LabourWorkType(
      id: 'disinfection',
      title: 'Disinfection Work',
      icon: Icons.sanitizer_rounded,
      iconColor: Color(0xFF6B8F71),
      bgColor: Color(0xFFEAF1E8),
    ),
  ];

  static LabourWorkType findForTask(String task) {
    final lower = task.toLowerCase();
    for (final t in sericultureTypes) {
      if (lower.contains(t.title.toLowerCase()) || 
          lower.contains(t.id) ||
          t.title.toLowerCase().contains(lower)) {
        return t;
      }
    }
    if (lower.contains('feed') || lower.contains('silk')) return sericultureTypes[0];
    if (lower.contains('bed') || lower.contains('clean')) return sericultureTypes[1];
    if (lower.contains('mulberry') || lower.contains('field') || lower.contains('leaf')) return sericultureTypes[2];
    if (lower.contains('house')) return sericultureTypes[3];
    if (lower.contains('tray') || lower.contains('mount')) return sericultureTypes[4];
    if (lower.contains('disinfect')) return sericultureTypes[5];
    return sericultureTypes[0];
  }
}
