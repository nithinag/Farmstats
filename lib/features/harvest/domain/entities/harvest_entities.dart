import 'package:freezed_annotation/freezed_annotation.dart';

part 'harvest_entities.freezed.dart';

@freezed
abstract class CocoonGrade with _$CocoonGrade {
  const factory CocoonGrade({
    required double gradeAWeight,
    required double gradeBWeight,
    required double gradeCWeight,
    required double rejectedWeight,
  }) = _CocoonGrade;
}

@freezed
abstract class ProductionMetrics with _$ProductionMetrics {
  const factory ProductionMetrics({
    required double yieldPercentage,
    required double survivalRate,
    required double feedConversionRatio,
    required double mortalityPercentage,
    required double harvestEfficiency,
  }) = _ProductionMetrics;
}

@freezed
abstract class HarvestRecord with _$HarvestRecord {
  const factory HarvestRecord({
    required String id,
    required String batchId,
    required DateTime harvestDate,
    required double actualHarvestDuration, // in hours
    required double grossWeight,
    required double netSaleableWeight,
    required double rejectedWeight,
    required double moisturePercentage,
    required double wastePercentage,
    required double averageCocoonSize,
    required CocoonGrade gradeDistribution,
    required ProductionMetrics metrics,
    String? harvestedBy, // worker ID
    String? remarks,
  }) = _HarvestRecord;
}
