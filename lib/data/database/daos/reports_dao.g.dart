// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reports_dao.dart';

// ignore_for_file: type=lint
mixin _$ReportsDaoMixin on DatabaseAccessor<AppDatabase> {
  $ExpenseCategoriesTableTable get expenseCategoriesTable =>
      attachedDatabase.expenseCategoriesTable;
  $BatchesTableTable get batchesTable => attachedDatabase.batchesTable;
  $ExpensesTableTable get expensesTable => attachedDatabase.expensesTable;
  $BuyersTableTable get buyersTable => attachedDatabase.buyersTable;
  $IncomeCategoriesTableTable get incomeCategoriesTable =>
      attachedDatabase.incomeCategoriesTable;
  $IncomesTableTable get incomesTable => attachedDatabase.incomesTable;
  $HarvestsTableTable get harvestsTable => attachedDatabase.harvestsTable;
  ReportsDaoManager get managers => ReportsDaoManager(this);
}

class ReportsDaoManager {
  final _$ReportsDaoMixin _db;
  ReportsDaoManager(this._db);
  $$ExpenseCategoriesTableTableTableManager get expenseCategoriesTable =>
      $$ExpenseCategoriesTableTableTableManager(
          _db.attachedDatabase, _db.expenseCategoriesTable);
  $$BatchesTableTableTableManager get batchesTable =>
      $$BatchesTableTableTableManager(_db.attachedDatabase, _db.batchesTable);
  $$ExpensesTableTableTableManager get expensesTable =>
      $$ExpensesTableTableTableManager(_db.attachedDatabase, _db.expensesTable);
  $$BuyersTableTableTableManager get buyersTable =>
      $$BuyersTableTableTableManager(_db.attachedDatabase, _db.buyersTable);
  $$IncomeCategoriesTableTableTableManager get incomeCategoriesTable =>
      $$IncomeCategoriesTableTableTableManager(
          _db.attachedDatabase, _db.incomeCategoriesTable);
  $$IncomesTableTableTableManager get incomesTable =>
      $$IncomesTableTableTableManager(_db.attachedDatabase, _db.incomesTable);
  $$HarvestsTableTableTableManager get harvestsTable =>
      $$HarvestsTableTableTableManager(_db.attachedDatabase, _db.harvestsTable);
}
