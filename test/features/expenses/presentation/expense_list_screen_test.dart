import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:farmstats/features/expenses/application/providers/expense_notifier.dart';
import 'package:farmstats/features/expenses/application/providers/expense_state.dart';
import 'package:farmstats/features/expenses/domain/entities/expense_entities.dart';
import 'package:farmstats/features/expenses/presentation/screens/expense_list_screen.dart';
import 'package:farmstats/features/expenses/presentation/widgets/expense_card.dart';
import 'package:farmstats/shared/widgets/feedback_views.dart';

void main() {
  group('ExpenseListScreen Tests', () {
    testWidgets('renders DashboardSkeletonLoader when initial/loading', (tester) async {
      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            expenseNotifierProvider.overrideWith(() => _MockExpenseNotifier(const ExpenseState.initial())),
          ],
          child: const MaterialApp(home: ExpenseListScreen()),
        ),
      );
      await tester.pump(const Duration(seconds: 1));
      
      expect(find.byType(DashboardSkeletonLoader), findsOneWidget);
    });

    testWidgets('renders ErrorView when state is error', (tester) async {
      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            expenseNotifierProvider.overrideWith(() => _MockExpenseNotifier(const ExpenseState.error('Network failed'))),
          ],
          child: const MaterialApp(home: ExpenseListScreen()),
        ),
      );
      await tester.pump(const Duration(seconds: 1));

      expect(find.byType(ErrorView), findsOneWidget);
      expect(find.text('Network failed'), findsOneWidget);
    });

    testWidgets('renders EmptyStateView when expenses are empty', (tester) async {
      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            expenseNotifierProvider.overrideWith(() => _MockExpenseNotifier(const ExpenseState.data([]))),
          ],
          child: const MaterialApp(home: ExpenseListScreen()),
        ),
      );
      await tester.pump(const Duration(seconds: 1));

      expect(find.byType(EmptyStateView), findsOneWidget);
      expect(find.text('No Expenses Yet'), findsOneWidget);
    });

    testWidgets('renders grouped list of expenses', (tester) async {
      final expenses = [
        Expense(
          id: '1',
          amount: 50.0,
          date: DateTime.now(),
          category: const ExpenseCategory(id: 'c1', name: 'Category 1', colorCode: '#FFFFFF', iconName: 'egg'),
          paymentMethod: 'Cash',
          description: 'Desc 1',
        ),
      ];

      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            expenseNotifierProvider.overrideWith(() => _MockExpenseNotifier(ExpenseState.data(expenses))),
          ],
          child: const MaterialApp(home: ExpenseListScreen()),
        ),
      );
      await tester.pump(const Duration(seconds: 1));

      expect(find.byType(ExpenseCard), findsOneWidget);
      expect(find.text('Desc 1'), findsOneWidget);
    });
  });
}

class _MockExpenseNotifier extends ExpenseNotifier {
  final ExpenseState _initialState;

  _MockExpenseNotifier(this._initialState);

  @override
  ExpenseState build() => _initialState;

  @override
  Future<void> loadExpenses() async {}
}
