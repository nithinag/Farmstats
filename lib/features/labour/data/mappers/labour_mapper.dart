import '../../domain/entities/labour_entities.dart';
import '../models/labour_models.dart';

class LabourMapper {
  static LabourWorker fromWorkerModel(LabourWorkerModel model) {
    DateTime parseDate(String? s, DateTime fallback) {
      if (s == null || s.trim().isEmpty) return fallback;
      try {
        return DateTime.parse(s);
      } catch (_) {
        return fallback;
      }
    }

    final role = WorkerRole.values.firstWhere(
      (e) => e.name.toLowerCase() == model.role.trim().toLowerCase(),
      orElse: () => WorkerRole.feeder,
    );

    final status = WorkerStatus.values.firstWhere(
      (e) => e.name.toLowerCase() == model.status.trim().toLowerCase(),
      orElse: () => WorkerStatus.active,
    );

    return LabourWorker(
      id: model.id,
      fullName: model.fullName,
      phoneNumber: model.phoneNumber,
      address: model.address,
      role: role,
      dailyWage: model.dailyWage,
      joiningDate: parseDate(model.joiningDate, DateTime.now()),
      status: status,
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
    DateTime parseDate(String? s, DateTime fallback) {
      if (s == null || s.trim().isEmpty) return fallback;
      try {
        return DateTime.parse(s);
      } catch (_) {
        return fallback;
      }
    }

    final leave = LeaveStatus.values.firstWhere(
      (e) => e.name.toLowerCase() == model.leaveStatus.trim().toLowerCase(),
      orElse: () => LeaveStatus.none,
    );

    return Attendance(
      id: model.id,
      workerId: model.workerId,
      date: parseDate(model.date, DateTime.now()),
      checkIn: model.checkIn != null ? parseDate(model.checkIn, DateTime.now()) : null,
      checkOut: model.checkOut != null ? parseDate(model.checkOut, DateTime.now()) : null,
      hoursWorked: model.hoursWorked,
      overtimeHours: model.overtimeHours,
      leaveStatus: leave,
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
    DateTime parseDate(String? s, DateTime fallback) {
      if (s == null || s.trim().isEmpty) return fallback;
      try {
        return DateTime.parse(s);
      } catch (_) {
        return fallback;
      }
    }

    final task = TaskType.values.firstWhere(
      (e) => e.name.toLowerCase() == model.task.trim().toLowerCase(),
      orElse: () => TaskType.other,
    );

    final status = AssignmentStatus.values.firstWhere(
      (e) => e.name.toLowerCase() == model.status.trim().toLowerCase(),
      orElse: () => AssignmentStatus.pending,
    );

    return WorkAssignment(
      id: model.id,
      workerId: model.workerId,
      batchId: model.batchId,
      task: task,
      startTime: parseDate(model.startTime, DateTime.now()),
      endTime: model.endTime != null ? parseDate(model.endTime, DateTime.now()) : null,
      durationHours: model.durationHours,
      status: status,
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
    DateTime parseDate(String? s, DateTime fallback) {
      if (s == null || s.trim().isEmpty) return fallback;
      try {
        return DateTime.parse(s);
      } catch (_) {
        return fallback;
      }
    }

    final method = PaymentMethod.values.firstWhere(
      (e) => e.name.toLowerCase() == model.paymentMethod.trim().toLowerCase(),
      orElse: () => PaymentMethod.cash,
    );

    return WageRecord(
      id: model.id,
      workerId: model.workerId,
      baseWage: model.baseWage,
      overtimePay: model.overtimePay,
      bonuses: model.bonuses,
      deductions: model.deductions,
      netPay: model.netPay,
      paymentDate: parseDate(model.paymentDate, DateTime.now()),
      paymentMethod: method,
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
