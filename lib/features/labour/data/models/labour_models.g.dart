// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'labour_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_LabourWorkerModel _$LabourWorkerModelFromJson(Map<String, dynamic> json) =>
    _LabourWorkerModel(
      id: json['id'] as String,
      fullName: json['fullName'] as String,
      phoneNumber: json['phoneNumber'] as String,
      address: json['address'] as String?,
      role: json['role'] as String,
      dailyWage: (json['dailyWage'] as num).toDouble(),
      joiningDate: json['joiningDate'] as String,
      status: json['status'] as String,
      emergencyContact: json['emergencyContact'] as String?,
      notes: json['notes'] as String?,
    );

Map<String, dynamic> _$LabourWorkerModelToJson(_LabourWorkerModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'fullName': instance.fullName,
      'phoneNumber': instance.phoneNumber,
      'address': instance.address,
      'role': instance.role,
      'dailyWage': instance.dailyWage,
      'joiningDate': instance.joiningDate,
      'status': instance.status,
      'emergencyContact': instance.emergencyContact,
      'notes': instance.notes,
    };

_AttendanceModel _$AttendanceModelFromJson(Map<String, dynamic> json) =>
    _AttendanceModel(
      id: json['id'] as String,
      workerId: json['workerId'] as String,
      date: json['date'] as String,
      checkIn: json['checkIn'] as String?,
      checkOut: json['checkOut'] as String?,
      hoursWorked: (json['hoursWorked'] as num).toDouble(),
      overtimeHours: (json['overtimeHours'] as num).toDouble(),
      leaveStatus: json['leaveStatus'] as String,
      remarks: json['remarks'] as String?,
    );

Map<String, dynamic> _$AttendanceModelToJson(_AttendanceModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'workerId': instance.workerId,
      'date': instance.date,
      'checkIn': instance.checkIn,
      'checkOut': instance.checkOut,
      'hoursWorked': instance.hoursWorked,
      'overtimeHours': instance.overtimeHours,
      'leaveStatus': instance.leaveStatus,
      'remarks': instance.remarks,
    };

_WorkAssignmentModel _$WorkAssignmentModelFromJson(Map<String, dynamic> json) =>
    _WorkAssignmentModel(
      id: json['id'] as String,
      workerId: json['workerId'] as String,
      batchId: json['batchId'] as String?,
      task: json['task'] as String,
      startTime: json['startTime'] as String,
      endTime: json['endTime'] as String?,
      durationHours: (json['durationHours'] as num?)?.toDouble(),
      status: json['status'] as String,
    );

Map<String, dynamic> _$WorkAssignmentModelToJson(
        _WorkAssignmentModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'workerId': instance.workerId,
      'batchId': instance.batchId,
      'task': instance.task,
      'startTime': instance.startTime,
      'endTime': instance.endTime,
      'durationHours': instance.durationHours,
      'status': instance.status,
    };

_WageRecordModel _$WageRecordModelFromJson(Map<String, dynamic> json) =>
    _WageRecordModel(
      id: json['id'] as String,
      workerId: json['workerId'] as String,
      baseWage: (json['baseWage'] as num).toDouble(),
      overtimePay: (json['overtimePay'] as num).toDouble(),
      bonuses: (json['bonuses'] as num).toDouble(),
      deductions: (json['deductions'] as num).toDouble(),
      netPay: (json['netPay'] as num).toDouble(),
      paymentDate: json['paymentDate'] as String,
      paymentMethod: json['paymentMethod'] as String,
      referenceNotes: json['referenceNotes'] as String?,
    );

Map<String, dynamic> _$WageRecordModelToJson(_WageRecordModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'workerId': instance.workerId,
      'baseWage': instance.baseWage,
      'overtimePay': instance.overtimePay,
      'bonuses': instance.bonuses,
      'deductions': instance.deductions,
      'netPay': instance.netPay,
      'paymentDate': instance.paymentDate,
      'paymentMethod': instance.paymentMethod,
      'referenceNotes': instance.referenceNotes,
    };
