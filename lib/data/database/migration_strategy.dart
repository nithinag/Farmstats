import 'package:drift/drift.dart';
import 'app_database.dart';
import '../../core/utils/logger.dart';

class AppMigrationStrategy {
  static MigrationStrategy strategy(AppDatabase db) {
    return MigrationStrategy(
      onCreate: (Migrator m) async {
        AppLogger.i('Creating database schema...');
        await m.createAll();
      },
      onUpgrade: (Migrator m, int from, int to) async {
        AppLogger.i('Upgrading database from version $from to $to...');
        if (from < 2) {
          // Recreate tables to apply the new nullable batchId and foreign key constraints
          await m.alterTable(TableMigration(db.expensesTable));
          await m.alterTable(TableMigration(db.incomesTable));
          await m.alterTable(TableMigration(db.inventoryTransactionsTable));
          await m.alterTable(TableMigration(db.inventoryItemsTable)); // Fixed categoryId reference
        }
        if (from < 3) {
          await m.addColumn(db.expensesTable, db.expensesTable.quantity);
        }
        if (from < 4) {
          await db.customStatement("UPDATE expense_categories_table SET name = 'DFL Cost' WHERE id = 'c1';");
        }
      },
      beforeOpen: (details) async {
        AppLogger.i('Database opened at version ${details.versionNow}');
        // Enable foreign keys
        await db.customStatement('PRAGMA foreign_keys = ON;');
        
        // Seed default expense categories if they don't exist
        await db.customStatement(
          "INSERT OR IGNORE INTO expense_categories_table (id, name, color_code, icon_name) VALUES "
          "('c1', 'DFL Cost', '#4CAF50', 'egg'),"
          "('c2', 'Mulberry Leaves', '#8BC34A', 'eco'),"
          "('c3', 'Fertilizer', '#FF9800', 'science'),"
          "('c4', 'Labour', '#F44336', 'people'),"
          "('c5', 'Electricity', '#FFEB3B', 'bolt'),"
          "('c6', 'Medicine', '#E91E63', 'medical_services'),"
          "('c7', 'Transport', '#2196F3', 'local_shipping'),"
          "('c8', 'Maintenance', '#9E9E9E', 'build'),"
          "('c9', 'Equipment', '#607D8B', 'handyman'),"
          "('c10', 'Other', '#000000', 'more_horiz');"
        );

        // Seed default income categories if they don't exist
        await db.customStatement(
          "INSERT OR IGNORE INTO income_categories_table (id, name, color_code, icon_name) VALUES "
          "('ic1', 'Cocoon Sales', '#4CAF50', 'egg'),"
          "('ic2', 'Silkworm Sales', '#8BC34A', 'eco'),"
          "('ic3', 'Govt. Subsidy', '#FF9800', 'agriculture'),"
          "('ic4', 'Other', '#000000', 'monetization_on');"
        );

        // Seed default buyers if they don't exist
        await db.customStatement(
          "INSERT OR IGNORE INTO buyers_table (id, name, contact) VALUES "
          "('b1', 'Silk Board', 'Govt. Sericulture Board'),"
          "('b2', 'Local Market', 'Main Cocoon Mandi'),"
          "('b3', 'Local Buyer', 'Direct wholesale buyer'),"
          "('b4', 'Sericulture Dept.', 'Govt. Subsidy Agent');"
        );

        // Seed default batch if it doesn't exist
        final now = DateTime.now().millisecondsSinceEpoch ~/ 1000;
        await db.customStatement(
          "INSERT OR IGNORE INTO batches_table ("
          "id, batch_name, start_date, expected_harvest_date, "
          "silkworm_variety, egg_source, number_of_dfls, mulberry_variety, "
          "rearing_house, current_stage, current_age_days, status, health_status, temperature, humidity"
          ") VALUES ("
          "'batch_1', 'Batch 1 - Mock', $now, ${now + 28 * 86400}, "
          "'Bivoltine', 'Govt CRC', 100, 'V1', 'Shed 1', 'Chawki', 5, 'Active', 'Good', 25.0, 75.0"
          ");"
        );
      },
    );
  }
}
