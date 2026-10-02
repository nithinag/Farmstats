import 'package:freezed_annotation/freezed_annotation.dart';

part 'backup_models.freezed.dart';
part 'backup_models.g.dart';

@freezed
abstract class BackupMetadataModel with _$BackupMetadataModel {
  const factory BackupMetadataModel({
    required String id,
    required String fileName,
    required String filePath,
    required String timestamp,
    required int fileSizeBytes,
    required String databaseVersion,
    required String checksum,
    required bool isAutoBackup,
  }) = _BackupMetadataModel;

  factory BackupMetadataModel.fromJson(Map<String, dynamic> json) => _$BackupMetadataModelFromJson(json);
}
