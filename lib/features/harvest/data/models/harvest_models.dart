import 'package:freezed_annotation/freezed_annotation.dart';

part 'harvest_models.freezed.dart';
part 'harvest_models.g.dart';

@freezed
abstract class HarvestRecordModel with _$HarvestRecordModel {
  const factory HarvestRecordModel({
    required String id,
    required String batchId,
    required String harvestDate,
    required double actualHarvestDuration,
    required double grossWeight,
    required double netSaleableWeight,
    required double rejectedWeight,
    required double moisturePercentage,
    required double wastePercentage,
    required double averageCocoonSize,
    required double gradeAWeight,
    required double gradeBWeight,
    required double gradeCWeight,
    required double yieldPercentage,
    required double survivalRate,
    required double feedConversionRatio,
    required double mortalityPercentage,
    required double harvestEfficiency,
    String? harvestedBy,
    String? remarks,
  }) = _HarvestRecordModel;

  factory HarvestRecordModel.fromJson(Map<String, dynamic> json) => _$HarvestRecordModelFromJson(json);
}
