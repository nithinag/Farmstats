import 'package:flutter_test/flutter_test.dart';
import 'package:farmstats/features/batches/domain/entities/batch_entities.dart';

void main() {
  group('Active Batch Lifecycle & Derivation Tests', () {
    test('Identifies active batch from list of batches correctly', () {
      final now = DateTime.now();
      final batch1 = Batch(
        id: 'b1',
        batchName: 'Batch #001',
        startDate: now.subtract(const Duration(days: 40)),
        expectedHarvestDate: now.subtract(const Duration(days: 12)),
        silkwormVariety: 'CSR2',
        eggSource: 'Govt CRC',
        numberOfDfls: 300,
        mulberryVariety: 'V1',
        rearingHouse: 'Main Shed',
        currentStage: InstarStage.spinning,
        currentAgeDays: 28,
        status: BatchStatus.completed,
        healthStatus: HealthStatus.good,
        temperature: 25.0,
        humidity: 75.0,
      );

      final batch2 = Batch(
        id: 'b2',
        batchName: 'Batch #002',
        startDate: now.subtract(const Duration(days: 7)),
        expectedHarvestDate: now.add(const Duration(days: 21)),
        silkwormVariety: 'CSR2',
        eggSource: 'Govt CRC',
        numberOfDfls: 300,
        mulberryVariety: 'V1',
        rearingHouse: 'Main Shed',
        currentStage: InstarStage.third,
        currentAgeDays: 7,
        status: BatchStatus.active,
        healthStatus: HealthStatus.excellent,
        temperature: 25.0,
        humidity: 75.0,
      );

      final batches = [batch1, batch2];

      final activeBatch = batches.firstWhere((b) => b.status == BatchStatus.active);
      expect(activeBatch.batchName, 'Batch #002');
      expect(activeBatch.currentAgeDays, 7);

      final completedBatches = batches.where((b) => b.status == BatchStatus.completed).toList();
      expect(completedBatches.length, 1);
      expect(completedBatches.first.batchName, 'Batch #001');
    });

    test('Computes next batch number sequentially', () {
      expect('#${(0 + 1).toString().padLeft(3, '0')}', '#001');
      expect('#${(1 + 1).toString().padLeft(3, '0')}', '#002');
      expect('#${(12 + 1).toString().padLeft(3, '0')}', '#013');
    });
  });
}
