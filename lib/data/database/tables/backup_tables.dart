import 'package:drift/drift.dart';

@DataClassName('BackupDbModel')
class BackupsTable extends Table {
  TextColumn get id => text()();
  TextColumn get fileName => text()();
  TextColumn get filePath => text()();
  DateTimeColumn get timestamp => dateTime()();
  IntColumn get fileSizeBytes => integer()();
  TextColumn get databaseVersion => text()();
  TextColumn get checksum => text()();
  BoolColumn get isAutoBackup => boolean()();

  @override
  Set<Column> get primaryKey => {id};
}
