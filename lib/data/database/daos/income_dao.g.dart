// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'income_dao.dart';

// ignore_for_file: type=lint
mixin _$IncomeDaoMixin on DatabaseAccessor<AppDatabase> {
  $BatchesTableTable get batchesTable => attachedDatabase.batchesTable;
  $BuyersTableTable get buyersTable => attachedDatabase.buyersTable;
  $IncomeCategoriesTableTable get incomeCategoriesTable =>
      attachedDatabase.incomeCategoriesTable;
  $IncomesTableTable get incomesTable => attachedDatabase.incomesTable;
  IncomeDaoManager get managers => IncomeDaoManager(this);
}

class IncomeDaoManager {
  final _$IncomeDaoMixin _db;
  IncomeDaoManager(this._db);
  $$BatchesTableTableTableManager get batchesTable =>
      $$BatchesTableTableTableManager(_db.attachedDatabase, _db.batchesTable);
  $$BuyersTableTableTableManager get buyersTable =>
      $$BuyersTableTableTableManager(_db.attachedDatabase, _db.buyersTable);
  $$IncomeCategoriesTableTableTableManager get incomeCategoriesTable =>
      $$IncomeCategoriesTableTableTableManager(
          _db.attachedDatabase, _db.incomeCategoriesTable);
  $$IncomesTableTableTableManager get incomesTable =>
      $$IncomesTableTableTableManager(_db.attachedDatabase, _db.incomesTable);
}
