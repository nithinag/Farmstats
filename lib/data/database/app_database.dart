import 'package:drift/drift.dart';
import 'database_initializer.dart';
import 'migration_strategy.dart';
import 'tables/expense_tables.dart';
import 'tables/income_tables.dart';
import 'tables/batch_tables.dart';
import 'tables/inventory_tables.dart';
import 'tables/labour_tables.dart';
import 'tables/feeding_tables.dart';
import 'tables/harvest_tables.dart';
import 'tables/notification_tables.dart';
import 'tables/backup_tables.dart';
import 'daos/expense_dao.dart';
import 'daos/income_dao.dart';
import 'daos/batch_dao.dart';
import 'daos/inventory_dao.dart';
import 'daos/labour_dao.dart';
import 'daos/feeding_dao.dart';
import 'daos/harvest_dao.dart';
import 'daos/reports_dao.dart';
import 'daos/notification_dao.dart';
import 'daos/backup_dao.dart';

part 'app_database.g.dart';

@DriftDatabase(
  tables: [
    ExpensesTable, ExpenseCategoriesTable, 
    IncomesTable, IncomeCategoriesTable, BuyersTable,
    BatchesTable, BatchTimelinesTable,
    InventoryItemsTable, InventoryCategoriesTable, InventoryTransactionsTable,
    WorkersTable, AttendanceTable, AssignmentsTable, WagesTable,
    FeedingLogsTable, EnvironmentalLogsTable, MortalityLogsTable,
    HarvestsTable, NotificationsTable, BackupsTable
  ],
  daos: [ExpenseDao, IncomeDao, BatchDao, InventoryDao, LabourDao, FeedingDao, HarvestDao, ReportsDao, NotificationDao, BackupDao],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(openConnection());
  AppDatabase.forTesting(super.e);

  @override
  int get schemaVersion => 4;

  @override
  MigrationStrategy get migration => AppMigrationStrategy.strategy(this);
}
