import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import '../../../../core/theme/color_scheme.dart';

class ProfilePhotoService {
  static final ImagePicker _picker = ImagePicker();

  /// Picks an image from [source] and copies it to durable app documents storage.
  /// Returns the persistent file path, or null if cancelled / failed.
  static Future<String?> pickAndSaveImage(ImageSource source) async {
    try {
      final picked = await _picker.pickImage(
        source: source,
        maxWidth: 1024,
        maxHeight: 1024,
        imageQuality: 88,
      );

      if (picked == null) {
        return null;
      }

      final appDir = await getApplicationDocumentsDirectory();
      final photosDir = Directory(p.join(appDir.path, 'profile_photos'));
      if (!photosDir.existsSync()) {
        photosDir.createSync(recursive: true);
      }

      final ext = p.extension(picked.path).isNotEmpty ? p.extension(picked.path) : '.jpg';
      final persistentFileName = 'farmer_profile_${DateTime.now().millisecondsSinceEpoch}$ext';
      final targetPath = p.join(photosDir.path, persistentFileName);

      final savedFile = await File(picked.path).copy(targetPath);
      return savedFile.path;
    } catch (e) {
      debugPrint('Error picking or saving profile image: $e');
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
                  'Update your profile photo across FARMSTATS',
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
                    'Select a photo from your device',
                    style: TextStyle(fontSize: 12, color: Color(0xFF64748B)),
                  ),
                  onTap: () async {
                    Navigator.pop(sheetContext);
                    final path = await pickAndSaveImage(ImageSource.gallery);
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
                    'Capture a new photo with camera',
                    style: TextStyle(fontSize: 12, color: Color(0xFF64748B)),
                  ),
                  onTap: () async {
                    Navigator.pop(sheetContext);
                    final path = await pickAndSaveImage(ImageSource.camera);
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
                      'Restore default fallback avatar',
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
