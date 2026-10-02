import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'expense_state.dart';
import '../../domain/entities/expense_entities.dart';
import '../../domain/repositories/i_expense_repository.dart';
import '../../data/repositories/expense_repository_impl.dart';
import '../../data/datasources/expense_mock_datasource.dart';
import '../../data/datasources/expense_drift_datasource.dart';
import '../../../../data/providers/database_provider.dart';
import '../usecases/expense_usecases.dart';
import '../../../dashboard/application/providers/dashboard_notifier.dart';
import '../../../reports/application/providers/reports_notifier.dart';

final expenseDataSourceProvider = Provider<IExpenseDataSource>((ref) {
  return ExpenseDriftDataSourceImpl(ref.watch(appDatabaseProvider).expenseDao);
});

final expenseRepositoryProvider = Provider<IExpenseRepository>((ref) {
  return ExpenseRepositoryImpl(ref.watch(expenseDataSourceProvider));
});

final getExpensesUseCaseProvider = Provider<GetExpensesUseCase>((ref) {
  return GetExpensesUseCase(ref.watch(expenseRepositoryProvider));
});

final addExpenseUseCaseProvider = Provider<AddExpenseUseCase>((ref) {
  return AddExpenseUseCase(ref.watch(expenseRepositoryProvider));
});

final updateExpenseUseCaseProvider = Provider<UpdateExpenseUseCase>((ref) {
  return UpdateExpenseUseCase(ref.watch(expenseRepositoryProvider));
});

final deleteExpenseUseCaseProvider = Provider<DeleteExpenseUseCase>((ref) {
  return DeleteExpenseUseCase(ref.watch(expenseRepositoryProvider));
});

final expenseNotifierProvider = NotifierProvider<ExpenseNotifier, ExpenseState>(() {
  return ExpenseNotifier();
});

class ExpenseNotifier extends Notifier<ExpenseState> {
  @override
  ExpenseState build() {
    Future.microtask(() => loadExpenses());
    return const ExpenseState.initial();
  }

  Future<void> loadExpenses() async {
    state = const ExpenseState.loading();
    final useCase = ref.read(getExpensesUseCaseProvider);
    final result = await useCase.execute();

    result.fold(
      (failure) => state = ExpenseState.error(failure.message),
      (expenses) => state = ExpenseState.data(expenses),
    );
  }

  Future<bool> addExpense(Expense expense) async {
    final result = await ref.read(addExpenseUseCaseProvider).execute(expense);
    return result.fold((failure) => false, (_) {
      loadExpenses();
      ref.read(dashboardAggregatorProvider.notifier).loadDashboard();
      ref.read(reportsNotifierProvider.notifier).loadReports();
return true;
    });
  }

  Future<bool> deleteExpense(String id) async {
    final result = await ref.read(deleteExpenseUseCaseProvider).execute(id);
    return result.fold((failure) => false, (_) {
      loadExpenses();
      ref.read(dashboardAggregatorProvider.notifier).loadDashboard();
      ref.read(reportsNotifierProvider.notifier).loadReports();
return true;
    });
  }
}
