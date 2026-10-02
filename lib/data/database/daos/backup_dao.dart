import 'package:drift/drift.dart';
import '../app_database.dart';
import '../tables/backup_tables.dart';

part 'backup_dao.g.dart';

@DriftAccessor(tables: [BackupsTable])
class BackupDao extends DatabaseAccessor<AppDatabase> with _$BackupDaoMixin {
  BackupDao(super.db);

  Future<List<BackupDbModel>> getAllBackups() => 
      (select(backupsTable)..orderBy([(t) => OrderingTerm(expression: t.timestamp, mode: OrderingMode.desc)])).get();

  Future<int> insertBackup(BackupDbModel backup) => into(backupsTable).insert(backup, mode: InsertMode.insertOrReplace);

  Future<int> deleteBackup(String id) => (delete(backupsTable)..where((t) => t.id.equals(id))).go();
}
