import 'package:flutter_test/flutter_test.dart';
import 'package:farmstats/features/backup/application/services/backup_services.dart';
import 'package:farmstats/features/backup/domain/entities/backup_entities.dart';

void main() {
  group('BackupValidationService Tests', () {
    test('generateChecksum produces consistent output for same path', () {
      final checksum1 = BackupValidationService.generateChecksum('/mock/path.sqlite');
      final checksum2 = BackupValidationService.generateChecksum('/mock/path.sqlite');
      
      expect(checksum1, equals(checksum2));
    });

    test('validateBackup returns true for valid backup', () {
      final validBackup = BackupMetadata(
        id: '123',
        fileName: 'backup.sqlite',
        filePath: '/mock/path.sqlite',
        timestamp: DateTime.now(),
        fileSizeBytes: 1024,
        databaseVersion: '1.0.0',
        checksum: BackupValidationService.generateChecksum('/mock/path.sqlite'),
        isAutoBackup: false,
      );

      final isValid = BackupValidationService.validateBackup(validBackup);
      expect(isValid, isTrue);
    });

    test('validateBackup returns false if file size is 0', () {
      final invalidBackup = BackupMetadata(
        id: '123',
        fileName: 'backup.sqlite',
        filePath: '/mock/path.sqlite',
        timestamp: DateTime.now(),
        fileSizeBytes: 0,
        databaseVersion: '1.0.0',
        checksum: BackupValidationService.generateChecksum('/mock/path.sqlite'),
        isAutoBackup: false,
      );

      final isValid = BackupValidationService.validateBackup(invalidBackup);
      expect(isValid, isFalse);
    });

    test('validateBackup returns false for mismatched checksum', () {
      final invalidBackup = BackupMetadata(
        id: '123',
        fileName: 'backup.sqlite',
        filePath: '/mock/path.sqlite',
        timestamp: DateTime.now(),
        fileSizeBytes: 1024,
        databaseVersion: '1.0.0',
        checksum: 'corrupted_checksum',
        isAutoBackup: false,
      );

      final isValid = BackupValidationService.validateBackup(invalidBackup);
      expect(isValid, isFalse);
    });
  });
}
