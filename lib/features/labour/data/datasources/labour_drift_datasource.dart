import '../../../../data/database/app_database.dart';
import '../../../../data/database/daos/labour_dao.dart';
import '../models/labour_models.dart';
import 'i_labour_datasource.dart';
import 'package:uuid/uuid.dart';

class LabourDriftDataSourceImpl implements ILabourDataSource {
  final LabourDao _dao;

  LabourDriftDataSourceImpl(this._dao);

  LabourWorkerModel _mapWorker(WorkerDbModel dbModel) {
    return LabourWorkerModel(
      id: dbModel.id,
      fullName: dbModel.fullName,
      phoneNumber: dbModel.phoneNumber,
      address: dbModel.address,
      role: dbModel.role,
      dailyWage: dbModel.dailyWage,
      joiningDate: dbModel.joiningDate.toIso8601String(),
      status: dbModel.status,
      emergencyContact: dbModel.emergencyContact,
      notes: dbModel.notes,
    );
  }

  WorkerDbModel _mapToWorkerDbModel(LabourWorkerModel model) {
    return WorkerDbModel(
      id: model.id,
      fullName: model.fullName,
      phoneNumber: model.phoneNumber,
      address: model.address,
      role: model.role,
      dailyWage: model.dailyWage,
      joiningDate: DateTime.parse(model.joiningDate),
      status: model.status,
      emergencyContact: model.emergencyContact,
      notes: model.notes,
    );
  }

  AttendanceModel _mapAttendance(AttendanceDbModel dbModel) {
    return AttendanceModel(
      id: dbModel.id,
      workerId: dbModel.workerId,
      date: dbModel.date.toIso8601String(),
      checkIn: dbModel.checkIn?.toIso8601String(),
      checkOut: dbModel.checkOut?.toIso8601String(),
      hoursWorked: dbModel.hoursWorked,
      overtimeHours: dbModel.overtimeHours,
      leaveStatus: dbModel.leaveStatus,
      remarks: dbModel.remarks,
    );
  }

  AttendanceDbModel _mapToAttendanceDbModel(AttendanceModel model) {
    return AttendanceDbModel(
      id: model.id,
      workerId: model.workerId,
      date: DateTime.parse(model.date),
      checkIn: model.checkIn != null ? DateTime.parse(model.checkIn!) : null,
      checkOut: model.checkOut != null ? DateTime.parse(model.checkOut!) : null,
      hoursWorked: model.hoursWorked,
      overtimeHours: model.overtimeHours,
      leaveStatus: model.leaveStatus,
      remarks: model.remarks,
    );
  }

  WorkAssignmentModel _mapAssignment(AssignmentDbModel dbModel) {
    return WorkAssignmentModel(
      id: dbModel.id,
      workerId: dbModel.workerId,
      batchId: dbModel.batchId,
      task: dbModel.task,
      startTime: dbModel.startTime.toIso8601String(),
      endTime: dbModel.endTime?.toIso8601String(),
      durationHours: dbModel.durationHours,
      status: dbModel.status,
    );
  }

  AssignmentDbModel _mapToAssignmentDbModel(WorkAssignmentModel model) {
    return AssignmentDbModel(
      id: model.id,
      workerId: model.workerId,
      batchId: model.batchId,
      task: model.task,
      startTime: DateTime.parse(model.startTime),
      endTime: model.endTime != null ? DateTime.parse(model.endTime!) : null,
      durationHours: model.durationHours,
      status: model.status,
    );
  }

  WageRecordModel _mapWage(WageDbModel dbModel) {
    return WageRecordModel(
      id: dbModel.id,
      workerId: dbModel.workerId,
      baseWage: dbModel.baseWage,
      overtimePay: dbModel.overtimePay,
      bonuses: dbModel.bonuses,
      deductions: dbModel.deductions,
      netPay: dbModel.netPay,
      paymentDate: dbModel.paymentDate.toIso8601String(),
      paymentMethod: dbModel.paymentMethod,
      referenceNotes: dbModel.referenceNotes,
    );
  }

  WageDbModel _mapToWageDbModel(WageRecordModel model) {
    return WageDbModel(
      id: model.id,
      workerId: model.workerId,
      baseWage: model.baseWage,
      overtimePay: model.overtimePay,
      bonuses: model.bonuses,
      deductions: model.deductions,
      netPay: model.netPay,
      paymentDate: DateTime.parse(model.paymentDate),
      paymentMethod: model.paymentMethod,
      referenceNotes: model.referenceNotes,
    );
  }

  @override
  Future<List<LabourWorkerModel>> getWorkers() async {
    final rows = await _dao.getAllWorkers();
    return rows.map(_mapWorker).toList();
  }

  @override
  Future<LabourWorkerModel?> getWorkerById(String id) async {
    final row = await _dao.getWorkerById(id);
    return row != null ? _mapWorker(row) : null;
  }

  @override
  Future<void> addWorker(LabourWorkerModel worker) async {
    await _dao.insertWorker(_mapToWorkerDbModel(worker));
  }

  @override
  Future<void> updateWorker(LabourWorkerModel worker) async {
    await _dao.updateWorker(_mapToWorkerDbModel(worker));
  }

  @override
  Future<List<AttendanceModel>> getAttendance(String workerId) async {
    final rows = await _dao.getAttendanceByWorker(workerId);
    return rows.map(_mapAttendance).toList();
  }

  @override
  Future<void> logAttendance(AttendanceModel attendance) async {
    await _dao.insertAttendance(_mapToAttendanceDbModel(attendance));
  }

  @override
  Future<List<WorkAssignmentModel>> getAssignments(String workerId) async {
    final rows = await _dao.getAssignmentsByWorker(workerId);
    return rows.map(_mapAssignment).toList();
  }

  @override
  Future<void> assignTask(WorkAssignmentModel assignment) async {
    await _dao.insertAssignment(_mapToAssignmentDbModel(assignment));
  }

  @override
  Future<void> payWage(WageRecordModel wage) async {
    final wageDb = _mapToWageDbModel(wage);
    
    // Auto-create the integrated Expense entry
    final expenseDb = ExpenseDbModel(
      id: const Uuid().v4(),
      categoryId: 'labour_cat_id', // Would normally map to an actual category ID
      amount: wage.netPay,
      date: DateTime.parse(wage.paymentDate),
      paymentMethod: wage.paymentMethod,
      description: 'Automated wage payment for worker ${wage.workerId}. Ref: ${wage.referenceNotes ?? ''}',
      batchId: null,
      receiptUrl: null,
    );
    
    await _dao.payWageAndRecordExpense(wageDb, expenseDb);
  }

  @override
  Future<List<WageRecordModel>> getWages(String workerId) async {
    final rows = await _dao.getWagesByWorker(workerId);
    return rows.map(_mapWage).toList();
  }
}
