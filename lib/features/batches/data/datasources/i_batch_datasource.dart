import '../models/batch_models.dart';

abstract class IBatchDataSource {
  Future<List<BatchModel>> getBatches();
  Future<BatchModel?> getBatchById(String id);
  Future<void> addBatch(BatchModel batch);
  Future<void> updateBatch(BatchModel batch);
  Future<void> deleteBatch(String id);
  Future<List<BatchTimelineEventModel>> getBatchTimeline(String batchId);
  Future<void> addTimelineEvent(BatchTimelineEventModel event);
}
