import 'package:drift/drift.dart';
import 'batch_tables.dart';

@DataClassName('ExpenseCategoryDbModel')
class ExpenseCategoriesTable extends Table {
  TextColumn get id => text()();
  TextColumn get name => text()();
  TextColumn get colorCode => text()();
  TextColumn get iconName => text()();

  @override
  Set<Column> get primaryKey => {id};
}

@DataClassName('ExpenseDbModel')
class ExpensesTable extends Table {
  TextColumn get id => text()();
  RealColumn get amount => real()();
  RealColumn get quantity => real().nullable()();
  DateTimeColumn get date => dateTime()();
  TextColumn get categoryId => text().references(ExpenseCategoriesTable, #id)();
  TextColumn get paymentMethod => text()();
  TextColumn get description => text()();
  TextColumn get batchId => text().nullable().references(BatchesTable, #id, onDelete: KeyAction.setNull)();
  TextColumn get receiptUrl => text().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}
