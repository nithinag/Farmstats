import 'package:freezed_annotation/freezed_annotation.dart';

part 'labour_entities.freezed.dart';

enum WorkerStatus { active, inactive, onLeave }
enum LeaveStatus { none, halfDay, fullDay, sick }
enum AssignmentStatus { pending, inProgress, completed, cancelled }
enum PaymentMethod { cash, bankTransfer, upi }
enum WorkerRole { supervisor, feeder, cleaner, harvester, maintenance, other }
enum TaskType { feeding, cleaning, disinfection, leafHarvesting, mounting, cocoonHarvest, maintenance, other }

@freezed
abstract class LabourWorker with _$LabourWorker {
  const factory LabourWorker({
    required String id,
    required String fullName,
    required String phoneNumber,
    String? address,
    required WorkerRole role,
    required double dailyWage,
    required DateTime joiningDate,
    required WorkerStatus status,
    String? emergencyContact,
    String? notes,
  }) = _LabourWorker;
}

@freezed
abstract class Attendance with _$Attendance {
  const factory Attendance({
    required String id,
    required String workerId,
    required DateTime date,
    DateTime? checkIn,
    DateTime? checkOut,
    @Default(0.0) double hoursWorked,
    @Default(0.0) double overtimeHours,
    required LeaveStatus leaveStatus,
    String? remarks,
  }) = _Attendance;
}

@freezed
abstract class WorkAssignment with _$WorkAssignment {
  const factory WorkAssignment({
    required String id,
    required String workerId,
    String? batchId,
    required TaskType task,
    required DateTime startTime,
    DateTime? endTime,
    double? durationHours,
    required AssignmentStatus status,
  }) = _WorkAssignment;
}

@freezed
abstract class WageRecord with _$WageRecord {
  const factory WageRecord({
    required String id,
    required String workerId,
    required double baseWage,
    required double overtimePay,
    required double bonuses,
    required double deductions,
    required double netPay,
    required DateTime paymentDate,
    required PaymentMethod paymentMethod,
    String? referenceNotes,
  }) = _WageRecord;
}
