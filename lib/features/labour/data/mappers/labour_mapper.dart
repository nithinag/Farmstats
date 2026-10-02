import '../../domain/entities/labour_entities.dart';
import '../models/labour_models.dart';

class LabourMapper {
  static LabourWorker fromWorkerModel(LabourWorkerModel model) {
    return LabourWorker(
      id: model.id,
      fullName: model.fullName,
      phoneNumber: model.phoneNumber,
      address: model.address,
      role: WorkerRole.values.firstWhere((e) => e.name == model.role),
      dailyWage: model.dailyWage,
      joiningDate: DateTime.parse(model.joiningDate),
      status: WorkerStatus.values.firstWhere((e) => e.name == model.status),
      emergencyContact: model.emergencyContact,
      notes: model.notes,
    );
  }

  static LabourWorkerModel toWorkerModel(LabourWorker entity) {
    return LabourWorkerModel(
      id: entity.id,
      fullName: entity.fullName,
      phoneNumber: entity.phoneNumber,
      address: entity.address,
      role: entity.role.name,
      dailyWage: entity.dailyWage,
      joiningDate: entity.joiningDate.toIso8601String(),
      status: entity.status.name,
      emergencyContact: entity.emergencyContact,
      notes: entity.notes,
    );
  }

  static Attendance fromAttendanceModel(AttendanceModel model) {
    return Attendance(
      id: model.id,
      workerId: model.workerId,
      date: DateTime.parse(model.date),
      checkIn: model.checkIn != null ? DateTime.parse(model.checkIn!) : null,
      checkOut: model.checkOut != null ? DateTime.parse(model.checkOut!) : null,
      hoursWorked: model.hoursWorked,
      overtimeHours: model.overtimeHours,
      leaveStatus: LeaveStatus.values.firstWhere((e) => e.name == model.leaveStatus),
      remarks: model.remarks,
    );
  }

  static AttendanceModel toAttendanceModel(Attendance entity) {
    return AttendanceModel(
      id: entity.id,
      workerId: entity.workerId,
      date: entity.date.toIso8601String(),
      checkIn: entity.checkIn?.toIso8601String(),
      checkOut: entity.checkOut?.toIso8601String(),
      hoursWorked: entity.hoursWorked,
      overtimeHours: entity.overtimeHours,
      leaveStatus: entity.leaveStatus.name,
      remarks: entity.remarks,
    );
  }

  static WorkAssignment fromAssignmentModel(WorkAssignmentModel model) {
    return WorkAssignment(
      id: model.id,
      workerId: model.workerId,
      batchId: model.batchId,
      task: TaskType.values.firstWhere((e) => e.name == model.task),
      startTime: DateTime.parse(model.startTime),
      endTime: model.endTime != null ? DateTime.parse(model.endTime!) : null,
      durationHours: model.durationHours,
      status: AssignmentStatus.values.firstWhere((e) => e.name == model.status),
    );
  }

  static WorkAssignmentModel toAssignmentModel(WorkAssignment entity) {
    return WorkAssignmentModel(
      id: entity.id,
      workerId: entity.workerId,
      batchId: entity.batchId,
      task: entity.task.name,
      startTime: entity.startTime.toIso8601String(),
      endTime: entity.endTime?.toIso8601String(),
      durationHours: entity.durationHours,
      status: entity.status.name,
    );
  }

  static WageRecord fromWageModel(WageRecordModel model) {
    return WageRecord(
      id: model.id,
      workerId: model.workerId,
      baseWage: model.baseWage,
      overtimePay: model.overtimePay,
      bonuses: model.bonuses,
      deductions: model.deductions,
      netPay: model.netPay,
      paymentDate: DateTime.parse(model.paymentDate),
      paymentMethod: PaymentMethod.values.firstWhere((e) => e.name == model.paymentMethod),
      referenceNotes: model.referenceNotes,
    );
  }

  static WageRecordModel toWageModel(WageRecord entity) {
    return WageRecordModel(
      id: entity.id,
      workerId: entity.workerId,
      baseWage: entity.baseWage,
      overtimePay: entity.overtimePay,
      bonuses: entity.bonuses,
      deductions: entity.deductions,
      netPay: entity.netPay,
      paymentDate: entity.paymentDate.toIso8601String(),
      paymentMethod: entity.paymentMethod.name,
      referenceNotes: entity.referenceNotes,
    );
  }
}
