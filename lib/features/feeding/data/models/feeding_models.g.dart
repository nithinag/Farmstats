// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feeding_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_FeedingLogModel _$FeedingLogModelFromJson(Map<String, dynamic> json) =>
    _FeedingLogModel(
      id: json['id'] as String,
      batchId: json['batchId'] as String,
      date: json['date'] as String,
      time: json['time'] as String,
      leafType: json['leafType'] as String,
      leafAge: json['leafAge'] as String,
      leafQuantity: (json['leafQuantity'] as num).toDouble(),
      feedingRound: (json['feedingRound'] as num).toInt(),
      workerId: json['workerId'] as String?,
      remarks: json['remarks'] as String?,
    );

Map<String, dynamic> _$FeedingLogModelToJson(_FeedingLogModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'batchId': instance.batchId,
      'date': instance.date,
      'time': instance.time,
      'leafType': instance.leafType,
      'leafAge': instance.leafAge,
      'leafQuantity': instance.leafQuantity,
      'feedingRound': instance.feedingRound,
      'workerId': instance.workerId,
      'remarks': instance.remarks,
    };

_EnvironmentalReadingModel _$EnvironmentalReadingModelFromJson(
        Map<String, dynamic> json) =>
    _EnvironmentalReadingModel(
      id: json['id'] as String,
      batchId: json['batchId'] as String,
      timestamp: json['timestamp'] as String,
      temperature: (json['temperature'] as num).toDouble(),
      humidity: (json['humidity'] as num).toDouble(),
      ventilationStatus: json['ventilationStatus'] as bool,
      weatherNotes: json['weatherNotes'] as String?,
    );

Map<String, dynamic> _$EnvironmentalReadingModelToJson(
        _EnvironmentalReadingModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'batchId': instance.batchId,
      'timestamp': instance.timestamp,
      'temperature': instance.temperature,
      'humidity': instance.humidity,
      'ventilationStatus': instance.ventilationStatus,
      'weatherNotes': instance.weatherNotes,
    };

_HealthObservationModel _$HealthObservationModelFromJson(
        Map<String, dynamic> json) =>
    _HealthObservationModel(
      id: json['id'] as String,
      batchId: json['batchId'] as String,
      date: json['date'] as String,
      disease: json['disease'] as String,
      symptoms: json['symptoms'] as String,
      severity: json['severity'] as String,
    );

Map<String, dynamic> _$HealthObservationModelToJson(
        _HealthObservationModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'batchId': instance.batchId,
      'date': instance.date,
      'disease': instance.disease,
      'symptoms': instance.symptoms,
      'severity': instance.severity,
    };

_TreatmentModel _$TreatmentModelFromJson(Map<String, dynamic> json) =>
    _TreatmentModel(
      id: json['id'] as String,
      batchId: json['batchId'] as String,
      observationId: json['observationId'] as String,
      date: json['date'] as String,
      medicine: json['medicine'] as String,
      dosage: (json['dosage'] as num).toDouble(),
      recoveryStatus: json['recoveryStatus'] as String,
      workerId: json['workerId'] as String?,
    );

Map<String, dynamic> _$TreatmentModelToJson(_TreatmentModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'batchId': instance.batchId,
      'observationId': instance.observationId,
      'date': instance.date,
      'medicine': instance.medicine,
      'dosage': instance.dosage,
      'recoveryStatus': instance.recoveryStatus,
      'workerId': instance.workerId,
    };

_MortalityRecordModel _$MortalityRecordModelFromJson(
        Map<String, dynamic> json) =>
    _MortalityRecordModel(
      id: json['id'] as String,
      batchId: json['batchId'] as String,
      date: json['date'] as String,
      deadCount: (json['deadCount'] as num).toInt(),
      reason: json['reason'] as String,
      workerId: json['workerId'] as String?,
      remarks: json['remarks'] as String?,
    );

Map<String, dynamic> _$MortalityRecordModelToJson(
        _MortalityRecordModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'batchId': instance.batchId,
      'date': instance.date,
      'deadCount': instance.deadCount,
      'reason': instance.reason,
      'workerId': instance.workerId,
      'remarks': instance.remarks,
    };

_StageProgressModel _$StageProgressModelFromJson(Map<String, dynamic> json) =>
    _StageProgressModel(
      id: json['id'] as String,
      batchId: json['batchId'] as String,
      instar: json['instar'] as String,
      dateStarted: json['dateStarted'] as String,
      dateCompleted: json['dateCompleted'] as String?,
      expectedNextStage: json['expectedNextStage'] as String?,
    );

Map<String, dynamic> _$StageProgressModelToJson(_StageProgressModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'batchId': instance.batchId,
      'instar': instance.instar,
      'dateStarted': instance.dateStarted,
      'dateCompleted': instance.dateCompleted,
      'expectedNextStage': instance.expectedNextStage,
    };
