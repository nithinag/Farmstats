import '../../../reports/application/providers/reports_notifier.dart';
import '../../../dashboard/application/providers/dashboard_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/repositories/i_labour_repository.dart';
import '../../data/repositories/labour_repository_impl.dart';
import '../../data/datasources/i_labour_datasource.dart';
import '../../data/datasources/labour_drift_datasource.dart';
import '../../../../data/providers/database_provider.dart';
import '../usecases/labour_usecases.dart';
import '../../domain/entities/labour_entities.dart';
import 'labour_state.dart';

final labourDataSourceProvider = Provider<ILabourDataSource>((ref) {
  return LabourDriftDataSourceImpl(ref.watch(appDatabaseProvider).labourDao);
});

final labourRepositoryProvider = Provider<ILabourRepository>((ref) {
  return LabourRepositoryImpl(ref.watch(labourDataSourceProvider));
});

final getWorkersUseCaseProvider = Provider((ref) => GetWorkersUseCase(ref.watch(labourRepositoryProvider)));
final addWorkerUseCaseProvider = Provider((ref) => AddWorkerUseCase(ref.watch(labourRepositoryProvider)));
final updateWorkerUseCaseProvider = Provider((ref) => UpdateWorkerUseCase(ref.watch(labourRepositoryProvider)));
final logAttendanceUseCaseProvider = Provider((ref) => LogAttendanceUseCase(ref.watch(labourRepositoryProvider)));
final payWageUseCaseProvider = Provider((ref) => PayWageUseCase(ref.watch(labourRepositoryProvider)));

final labourNotifierProvider = NotifierProvider<LabourNotifier, LabourState>(() {
  return LabourNotifier();
});

class LabourNotifier extends Notifier<LabourState> {
  @override
  LabourState build() {
    loadWorkers();
    return const LabourState.initial();
  }

  Future<void> loadWorkers() async {
    state = const LabourState.loading();
    final result = await ref.read(getWorkersUseCaseProvider).execute();
    state = result.fold(
      (failure) => LabourState.error(failure.message),
      (workers) => LabourState.data(workers),
    );
  }

  Future<bool> addWorker(LabourWorker worker) async {
    final result = await ref.read(addWorkerUseCaseProvider).execute(worker);
    return result.fold((failure) => false, (_) {
      loadWorkers();
      ref.read(dashboardAggregatorProvider.notifier).loadDashboard();
      ref.read(reportsNotifierProvider.notifier).loadReports();
      return true;
    });
  }

  Future<bool> updateWorker(LabourWorker worker) async {
    final result = await ref.read(updateWorkerUseCaseProvider).execute(worker);
    return result.fold((failure) => false, (_) {
      loadWorkers();
      ref.read(dashboardAggregatorProvider.notifier).loadDashboard();
      ref.read(reportsNotifierProvider.notifier).loadReports();
      return true;
    });
  }
}
