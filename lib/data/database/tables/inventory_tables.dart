import 'package:drift/drift.dart';
import 'batch_tables.dart';

@DataClassName('InventoryItemDbModel')
class InventoryItemsTable extends Table {
  TextColumn get id => text()();
  TextColumn get name => text()();
  TextColumn get categoryId => text().references(InventoryCategoriesTable, #id)();
  TextColumn get unit => text()();
  RealColumn get currentQuantity => real()();
  RealColumn get minimumQuantity => real()();
  RealColumn get maximumQuantity => real().nullable()();
  RealColumn get purchasePrice => real()();
  TextColumn get supplier => text().nullable()();
  DateTimeColumn get purchaseDate => dateTime()();
  DateTimeColumn get expiryDate => dateTime().nullable()();
  TextColumn get storageLocation => text().nullable()();
  TextColumn get status => text()();
  TextColumn get notes => text().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}

@DataClassName('InventoryCategoryDbModel')
class InventoryCategoriesTable extends Table {
  TextColumn get id => text()();
  TextColumn get name => text()();
  TextColumn get colorCode => text()();
  TextColumn get iconName => text()();

  @override
  Set<Column> get primaryKey => {id};
}

@DataClassName('InventoryTransactionDbModel')
class InventoryTransactionsTable extends Table {
  TextColumn get id => text()();
  TextColumn get itemId => text().references(InventoryItemsTable, #id, onDelete: KeyAction.cascade)();
  RealColumn get quantity => real()();
  TextColumn get type => text()();
  TextColumn get batchId => text().nullable().references(BatchesTable, #id, onDelete: KeyAction.setNull)();
  DateTimeColumn get date => dateTime()();
  TextColumn get reason => text().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}
