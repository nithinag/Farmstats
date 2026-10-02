import 'package:drift/drift.dart';
import 'batch_tables.dart';

@DataClassName('HarvestRecordDbModel')
class HarvestsTable extends Table {
  TextColumn get id => text()();
  TextColumn get batchId => text().references(BatchesTable, #id, onDelete: KeyAction.cascade)();
  DateTimeColumn get harvestDate => dateTime()();
  RealColumn get actualHarvestDuration => real()();
  RealColumn get grossWeight => real()();
  RealColumn get netSaleableWeight => real()();
  RealColumn get rejectedWeight => real()();
  RealColumn get moisturePercentage => real()();
  RealColumn get wastePercentage => real()();
  RealColumn get averageCocoonSize => real()();
  
  // Grade Distribution embedded
  RealColumn get gradeAWeight => real()();
  RealColumn get gradeBWeight => real()();
  RealColumn get gradeCWeight => real()();
  
  // Production Metrics embedded
  RealColumn get yieldPercentage => real()();
  RealColumn get survivalRate => real()();
  RealColumn get feedConversionRatio => real()();
  RealColumn get mortalityPercentage => real()();
  RealColumn get harvestEfficiency => real()();

  TextColumn get harvestedBy => text().nullable()();
  TextColumn get remarks => text().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}
