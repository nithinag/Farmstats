import 'package:freezed_annotation/freezed_annotation.dart';

part 'batch_models.freezed.dart';
part 'batch_models.g.dart';

@freezed
abstract class BatchModel with _$BatchModel {
  const factory BatchModel({
    required String id,
    required String batchName,
    required String startDate,
    required String expectedHarvestDate,
    String? actualHarvestDate,
    required String silkwormVariety,
    required String eggSource,
    required int numberOfDfls,
    double? dflPrice,
    required String mulberryVariety,
    required String rearingHouse,
    required String currentStage,
    required int currentAgeDays,
    required String status,
    required String healthStatus,
    required double temperature,
    required double humidity,
    String? notes,
  }) = _BatchModel;

  factory BatchModel.fromJson(Map<String, dynamic> json) => _$BatchModelFromJson(json);
}

@freezed
abstract class BatchTimelineEventModel with _$BatchTimelineEventModel {
  const factory BatchTimelineEventModel({
    required String id,
    required String batchId,
    required String timestamp,
    required String eventType,
    required String description,
  }) = _BatchTimelineEventModel;

  factory BatchTimelineEventModel.fromJson(Map<String, dynamic> json) => _$BatchTimelineEventModelFromJson(json);
}
