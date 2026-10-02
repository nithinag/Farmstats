import 'dart:io';
import 'package:path_provider/path_provider.dart';
import '../../../../core/services/file_storage_service.dart';
import 'package:uuid/uuid.dart';
import '../../domain/entities/backup_entities.dart';

class BackupValidationService {
  /// Mocks generating a checksum for a given file
  static String generateChecksum(String filePath) {
    // In a real implementation, read the file bytes and generate SHA256
    return 'mocked_checksum_${filePath.hashCode}';
  }

  /// Validates a backup file before restoration
  static bool validateBackup(BackupMetadata metadata) {
    // 1. Verify file size is not zero
    if (metadata.fileSizeBytes <= 0) return false;
    
    // 2. Validate checksum matches file state (mocked)
    final currentChecksum = generateChecksum(metadata.filePath);
    if (currentChecksum != metadata.checksum) return false;

    // 3. Database version checks could happen here
    return true;
  }
}

class DatabaseExportService {
  static Future<BackupMetadata> exportDatabase(bool isAutoBackup) async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final dbFile = File('${dbFolder.path}/farmstats_db.sqlite');
    
    if (!await dbFile.exists()) throw Exception('Database file not found');
    
    final timestamp = DateTime.now();
    final fileName = 'farmstats_backup_${timestamp.millisecondsSinceEpoch}.sqlite';
    
    final backupDir = await FileStorageService.getExportDirectory(ExportType.backup);
    if (backupDir == null) throw Exception('Permission denied or storage unavailable');
    
    final backupFile = File('$backupDir/$fileName');
    await dbFile.copy(backupFile.path);
    
    return BackupMetadata(
      id: const Uuid().v4(),
      fileName: fileName,
      filePath: backupFile.path,
      timestamp: timestamp,
      fileSizeBytes: await backupFile.length(),
      databaseVersion: '1.0.0',
      checksum: BackupValidationService.generateChecksum(backupFile.path),
      isAutoBackup: isAutoBackup,
    );
  }

  static Future<void> importDatabase(String filePath) async {
    final backupFile = File(filePath);
    if (!await backupFile.exists()) throw Exception('Backup file not found');
    
    final dbFolder = await getApplicationDocumentsDirectory();
    final dbFile = File('${dbFolder.path}/farmstats_db.sqlite');
    
    await backupFile.copy(dbFile.path);
  }
}
