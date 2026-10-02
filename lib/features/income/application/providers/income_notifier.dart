import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/entities/income_entities.dart';
import '../../domain/repositories/i_income_repository.dart';
import '../../data/repositories/income_repository_impl.dart';
import '../../data/datasources/i_income_datasource.dart';
import '../../data/datasources/income_drift_datasource.dart';
import '../../../../data/providers/database_provider.dart';
import '../usecases/income_usecases.dart';
import 'income_state.dart';
import '../../../dashboard/application/providers/dashboard_notifier.dart';
import '../../../reports/application/providers/reports_notifier.dart';

final incomeDataSourceProvider = Provider<IIncomeDataSource>((ref) {
  return IncomeDriftDataSourceImpl(ref.watch(appDatabaseProvider).incomeDao);
});

final incomeRepositoryProvider = Provider<IIncomeRepository>((ref) {
  return IncomeRepositoryImpl(ref.watch(incomeDataSourceProvider));
});

final getIncomesUseCaseProvider = Provider((ref) => GetIncomesUseCase(ref.watch(incomeRepositoryProvider)));
final addIncomeUseCaseProvider = Provider((ref) => AddIncomeUseCase(ref.watch(incomeRepositoryProvider)));
final updateIncomeUseCaseProvider = Provider((ref) => UpdateIncomeUseCase(ref.watch(incomeRepositoryProvider)));
final deleteIncomeUseCaseProvider = Provider((ref) => DeleteIncomeUseCase(ref.watch(incomeRepositoryProvider)));

final incomeNotifierProvider = NotifierProvider<IncomeNotifier, IncomeState>(() {
  return IncomeNotifier();
});

class IncomeNotifier extends Notifier<IncomeState> {
  @override
  IncomeState build() {
    loadIncomes();
    return const IncomeState.initial();
  }

  Future<void> loadIncomes() async {
    state = const IncomeState.loading();
    final result = await ref.read(getIncomesUseCaseProvider).execute();
    state = result.fold(
      (failure) => IncomeState.error(failure.message),
      (incomes) => IncomeState.data(incomes),
    );
  }

  Future<String?> addIncome(Income income) async {
    final result = await ref.read(addIncomeUseCaseProvider).execute(income);
    return result.fold(
      (failure) {
        state = IncomeState.error(failure.message);
        return failure.message;
      },
      (success) {
        ref.read(dashboardAggregatorProvider.notifier).loadDashboard();
        ref.read(reportsNotifierProvider.notifier).loadReports();
        loadIncomes();
        return null;
      },
    );
  }

  Future<bool> deleteIncome(String id) async {
    final result = await ref.read(deleteIncomeUseCaseProvider).execute(id);
    return result.fold((failure) => false, (_) {
      loadIncomes();
      ref.read(dashboardAggregatorProvider.notifier).loadDashboard();
      ref.read(reportsNotifierProvider.notifier).loadReports();
return true;
    });
  }
}
