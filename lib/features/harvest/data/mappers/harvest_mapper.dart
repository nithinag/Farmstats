import '../../domain/entities/harvest_entities.dart';
import '../models/harvest_models.dart';

class HarvestMapper {
  static HarvestRecord fromModel(HarvestRecordModel model) {
    return HarvestRecord(
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
      gradeDistribution: CocoonGrade(
        gradeAWeight: model.gradeAWeight,
        gradeBWeight: model.gradeBWeight,
        gradeCWeight: model.gradeCWeight,
        rejectedWeight: model.rejectedWeight,
      ),
      metrics: ProductionMetrics(
        yieldPercentage: model.yieldPercentage,
        survivalRate: model.survivalRate,
        feedConversionRatio: model.feedConversionRatio,
        mortalityPercentage: model.mortalityPercentage,
        harvestEfficiency: model.harvestEfficiency,
      ),
      harvestedBy: model.harvestedBy,
      remarks: model.remarks,
    );
  }

  static HarvestRecordModel toModel(HarvestRecord entity) {
    return HarvestRecordModel(
      id: entity.id,
      batchId: entity.batchId,
      harvestDate: entity.harvestDate.toIso8601String(),
      actualHarvestDuration: entity.actualHarvestDuration,
      grossWeight: entity.grossWeight,
      netSaleableWeight: entity.netSaleableWeight,
      rejectedWeight: entity.rejectedWeight,
      moisturePercentage: entity.moisturePercentage,
      wastePercentage: entity.wastePercentage,
      averageCocoonSize: entity.averageCocoonSize,
      gradeAWeight: entity.gradeDistribution.gradeAWeight,
      gradeBWeight: entity.gradeDistribution.gradeBWeight,
      gradeCWeight: entity.gradeDistribution.gradeCWeight,
      yieldPercentage: entity.metrics.yieldPercentage,
      survivalRate: entity.metrics.survivalRate,
      feedConversionRatio: entity.metrics.feedConversionRatio,
      mortalityPercentage: entity.metrics.mortalityPercentage,
      harvestEfficiency: entity.metrics.harvestEfficiency,
      harvestedBy: entity.harvestedBy,
      remarks: entity.remarks,
    );
  }
}
