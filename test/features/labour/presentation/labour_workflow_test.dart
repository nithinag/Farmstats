import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:farmstats/features/labour/presentation/screens/worker_list_screen.dart';
import 'package:farmstats/features/labour/presentation/screens/worker_form_screen.dart';
import 'package:farmstats/features/labour/presentation/screens/worker_details_screen.dart';
import 'package:farmstats/features/labour/presentation/screens/attendance_screen.dart';
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

  @override
  Future<bool> addWorker(LabourWorker worker) async => true;

  @override
  Future<bool> updateWorker(LabourWorker worker) async => true;
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
  setUp(() {
    SharedPreferences.setMockInitialValues({});
  });

  final dummyWorkers = [
    LabourWorker(
      id: 'w1',
      fullName: 'Nithin',
      phoneNumber: '+91 74186 61938',
      role: WorkerRole.feeder,
      dailyWage: 500,
      joiningDate: DateTime(2026, 1, 1),
      status: WorkerStatus.active,
    ),
    LabourWorker(
      id: 'w2',
      fullName: 'Ramesh',
      phoneNumber: '+91 98765 43210',
      role: WorkerRole.cleaner,
      dailyWage: 600,
      joiningDate: DateTime(2026, 1, 1),
      status: WorkerStatus.active,
    ),
  ];

  final now = DateTime.now();
  final dummyExpenses = [
    Expense(
      id: 'e1',
      amount: 500,
      date: now,
      category: const ExpenseCategory(id: 'c4', name: 'Labour Wages', colorCode: '#2E7D32', iconName: 'people'),
      paymentMethod: 'Cash',
      description: 'Labour: Nithin - Silkworm Feeding & Cleaning (Paid)',
    ),
    Expense(
      id: 'e2',
      amount: 600,
      date: now,
      category: const ExpenseCategory(id: 'c4', name: 'Labour Wages', colorCode: '#2E7D32', iconName: 'people'),
      paymentMethod: 'Pending',
      description: 'Labour: Ramesh - House Cleaning (Pending)',
    ),
  ];

  group('Labour & Wages Production-Ready UI Tests', () {
    testWidgets('Screen 1 & 4: WorkerListScreen renders overview and wage logs correctly', (tester) async {
      tester.view.physicalSize = const Size(1080, 2400);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(tester.view.resetPhysicalSize);

      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            labourNotifierProvider.overrideWith(() => _MockLabourNotifier(LabourState.data(dummyWorkers))),
            expenseNotifierProvider.overrideWith(() => _MockExpenseNotifier(ExpenseState.data(dummyExpenses))),
          ],
          child: const MaterialApp(home: WorkerListScreen()),
        ),
      );
      await tester.pumpAndSettle();

      // App bar & tabs
      expect(find.text('Labour & Wages'), findsOneWidget);
      expect(find.text('Workers'), findsOneWidget);
      expect(find.text('Wage Logs'), findsOneWidget);

      // KPI cards
      expect(find.text('Total Paid Wages'), findsOneWidget);
      expect(find.text('Pending Dues'), findsOneWidget);

      // Workers list
      expect(find.text('Farm Workers (2)'), findsOneWidget);
      expect(find.text('Nithin'), findsOneWidget);
      expect(find.text('+91 74186 61938'), findsOneWidget);
      expect(find.text('Ramesh'), findsOneWidget);
      expect(find.text('+91 98765 43210'), findsOneWidget);

      // Verify Banner is removed completely
      expect(find.textContaining('Manage your farm workers'), findsNothing);

      // Verify Topmost filter icon beside tabs
      expect(find.byIcon(Icons.tune_rounded), findsWidgets);

      // Verify swipe navigation: swipe left to Wage Logs
      await tester.fling(find.text('Farm Workers (2)'), const Offset(-500, 0), 1000);
      await tester.pumpAndSettle();

      // Verify Wage Logs elements
      expect(find.textContaining('All ('), findsOneWidget);
      expect(find.textContaining('Paid ('), findsOneWidget);
      expect(find.textContaining('Pending ('), findsOneWidget);
      expect(find.text('Add Wage Log'), findsOneWidget);
      expect(find.text('Silkworm Feeding & Cleaning'), findsOneWidget);
      expect(find.text('Paid'), findsWidgets);
      expect(find.text('Pending'), findsWidgets);

      // Tap on wage log to open action sheet with delete option
      await tester.tap(find.text('Silkworm Feeding & Cleaning').first);
      await tester.pumpAndSettle();

      expect(find.text('Delete Wage Log'), findsOneWidget);

      // Tap Delete Wage Log to open confirmation dialog
      await tester.tap(find.text('Delete Wage Log'));
      await tester.pumpAndSettle();

      expect(find.text('Delete Wage Log?'), findsOneWidget);
      expect(find.text('Cancel'), findsOneWidget);
      expect(find.text('Delete'), findsOneWidget);

      // Cancel deletion
      await tester.tap(find.text('Cancel'));
      await tester.pumpAndSettle();

      // Swipe right back to Workers
      await tester.fling(find.text('Add Wage Log'), const Offset(500, 0), 1000);
      await tester.pumpAndSettle();
      expect(find.text('Farm Workers (2)'), findsOneWidget);
    });

    testWidgets('Screen 2: WorkerFormScreen validates Indian mobile phone number strictly', (tester) async {
      tester.view.physicalSize = const Size(1080, 2400);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(tester.view.resetPhysicalSize);

      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            labourNotifierProvider.overrideWith(() => _MockLabourNotifier(const LabourState.data([]))),
          ],
          child: const MaterialApp(home: WorkerFormScreen()),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Add Worker'), findsOneWidget);
      expect(find.text('Add Profile Photo\n(Optional)'), findsOneWidget);
      expect(find.text('Full Name *'), findsOneWidget);
      expect(find.text('Phone Number *'), findsOneWidget);
      expect(find.text('Indian numbers must be 10 digits'), findsOneWidget);
      expect(find.text('Save Worker'), findsOneWidget);

      // Attempt to save with empty fields
      await tester.tap(find.text('Save Worker'));
      await tester.pumpAndSettle();

      expect(find.text('Worker name is required'), findsOneWidget);
      expect(find.text('Phone number is required'), findsOneWidget);

      // Enter invalid phone (<10 digits)
      final phoneField = find.widgetWithText(TextFormField, 'Enter phone number');
      await tester.enterText(phoneField, '12345');
      await tester.tap(find.text('Save Worker'));
      await tester.pumpAndSettle();
      expect(find.text('Indian mobile number must be exactly 10 digits'), findsOneWidget);

      // Enter 10 digits starting with invalid digit (e.g. 5)
      await tester.enterText(phoneField, '5234567890');
      await tester.tap(find.text('Save Worker'));
      await tester.pumpAndSettle();
      expect(find.text('Indian mobile number must start with 6, 7, 8, or 9'), findsOneWidget);

      // Enter valid Indian 10 digits
      await tester.enterText(phoneField, '9876543210');
      await tester.enterText(find.widgetWithText(TextFormField, 'Enter worker name'), 'Test Worker');
      await tester.tap(find.text('Save Worker'));
      await tester.pumpAndSettle();
      expect(find.text('Indian mobile number must be exactly 10 digits'), findsNothing);
    });

    testWidgets('Screen 3: WorkerDetailsScreen displays stats and delete confirmation', (tester) async {
      tester.view.physicalSize = const Size(1080, 2400);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(tester.view.resetPhysicalSize);

      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            labourNotifierProvider.overrideWith(() => _MockLabourNotifier(LabourState.data(dummyWorkers))),
            expenseNotifierProvider.overrideWith(() => _MockExpenseNotifier(ExpenseState.data(dummyExpenses))),
          ],
          child: MaterialApp(home: WorkerDetailsScreen(worker: dummyWorkers[0])),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Worker Details'), findsOneWidget);
      expect(find.text('Nithin'), findsOneWidget);
      expect(find.text('+91 74186 61938'), findsOneWidget);
      expect(find.text('Active'), findsOneWidget);

      // 3 Stat cards
      expect(find.text('Daily Wage'), findsOneWidget);
      expect(find.text('Total Earned'), findsOneWidget);
      expect(find.text('Total Days'), findsOneWidget);

      // Sub-tabs
      expect(find.text('Overview'), findsOneWidget);
      expect(find.text('Wage Logs'), findsOneWidget);
      expect(find.text('Edit'), findsOneWidget);

      // Actions
      expect(find.text('Edit Worker'), findsOneWidget);
      expect(find.text('Remove Worker'), findsOneWidget);

      // Tap Remove Worker to test dialog
      await tester.tap(find.text('Remove Worker'));
      await tester.pumpAndSettle();

      expect(find.text('Delete Worker?'), findsOneWidget);
      expect(find.textContaining('This will remove the worker from your list'), findsOneWidget);
      expect(find.text('Cancel'), findsOneWidget);
      expect(find.text('Delete'), findsOneWidget);

      // Tap Cancel closes dialog
      await tester.tap(find.text('Cancel'));
      await tester.pumpAndSettle();
      expect(find.text('Delete Worker?'), findsNothing);
    });

    testWidgets('Screen 5: AttendanceScreen renders selectors and status chips', (tester) async {
      tester.view.physicalSize = const Size(1080, 2400);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(tester.view.resetPhysicalSize);

      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            labourNotifierProvider.overrideWith(() => _MockLabourNotifier(LabourState.data(dummyWorkers))),
            expenseNotifierProvider.overrideWith(() => _MockExpenseNotifier(const ExpenseState.data([]))),
            batchNotifierProvider.overrideWith(() => _MockBatchNotifier(const BatchState.data([]))),
          ],
          child: const MaterialApp(home: AttendanceScreen()),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Add Wage Log'), findsOneWidget);
      expect(find.text('Select Worker *'), findsOneWidget);
      expect(find.text('Work Type *'), findsOneWidget);
      expect(find.text('Silkworm Feeding & Cleaning'), findsOneWidget);
      expect(find.text('Date *'), findsOneWidget);
      expect(find.text('Hours (Optional)'), findsOneWidget);
      expect(find.text('Amount (₹) *'), findsOneWidget);
      expect(find.text('Status'), findsOneWidget);
      expect(find.text('Paid'), findsOneWidget);
      expect(find.text('Pending'), findsOneWidget);
      expect(find.text('Overdue'), findsOneWidget);
      expect(find.text('Save Log'), findsOneWidget);
      expect(find.text('Cancel'), findsOneWidget);

      // Tap Pending status chip
      await tester.tap(find.text('Pending'));
      await tester.pumpAndSettle();

      // Tap Overdue status chip
      await tester.tap(find.text('Overdue'));
      await tester.pumpAndSettle();
    });
  });
}
