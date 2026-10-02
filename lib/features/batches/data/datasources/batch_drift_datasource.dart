import '../../../../data/database/app_database.dart';
import '../../../../data/database/daos/batch_dao.dart';
import '../models/batch_models.dart';
import 'i_batch_datasource.dart';

class BatchDriftDataSourceImpl implements IBatchDataSource {
  final BatchDao _dao;

  BatchDriftDataSourceImpl(this._dao);

  BatchModel _mapToModel(BatchDbModel dbModel) {
    return BatchModel(
      id: dbModel.id,
      batchName: dbModel.batchName,
      startDate: dbModel.startDate.toIso8601String(),
      expectedHarvestDate: dbModel.expectedHarvestDate.toIso8601String(),
      actualHarvestDate: dbModel.actualHarvestDate?.toIso8601String(),
      silkwormVariety: dbModel.silkwormVariety,
      eggSource: dbModel.eggSource,
      numberOfDfls: dbModel.numberOfDfls,
      dflPrice: dbModel.dflPrice,
      mulberryVariety: dbModel.mulberryVariety,
      rearingHouse: dbModel.rearingHouse,
      currentStage: dbModel.currentStage,
      currentAgeDays: dbModel.currentAgeDays,
      status: dbModel.status,
      healthStatus: dbModel.healthStatus,
      temperature: dbModel.temperature,
      humidity: dbModel.humidity,
      notes: dbModel.notes,
    );
  }

  BatchDbModel _mapToDbModel(BatchModel model) {
    return BatchDbModel(
      id: model.id,
      batchName: model.batchName,
      startDate: DateTime.parse(model.startDate),
      expectedHarvestDate: DateTime.parse(model.expectedHarvestDate),
      actualHarvestDate: model.actualHarvestDate != null ? DateTime.parse(model.actualHarvestDate!) : null,
      silkwormVariety: model.silkwormVariety,
      eggSource: model.eggSource,
      numberOfDfls: model.numberOfDfls,
      dflPrice: model.dflPrice,
      mulberryVariety: model.mulberryVariety,
      rearingHouse: model.rearingHouse,
      currentStage: model.currentStage,
      currentAgeDays: model.currentAgeDays,
      status: model.status,
      healthStatus: model.healthStatus,
      temperature: model.temperature,
      humidity: model.humidity,
      notes: model.notes,
    );
  }

  @override
  Future<List<BatchModel>> getBatches() async {
    final rows = await _dao.getAllBatches();
    return rows.map(_mapToModel).toList();
  }

  @override
  Future<BatchModel?> getBatchById(String id) async {
    final row = await _dao.getBatchById(id);
    if (row == null) return null;
    return _mapToModel(row);
  }

  @override
  Future<void> addBatch(BatchModel batch) async {
    await _dao.insertBatch(_mapToDbModel(batch));
  }

  @override
  Future<void> updateBatch(BatchModel batch) async {
    await _dao.updateBatch(_mapToDbModel(batch));
  }

  @override
  Future<void> deleteBatch(String id) async {
    await _dao.deleteBatch(id);
  }

  @override
  Future<List<BatchTimelineEventModel>> getBatchTimeline(String batchId) async {
    final rows = await _dao.getTimeline(batchId);
    return rows.map((dbModel) => BatchTimelineEventModel(
      id: dbModel.id,
      batchId: dbModel.batchId,
      timestamp: dbModel.timestamp.toIso8601String(),
      eventType: dbModel.eventType,
      description: dbModel.description,
    )).toList();
  }

  @override
  Future<void> addTimelineEvent(BatchTimelineEventModel event) async {
    await _dao.insertTimelineEvent(BatchTimelineDbModel(
      id: event.id,
      batchId: event.batchId,
      timestamp: DateTime.parse(event.timestamp),
      eventType: event.eventType,
      description: event.description,
    ));
  }
}
