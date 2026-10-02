// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'expense_dao.dart';

// ignore_for_file: type=lint
mixin _$ExpenseDaoMixin on DatabaseAccessor<AppDatabase> {
  $ExpenseCategoriesTableTable get expenseCategoriesTable =>
      attachedDatabase.expenseCategoriesTable;
  $BatchesTableTable get batchesTable => attachedDatabase.batchesTable;
  $ExpensesTableTable get expensesTable => attachedDatabase.expensesTable;
  ExpenseDaoManager get managers => ExpenseDaoManager(this);
}

class ExpenseDaoManager {
  final _$ExpenseDaoMixin _db;
  ExpenseDaoManager(this._db);
  $$ExpenseCategoriesTableTableTableManager get expenseCategoriesTable =>
      $$ExpenseCategoriesTableTableTableManager(
          _db.attachedDatabase, _db.expenseCategoriesTable);
  $$BatchesTableTableTableManager get batchesTable =>
      $$BatchesTableTableTableManager(_db.attachedDatabase, _db.batchesTable);
  $$ExpensesTableTableTableManager get expensesTable =>
      $$ExpensesTableTableTableManager(_db.attachedDatabase, _db.expensesTable);
}
