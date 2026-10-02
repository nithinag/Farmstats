import 'package:drift/drift.dart';
import 'batch_tables.dart';

@DataClassName('FeedingLogDbModel')
class FeedingLogsTable extends Table {
  TextColumn get id => text()();
  TextColumn get batchId => text().references(BatchesTable, #id, onDelete: KeyAction.cascade)();
  DateTimeColumn get date => dateTime()();
  TextColumn get time => text()();
  TextColumn get leafType => text()();
  TextColumn get leafAge => text()();
  RealColumn get leafQuantity => real()();
  IntColumn get feedingRound => integer()();
  TextColumn get workerId => text().nullable()();
  TextColumn get remarks => text().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}

@DataClassName('EnvironmentalReadingDbModel')
class EnvironmentalLogsTable extends Table {
  TextColumn get id => text()();
  TextColumn get batchId => text().references(BatchesTable, #id, onDelete: KeyAction.cascade)();
  DateTimeColumn get timestamp => dateTime()();
  RealColumn get temperature => real()();
  RealColumn get humidity => real()();
  BoolColumn get ventilationStatus => boolean()();
  TextColumn get weatherNotes => text().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}

@DataClassName('MortalityLogDbModel')
class MortalityLogsTable extends Table {
  TextColumn get id => text()();
  TextColumn get batchId => text().references(BatchesTable, #id, onDelete: KeyAction.cascade)();
  DateTimeColumn get date => dateTime()();
  IntColumn get deadCount => integer()();
  TextColumn get reason => text()();
  TextColumn get workerId => text().nullable()();
  TextColumn get remarks => text().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}
