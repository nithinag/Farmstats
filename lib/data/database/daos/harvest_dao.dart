import 'package:drift/drift.dart';
import '../app_database.dart';
import '../tables/harvest_tables.dart';
import '../tables/batch_tables.dart';
import '../tables/income_tables.dart'; // need IncomesTable

part 'harvest_dao.g.dart';

@DriftAccessor(tables: [HarvestsTable, BatchesTable, IncomesTable])
class HarvestDao extends DatabaseAccessor<AppDatabase> with _$HarvestDaoMixin {
  HarvestDao(super.db);

  Future<List<HarvestRecordDbModel>> getAllHarvests() async {
    return await (select(harvestsTable)..orderBy([(t) => OrderingTerm.desc(t.harvestDate)])).get();
  }

  Future<HarvestRecordDbModel?> getHarvestByBatch(String batchId) async {
    return await (select(harvestsTable)..where((t) => t.batchId.equals(batchId))).getSingleOrNull();
  }

  /// Complex Transaction: Inserts Harvest, marks Batch as harvested, and optionally generates an Income record.
  Future<void> insertHarvestTransaction(
    HarvestRecordDbModel harvest,
    {IncomeDbModel? generatedIncome}
  ) async {
    await transaction(() async {
      // 1. Insert harvest record
      await into(harvestsTable).insert(harvest, mode: InsertMode.replace);

      // 2. Mark Batch as harvested
      final batchRow = await (select(batchesTable)..where((t) => t.id.equals(harvest.batchId))).getSingleOrNull();
      if (batchRow != null) {
        await update(batchesTable).replace(batchRow.copyWith(status: 'harvested'));
      }

      // 3. Optional Income Generation
      if (generatedIncome != null) {
        await into(incomesTable).insert(generatedIncome, mode: InsertMode.replace);
      }
    });
  }
}
