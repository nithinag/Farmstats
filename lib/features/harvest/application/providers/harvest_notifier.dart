import '../../../reports/application/providers/reports_notifier.dart';
import '../../../dashboard/application/providers/dashboard_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/repositories/i_harvest_repository.dart';
import '../../data/repositories/harvest_repository_impl.dart';
import '../../data/datasources/i_harvest_datasource.dart';
import '../../data/datasources/harvest_drift_datasource.dart';
import '../../../../data/providers/database_provider.dart';
import '../usecases/harvest_usecases.dart';
import '../../domain/entities/harvest_entities.dart';
import 'harvest_state.dart';

final harvestDataSourceProvider = Provider<IHarvestDataSource>((ref) {
  return HarvestDriftDataSourceImpl(ref.watch(appDatabaseProvider).harvestDao);
});

final harvestRepositoryProvider = Provider<IHarvestRepository>((ref) {
  return HarvestRepositoryImpl(ref.watch(harvestDataSourceProvider));
});

final getHarvestsUseCaseProvider = Provider((ref) => GetHarvestsUseCase(ref.watch(harvestRepositoryProvider)));
final saveHarvestUseCaseProvider = Provider((ref) => SaveHarvestUseCase(ref.watch(harvestRepositoryProvider)));

final harvestNotifierProvider = NotifierProvider<HarvestNotifier, HarvestState>(() {
  return HarvestNotifier();
});

class HarvestNotifier extends Notifier<HarvestState> {
  @override
  HarvestState build() {
    loadHarvests();
    return const HarvestState.initial();
  }

  Future<void> loadHarvests() async {
    state = const HarvestState.loading();
    final result = await ref.read(getHarvestsUseCaseProvider).execute();
    state = result.fold(
      (failure) => HarvestState.error(failure.message),
      (harvests) => HarvestState.data(harvests),
    );
  }

  Future<bool> saveHarvest(HarvestRecord harvest, {required bool generateIncomeRecord}) async {
    final result = await ref.read(saveHarvestUseCaseProvider).execute(harvest, generateIncomeRecord: generateIncomeRecord);
    return result.fold((failure) => false, (_) {
      loadHarvests();
      ref.read(dashboardAggregatorProvider.notifier).loadDashboard();
      ref.read(reportsNotifierProvider.notifier).loadReports();
      return true;
    });
  }
}
