import '../models/backup_models.dart';

abstract class IBackupDataSource {
  Future<List<BackupMetadataModel>> getBackupHistory();
  Future<void> saveBackupMetadata(BackupMetadataModel backup);
  Future<void> deleteBackupMetadata(String id);
}
