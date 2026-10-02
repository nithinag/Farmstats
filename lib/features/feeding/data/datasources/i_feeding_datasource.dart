import '../models/feeding_models.dart';

abstract class IFeedingDataSource {
  Future<List<FeedingLogModel>> getFeedingsForBatch(String batchId);
  Future<void> logFeeding(FeedingLogModel feeding, {required String inventoryItemId});
  
  Future<List<EnvironmentalReadingModel>> getEnvironmentalReadings(String batchId);
  Future<void> logEnvironment(EnvironmentalReadingModel reading);
  
  Future<List<MortalityRecordModel>> getMortalityLogs(String batchId);
  Future<void> logMortality(MortalityRecordModel log);
}
