import '../../../../data/database/app_database.dart';
import '../../../../data/database/daos/backup_dao.dart';
import '../models/backup_models.dart';
import 'i_backup_datasource.dart';

class BackupDriftDataSourceImpl implements IBackupDataSource {
  final BackupDao _dao;

  BackupDriftDataSourceImpl(this._dao);

  @override
  Future<List<BackupMetadataModel>> getBackupHistory() async {
    final dbModels = await _dao.getAllBackups();
    return dbModels.map((db) => BackupMetadataModel(
      id: db.id,
      fileName: db.fileName,
      filePath: db.filePath,
      timestamp: db.timestamp.toIso8601String(),
      fileSizeBytes: db.fileSizeBytes,
      databaseVersion: db.databaseVersion,
      checksum: db.checksum,
      isAutoBackup: db.isAutoBackup,
    )).toList();
  }

  @override
  Future<void> saveBackupMetadata(BackupMetadataModel backup) async {
    final dbModel = BackupDbModel(
      id: backup.id,
      fileName: backup.fileName,
      filePath: backup.filePath,
      timestamp: DateTime.parse(backup.timestamp),
      fileSizeBytes: backup.fileSizeBytes,
      databaseVersion: backup.databaseVersion,
      checksum: backup.checksum,
      isAutoBackup: backup.isAutoBackup,
    );
    await _dao.insertBackup(dbModel);
  }

  @override
  Future<void> deleteBackupMetadata(String id) async {
    await _dao.deleteBackup(id);
  }
}
