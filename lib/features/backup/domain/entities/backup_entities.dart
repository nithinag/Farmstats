import 'package:freezed_annotation/freezed_annotation.dart';

part 'backup_entities.freezed.dart';

@freezed
abstract class BackupMetadata with _$BackupMetadata {
  const factory BackupMetadata({
    required String id,
    required String fileName,
    required String filePath,
    required DateTime timestamp,
    required int fileSizeBytes,
    required String databaseVersion,
    required String checksum,
    required bool isAutoBackup,
  }) = _BackupMetadata;
}
