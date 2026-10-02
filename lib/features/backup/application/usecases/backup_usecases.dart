import 'package:fpdart/fpdart.dart';
import '../../../../core/errors/failure.dart';
import '../../domain/entities/backup_entities.dart';
import '../../domain/repositories/i_backup_repository.dart';

class GetBackupHistoryUseCase {
  final IBackupRepository _repository;
  GetBackupHistoryUseCase(this._repository);

  Future<Either<Failure, List<BackupMetadata>>> execute() => _repository.getBackupHistory();
}

class CreateBackupUseCase {
  final IBackupRepository _repository;
  CreateBackupUseCase(this._repository);

  Future<Either<Failure, BackupMetadata>> execute({bool isAutoBackup = false}) => _repository.createBackup(isAutoBackup: isAutoBackup);
}

class RestoreBackupUseCase {
  final IBackupRepository _repository;
  RestoreBackupUseCase(this._repository);

  Future<Either<Failure, void>> execute(BackupMetadata backup) => _repository.restoreBackup(backup);
}
