import 'package:drift/drift.dart';
import '../app_database.dart';
import '../tables/batch_tables.dart';

part 'batch_dao.g.dart';

@DriftAccessor(tables: [BatchesTable, BatchTimelinesTable])
class BatchDao extends DatabaseAccessor<AppDatabase> with _$BatchDaoMixin {
  BatchDao(super.db);

  Future<List<BatchDbModel>> getAllBatches() async {
    return await (select(batchesTable)..orderBy([(t) => OrderingTerm.desc(t.startDate)])).get();
  }

  Future<BatchDbModel?> getBatchById(String id) async {
    return await (select(batchesTable)..where((t) => t.id.equals(id))).getSingleOrNull();
  }

  Future<void> insertBatch(BatchDbModel batch) async {
    await into(batchesTable).insert(batch, mode: InsertMode.replace);
  }

  Future<void> updateBatch(BatchDbModel batch) async {
    await update(batchesTable).replace(batch);
  }

  Future<void> deleteBatch(String id) async {
    await (delete(batchesTable)..where((t) => t.id.equals(id))).go();
  }

  Future<List<BatchTimelineDbModel>> getTimeline(String batchId) async {
    return await (select(batchTimelinesTable)
          ..where((t) => t.batchId.equals(batchId))
          ..orderBy([(t) => OrderingTerm.desc(t.timestamp)]))
        .get();
  }

  Future<void> insertTimelineEvent(BatchTimelineDbModel event) async {
    await into(batchTimelinesTable).insert(event, mode: InsertMode.replace);
  }
}
