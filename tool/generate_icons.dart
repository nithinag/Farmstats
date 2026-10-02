// ignore_for_file: avoid_print
import 'dart:io';
import 'package:image/image.dart';

void main() async {
  final Map<String, String> icons = {
    'icon_alt1': 'C:/Users/nithi/.gemini/antigravity-ide/brain/c80bbb98-9c41-481b-b4e2-bcd2d2dc06c1/media__1785566825875.png',
    'icon_dark': 'C:/Users/nithi/.gemini/antigravity-ide/brain/c80bbb98-9c41-481b-b4e2-bcd2d2dc06c1/media__1785566825970.jpg',
  };

  final Map<String, int> androidMipmaps = {
    'mipmap-mdpi': 48,
    'mipmap-hdpi': 72,
    'mipmap-xhdpi': 96,
    'mipmap-xxhdpi': 144,
    'mipmap-xxxhdpi': 192,
  };

  final Map<String, int> iosSizes = {
    '@2x': 120,
    '@3x': 180,
  };

  for (final entry in icons.entries) {
    final iconName = entry.key;
    final sourcePath = entry.value;

    print('Processing $iconName...');
    final file = File(sourcePath);
    if (!await file.exists()) {
      print('Error: Source file $sourcePath does not exist.');
      continue;
    }

    final image = decodeImage(await file.readAsBytes());
    if (image == null) {
      print('Error: Could not decode image $sourcePath');
      continue;
    }

    // Android
    for (final sizeEntry in androidMipmaps.entries) {
      final dirName = sizeEntry.key;
      final size = sizeEntry.value;

      final resized = copyResize(image, width: size, height: size, interpolation: Interpolation.linear);
      final outDir = Directory('android/app/src/main/res/$dirName');
      if (!await outDir.exists()) {
        await outDir.create(recursive: true);
      }
      final outFile = File('${outDir.path}/$iconName.png');
      await outFile.writeAsBytes(encodePng(resized));
      print('  Saved Android: ${outFile.path}');
    }

    // iOS
    for (final sizeEntry in iosSizes.entries) {
      final suffix = sizeEntry.key;
      final size = sizeEntry.value;

      final resized = copyResize(image, width: size, height: size, interpolation: Interpolation.linear);
      final outDir = Directory('ios/Runner/Assets.xcassets/$iconName.appiconset');
      if (!await outDir.exists()) {
        await outDir.create(recursive: true);
      }
      final outFile = File('${outDir.path}/Icon-App-60x60$suffix.png');
      await outFile.writeAsBytes(encodePng(resized));
      print('  Saved iOS: ${outFile.path}');
      
      // Also save generic for Contents.json
      if (suffix == '@2x') {
         final outFile120 = File('${outDir.path}/Icon-App-60x60@2x.png');
         if (!await outFile120.exists()) await outFile120.writeAsBytes(encodePng(resized));
      }
    }
    
    // Create iOS Contents.json
    final contentsJson = '''{
  "images" : [
    {
      "size" : "60x60",
      "idiom" : "iphone",
      "filename" : "Icon-App-60x60@2x.png",
      "scale" : "2x"
    },
    {
      "size" : "60x60",
      "idiom" : "iphone",
      "filename" : "Icon-App-60x60@3x.png",
      "scale" : "3x"
    }
  ],
  "info" : {
    "version" : 1,
    "author" : "xcode"
  }
}''';
    final contentsFile = File('ios/Runner/Assets.xcassets/$iconName.appiconset/Contents.json');
    await contentsFile.writeAsString(contentsJson);
    print('  Created iOS Contents.json for $iconName');
  }

  // Handle the default icon generation using flutter_launcher_icons config
  final defaultConfig = '''flutter_launcher_icons:
  android: true
  ios: true
  image_path: "C:/Users/nithi/.gemini/antigravity-ide/brain/c80bbb98-9c41-481b-b4e2-bcd2d2dc06c1/media__1785566825829.png"
''';
  await File('flutter_launcher_icons.yaml').writeAsString(defaultConfig);
  print('Created flutter_launcher_icons.yaml. Run `flutter pub run flutter_launcher_icons` to generate the default app icon.');
}
