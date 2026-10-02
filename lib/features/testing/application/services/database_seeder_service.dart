import 'package:uuid/uuid.dart';
import 'package:drift/drift.dart';
import '../../../../data/database/app_database.dart';
import '../../../../core/utils/logger.dart';

class DatabaseSeederService {
  final AppDatabase _db;
  
  DatabaseSeederService(this._db);

  Future<void> seedDatabase() async {
    AppLogger.i('Starting database stress test seeding...');
    final startTime = DateTime.now();

    try {
      await _db.transaction(() async {
        // Since schemas are complex, we execute raw SQL for blazing fast stress testing
        for (var i = 0; i < 100; i++) {
          final batchId = const Uuid().v4();
          await _db.customInsert(
            'INSERT INTO batches (id, batch_name, start_date, expected_harvest_date, status, number_of_dfls, silkworm_variety, mulberry_variety, current_stage, current_age_days, health_status, temperature, humidity, rearing_house, egg_source) '
            "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)",
            variables: [
              Variable(batchId),
              Variable('Stress Batch $i'),
              Variable(DateTime.now().subtract(Duration(days: i)).millisecondsSinceEpoch ~/ 1000),
              Variable(DateTime.now().add(const Duration(days: 30)).millisecondsSinceEpoch ~/ 1000),
              const Variable('active'),
              const Variable(500),
              const Variable('Bivoltine'),
              const Variable('V1'),
              const Variable('Egg'),
              const Variable(0),
              const Variable('Healthy'),
              const Variable(25.0),
              const Variable(75.0),
              const Variable('House 1'),
              const Variable('Govt Center'),
            ],
          );
        }
      });
      
      final elapsed = DateTime.now().difference(startTime);
      AppLogger.i('Seeding completed successfully in ${elapsed.inMilliseconds} ms.');
      
    } catch (e, stack) {
      AppLogger.e('Seeding failed', error: e, stackTrace: stack);
      rethrow;
    }
  }

  Future<void> wipeDatabase() async {
    AppLogger.i('Wiping database...');
    // Wipe test data
    await _db.customStatement("DELETE FROM batches WHERE batch_name LIKE 'Stress Batch%'");
    AppLogger.i('Database wiped.');
  }
}
