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
}
