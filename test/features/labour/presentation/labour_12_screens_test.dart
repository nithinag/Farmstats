import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:farmstats/features/labour/presentation/screens/quick_add_worker_screen.dart';
import 'package:farmstats/features/labour/presentation/screens/wage_log_success_screen.dart';
import 'package:farmstats/features/labour/presentation/screens/add_multiple_workers_screen.dart';
import 'package:farmstats/features/labour/presentation/screens/wage_log_details_screen.dart';
import 'package:farmstats/features/labour/presentation/widgets/labour_components.dart';
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

    testWidgets('Screen 2: FilterWorkersSheet renders status chips, today status, sort radio options, and handles apply', (tester) async {
      String appliedStatus = '';
      String appliedToday = '';
      String appliedSort = '';

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: FilterWorkersSheet(
              currentWorkerStatus: 'All',
              currentTodayStatus: 'All',
              currentSort: 'Name (A - Z)',
              onApply: (status, today, sort) {
                appliedStatus = status;
                appliedToday = today;
                appliedSort = sort;
              },
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Filter Workers'), findsOneWidget);
      expect(find.text('Worker Status'), findsOneWidget);
      expect(find.text('Active'), findsOneWidget);
      expect(find.text('Inactive'), findsOneWidget);
      expect(find.text("Today's Status"), findsOneWidget);
      expect(find.text('Added Today'), findsOneWidget);
      expect(find.text('Not Added'), findsOneWidget);
      expect(find.text('Sort By'), findsOneWidget);
      expect(find.text('Name (A - Z)'), findsOneWidget);
      expect(find.text('Daily Wage (High to Low)'), findsOneWidget);
      expect(find.text('Daily Wage (Low to High)'), findsOneWidget);
      expect(find.text('Total Earned (High to Low)'), findsOneWidget);
      expect(find.text('Reset'), findsOneWidget);
      expect(find.text('Apply'), findsOneWidget);

      // Select Active and Daily Wage (High to Low)
      await tester.tap(find.text('Active'));
      await tester.tap(find.text('Added Today'));
      await tester.tap(find.text('Daily Wage (High to Low)'));
      await tester.pumpAndSettle();

      await tester.tap(find.text('Apply'));
      await tester.pumpAndSettle();

      expect(appliedStatus, 'Active');
      expect(appliedToday, 'Added Today');
      expect(appliedSort, 'Daily Wage (High to Low)');
    });

    testWidgets('Screen 10: showWageLogActionSheet displays Edit, Mark as Paid, Delete, Cancel for Unpaid and never Mark as Unpaid for Paid', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Builder(
              builder: (ctx) => ElevatedButton(
                onPressed: () {
                  showWageLogActionSheet(
                    context: ctx,
                    taskTitle: 'Silkworm Feeding & Cleaning',
                    workerName: 'Srikanth',
                    formattedDate: '30 Oct 2026',
                    amount: 500,
                    status: 'Unpaid',
                    onToggleStatus: () {},
                    onDelete: () {},
                  );
                },
                child: const Text('Open Options'),
              ),
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();

      // Open for Unpaid
      await tester.tap(find.text('Open Options'));
      await tester.pumpAndSettle();

      expect(find.text('Wage Log Options'), findsOneWidget);
      expect(find.text('Edit Wage Log'), findsOneWidget);
      expect(find.text('Mark as Paid'), findsOneWidget);
      expect(find.text('Delete Wage Log'), findsOneWidget);
      expect(find.text('Cancel'), findsOneWidget);
      expect(find.text('Mark as Unpaid'), findsNothing);

      // Dismiss
      await tester.tap(find.text('Cancel'));
      await tester.pumpAndSettle();

      // Now open for Paid
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Builder(
              builder: (ctx) => ElevatedButton(
                onPressed: () {
                  showWageLogActionSheet(
                    context: ctx,
                    taskTitle: 'Silkworm Feeding & Cleaning',
                    workerName: 'Srikanth',
                    formattedDate: '30 Oct 2026',
                    amount: 500,
                    status: 'Paid',
                    onToggleStatus: () {},
                    onDelete: () {},
                  );
                },
                child: const Text('Open Paid Options'),
              ),
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();

      await tester.tap(find.text('Open Paid Options'));
      await tester.pumpAndSettle();

      expect(find.text('Wage Log Options'), findsOneWidget);
      expect(find.text('Edit Wage Log'), findsOneWidget);
      expect(find.text('Delete Wage Log'), findsOneWidget);
      expect(find.text('Cancel'), findsOneWidget);
      // Strictly verify that once paid, it can NEVER be marked as unpaid
      expect(find.text('Mark as Unpaid'), findsNothing);
      expect(find.text('Mark as Paid'), findsNothing);
    });

    testWidgets('Screen 11: FilterWageLogsSheet renders Data Scope, Period, Payment Status chips, and Sort By', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: FilterWageLogsSheet(
              selectedMonth: DateTime.now(),
              currentBatchName: 'Batch 1 - Mock',
              selectedStatus: 'All',
              selectedSort: 'Newest First',
              onApply: (month, batchId, workerId, workType, status) {},
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Filter Wage Logs'), findsOneWidget);
      expect(find.text('Data Scope'), findsOneWidget);
      expect(find.textContaining('Current Batch'), findsOneWidget);
      expect(find.text('Select Batch'), findsOneWidget);
      expect(find.text('Period'), findsOneWidget);
      expect(find.textContaining('This Month'), findsOneWidget);
      expect(find.text('Select Month'), findsOneWidget);
      expect(find.textContaining('This Year'), findsOneWidget);
      expect(find.text('Entire History'), findsOneWidget);
      expect(find.text('Payment Status'), findsOneWidget);
      expect(find.text('All'), findsOneWidget);
      expect(find.text('Paid'), findsOneWidget);
      expect(find.text('Unpaid'), findsOneWidget);
      expect(find.text('Sort By'), findsOneWidget);
      expect(find.text('Newest First'), findsOneWidget);
      expect(find.text('Reset'), findsOneWidget);
      expect(find.text('Apply'), findsOneWidget);
    });
  });
}
