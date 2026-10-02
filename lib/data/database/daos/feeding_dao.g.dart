// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feeding_dao.dart';

// ignore_for_file: type=lint
mixin _$FeedingDaoMixin on DatabaseAccessor<AppDatabase> {
  $BatchesTableTable get batchesTable => attachedDatabase.batchesTable;
  $FeedingLogsTableTable get feedingLogsTable =>
      attachedDatabase.feedingLogsTable;
  $EnvironmentalLogsTableTable get environmentalLogsTable =>
      attachedDatabase.environmentalLogsTable;
  $MortalityLogsTableTable get mortalityLogsTable =>
      attachedDatabase.mortalityLogsTable;
  $InventoryCategoriesTableTable get inventoryCategoriesTable =>
      attachedDatabase.inventoryCategoriesTable;
  $InventoryItemsTableTable get inventoryItemsTable =>
      attachedDatabase.inventoryItemsTable;
  $InventoryTransactionsTableTable get inventoryTransactionsTable =>
      attachedDatabase.inventoryTransactionsTable;
  FeedingDaoManager get managers => FeedingDaoManager(this);
}

class FeedingDaoManager {
  final _$FeedingDaoMixin _db;
  FeedingDaoManager(this._db);
  $$BatchesTableTableTableManager get batchesTable =>
      $$BatchesTableTableTableManager(_db.attachedDatabase, _db.batchesTable);
  $$FeedingLogsTableTableTableManager get feedingLogsTable =>
      $$FeedingLogsTableTableTableManager(
          _db.attachedDatabase, _db.feedingLogsTable);
  $$EnvironmentalLogsTableTableTableManager get environmentalLogsTable =>
      $$EnvironmentalLogsTableTableTableManager(
          _db.attachedDatabase, _db.environmentalLogsTable);
  $$MortalityLogsTableTableTableManager get mortalityLogsTable =>
      $$MortalityLogsTableTableTableManager(
          _db.attachedDatabase, _db.mortalityLogsTable);
  $$InventoryCategoriesTableTableTableManager get inventoryCategoriesTable =>
      $$InventoryCategoriesTableTableTableManager(
          _db.attachedDatabase, _db.inventoryCategoriesTable);
  $$InventoryItemsTableTableTableManager get inventoryItemsTable =>
      $$InventoryItemsTableTableTableManager(
          _db.attachedDatabase, _db.inventoryItemsTable);
  $$InventoryTransactionsTableTableTableManager
      get inventoryTransactionsTable =>
          $$InventoryTransactionsTableTableTableManager(
              _db.attachedDatabase, _db.inventoryTransactionsTable);
}
