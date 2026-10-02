import '../../../reports/application/providers/reports_notifier.dart';
import '../../../dashboard/application/providers/dashboard_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/repositories/i_batch_repository.dart';
import '../../data/repositories/batch_repository_impl.dart';
import '../../data/datasources/i_batch_datasource.dart';
import '../../data/datasources/batch_drift_datasource.dart';
import '../../../../data/providers/database_provider.dart';
import '../usecases/batch_usecases.dart';
import '../../domain/entities/batch_entities.dart';
import 'batch_state.dart';

final batchDataSourceProvider = Provider<IBatchDataSource>((ref) {
  return BatchDriftDataSourceImpl(ref.watch(appDatabaseProvider).batchDao);
});

final batchRepositoryProvider = Provider<IBatchRepository>((ref) {
  return BatchRepositoryImpl(ref.watch(batchDataSourceProvider));
});

final getBatchesUseCaseProvider = Provider((ref) => GetBatchesUseCase(ref.watch(batchRepositoryProvider)));
final addBatchUseCaseProvider = Provider((ref) => AddBatchUseCase(ref.watch(batchRepositoryProvider)));
final updateBatchUseCaseProvider = Provider((ref) => UpdateBatchUseCase(ref.watch(batchRepositoryProvider)));
final getBatchTimelineUseCaseProvider = Provider((ref) => GetBatchTimelineUseCase(ref.watch(batchRepositoryProvider)));

final activeBatchProvider = Provider<Batch?>((ref) {
  final batchState = ref.watch(batchNotifierProvider);
  return batchState.maybeWhen(
    data: (batches) {
      if (batches.isEmpty) return null;
      // 1. Find explicit active batch
      final active = batches.where((b) => b.status == BatchStatus.active).firstOrNull;
      if (active != null) return active;
      // 2. Fallback to any non-completed, non-cancelled batch
      return batches.where((b) => b.status != BatchStatus.completed && b.status != BatchStatus.cancelled).firstOrNull;
    },
    orElse: () => null,
  );
});

final lastCompletedBatchProvider = Provider<Batch?>((ref) {
  final batchState = ref.watch(batchNotifierProvider);
  return batchState.maybeWhen(
    data: (batches) {
      final completed = batches.where((b) => b.status == BatchStatus.completed).toList();
      return completed.isNotEmpty ? completed.first : null;
    },
    orElse: () => null,
  );
});

final nextBatchNumberProvider = Provider<String>((ref) {
  final batchState = ref.watch(batchNotifierProvider);
  return batchState.maybeWhen(
    data: (batches) {
      int maxNum = 0;
      for (final b in batches) {
        final match = RegExp(r'#?(\d+)').firstMatch(b.batchName);
        if (match != null) {
          final n = int.tryParse(match.group(1)!) ?? 0;
          if (n > maxNum) maxNum = n;
        }
      }
      final nextNumber = maxNum > 0 ? maxNum + 1 : (batches.length + 1);
      return '#${nextNumber.toString().padLeft(3, '0')}';
    },
    orElse: () => '#001',
  );
});

final batchNotifierProvider = NotifierProvider<BatchNotifier, BatchState>(() {
  return BatchNotifier();
});

class BatchNotifier extends Notifier<BatchState> {
  @override
  BatchState build() {
    loadBatches();
    return const BatchState.initial();
  }

  Future<void> loadBatches() async {
    state = const BatchState.loading();
    final result = await ref.read(getBatchesUseCaseProvider).execute();
    state = result.fold(
      (failure) => BatchState.error(failure.message),
      (batches) => BatchState.data(batches),
    );
  }

  Future<bool> addBatch(Batch batch) async {
    final result = await ref.read(addBatchUseCaseProvider).execute(batch);
    return result.fold((failure) => false, (_) {
      loadBatches();
      ref.read(dashboardAggregatorProvider.notifier).loadDashboard();
      ref.read(reportsNotifierProvider.notifier).loadReports();
      return true;
    });
  }

  Future<bool> updateBatch(Batch batch, Batch oldBatch) async {
    final result = await ref.read(updateBatchUseCaseProvider).execute(batch, oldBatch);
    return result.fold((failure) => false, (_) {
      loadBatches();
      ref.read(dashboardAggregatorProvider.notifier).loadDashboard();
      ref.read(reportsNotifierProvider.notifier).loadReports();
      return true;
    });
  }

  Future<bool> completeBatch(Batch batch) async {
    final completed = batch.copyWith(
      status: BatchStatus.completed,
      actualHarvestDate: batch.actualHarvestDate ?? DateTime.now(),
    );
    return await updateBatch(completed, batch);
  }
}

