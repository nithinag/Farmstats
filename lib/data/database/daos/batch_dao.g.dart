// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'batch_dao.dart';

// ignore_for_file: type=lint
mixin _$BatchDaoMixin on DatabaseAccessor<AppDatabase> {
  $BatchesTableTable get batchesTable => attachedDatabase.batchesTable;
  $BatchTimelinesTableTable get batchTimelinesTable =>
      attachedDatabase.batchTimelinesTable;
  BatchDaoManager get managers => BatchDaoManager(this);
}

class BatchDaoManager {
  final _$BatchDaoMixin _db;
  BatchDaoManager(this._db);
  $$BatchesTableTableTableManager get batchesTable =>
      $$BatchesTableTableTableManager(_db.attachedDatabase, _db.batchesTable);
  $$BatchTimelinesTableTableTableManager get batchTimelinesTable =>
      $$BatchTimelinesTableTableTableManager(
          _db.attachedDatabase, _db.batchTimelinesTable);
}
