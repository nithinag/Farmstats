import 'package:drift/drift.dart';
import '../app_database.dart';
import '../tables/labour_tables.dart';
import '../tables/expense_tables.dart';

part 'labour_dao.g.dart';

@DriftAccessor(tables: [WorkersTable, AttendanceTable, AssignmentsTable, WagesTable, ExpensesTable])
class LabourDao extends DatabaseAccessor<AppDatabase> with _$LabourDaoMixin {
  LabourDao(super.db);

  Future<List<WorkerDbModel>> getAllWorkers() async {
    return await select(workersTable).get();
  }

  Future<WorkerDbModel?> getWorkerById(String id) async {
    return await (select(workersTable)..where((t) => t.id.equals(id))).getSingleOrNull();
  }

  Future<void> insertWorker(WorkerDbModel worker) async {
    await into(workersTable).insert(worker, mode: InsertMode.replace);
  }

  Future<void> updateWorker(WorkerDbModel worker) async {
    await update(workersTable).replace(worker);
  }

  Future<List<AttendanceDbModel>> getAttendanceByWorker(String workerId) async {
    return await (select(attendanceTable)..where((t) => t.workerId.equals(workerId))..orderBy([(t) => OrderingTerm.desc(t.date)])).get();
  }

  Future<void> insertAttendance(AttendanceDbModel attendance) async {
    await into(attendanceTable).insert(attendance, mode: InsertMode.replace);
  }

  Future<List<AssignmentDbModel>> getAssignmentsByWorker(String workerId) async {
    return await (select(assignmentsTable)..where((t) => t.workerId.equals(workerId))..orderBy([(t) => OrderingTerm.desc(t.startTime)])).get();
  }

  Future<void> insertAssignment(AssignmentDbModel assignment) async {
    await into(assignmentsTable).insert(assignment, mode: InsertMode.replace);
  }

  Future<List<WageDbModel>> getWagesByWorker(String workerId) async {
    return await (select(wagesTable)..where((t) => t.workerId.equals(workerId))..orderBy([(t) => OrderingTerm.desc(t.paymentDate)])).get();
  }

  /// Transactionally inserts a wage record AND an expense record.
  Future<void> payWageAndRecordExpense(WageDbModel wage, ExpenseDbModel expense) async {
    await transaction(() async {
      await into(wagesTable).insert(wage, mode: InsertMode.replace);
      await into(expensesTable).insert(expense, mode: InsertMode.replace);
    });
  }
}
