import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/backup_entities.dart';

part 'backup_state.freezed.dart';

@freezed
abstract class BackupState with _$BackupState {
  const factory BackupState.initial() = BackupStateInitial;
  const factory BackupState.loading() = BackupStateLoading;
  const factory BackupState.data({
    required List<BackupMetadata> history,
  }) = BackupStateData;
  const factory BackupState.error(String message) = BackupStateError;
  const factory BackupState.success(String message) = BackupStateSuccess;
}
