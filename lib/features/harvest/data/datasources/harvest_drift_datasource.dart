import 'package:uuid/uuid.dart';
import '../../../../data/database/app_database.dart';
import '../../../../data/database/daos/harvest_dao.dart';
import '../models/harvest_models.dart';
import 'i_harvest_datasource.dart';

class HarvestDriftDataSourceImpl implements IHarvestDataSource {
  final HarvestDao _dao;

  HarvestDriftDataSourceImpl(this._dao);

  @override
  Future<List<HarvestRecordModel>> getAllHarvests() async {
    final rows = await _dao.getAllHarvests();
    return rows.map(_mapToModel).toList();
  }

  @override
  Future<HarvestRecordModel?> getHarvestByBatch(String batchId) async {
    final row = await _dao.getHarvestByBatch(batchId);
    return row != null ? _mapToModel(row) : null;
  }

  @override
  Future<void> saveHarvest(HarvestRecordModel harvest, {required bool generateIncomeRecord}) async {
    final harvestDb = _mapToDbModel(harvest);

    IncomeDbModel? incomeDb;
    if (generateIncomeRecord) {
      // Generate a mock income record representing the sale of the net harvest weight.
      // In a real app, actual sales price would be calculated per grade.
      incomeDb = IncomeDbModel(
        id: const Uuid().v4(),
        saleDate: DateTime.parse(harvest.harvestDate),
        batchId: harvest.batchId,
        buyerId: 'default_buyer_id',
        categoryId: 'sales_cat_id',
        cocoonGrade: 'Mixed',
        quantity: harvest.netSaleableWeight,
        rate: 400.0,
        grossAmount: harvest.netSaleableWeight * 400.0,
        transportCharges: 0.0,
        commission: 0.0,
        netAmount: harvest.netSaleableWeight * 400.0,
        paymentMethod: 'Cash',
        paymentStatus: 'Pending',
        remarks: 'Auto-generated harvest sale',
      );
    }

    await _dao.insertHarvestTransaction(harvestDb, generatedIncome: incomeDb);
  }

  HarvestRecordModel _mapToModel(HarvestRecordDbModel dbModel) {
    return HarvestRecordModel(
      id: dbModel.id,
      batchId: dbModel.batchId,
      harvestDate: dbModel.harvestDate.toIso8601String(),
      actualHarvestDuration: dbModel.actualHarvestDuration,
      grossWeight: dbModel.grossWeight,
      netSaleableWeight: dbModel.netSaleableWeight,
      rejectedWeight: dbModel.rejectedWeight,
      moisturePercentage: dbModel.moisturePercentage,
      wastePercentage: dbModel.wastePercentage,
      averageCocoonSize: dbModel.averageCocoonSize,
      gradeAWeight: dbModel.gradeAWeight,
      gradeBWeight: dbModel.gradeBWeight,
      gradeCWeight: dbModel.gradeCWeight,
      yieldPercentage: dbModel.yieldPercentage,
      survivalRate: dbModel.survivalRate,
      feedConversionRatio: dbModel.feedConversionRatio,
      mortalityPercentage: dbModel.mortalityPercentage,
      harvestEfficiency: dbModel.harvestEfficiency,
      harvestedBy: dbModel.harvestedBy,
      remarks: dbModel.remarks,
    );
  }

  HarvestRecordDbModel _mapToDbModel(HarvestRecordModel model) {
    return HarvestRecordDbModel(
      id: model.id,
      batchId: model.batchId,
      harvestDate: DateTime.parse(model.harvestDate),
      actualHarvestDuration: model.actualHarvestDuration,
      grossWeight: model.grossWeight,
      netSaleableWeight: model.netSaleableWeight,
      rejectedWeight: model.rejectedWeight,
      moisturePercentage: model.moisturePercentage,
      wastePercentage: model.wastePercentage,
      averageCocoonSize: model.averageCocoonSize,
      gradeAWeight: model.gradeAWeight,
      gradeBWeight: model.gradeBWeight,
      gradeCWeight: model.gradeCWeight,
      yieldPercentage: model.yieldPercentage,
      survivalRate: model.survivalRate,
      feedConversionRatio: model.feedConversionRatio,
      mortalityPercentage: model.mortalityPercentage,
      harvestEfficiency: model.harvestEfficiency,
      harvestedBy: model.harvestedBy,
      remarks: model.remarks,
    );
  }
}
