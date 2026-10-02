import 'package:drift/drift.dart';
import 'batch_tables.dart';

@DataClassName('IncomeCategoryDbModel')
class IncomeCategoriesTable extends Table {
  TextColumn get id => text()();
  TextColumn get name => text()();
  TextColumn get colorCode => text()();
  TextColumn get iconName => text()();

  @override
  Set<Column> get primaryKey => {id};
}

@DataClassName('BuyerDbModel')
class BuyersTable extends Table {
  TextColumn get id => text()();
  TextColumn get name => text()();
  TextColumn get contact => text()();

  @override
  Set<Column> get primaryKey => {id};
}

@DataClassName('IncomeDbModel')
class IncomesTable extends Table {
  TextColumn get id => text()();
  DateTimeColumn get saleDate => dateTime()();
  TextColumn get batchId => text().nullable().references(BatchesTable, #id, onDelete: KeyAction.setNull)();
  TextColumn get buyerId => text().references(BuyersTable, #id)();
  TextColumn get categoryId => text().references(IncomeCategoriesTable, #id)();
  TextColumn get cocoonGrade => text()();
  RealColumn get quantity => real()();
  RealColumn get rate => real()();
  RealColumn get grossAmount => real()();
  RealColumn get transportCharges => real()();
  RealColumn get commission => real()();
  RealColumn get netAmount => real()();
  TextColumn get paymentMethod => text()();
  TextColumn get paymentStatus => text()();
  TextColumn get invoiceNumber => text().nullable()();

  TextColumn get remarks => text().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}
