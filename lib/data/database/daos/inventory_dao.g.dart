// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'inventory_dao.dart';

// ignore_for_file: type=lint
mixin _$InventoryDaoMixin on DatabaseAccessor<AppDatabase> {
  $InventoryCategoriesTableTable get inventoryCategoriesTable =>
      attachedDatabase.inventoryCategoriesTable;
  $InventoryItemsTableTable get inventoryItemsTable =>
      attachedDatabase.inventoryItemsTable;
  $BatchesTableTable get batchesTable => attachedDatabase.batchesTable;
  $InventoryTransactionsTableTable get inventoryTransactionsTable =>
      attachedDatabase.inventoryTransactionsTable;
  InventoryDaoManager get managers => InventoryDaoManager(this);
}

class InventoryDaoManager {
  final _$InventoryDaoMixin _db;
  InventoryDaoManager(this._db);
  $$InventoryCategoriesTableTableTableManager get inventoryCategoriesTable =>
      $$InventoryCategoriesTableTableTableManager(
          _db.attachedDatabase, _db.inventoryCategoriesTable);
  $$InventoryItemsTableTableTableManager get inventoryItemsTable =>
      $$InventoryItemsTableTableTableManager(
          _db.attachedDatabase, _db.inventoryItemsTable);
  $$BatchesTableTableTableManager get batchesTable =>
      $$BatchesTableTableTableManager(_db.attachedDatabase, _db.batchesTable);
  $$InventoryTransactionsTableTableTableManager
      get inventoryTransactionsTable =>
          $$InventoryTransactionsTableTableTableManager(
              _db.attachedDatabase, _db.inventoryTransactionsTable);
}
