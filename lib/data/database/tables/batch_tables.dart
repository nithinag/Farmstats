import 'package:drift/drift.dart';

@DataClassName('BatchDbModel')
class BatchesTable extends Table {
  TextColumn get id => text()();
  TextColumn get batchName => text()();
  DateTimeColumn get startDate => dateTime()();
  DateTimeColumn get expectedHarvestDate => dateTime()();
  DateTimeColumn get actualHarvestDate => dateTime().nullable()();
  TextColumn get silkwormVariety => text()();
  TextColumn get eggSource => text()();
  IntColumn get numberOfDfls => integer()();
  RealColumn get dflPrice => real().nullable()();
  TextColumn get mulberryVariety => text()();
  TextColumn get rearingHouse => text()();
  TextColumn get currentStage => text()();
  IntColumn get currentAgeDays => integer()();
  TextColumn get status => text()();
  TextColumn get healthStatus => text()();
  RealColumn get temperature => real()();
  RealColumn get humidity => real()();
  TextColumn get notes => text().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}

@DataClassName('BatchTimelineDbModel')
class BatchTimelinesTable extends Table {
  TextColumn get id => text()();
  TextColumn get batchId => text().references(BatchesTable, #id, onDelete: KeyAction.cascade)();
  DateTimeColumn get timestamp => dateTime()();
  TextColumn get eventType => text()();
  TextColumn get description => text()();

  @override
  Set<Column> get primaryKey => {id};
}
