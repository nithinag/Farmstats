import '../models/harvest_models.dart';

abstract class IHarvestDataSource {
  Future<List<HarvestRecordModel>> getAllHarvests();
  Future<HarvestRecordModel?> getHarvestByBatch(String batchId);
  Future<void> saveHarvest(HarvestRecordModel harvest, {required bool generateIncomeRecord});
}
