import '../../domain/entities/feeding_entities.dart';
import '../models/feeding_models.dart';

class FeedingMapper {
  static FeedingLog fromFeedingLogModel(FeedingLogModel model) {
    return FeedingLog(
      id: model.id,
      batchId: model.batchId,
      date: DateTime.parse(model.date),
      time: model.time,
      leafType: LeafType.values.firstWhere((e) => e.name == model.leafType, orElse: () => LeafType.other),
      leafAge: model.leafAge,
      leafQuantity: model.leafQuantity,
      feedingRound: model.feedingRound,
      workerId: model.workerId,
      remarks: model.remarks,
    );
  }

  static FeedingLogModel toFeedingLogModel(FeedingLog entity) {
    return FeedingLogModel(
      id: entity.id,
      batchId: entity.batchId,
      date: entity.date.toIso8601String(),
      time: entity.time,
      leafType: entity.leafType.name,
      leafAge: entity.leafAge,
      leafQuantity: entity.leafQuantity,
      feedingRound: entity.feedingRound,
      workerId: entity.workerId,
      remarks: entity.remarks,
    );
  }

  static EnvironmentalReading fromEnvModel(EnvironmentalReadingModel model) {
    return EnvironmentalReading(
      id: model.id,
      batchId: model.batchId,
      timestamp: DateTime.parse(model.timestamp),
      temperature: model.temperature,
      humidity: model.humidity,
      ventilationStatus: model.ventilationStatus,
      weatherNotes: model.weatherNotes,
    );
  }

  static EnvironmentalReadingModel toEnvModel(EnvironmentalReading entity) {
    return EnvironmentalReadingModel(
      id: entity.id,
      batchId: entity.batchId,
      timestamp: entity.timestamp.toIso8601String(),
      temperature: entity.temperature,
      humidity: entity.humidity,
      ventilationStatus: entity.ventilationStatus,
      weatherNotes: entity.weatherNotes,
    );
  }

  static MortalityRecord fromMortalityModel(MortalityRecordModel model) {
    return MortalityRecord(
      id: model.id,
      batchId: model.batchId,
      date: DateTime.parse(model.date),
      deadCount: model.deadCount,
      reason: model.reason,
      workerId: model.workerId,
      remarks: model.remarks,
    );
  }

  static MortalityRecordModel toMortalityModel(MortalityRecord entity) {
    return MortalityRecordModel(
      id: entity.id,
      batchId: entity.batchId,
      date: entity.date.toIso8601String(),
      deadCount: entity.deadCount,
      reason: entity.reason,
      workerId: entity.workerId,
      remarks: entity.remarks,
    );
  }
}
