import 'package:freezed_annotation/freezed_annotation.dart';

part 'labour_models.freezed.dart';
part 'labour_models.g.dart';

@freezed
abstract class LabourWorkerModel with _$LabourWorkerModel {
  const factory LabourWorkerModel({
    required String id,
    required String fullName,
    required String phoneNumber,
    String? address,
    required String role,
    required double dailyWage,
    required String joiningDate,
    required String status,
    String? emergencyContact,
    String? notes,
  }) = _LabourWorkerModel;

  factory LabourWorkerModel.fromJson(Map<String, dynamic> json) => _$LabourWorkerModelFromJson(json);
}

@freezed
abstract class AttendanceModel with _$AttendanceModel {
  const factory AttendanceModel({
    required String id,
    required String workerId,
    required String date,
    String? checkIn,
    String? checkOut,
    required double hoursWorked,
    required double overtimeHours,
    required String leaveStatus,
    String? remarks,
  }) = _AttendanceModel;

  factory AttendanceModel.fromJson(Map<String, dynamic> json) => _$AttendanceModelFromJson(json);
}

@freezed
abstract class WorkAssignmentModel with _$WorkAssignmentModel {
  const factory WorkAssignmentModel({
    required String id,
    required String workerId,
    String? batchId,
    required String task,
    required String startTime,
    String? endTime,
    double? durationHours,
    required String status,
  }) = _WorkAssignmentModel;

  factory WorkAssignmentModel.fromJson(Map<String, dynamic> json) => _$WorkAssignmentModelFromJson(json);
}

@freezed
abstract class WageRecordModel with _$WageRecordModel {
  const factory WageRecordModel({
    required String id,
    required String workerId,
    required double baseWage,
    required double overtimePay,
    required double bonuses,
    required double deductions,
    required double netPay,
    required String paymentDate,
    required String paymentMethod,
    String? referenceNotes,
  }) = _WageRecordModel;

  factory WageRecordModel.fromJson(Map<String, dynamic> json) => _$WageRecordModelFromJson(json);
}
