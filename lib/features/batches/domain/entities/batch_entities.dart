import 'package:freezed_annotation/freezed_annotation.dart';

part 'batch_entities.freezed.dart';

enum BatchStatus { planned, active, harvested, completed, cancelled }

enum InstarStage { first, second, third, fourth, fifth, spinning }

enum HealthStatus { excellent, good, fair, poor, critical }

@freezed
abstract class Batch with _$Batch {
  const factory Batch({
    required String id,
    required String batchName,
    required DateTime startDate,
    required DateTime expectedHarvestDate,
    DateTime? actualHarvestDate,
    required String silkwormVariety,
    required String eggSource,
    required int numberOfDfls,
    double? dflPrice,
    required String mulberryVariety,
    required String rearingHouse,
    required InstarStage currentStage,
    required int currentAgeDays,
    required BatchStatus status,
    required HealthStatus healthStatus,
    required double temperature,
    required double humidity,
    String? notes,
  }) = _Batch;
}

@freezed
abstract class BatchTimelineEvent with _$BatchTimelineEvent {
  const factory BatchTimelineEvent({
    required String id,
    required String batchId,
    required DateTime timestamp,
    required String eventType,
    required String description,
  }) = _BatchTimelineEvent;
}

@freezed
abstract class BatchFilter with _$BatchFilter {
  const factory BatchFilter({
    List<BatchStatus>? statuses,
    String? rearingHouse,
    String? silkwormVariety,
    DateTime? startDateAfter,
    DateTime? startDateBefore,
  }) = _BatchFilter;
}
