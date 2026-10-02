import 'package:drift/drift.dart';
import '../app_database.dart';
import '../tables/inventory_tables.dart';

part 'inventory_dao.g.dart';

@DriftAccessor(tables: [InventoryItemsTable, InventoryCategoriesTable, InventoryTransactionsTable])
class InventoryDao extends DatabaseAccessor<AppDatabase> with _$InventoryDaoMixin {
  InventoryDao(super.db);

  Future<List<TypedResult>> getAllInventoryItems() async {
    return await (select(inventoryItemsTable).join([
      innerJoin(inventoryCategoriesTable, inventoryCategoriesTable.id.equalsExp(inventoryItemsTable.categoryId)),
    ])
    ..orderBy([OrderingTerm.desc(inventoryItemsTable.currentQuantity)])).get();
  }

  Future<TypedResult?> getItemById(String id) async {
    return await (select(inventoryItemsTable).join([
      innerJoin(inventoryCategoriesTable, inventoryCategoriesTable.id.equalsExp(inventoryItemsTable.categoryId)),
    ])..where(inventoryItemsTable.id.equals(id))).getSingleOrNull();
  }

  Future<void> insertItem(InventoryItemDbModel item) async {
    await into(inventoryItemsTable).insert(item, mode: InsertMode.replace);
  }

  Future<void> updateItem(InventoryItemDbModel item) async {
    await update(inventoryItemsTable).replace(item);
  }

  Future<void> deleteItem(String id) async {
    await (delete(inventoryItemsTable)..where((t) => t.id.equals(id))).go();
  }

  Future<List<InventoryCategoryDbModel>> getCategories() async {
    return await select(inventoryCategoriesTable).get();
  }

  Future<void> insertTransaction(InventoryTransactionDbModel txn) async {
    return transaction(() async {
      await into(inventoryTransactionsTable).insert(txn, mode: InsertMode.replace);
      
      // Update item quantity depending on transaction type
      final itemRow = await (select(inventoryItemsTable)..where((t) => t.id.equals(txn.itemId))).getSingle();
      
      double newQuantity = itemRow.currentQuantity;
      if (txn.type == 'add') {
        newQuantity += txn.quantity;
      } else if (txn.type == 'consume' || txn.type == 'transfer') {
        newQuantity -= txn.quantity;
      }
      
      await update(inventoryItemsTable).replace(itemRow.copyWith(currentQuantity: newQuantity));
    });
  }

  Future<List<InventoryTransactionDbModel>> getStockHistory(String itemId) async {
    return await (select(inventoryTransactionsTable)
          ..where((t) => t.itemId.equals(itemId))
          ..orderBy([(t) => OrderingTerm.desc(t.date)]))
        .get();
  }
}
