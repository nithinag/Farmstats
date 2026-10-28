import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../../presentation/screens/image_crop_screen.dart';
import '../../../../core/theme/color_scheme.dart';

class ProfilePhotoService {
  static final ImagePicker _picker = ImagePicker();

  /// Picks an image from [source], opens the interactive [ImageCropScreen],
  /// and saves the cropped square avatar with circular preview into persistent storage.
  /// Returns the persistent file path, or null if cancelled / failed.
  static Future<String?> pickAndCropImage(BuildContext context, ImageSource source) async {
    try {
      final picked = await _picker.pickImage(
        source: source,
        maxWidth: 2048,
        maxHeight: 2048,
        imageQuality: 95,
      );

      if (picked == null) {
        return null;
      }

      final bytes = await picked.readAsBytes();
      if (!context.mounted) return null;

      final croppedPath = await Navigator.push<String?>(
        context,
        MaterialPageRoute(
          builder: (ctx) => ImageCropScreen(imageBytes: bytes),
        ),
      );

      return croppedPath;
    } catch (e) {
      debugPrint('Error picking or cropping profile image: $e');
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Could not access image: $e'),
            backgroundColor: AppColorScheme.error,
          ),
        );
      }
      return null;
    }
  }

  /// Deletes an existing profile photo file from disk if it exists.
  static Future<void> deletePhotoFile(String? filePath) async {
    if (filePath == null || filePath.trim().isEmpty) return;
    try {
      final file = File(filePath);
      if (await file.exists()) {
        await file.delete();
      }
    } catch (e) {
      debugPrint('Error deleting old profile photo: $e');
    }
  }

  /// Shows a clean bottom sheet allowing the farmer to choose a photo, take a photo, or remove current photo.
  static Future<void> showPhotoOptionsModal({
    required BuildContext context,
    required bool hasCustomPhoto,
    required ValueChanged<String?> onPhotoSelected,
  }) async {
    await showModalBottomSheet<void>(
      context: context,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (sheetContext) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    width: 40,
                    height: 4,
                    decoration: BoxDecoration(
                      color: const Color(0xFFE2E8F0),
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Profile Photo',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF1E293B),
                  ),
                ),
                const SizedBox(height: 6),
                const Text(
                  'Crop and update your circular avatar across FARMSTATS',
                  style: TextStyle(
                    fontSize: 13,
                    color: Color(0xFF64748B),
                  ),
                ),
                const SizedBox(height: 16),
                ListTile(
                  leading: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: AppColorScheme.primary.withValues(alpha: 0.1),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.photo_library_outlined, color: AppColorScheme.primary),
                  ),
                  title: const Text(
                    'Choose from Gallery',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF1E293B),
                    ),
                  ),
                  subtitle: const Text(
                    'Select and crop photo with zoom & repositioning',
                    style: TextStyle(fontSize: 12, color: Color(0xFF64748B)),
                  ),
                  onTap: () async {
                    Navigator.pop(sheetContext);
                    final path = await pickAndCropImage(context, ImageSource.gallery);
                    if (path != null) {
                      onPhotoSelected(path);
                    }
                  },
                ),
                ListTile(
                  leading: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: AppColorScheme.primary.withValues(alpha: 0.1),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.photo_camera_outlined, color: AppColorScheme.primary),
                  ),
                  title: const Text(
                    'Take Photo',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF1E293B),
                    ),
                  ),
                  subtitle: const Text(
                    'Capture a new photo and adjust avatar crop',
                    style: TextStyle(fontSize: 12, color: Color(0xFF64748B)),
                  ),
                  onTap: () async {
                    Navigator.pop(sheetContext);
                    final path = await pickAndCropImage(context, ImageSource.camera);
                    if (path != null) {
                      onPhotoSelected(path);
                    }
                  },
                ),
                if (hasCustomPhoto) ...[
                  const Divider(height: 1, color: Color(0xFFE2E8F0)),
                  ListTile(
                    leading: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: AppColorScheme.error.withValues(alpha: 0.1),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.delete_outline, color: AppColorScheme.error),
                    ),
                    title: const Text(
                      'Remove Photo',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: AppColorScheme.error,
                      ),
                    ),
                    subtitle: const Text(
                      'Restore default initials avatar',
                      style: TextStyle(fontSize: 12, color: Color(0xFF64748B)),
                    ),
                    onTap: () {
                      Navigator.pop(sheetContext);
                      onPhotoSelected('');
                    },
                  ),
                ],
                const SizedBox(height: 8),
              ],
            ),
          ),
        );
      },
    );
  }
}
