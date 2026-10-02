import 'package:drift/drift.dart';
import '../app_database.dart';
import '../tables/feeding_tables.dart';

import '../tables/inventory_tables.dart';

part 'feeding_dao.g.dart';

@DriftAccessor(tables: [
  FeedingLogsTable, 
  EnvironmentalLogsTable, 
  MortalityLogsTable,
  InventoryItemsTable,
  InventoryTransactionsTable,
])
class FeedingDao extends DatabaseAccessor<AppDatabase> with _$FeedingDaoMixin {
  FeedingDao(super.db);

  Future<List<FeedingLogDbModel>> getFeedingsForBatch(String batchId) async {
    return await (select(feedingLogsTable)..where((t) => t.batchId.equals(batchId))..orderBy([(t) => OrderingTerm.desc(t.date)])).get();
  }

  /// Automatically reduces inventory stock (Mulberry leaves) when logging a feeding.
  Future<void> insertFeedingAndReduceInventory(
    FeedingLogDbModel feeding, 
    InventoryTransactionDbModel inventoryTx,
  ) async {
    await transaction(() async {
      // 1. Insert Feeding
      await into(feedingLogsTable).insert(feeding, mode: InsertMode.replace);
      
      // 2. Insert Inventory Tx
      await into(inventoryTransactionsTable).insert(inventoryTx, mode: InsertMode.replace);
      
      // 3. Update Item Quantity
      final itemRow = await (select(inventoryItemsTable)..where((t) => t.id.equals(inventoryTx.itemId))).getSingleOrNull();
      if (itemRow != null) {
        final newQuantity = itemRow.currentQuantity - inventoryTx.quantity;
        await update(inventoryItemsTable).replace(itemRow.copyWith(currentQuantity: newQuantity));
      }
    });
  }

  Future<List<EnvironmentalReadingDbModel>> getEnvironmentalReadings(String batchId) async {
    return await (select(environmentalLogsTable)..where((t) => t.batchId.equals(batchId))..orderBy([(t) => OrderingTerm.desc(t.timestamp)])).get();
  }

  Future<void> insertEnvironmentalReading(EnvironmentalReadingDbModel reading) async {
    await into(environmentalLogsTable).insert(reading, mode: InsertMode.replace);
  }

  Future<List<MortalityLogDbModel>> getMortalityLogs(String batchId) async {
    return await (select(mortalityLogsTable)..where((t) => t.batchId.equals(batchId))..orderBy([(t) => OrderingTerm.desc(t.date)])).get();
  }

  Future<void> insertMortalityLog(MortalityLogDbModel log) async {
    await into(mortalityLogsTable).insert(log, mode: InsertMode.replace);
  }
}
