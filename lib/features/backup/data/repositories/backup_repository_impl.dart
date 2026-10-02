import 'package:fpdart/fpdart.dart';
import '../../../../core/errors/failure.dart';
import '../../domain/entities/backup_entities.dart';
import '../../domain/repositories/i_backup_repository.dart';
import '../datasources/i_backup_datasource.dart';
import '../mappers/backup_mapper.dart';
import '../../application/services/backup_services.dart';

class BackupRepositoryImpl implements IBackupRepository {
  final IBackupDataSource _dataSource;

  BackupRepositoryImpl(this._dataSource);

  @override
  Future<Either<Failure, List<BackupMetadata>>> getBackupHistory() async {
    try {
      final models = await _dataSource.getBackupHistory();
      final entities = models.map(BackupMapper.fromModel).toList();
      return Right(entities);
    } catch (e) {
      return Left(Failure('Failed to load backup history: $e'));
    }
  }

  @override
  Future<Either<Failure, BackupMetadata>> createBackup({required bool isAutoBackup}) async {
    try {
      final backup = await DatabaseExportService.exportDatabase(isAutoBackup);
      final model = BackupMapper.toModel(backup);
      await _dataSource.saveBackupMetadata(model);
      return Right(backup);
    } catch (e) {
      return Left(Failure('Failed to create backup: $e'));
    }
  }

  @override
  Future<Either<Failure, void>> restoreBackup(BackupMetadata backup) async {
    try {
      if (!BackupValidationService.validateBackup(backup)) {
        return const Left(Failure('Backup validation failed. The file may be corrupted.'));
      }
      
      await DatabaseExportService.importDatabase(backup.filePath);
      return const Right(null);
    } catch (e) {
      return Left(Failure('Failed to restore backup: $e'));
    }
  }
}
