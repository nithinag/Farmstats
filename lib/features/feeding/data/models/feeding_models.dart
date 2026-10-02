import 'package:freezed_annotation/freezed_annotation.dart';

part 'feeding_models.freezed.dart';
part 'feeding_models.g.dart';

@freezed
abstract class FeedingLogModel with _$FeedingLogModel {
  const factory FeedingLogModel({
    required String id,
    required String batchId,
    required String date,
    required String time,
    required String leafType,
    required String leafAge,
    required double leafQuantity,
    required int feedingRound,
    String? workerId,
    String? remarks,
  }) = _FeedingLogModel;

  factory FeedingLogModel.fromJson(Map<String, dynamic> json) => _$FeedingLogModelFromJson(json);
}

@freezed
abstract class EnvironmentalReadingModel with _$EnvironmentalReadingModel {
  const factory EnvironmentalReadingModel({
    required String id,
    required String batchId,
    required String timestamp,
    required double temperature,
    required double humidity,
    required bool ventilationStatus,
    String? weatherNotes,
  }) = _EnvironmentalReadingModel;

  factory EnvironmentalReadingModel.fromJson(Map<String, dynamic> json) => _$EnvironmentalReadingModelFromJson(json);
}

@freezed
abstract class HealthObservationModel with _$HealthObservationModel {
  const factory HealthObservationModel({
    required String id,
    required String batchId,
    required String date,
    required String disease,
    required String symptoms,
    required String severity,
  }) = _HealthObservationModel;

  factory HealthObservationModel.fromJson(Map<String, dynamic> json) => _$HealthObservationModelFromJson(json);
}

@freezed
abstract class TreatmentModel with _$TreatmentModel {
  const factory TreatmentModel({
    required String id,
    required String batchId,
    required String observationId,
    required String date,
    required String medicine,
    required double dosage,
    required String recoveryStatus,
    String? workerId,
  }) = _TreatmentModel;

  factory TreatmentModel.fromJson(Map<String, dynamic> json) => _$TreatmentModelFromJson(json);
}

@freezed
abstract class MortalityRecordModel with _$MortalityRecordModel {
  const factory MortalityRecordModel({
    required String id,
    required String batchId,
    required String date,
    required int deadCount,
    required String reason,
    String? workerId,
    String? remarks,
  }) = _MortalityRecordModel;

  factory MortalityRecordModel.fromJson(Map<String, dynamic> json) => _$MortalityRecordModelFromJson(json);
}

@freezed
abstract class StageProgressModel with _$StageProgressModel {
  const factory StageProgressModel({
    required String id,
    required String batchId,
    required String instar,
    required String dateStarted,
    String? dateCompleted,
    String? expectedNextStage,
  }) = _StageProgressModel;

  factory StageProgressModel.fromJson(Map<String, dynamic> json) => _$StageProgressModelFromJson(json);
}
