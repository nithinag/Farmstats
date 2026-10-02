// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'labour_dao.dart';

// ignore_for_file: type=lint
mixin _$LabourDaoMixin on DatabaseAccessor<AppDatabase> {
  $WorkersTableTable get workersTable => attachedDatabase.workersTable;
  $AttendanceTableTable get attendanceTable => attachedDatabase.attendanceTable;
  $AssignmentsTableTable get assignmentsTable =>
      attachedDatabase.assignmentsTable;
  $WagesTableTable get wagesTable => attachedDatabase.wagesTable;
  $ExpenseCategoriesTableTable get expenseCategoriesTable =>
      attachedDatabase.expenseCategoriesTable;
  $BatchesTableTable get batchesTable => attachedDatabase.batchesTable;
  $ExpensesTableTable get expensesTable => attachedDatabase.expensesTable;
  LabourDaoManager get managers => LabourDaoManager(this);
}

class LabourDaoManager {
  final _$LabourDaoMixin _db;
  LabourDaoManager(this._db);
  $$WorkersTableTableTableManager get workersTable =>
      $$WorkersTableTableTableManager(_db.attachedDatabase, _db.workersTable);
  $$AttendanceTableTableTableManager get attendanceTable =>
      $$AttendanceTableTableTableManager(
          _db.attachedDatabase, _db.attendanceTable);
  $$AssignmentsTableTableTableManager get assignmentsTable =>
      $$AssignmentsTableTableTableManager(
          _db.attachedDatabase, _db.assignmentsTable);
  $$WagesTableTableTableManager get wagesTable =>
      $$WagesTableTableTableManager(_db.attachedDatabase, _db.wagesTable);
  $$ExpenseCategoriesTableTableTableManager get expenseCategoriesTable =>
      $$ExpenseCategoriesTableTableTableManager(
          _db.attachedDatabase, _db.expenseCategoriesTable);
  $$BatchesTableTableTableManager get batchesTable =>
      $$BatchesTableTableTableManager(_db.attachedDatabase, _db.batchesTable);
  $$ExpensesTableTableTableManager get expensesTable =>
      $$ExpensesTableTableTableManager(_db.attachedDatabase, _db.expensesTable);
}
