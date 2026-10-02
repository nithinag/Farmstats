import 'package:fpdart/fpdart.dart';
import '../../../../core/errors/failure.dart';
import '../entities/backup_entities.dart';

abstract class IBackupRepository {
  Future<Either<Failure, List<BackupMetadata>>> getBackupHistory();
  Future<Either<Failure, BackupMetadata>> createBackup({required bool isAutoBackup});
  Future<Either<Failure, void>> restoreBackup(BackupMetadata backup);
}
