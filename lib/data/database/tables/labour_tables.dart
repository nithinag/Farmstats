import 'package:drift/drift.dart';

@DataClassName('WorkerDbModel')
class WorkersTable extends Table {
  TextColumn get id => text()();
  TextColumn get fullName => text()();
  TextColumn get phoneNumber => text()();
  TextColumn get address => text().nullable()();
  TextColumn get role => text()();
  RealColumn get dailyWage => real()();
  DateTimeColumn get joiningDate => dateTime()();
  TextColumn get status => text()();
  TextColumn get emergencyContact => text().nullable()();
  TextColumn get notes => text().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}

@DataClassName('AttendanceDbModel')
class AttendanceTable extends Table {
  TextColumn get id => text()();
  TextColumn get workerId => text().references(WorkersTable, #id, onDelete: KeyAction.cascade)();
  DateTimeColumn get date => dateTime()();
  DateTimeColumn get checkIn => dateTime().nullable()();
  DateTimeColumn get checkOut => dateTime().nullable()();
  RealColumn get hoursWorked => real().withDefault(const Constant(0.0))();
  RealColumn get overtimeHours => real().withDefault(const Constant(0.0))();
  TextColumn get leaveStatus => text()();
  TextColumn get remarks => text().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}

@DataClassName('AssignmentDbModel')
class AssignmentsTable extends Table {
  TextColumn get id => text()();
  TextColumn get workerId => text().references(WorkersTable, #id, onDelete: KeyAction.cascade)();
  TextColumn get batchId => text().nullable()(); // Reference to BatchesTable but decoupled
  TextColumn get task => text()();
  DateTimeColumn get startTime => dateTime()();
  DateTimeColumn get endTime => dateTime().nullable()();
  RealColumn get durationHours => real().nullable()();
  TextColumn get status => text()();

  @override
  Set<Column> get primaryKey => {id};
}

@DataClassName('WageDbModel')
class WagesTable extends Table {
  TextColumn get id => text()();
  TextColumn get workerId => text().references(WorkersTable, #id, onDelete: KeyAction.cascade)();
  RealColumn get baseWage => real()();
  RealColumn get overtimePay => real()();
  RealColumn get bonuses => real()();
  RealColumn get deductions => real()();
  RealColumn get netPay => real()();
  DateTimeColumn get paymentDate => dateTime()();
  TextColumn get paymentMethod => text()();
  TextColumn get referenceNotes => text().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}
