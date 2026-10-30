import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:farmstats/features/labour/presentation/screens/quick_add_worker_screen.dart';
import 'package:farmstats/features/labour/presentation/screens/wage_log_success_screen.dart';
import 'package:farmstats/features/labour/presentation/screens/add_multiple_workers_screen.dart';
import 'package:farmstats/features/labour/presentation/screens/wage_log_details_screen.dart';
import 'package:farmstats/features/labour/domain/entities/labour_entities.dart';
import 'package:farmstats/features/labour/application/providers/labour_notifier.dart';
import 'package:farmstats/features/labour/application/providers/labour_state.dart';
import 'package:farmstats/features/expenses/application/providers/expense_notifier.dart';
import 'package:farmstats/features/expenses/application/providers/expense_state.dart';
import 'package:farmstats/features/expenses/domain/entities/expense_entities.dart';
import 'package:farmstats/features/batches/application/providers/batch_notifier.dart';
import 'package:farmstats/features/batches/application/providers/batch_state.dart';

class _MockLabourNotifier extends LabourNotifier {
  final LabourState _initial;
  _MockLabourNotifier(this._initial);

  @override
  LabourState build() => _initial;

  @override
  Future<void> loadWorkers() async {}
}

class _MockExpenseNotifier extends ExpenseNotifier {
  final ExpenseState _initial;
  _MockExpenseNotifier(this._initial);

  @override
  ExpenseState build() => _initial;

  @override
  Future<void> loadExpenses() async {}
}

class _MockBatchNotifier extends BatchNotifier {
  final BatchState _initial;
  _MockBatchNotifier(this._initial);

  @override
  BatchState build() => _initial;

  @override
  Future<void> loadBatches() async {}
}

void main() {
  final dummyWorker = LabourWorker(
    id: 'w1',
    fullName: 'Srikanth',
    phoneNumber: '+91 74186 69138',
    role: WorkerRole.feeder,
    dailyWage: 500,
    joiningDate: DateTime(2026, 1, 1),
    status: WorkerStatus.active,
  );

  final dummyWorkers = [
    dummyWorker,
    LabourWorker(
      id: 'w2',
      fullName: 'Nithin',
      phoneNumber: '+91 74186 61938',
      role: WorkerRole.feeder,
      dailyWage: 500,
      joiningDate: DateTime(2026, 1, 1),
      status: WorkerStatus.active,
    ),
  ];

  final dummyExpense = Expense(
    id: 'e1',
    amount: 500,
    date: DateTime.now(),
    category: const ExpenseCategory(id: 'c4', name: 'Labour Wages', colorCode: '#2E7D32', iconName: 'people'),
    paymentMethod: 'Pending',
    description: 'Labour: Srikanth | Early Morning Shift • 6:00 AM - 9:00 AM | Silkworm Feeding & Cleaning (Unpaid) | Notes: Routine morning check',
  );

  group('FARMSTATS 12-Screen Labour & Wages Module Tests', () {
    testWidgets('Screen 2: QuickAddWorkerScreen renders single worker pre-filled data and toggles payment status', (tester) async {
      tester.view.physicalSize = const Size(1080, 2400);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(tester.view.resetPhysicalSize);

      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            labourNotifierProvider.overrideWith(() => _MockLabourNotifier(LabourState.data(dummyWorkers))),
            batchNotifierProvider.overrideWith(() => _MockBatchNotifier(const BatchState.data([]))),
          ],
          child: MaterialApp(
            home: QuickAddWorkerScreen(worker: dummyWorker),
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text("Add Today's Work"), findsOneWidget);
      expect(find.text('Srikanth'), findsOneWidget);
      expect(find.text('Work Type *'), findsOneWidget);
      expect(find.text('Silkworm Feeding & Cleaning'), findsOneWidget);
      expect(find.text('Shift *'), findsOneWidget);
      expect(find.text('Early Morning Shift'), findsOneWidget);
      expect(find.text('Batch (Optional)'), findsOneWidget);
      expect(find.text('Wage Amount'), findsOneWidget);
      expect(find.text('Payment Status'), findsOneWidget);
      expect(find.text('Unpaid'), findsOneWidget);
      expect(find.text('Paid'), findsOneWidget);
      expect(find.text('Save Wage Log'), findsOneWidget);

      // Toggle to Paid
      await tester.tap(find.text('Paid'));
      await tester.pumpAndSettle();
      expect(find.text('Paid'), findsOneWidget);

      // Toggle back to Unpaid
      await tester.tap(find.text('Unpaid'));
      await tester.pumpAndSettle();
      expect(find.text('Unpaid'), findsOneWidget);
    });

    testWidgets('Screen 3: WageLogSuccessScreen renders confetti celebration checkmark and buttons', (tester) async {
      tester.view.physicalSize = const Size(1080, 2400);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(tester.view.resetPhysicalSize);

      await tester.pumpWidget(
        MaterialApp(
          home: WageLogSuccessScreen(
            workerName: 'Srikanth',
            amount: 500,
            taskTitle: 'Silkworm Feeding & Cleaning',
            shiftName: 'Early Morning Shift',
            worker: dummyWorker,
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Wage log added!'), findsOneWidget);
      expect(find.text('Srikanth has been added for today.'), findsOneWidget);
      expect(find.text('Srikanth'), findsOneWidget);
      expect(find.text('₹500'), findsOneWidget);
      expect(find.textContaining('Silkworm Feeding & Cleaning'), findsOneWidget);
      expect(find.textContaining('Early Morning Shift'), findsOneWidget);
      expect(find.text('Add Another Worker'), findsOneWidget);
      expect(find.text("View Today's Workers"), findsOneWidget);
    });

    testWidgets('Screen 4: AddMultipleWorkersScreen allows worker selection, uniform wage, and displays total', (tester) async {
      tester.view.physicalSize = const Size(1080, 2400);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(tester.view.resetPhysicalSize);

      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            labourNotifierProvider.overrideWith(() => _MockLabourNotifier(LabourState.data(dummyWorkers))),
            batchNotifierProvider.overrideWith(() => _MockBatchNotifier(const BatchState.data([]))),
          ],
          child: const MaterialApp(
            home: AddMultipleWorkersScreen(),
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text("Add Today's Wages"), findsOneWidget);
      expect(find.textContaining('Select Workers'), findsOneWidget);
      expect(find.text('Srikanth'), findsOneWidget);
      expect(find.text('Nithin'), findsOneWidget);
      expect(find.text('Work Type *'), findsOneWidget);
      expect(find.text('Shift *'), findsOneWidget);
      expect(find.text('Wage Amount for all selected'), findsOneWidget);
      expect(find.text('Payment Status'), findsOneWidget);
      expect(find.text('Unpaid'), findsOneWidget);
      expect(find.text('Paid'), findsOneWidget);
      expect(find.textContaining('Add 2 Workers (₹1,000)'), findsOneWidget);

      // Deselect Srikanth
      await tester.tap(find.text('Srikanth'));
      await tester.pumpAndSettle();
      expect(find.textContaining('Add 1 Worker (₹500)'), findsOneWidget);

      // Select Srikanth back
      await tester.tap(find.text('Srikanth'));
      await tester.pumpAndSettle();
      expect(find.textContaining('Add 2 Workers (₹1,000)'), findsOneWidget);
    });

    testWidgets('Screen 8: WageLogDetailsScreen renders worker header, details card, and contextual action buttons', (tester) async {
      tester.view.physicalSize = const Size(1080, 2400);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(tester.view.resetPhysicalSize);

      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            labourNotifierProvider.overrideWith(() => _MockLabourNotifier(LabourState.data(dummyWorkers))),
            expenseNotifierProvider.overrideWith(() => _MockExpenseNotifier(ExpenseState.data([dummyExpense]))),
            batchNotifierProvider.overrideWith(() => _MockBatchNotifier(const BatchState.data([]))),
          ],
          child: MaterialApp(
            home: WageLogDetailsScreen(
              expense: dummyExpense,
              worker: dummyWorker,
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Wage Log Details'), findsOneWidget);
      expect(find.text('Srikanth'), findsWidgets);
      expect(find.text('Unpaid'), findsWidgets);
      expect(find.text('Silkworm Feeding & Cleaning'), findsOneWidget);
      expect(find.textContaining('Early Morning Shift'), findsOneWidget);
      expect(find.text('₹500'), findsOneWidget);
      expect(find.text('Routine morning check'), findsOneWidget);

      // Bottom actions
      expect(find.text('Edit'), findsOneWidget);
      expect(find.text('Mark as Paid'), findsOneWidget);
      expect(find.text('Delete'), findsOneWidget);
    });
  });
}
