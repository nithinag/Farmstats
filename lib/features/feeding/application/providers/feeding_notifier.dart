import '../../../reports/application/providers/reports_notifier.dart';
import '../../../dashboard/application/providers/dashboard_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/repositories/i_feeding_repository.dart';
import '../../data/repositories/feeding_repository_impl.dart';
import '../../data/datasources/i_feeding_datasource.dart';
import '../../data/datasources/feeding_drift_datasource.dart';
import '../../../../data/providers/database_provider.dart';
import '../usecases/feeding_usecases.dart';
import '../../domain/entities/feeding_entities.dart';
import 'feeding_state.dart';

final feedingDataSourceProvider = Provider<IFeedingDataSource>((ref) {
  return FeedingDriftDataSourceImpl(ref.watch(appDatabaseProvider).feedingDao);
});

final feedingRepositoryProvider = Provider<IFeedingRepository>((ref) {
  return FeedingRepositoryImpl(ref.watch(feedingDataSourceProvider));
});

final getFeedingsUseCaseProvider = Provider((ref) => GetFeedingsUseCase(ref.watch(feedingRepositoryProvider)));
final logFeedingUseCaseProvider = Provider((ref) => LogFeedingUseCase(ref.watch(feedingRepositoryProvider)));
final logMortalityUseCaseProvider = Provider((ref) => LogMortalityUseCase(ref.watch(feedingRepositoryProvider)));
final logEnvironmentUseCaseProvider = Provider((ref) => LogEnvironmentUseCase(ref.watch(feedingRepositoryProvider)));

final feedingNotifierProvider = NotifierProvider<FeedingNotifier, FeedingState>(() {
  return FeedingNotifier();
});

class FeedingNotifier extends Notifier<FeedingState> {
  @override
  FeedingState build() {
    return const FeedingState.initial();
  }

  Future<void> loadBatchData(String batchId) async {
    state = const FeedingState.loading();
    
    // In a real scenario, we'd use `Future.wait` for getMortality and getEnvironment too.
    // For now we just load feedings to demonstrate UI state.
    final feedingResult = await ref.read(getFeedingsUseCaseProvider).execute(batchId);
    
    state = feedingResult.fold(
      (failure) => FeedingState.error(failure.message),
      (feedings) => FeedingState.data(
        feedings: feedings,
        mortality: [],
        environments: [],
      ),
    );
  }

  Future<bool> logFeeding(FeedingLog log, {required String inventoryItemId}) async {
    final result = await ref.read(logFeedingUseCaseProvider).execute(log, inventoryItemId: inventoryItemId);
    return result.fold((failure) => false, (_) {
      loadBatchData(log.batchId);
      ref.read(dashboardAggregatorProvider.notifier).loadDashboard();
      ref.read(reportsNotifierProvider.notifier).loadReports();
      return true;
    });
  }
}
