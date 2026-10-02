import '../../domain/entities/batch_entities.dart';
import '../models/batch_models.dart';

class BatchMapper {
  static Batch fromModel(BatchModel model) {
    DateTime parseDate(String? dateStr, DateTime fallback) {
      if (dateStr == null || dateStr.trim().isEmpty) return fallback;
      try {
        return DateTime.parse(dateStr);
      } catch (_) {
        return fallback;
      }
    }

    final start = parseDate(model.startDate, DateTime.now());
    final expectedHarvest = parseDate(model.expectedHarvestDate, start.add(const Duration(days: 30)));
    final actualHarvest = model.actualHarvestDate != null && model.actualHarvestDate!.isNotEmpty
        ? parseDate(model.actualHarvestDate, expectedHarvest)
        : null;

    final currentStage = InstarStage.values.firstWhere(
      (e) => e.name.toLowerCase() == model.currentStage.trim().toLowerCase(),
      orElse: () => InstarStage.first,
    );

    final status = BatchStatus.values.firstWhere(
      (e) => e.name.toLowerCase() == model.status.trim().toLowerCase(),
      orElse: () => BatchStatus.active,
    );

    final healthStatus = HealthStatus.values.firstWhere(
      (e) => e.name.toLowerCase() == model.healthStatus.trim().toLowerCase(),
      orElse: () => HealthStatus.good,
    );

    final calculatedAge = DateTime.now().difference(start).inDays + 1;
    final age = model.currentAgeDays > 0 ? model.currentAgeDays : (calculatedAge > 0 ? calculatedAge : 1);

    return Batch(
      id: model.id,
      batchName: model.batchName,
      startDate: start,
      expectedHarvestDate: expectedHarvest,
      actualHarvestDate: actualHarvest,
      silkwormVariety: model.silkwormVariety,
      eggSource: model.eggSource,
      numberOfDfls: model.numberOfDfls,
      dflPrice: model.dflPrice,
      mulberryVariety: model.mulberryVariety,
      rearingHouse: model.rearingHouse,
      currentStage: currentStage,
      currentAgeDays: age,
      status: status,
      healthStatus: healthStatus,
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
