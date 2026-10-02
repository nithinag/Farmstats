import '../../domain/entities/batch_entities.dart';
import '../models/batch_models.dart';

class BatchMapper {
  static Batch fromModel(BatchModel model) {
    return Batch(
      id: model.id,
      batchName: model.batchName,
      startDate: DateTime.parse(model.startDate),
      expectedHarvestDate: DateTime.parse(model.expectedHarvestDate),
      actualHarvestDate: model.actualHarvestDate != null ? DateTime.parse(model.actualHarvestDate!) : null,
      silkwormVariety: model.silkwormVariety,
      eggSource: model.eggSource,
      numberOfDfls: model.numberOfDfls,
      dflPrice: model.dflPrice,
      mulberryVariety: model.mulberryVariety,
      rearingHouse: model.rearingHouse,
      currentStage: InstarStage.values.firstWhere((e) => e.name == model.currentStage),
      currentAgeDays: model.currentAgeDays,
      status: BatchStatus.values.firstWhere((e) => e.name == model.status),
      healthStatus: HealthStatus.values.firstWhere((e) => e.name == model.healthStatus),
      temperature: model.temperature,
      humidity: model.humidity,
      notes: model.notes,
    );
  }

  static BatchModel toModel(Batch entity) {
    return BatchModel(
      id: entity.id,
      batchName: entity.batchName,
      startDate: entity.startDate.toIso8601String(),
      expectedHarvestDate: entity.expectedHarvestDate.toIso8601String(),
      actualHarvestDate: entity.actualHarvestDate?.toIso8601String(),
      silkwormVariety: entity.silkwormVariety,
      eggSource: entity.eggSource,
      numberOfDfls: entity.numberOfDfls,
      dflPrice: entity.dflPrice,
      mulberryVariety: entity.mulberryVariety,
      rearingHouse: entity.rearingHouse,
      currentStage: entity.currentStage.name,
      currentAgeDays: entity.currentAgeDays,
      status: entity.status.name,
      healthStatus: entity.healthStatus.name,
      temperature: entity.temperature,
      humidity: entity.humidity,
      notes: entity.notes,
    );
  }
  
  static BatchTimelineEvent timelineFromModel(BatchTimelineEventModel model) {
    return BatchTimelineEvent(
      id: model.id,
      batchId: model.batchId,
      timestamp: DateTime.parse(model.timestamp),
      eventType: model.eventType,
      description: model.description,
    );
  }
  
  static BatchTimelineEventModel timelineToModel(BatchTimelineEvent entity) {
    return BatchTimelineEventModel(
      id: entity.id,
      batchId: entity.batchId,
      timestamp: entity.timestamp.toIso8601String(),
      eventType: entity.eventType,
      description: entity.description,
    );
  }
}
