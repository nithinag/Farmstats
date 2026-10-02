import 'dart:io';
import 'package:permission_handler/permission_handler.dart';
import 'package:path_provider/path_provider.dart';

enum ExportType { csv, json, pdf, backup }

class FileStorageService {
  static Future<bool> requestPermissions() async {
    if (Platform.isAndroid) {
      if (await Permission.manageExternalStorage.isGranted) return true;
      if (await Permission.storage.isGranted) return true;

      final manageStatus = await Permission.manageExternalStorage.request();
      if (manageStatus.isGranted) return true;

      final storageStatus = await Permission.storage.request();
      return storageStatus.isGranted;
    }
    return true; // Desktop doesn't strictly need this permission handler
  }

  static Future<String?> getFarmStatsDirectory() async {
    try {
      final hasPermission = await requestPermissions();
      if (!hasPermission) return null;

      Directory? baseDir;
      if (Platform.isAndroid) {
        baseDir = Directory('/storage/emulated/0/Documents');
        if (!await baseDir.exists()) {
          baseDir = await getExternalStorageDirectory();
        }
      } else {
        baseDir = await getApplicationDocumentsDirectory();
      }

      if (baseDir == null) return null;

      final farmStatsDir = Directory('${baseDir.path}/FARMSTATS');
      if (!await farmStatsDir.exists()) {
        await farmStatsDir.create(recursive: true);
      }

      return farmStatsDir.path;
    } catch (e) {
      return null;
    }
  }

  static Future<String?> getExportDirectory(ExportType type) async {
    final baseDir = await getFarmStatsDirectory();
    if (baseDir == null) return null;

    String subFolder = '';
    switch (type) {
      case ExportType.csv:
        subFolder = 'CSV';
        break;
      case ExportType.json:
      case ExportType.backup:
        subFolder = 'JSON';
        break;
      case ExportType.pdf:
        subFolder = 'PDF';
        break;
    }

    final targetDir = Directory('$baseDir/$subFolder');
    if (!await targetDir.exists()) {
      await targetDir.create(recursive: true);
    }
    return targetDir.path;
  }

  static Future<File?> saveFile(ExportType type, String fileName, String content, {bool isBytes = false, List<int>? bytes}) async {
    try {
      final dir = await getExportDirectory(type);
      if (dir == null) return null;

      final file = File('$dir/$fileName');
      if (isBytes && bytes != null) {
        await file.writeAsBytes(bytes);
      } else {
        await file.writeAsString(content);
      }
      return file;
    } catch (e) {
      return null;
    }
  }
}
