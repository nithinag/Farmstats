// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'harvest_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_HarvestRecordModel _$HarvestRecordModelFromJson(Map<String, dynamic> json) =>
    _HarvestRecordModel(
      id: json['id'] as String,
      batchId: json['batchId'] as String,
      harvestDate: json['harvestDate'] as String,
      actualHarvestDuration: (json['actualHarvestDuration'] as num).toDouble(),
      grossWeight: (json['grossWeight'] as num).toDouble(),
      netSaleableWeight: (json['netSaleableWeight'] as num).toDouble(),
      rejectedWeight: (json['rejectedWeight'] as num).toDouble(),
      moisturePercentage: (json['moisturePercentage'] as num).toDouble(),
      wastePercentage: (json['wastePercentage'] as num).toDouble(),
      averageCocoonSize: (json['averageCocoonSize'] as num).toDouble(),
      gradeAWeight: (json['gradeAWeight'] as num).toDouble(),
      gradeBWeight: (json['gradeBWeight'] as num).toDouble(),
      gradeCWeight: (json['gradeCWeight'] as num).toDouble(),
      yieldPercentage: (json['yieldPercentage'] as num).toDouble(),
      survivalRate: (json['survivalRate'] as num).toDouble(),
      feedConversionRatio: (json['feedConversionRatio'] as num).toDouble(),
      mortalityPercentage: (json['mortalityPercentage'] as num).toDouble(),
      harvestEfficiency: (json['harvestEfficiency'] as num).toDouble(),
      harvestedBy: json['harvestedBy'] as String?,
      remarks: json['remarks'] as String?,
    );

Map<String, dynamic> _$HarvestRecordModelToJson(_HarvestRecordModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'batchId': instance.batchId,
      'harvestDate': instance.harvestDate,
      'actualHarvestDuration': instance.actualHarvestDuration,
      'grossWeight': instance.grossWeight,
      'netSaleableWeight': instance.netSaleableWeight,
      'rejectedWeight': instance.rejectedWeight,
      'moisturePercentage': instance.moisturePercentage,
      'wastePercentage': instance.wastePercentage,
      'averageCocoonSize': instance.averageCocoonSize,
      'gradeAWeight': instance.gradeAWeight,
      'gradeBWeight': instance.gradeBWeight,
      'gradeCWeight': instance.gradeCWeight,
      'yieldPercentage': instance.yieldPercentage,
      'survivalRate': instance.survivalRate,
      'feedConversionRatio': instance.feedConversionRatio,
      'mortalityPercentage': instance.mortalityPercentage,
      'harvestEfficiency': instance.harvestEfficiency,
      'harvestedBy': instance.harvestedBy,
      'remarks': instance.remarks,
    };
