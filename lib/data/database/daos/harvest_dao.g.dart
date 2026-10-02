// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'harvest_dao.dart';

// ignore_for_file: type=lint
mixin _$HarvestDaoMixin on DatabaseAccessor<AppDatabase> {
  $BatchesTableTable get batchesTable => attachedDatabase.batchesTable;
  $HarvestsTableTable get harvestsTable => attachedDatabase.harvestsTable;
  $BuyersTableTable get buyersTable => attachedDatabase.buyersTable;
  $IncomeCategoriesTableTable get incomeCategoriesTable =>
      attachedDatabase.incomeCategoriesTable;
  $IncomesTableTable get incomesTable => attachedDatabase.incomesTable;
  HarvestDaoManager get managers => HarvestDaoManager(this);
}

class HarvestDaoManager {
  final _$HarvestDaoMixin _db;
  HarvestDaoManager(this._db);
  $$BatchesTableTableTableManager get batchesTable =>
      $$BatchesTableTableTableManager(_db.attachedDatabase, _db.batchesTable);
  $$HarvestsTableTableTableManager get harvestsTable =>
      $$HarvestsTableTableTableManager(_db.attachedDatabase, _db.harvestsTable);
  $$BuyersTableTableTableManager get buyersTable =>
      $$BuyersTableTableTableManager(_db.attachedDatabase, _db.buyersTable);
  $$IncomeCategoriesTableTableTableManager get incomeCategoriesTable =>
      $$IncomeCategoriesTableTableTableManager(
          _db.attachedDatabase, _db.incomeCategoriesTable);
  $$IncomesTableTableTableManager get incomesTable =>
      $$IncomesTableTableTableManager(_db.attachedDatabase, _db.incomesTable);
}
