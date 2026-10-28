import 'dart:io';
import 'package:flutter/material.dart';
import '../../core/theme/color_scheme.dart';

class FarmerAvatar extends StatelessWidget {
  final String? photoPath;
  final String name;
  final double size;
  final bool showEditBadge;
  final IconData badgeIcon;
  final Color badgeColor;
  final VoidCallback? onTap;
  final VoidCallback? onBadgeTap;
  final Color? borderColor;
  final double borderWidth;

  const FarmerAvatar({
    super.key,
    this.photoPath,
    this.name = 'Farmer',
    this.size = 44.0,
    this.showEditBadge = false,
    this.badgeIcon = Icons.camera_alt_rounded,
    this.badgeColor = AppColorScheme.forestGreen,
    this.onTap,
    this.onBadgeTap,
    this.borderColor,
    this.borderWidth = 1.5,
  });

  String _getInitials(String input) {
    final parts = input.trim().split(RegExp(r'\s+'));
    if (parts.isEmpty || parts[0].isEmpty) return 'F';
    if (parts.length == 1) return parts[0][0].toUpperCase();
    return '${parts[0][0]}${parts[1][0]}'.toUpperCase();
  }

  Widget _buildFallbackAvatar(BuildContext context) {
    final initials = _getInitials(name);
    return Container(
      width: size,
      height: size,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: AppColorScheme.forestGreen,
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF2E7D32),
            Color(0xFF1B5E20),
          ],
        ),
      ),
      child: Center(
        child: Text(
          initials,
          style: TextStyle(
            color: Colors.white,
            fontSize: size * 0.38,
            fontWeight: FontWeight.w700,
            letterSpacing: 0.5,
          ),
        ),
      ),
    );
  }

  Widget _buildImageContent(BuildContext context) {
    final path = photoPath?.trim() ?? '';
    if (path.isEmpty) {
      return _buildFallbackAvatar(context);
    }

    if (path.startsWith('assets/')) {
      return Image.asset(
        path,
        width: size,
        height: size,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) => _buildFallbackAvatar(context),
      );
    }

    final file = File(path);
    if (!file.existsSync()) {
      return _buildFallbackAvatar(context);
    }

    return Image.file(
      file,
      width: size,
      height: size,
      fit: BoxFit.cover,
      errorBuilder: (context, error, stackTrace) => _buildFallbackAvatar(context),
    );
  }

  @override
  Widget build(BuildContext context) {
    final effectiveBorderColor = borderColor ?? AppColorScheme.primary.withValues(alpha: 0.25);
    final badgeDiameter = (size * 0.32).clamp(20.0, 32.0);
    final badgeIconSize = badgeDiameter * 0.55;

    Widget avatarCore = Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: effectiveBorderColor, width: borderWidth),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.08),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(size / 2),
        child: _buildImageContent(context),
      ),
    );

    if (onTap != null && !showEditBadge) {
      avatarCore = InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(size / 2),
        child: avatarCore,
      );
    }

    if (!showEditBadge) {
      return avatarCore;
    }

    return GestureDetector(
      onTap: onTap,
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.bottomRight,
        children: [
          avatarCore,
          Positioned(
            right: 0,
            bottom: 0,
            child: GestureDetector(
              onTap: onBadgeTap ?? onTap,
              child: Container(
                width: badgeDiameter,
                height: badgeDiameter,
                decoration: BoxDecoration(
                  color: badgeColor,
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 2),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.2),
                      blurRadius: 4,
                      offset: const Offset(0, 1),
                    ),
                  ],
                ),
                child: Center(
                  child: Icon(
                    badgeIcon,
                    size: badgeIconSize,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
