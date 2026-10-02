// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'backup_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_BackupMetadataModel _$BackupMetadataModelFromJson(Map<String, dynamic> json) =>
    _BackupMetadataModel(
      id: json['id'] as String,
      fileName: json['fileName'] as String,
      filePath: json['filePath'] as String,
      timestamp: json['timestamp'] as String,
      fileSizeBytes: (json['fileSizeBytes'] as num).toInt(),
      databaseVersion: json['databaseVersion'] as String,
      checksum: json['checksum'] as String,
      isAutoBackup: json['isAutoBackup'] as bool,
    );

Map<String, dynamic> _$BackupMetadataModelToJson(
        _BackupMetadataModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'fileName': instance.fileName,
      'filePath': instance.filePath,
      'timestamp': instance.timestamp,
      'fileSizeBytes': instance.fileSizeBytes,
      'databaseVersion': instance.databaseVersion,
      'checksum': instance.checksum,
      'isAutoBackup': instance.isAutoBackup,
    };
