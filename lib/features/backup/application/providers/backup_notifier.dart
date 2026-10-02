
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/entities/backup_entities.dart';
import '../../domain/repositories/i_backup_repository.dart';
import '../../data/repositories/backup_repository_impl.dart';
import '../../data/datasources/i_backup_datasource.dart';
import '../../data/datasources/backup_drift_datasource.dart';
import '../../../../data/providers/database_provider.dart';
import '../usecases/backup_usecases.dart';
import 'backup_state.dart';

final backupDataSourceProvider = Provider<IBackupDataSource>((ref) {
  return BackupDriftDataSourceImpl(ref.watch(appDatabaseProvider).backupDao);
});

final backupRepositoryProvider = Provider<IBackupRepository>((ref) {
  return BackupRepositoryImpl(ref.watch(backupDataSourceProvider));
});

final getBackupHistoryUseCaseProvider = Provider((ref) => GetBackupHistoryUseCase(ref.watch(backupRepositoryProvider)));
final createBackupUseCaseProvider = Provider((ref) => CreateBackupUseCase(ref.watch(backupRepositoryProvider)));
final restoreBackupUseCaseProvider = Provider((ref) => RestoreBackupUseCase(ref.watch(backupRepositoryProvider)));

final backupNotifierProvider = NotifierProvider<BackupNotifier, BackupState>(() {
  return BackupNotifier();
});

class BackupNotifier extends Notifier<BackupState> {
  @override
  BackupState build() {
    loadHistory();
    return const BackupState.initial();
  }

  Future<void> loadHistory() async {
    state = const BackupState.loading();
    final result = await ref.read(getBackupHistoryUseCaseProvider).execute();
    
    state = result.fold(
      (failure) => BackupState.error(failure.message),
      (history) => BackupState.data(history: history),
    );
  }

  Future<void> createBackup() async {
    state = const BackupState.loading();
    final result = await ref.read(createBackupUseCaseProvider).execute(isAutoBackup: false);
    
    result.fold(
      (failure) {
        state = BackupState.error(failure.message);
        loadHistory();
      },
      (backup) {
        state = BackupState.success('Backup created successfully: ${backup.fileName}');
        loadHistory();
      },
    );
  }

  Future<void> restoreBackup(BackupMetadata backup) async {
    state = const BackupState.loading();
    final result = await ref.read(restoreBackupUseCaseProvider).execute(backup);
    
    result.fold(
      (failure) {
        state = BackupState.error(failure.message);
        loadHistory();
      },
      (_) {
        state = const BackupState.success('Database restored successfully. Please restart the app.');
        loadHistory();
      },
    );
  }
}
