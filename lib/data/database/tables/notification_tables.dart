import 'package:drift/drift.dart';

@DataClassName('NotificationDbModel')
class NotificationsTable extends Table {
  TextColumn get id => text()();
  TextColumn get title => text()();
  TextColumn get message => text()();
  TextColumn get category => text()();
  TextColumn get priority => text()();
  DateTimeColumn get timestamp => dateTime()();
  BoolColumn get isRead => boolean().withDefault(const Constant(false))();
  TextColumn get referenceId => text().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}
