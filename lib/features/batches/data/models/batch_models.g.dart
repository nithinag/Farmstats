// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'batch_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_BatchModel _$BatchModelFromJson(Map<String, dynamic> json) => _BatchModel(
      id: json['id'] as String,
      batchName: json['batchName'] as String,
      startDate: json['startDate'] as String,
      expectedHarvestDate: json['expectedHarvestDate'] as String,
      actualHarvestDate: json['actualHarvestDate'] as String?,
      silkwormVariety: json['silkwormVariety'] as String,
      eggSource: json['eggSource'] as String,
      numberOfDfls: (json['numberOfDfls'] as num).toInt(),
      dflPrice: (json['dflPrice'] as num?)?.toDouble(),
      mulberryVariety: json['mulberryVariety'] as String,
      rearingHouse: json['rearingHouse'] as String,
      currentStage: json['currentStage'] as String,
      currentAgeDays: (json['currentAgeDays'] as num).toInt(),
      status: json['status'] as String,
      healthStatus: json['healthStatus'] as String,
      temperature: (json['temperature'] as num).toDouble(),
      humidity: (json['humidity'] as num).toDouble(),
      notes: json['notes'] as String?,
    );

Map<String, dynamic> _$BatchModelToJson(_BatchModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'batchName': instance.batchName,
      'startDate': instance.startDate,
      'expectedHarvestDate': instance.expectedHarvestDate,
      'actualHarvestDate': instance.actualHarvestDate,
      'silkwormVariety': instance.silkwormVariety,
      'eggSource': instance.eggSource,
      'numberOfDfls': instance.numberOfDfls,
      'dflPrice': instance.dflPrice,
      'mulberryVariety': instance.mulberryVariety,
      'rearingHouse': instance.rearingHouse,
      'currentStage': instance.currentStage,
      'currentAgeDays': instance.currentAgeDays,
      'status': instance.status,
      'healthStatus': instance.healthStatus,
      'temperature': instance.temperature,
      'humidity': instance.humidity,
      'notes': instance.notes,
    };

_BatchTimelineEventModel _$BatchTimelineEventModelFromJson(
        Map<String, dynamic> json) =>
    _BatchTimelineEventModel(
      id: json['id'] as String,
      batchId: json['batchId'] as String,
      timestamp: json['timestamp'] as String,
      eventType: json['eventType'] as String,
      description: json['description'] as String,
    );

Map<String, dynamic> _$BatchTimelineEventModelToJson(
        _BatchTimelineEventModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'batchId': instance.batchId,
      'timestamp': instance.timestamp,
      'eventType': instance.eventType,
      'description': instance.description,
    };
