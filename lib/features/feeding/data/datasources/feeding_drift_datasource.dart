import 'package:uuid/uuid.dart';
import '../../../../data/database/app_database.dart';
import '../../../../data/database/daos/feeding_dao.dart';
import '../models/feeding_models.dart';
import 'i_feeding_datasource.dart';

class FeedingDriftDataSourceImpl implements IFeedingDataSource {
  final FeedingDao _dao;
  
  FeedingDriftDataSourceImpl(this._dao);

  @override
  Future<List<FeedingLogModel>> getFeedingsForBatch(String batchId) async {
    final rows = await _dao.getFeedingsForBatch(batchId);
    return rows.map((dbModel) => FeedingLogModel(
      id: dbModel.id,
      batchId: dbModel.batchId,
      date: dbModel.date.toIso8601String(),
      time: dbModel.time,
      leafType: dbModel.leafType,
      leafAge: dbModel.leafAge,
      leafQuantity: dbModel.leafQuantity,
      feedingRound: dbModel.feedingRound,
      workerId: dbModel.workerId,
      remarks: dbModel.remarks,
    )).toList();
  }

  @override
  Future<void> logFeeding(FeedingLogModel feeding, {required String inventoryItemId}) async {
    final feedingDb = FeedingLogDbModel(
      id: feeding.id,
      batchId: feeding.batchId,
      date: DateTime.parse(feeding.date),
      time: feeding.time,
      leafType: feeding.leafType,
      leafAge: feeding.leafAge,
      leafQuantity: feeding.leafQuantity,
      feedingRound: feeding.feedingRound,
      workerId: feeding.workerId,
      remarks: feeding.remarks,
    );

    // Auto-create inventory reduction transaction
    final invTxDb = InventoryTransactionDbModel(
      id: const Uuid().v4(),
      itemId: inventoryItemId,
      type: 'consume',
      quantity: feeding.leafQuantity,
      date: DateTime.parse(feeding.date),
      batchId: feeding.batchId,
      reason: 'Feeding round ${feeding.feedingRound}',
    );

    await _dao.insertFeedingAndReduceInventory(feedingDb, invTxDb);
  }

  @override
  Future<List<EnvironmentalReadingModel>> getEnvironmentalReadings(String batchId) async {
    final rows = await _dao.getEnvironmentalReadings(batchId);
    return rows.map((r) => EnvironmentalReadingModel(
      id: r.id,
      batchId: r.batchId,
      timestamp: r.timestamp.toIso8601String(),
      temperature: r.temperature,
      humidity: r.humidity,
      ventilationStatus: r.ventilationStatus,
      weatherNotes: r.weatherNotes,
    )).toList();
  }

  @override
  Future<void> logEnvironment(EnvironmentalReadingModel reading) async {
    await _dao.insertEnvironmentalReading(EnvironmentalReadingDbModel(
      id: reading.id,
      batchId: reading.batchId,
      timestamp: DateTime.parse(reading.timestamp),
      temperature: reading.temperature,
      humidity: reading.humidity,
      ventilationStatus: reading.ventilationStatus,
      weatherNotes: reading.weatherNotes,
    ));
  }

  @override
  Future<List<MortalityRecordModel>> getMortalityLogs(String batchId) async {
    final rows = await _dao.getMortalityLogs(batchId);
    return rows.map((r) => MortalityRecordModel(
      id: r.id,
      batchId: r.batchId,
      date: r.date.toIso8601String(),
      deadCount: r.deadCount,
      reason: r.reason,
      workerId: r.workerId,
      remarks: r.remarks,
    )).toList();
  }

  @override
  Future<void> logMortality(MortalityRecordModel log) async {
    await _dao.insertMortalityLog(MortalityLogDbModel(
      id: log.id,
      batchId: log.batchId,
      date: DateTime.parse(log.date),
      deadCount: log.deadCount,
      reason: log.reason,
      workerId: log.workerId,
      remarks: log.remarks,
    ));
  }
}
