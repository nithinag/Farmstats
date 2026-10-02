import 'package:freezed_annotation/freezed_annotation.dart';

part 'feeding_entities.freezed.dart';

enum LeafType { v1, m5, s36, g4, other }
enum InstarStage { first, second, third, fourth, fifth, spinning, cocoon }

@freezed
abstract class FeedingLog with _$FeedingLog {
  const factory FeedingLog({
    required String id,
    required String batchId,
    required DateTime date,
    required String time,
    required LeafType leafType,
    required String leafAge,
    required double leafQuantity,
    required int feedingRound,
    String? workerId,
    String? remarks,
  }) = _FeedingLog;
}

@freezed
abstract class EnvironmentalReading with _$EnvironmentalReading {
  const factory EnvironmentalReading({
    required String id,
    required String batchId,
    required DateTime timestamp,
    required double temperature,
    required double humidity,
    required bool ventilationStatus,
    String? weatherNotes,
  }) = _EnvironmentalReading;
}

@freezed
abstract class HealthObservation with _$HealthObservation {
  const factory HealthObservation({
    required String id,
    required String batchId,
    required DateTime date,
    required String disease,
    required String symptoms,
    required String severity,
  }) = _HealthObservation;
}

@freezed
abstract class Treatment with _$Treatment {
  const factory Treatment({
    required String id,
    required String batchId,
    required String observationId,
    required DateTime date,
    required String medicine,
    required double dosage,
    required String recoveryStatus,
    String? workerId,
  }) = _Treatment;
}

@freezed
abstract class MortalityRecord with _$MortalityRecord {
  const factory MortalityRecord({
    required String id,
    required String batchId,
    required DateTime date,
    required int deadCount,
    required String reason,
    String? workerId,
    String? remarks,
  }) = _MortalityRecord;
}

@freezed
abstract class StageProgress with _$StageProgress {
  const factory StageProgress({
    required String id,
    required String batchId,
    required InstarStage instar,
    required DateTime dateStarted,
    DateTime? dateCompleted,
    DateTime? expectedNextStage,
  }) = _StageProgress;
}
