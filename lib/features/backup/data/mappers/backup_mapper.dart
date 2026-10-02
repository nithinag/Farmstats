import '../../domain/entities/backup_entities.dart';
import '../models/backup_models.dart';

class BackupMapper {
  static BackupMetadata fromModel(BackupMetadataModel model) {
    return BackupMetadata(
      id: model.id,
      fileName: model.fileName,
      filePath: model.filePath,
      timestamp: DateTime.parse(model.timestamp),
      fileSizeBytes: model.fileSizeBytes,
      databaseVersion: model.databaseVersion,
      checksum: model.checksum,
      isAutoBackup: model.isAutoBackup,
    );
  }

  static BackupMetadataModel toModel(BackupMetadata entity) {
    return BackupMetadataModel(
      id: entity.id,
      fileName: entity.fileName,
      filePath: entity.filePath,
      timestamp: entity.timestamp.toIso8601String(),
      fileSizeBytes: entity.fileSizeBytes,
      databaseVersion: entity.databaseVersion,
      checksum: entity.checksum,
      isAutoBackup: entity.isAutoBackup,
    );
  }
}
