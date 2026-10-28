import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:crop_your_image/crop_your_image.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import '../../../../core/theme/color_scheme.dart';

class ImageCropScreen extends StatefulWidget {
  final Uint8List imageBytes;

  const ImageCropScreen({
    super.key,
    required this.imageBytes,
  });

  @override
  State<ImageCropScreen> createState() => _ImageCropScreenState();
}

class _ImageCropScreenState extends State<ImageCropScreen> {
  final _cropController = CropController();
  bool _isProcessing = false;

  Future<void> _handleCroppedBytes(Uint8List croppedBytes) async {
    try {
      final appDir = await getApplicationDocumentsDirectory();
      final photosDir = Directory(p.join(appDir.path, 'profile_photos'));
      if (!photosDir.existsSync()) {
        photosDir.createSync(recursive: true);
      }

      final fileName = 'farmer_profile_${DateTime.now().millisecondsSinceEpoch}.jpg';
      final persistentFile = File(p.join(photosDir.path, fileName));
      await persistentFile.writeAsBytes(croppedBytes);

      if (mounted) {
        Navigator.pop(context, persistentFile.path);
      }
    } catch (e) {
      debugPrint('Error saving cropped profile photo: $e');
      if (mounted) {
        setState(() => _isProcessing = false);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to save cropped image: $e'),
            backgroundColor: AppColorScheme.error,
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.close, color: Colors.white),
          onPressed: _isProcessing ? null : () => Navigator.pop(context, null),
        ),
        title: const Text(
          'Crop Profile Photo',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        actions: [
          TextButton(
            onPressed: _isProcessing
                ? null
                : () {
                    setState(() => _isProcessing = true);
                    _cropController.crop();
                  },
            child: const Text(
              'Apply',
              style: TextStyle(
                color: AppColorScheme.forestGreen,
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          Crop(
            image: widget.imageBytes,
            controller: _cropController,
            onCropped: (result) {
              if (result is CropSuccess) {
                _handleCroppedBytes(result.croppedImage);
              } else if (result is CropFailure) {
                setState(() => _isProcessing = false);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Crop failed: ${result.cause}'),
                    backgroundColor: AppColorScheme.error,
                  ),
                );
              }
            },
            aspectRatio: 1.0,
            withCircleUi: true,
            baseColor: Colors.black,
            maskColor: Colors.black.withValues(alpha: 0.75),
            interactive: true,
            fixCropRect: true,
            radius: 0,
          ),
          Positioned(
            left: 20,
            right: 20,
            bottom: 30,
            child: SafeArea(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                decoration: BoxDecoration(
                  color: Colors.black.withValues(alpha: 0.65),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.white24, width: 0.8),
                ),
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.pinch, color: Colors.white70, size: 18),
                    SizedBox(width: 8),
                    Flexible(
                      child: Text(
                        'Pinch to zoom, pan to adjust circular avatar',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white, fontSize: 13, fontWeight: FontWeight.w500),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          if (_isProcessing)
            Container(
              color: Colors.black54,
              child: const Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CircularProgressIndicator(color: AppColorScheme.forestGreen),
                    SizedBox(height: 16),
                    Text(
                      'Saving cropped avatar...',
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}
