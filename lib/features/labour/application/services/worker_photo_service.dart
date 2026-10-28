import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../presentation/theme/labour_theme.dart';
import '../../../settings/presentation/screens/image_crop_screen.dart';

class WorkerPhotoService {
  static final ImagePicker _picker = ImagePicker();

  static String _key(String workerId) => 'worker_photo_$workerId';

  /// Get the stored local photo path for a worker
  static Future<String?> getPhotoPath(String workerId) async {
    final prefs = await SharedPreferences.getInstance();
    final path = prefs.getString(_key(workerId));
    if (path != null && path.isNotEmpty) {
      if (await File(path).exists()) {
        return path;
      }
    }
    return null;
  }

  /// Store the local photo path for a worker
  static Future<void> setPhotoPath(String workerId, String path) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_key(workerId), path);
  }

  /// Delete photo file and clear preference
  static Future<void> deletePhoto(String workerId) async {
    final prefs = await SharedPreferences.getInstance();
    final path = prefs.getString(_key(workerId));
    if (path != null && path.isNotEmpty) {
      try {
        final file = File(path);
        if (await file.exists()) {
          await file.delete();
        }
      } catch (e) {
        debugPrint('Error deleting worker photo: $e');
      }
    }
    await prefs.remove(_key(workerId));
  }

  /// Pick an image and crop it into circular/square avatar
  static Future<String?> pickAndCropPhoto(BuildContext context, ImageSource source) async {
    try {
      final picked = await _picker.pickImage(
        source: source,
        maxWidth: 2048,
        maxHeight: 2048,
        imageQuality: 92,
      );

      if (picked == null) return null;
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
      debugPrint('Error picking worker photo: $e');
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Could not access image: $e'),
            backgroundColor: LabourColors.error,
          ),
        );
      }
      return null;
    }
  }

  /// Shows the photo selection bottom sheet
  static Future<void> showPhotoOptionsModal({
    required BuildContext context,
    required bool hasCustomPhoto,
    required ValueChanged<String?> onPhotoSelected,
  }) async {
    await showModalBottomSheet<void>(
      context: context,
      backgroundColor: LabourColors.cardSurface,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (sheetContext) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    width: 36,
                    height: 4,
                    decoration: BoxDecoration(
                      color: LabourColors.border,
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Worker Photo',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: LabourColors.primaryText,
                  ),
                ),
                const SizedBox(height: 14),
                ListTile(
                  leading: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: LabourColors.softGreenSurface,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Icon(Icons.camera_alt_rounded, color: LabourColors.forestGreen),
                  ),
                  title: const Text('Take Photo', style: TextStyle(fontWeight: FontWeight.w600, color: LabourColors.primaryText)),
                  onTap: () async {
                    Navigator.pop(sheetContext);
                    final path = await pickAndCropPhoto(context, ImageSource.camera);
                    if (path != null) onPhotoSelected(path);
                  },
                ),
                ListTile(
                  leading: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: LabourColors.softGreenSurface,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Icon(Icons.photo_library_rounded, color: LabourColors.forestGreen),
                  ),
                  title: const Text('Choose from Gallery', style: TextStyle(fontWeight: FontWeight.w600, color: LabourColors.primaryText)),
                  onTap: () async {
                    Navigator.pop(sheetContext);
                    final path = await pickAndCropPhoto(context, ImageSource.gallery);
                    if (path != null) onPhotoSelected(path);
                  },
                ),
                if (hasCustomPhoto)
                  ListTile(
                    leading: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: LabourColors.softRedSurface,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Icon(Icons.delete_outline_rounded, color: LabourColors.error),
                    ),
                    title: const Text('Remove Photo', style: TextStyle(fontWeight: FontWeight.w600, color: LabourColors.error)),
                    onTap: () {
                      Navigator.pop(sheetContext);
                      onPhotoSelected(null);
                    },
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}
