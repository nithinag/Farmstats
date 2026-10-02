// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'backup_dao.dart';

// ignore_for_file: type=lint
mixin _$BackupDaoMixin on DatabaseAccessor<AppDatabase> {
  $BackupsTableTable get backupsTable => attachedDatabase.backupsTable;
  BackupDaoManager get managers => BackupDaoManager(this);
}

class BackupDaoManager {
  final _$BackupDaoMixin _db;
  BackupDaoManager(this._db);
  $$BackupsTableTableTableManager get backupsTable =>
      $$BackupsTableTableTableManager(_db.attachedDatabase, _db.backupsTable);
}
