import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:farmstats/features/labour/presentation/screens/worker_list_screen.dart';
import 'package:farmstats/features/labour/presentation/screens/worker_form_screen.dart';
import 'package:farmstats/features/labour/presentation/screens/worker_details_screen.dart';
import 'package:farmstats/features/labour/presentation/screens/attendance_screen.dart';
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
      fullName: 'Samantha',
      phoneNumber: '+91 76760 76579',
      role: WorkerRole.cleaner,
      dailyWage: 500,
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
      description: 'Labour: Nithin | Day Shift • 10:00 AM - 6:00 PM | Silkworm Feeding & Cleaning (Paid)',
    ),
    Expense(
      id: 'e2',
      amount: 500,
      date: now,
      category: const ExpenseCategory(id: 'c4', name: 'Labour Wages', colorCode: '#2E7D32', iconName: 'people'),
      paymentMethod: 'Pending',
      description: 'Labour: Samantha | Early Morning Shift • 6:00 AM - 9:00 AM | Mulberry Field Work (Pending)',
    ),
  ];

  group('Labour & Wages Production-Grade UI Tests', () {
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
      expect(find.byIcon(Icons.tune_rounded), findsOneWidget);

      // Hero Attendance Card
      expect(find.text("Add Today's Wages"), findsOneWidget);

      // Verify redundant KPI cards are removed from Screen 1
      expect(find.text('Total Paid Wages'), findsNothing);
      expect(find.text('Pending Dues'), findsNothing);

      // Workers list
      expect(find.text('Farm Workers (2)'), findsOneWidget);
      expect(find.text('Add'), findsOneWidget);
      expect(find.text('Nithin'), findsOneWidget);
      expect(find.text('+91 74186 61938'), findsOneWidget);
      expect(find.text('Samantha'), findsOneWidget);
      expect(find.text('+91 76760 76579'), findsOneWidget);

      // Verify redundant search field from body is removed completely
      expect(find.widgetWithText(TextField, 'Search workers...'), findsNothing);

      // Verify AppBar search action opens compact search
      final searchIcon = find.byIcon(Icons.search);
      expect(searchIcon, findsOneWidget);
      await tester.tap(searchIcon);
      await tester.pumpAndSettle();

      expect(find.byType(TextField), findsOneWidget);
      await tester.enterText(find.byType(TextField), 'Nithin');
      await tester.pumpAndSettle();
      expect(find.text('Nithin'), findsWidgets);
      expect(find.text('Samantha'), findsNothing);

      // Clear search
      await tester.tap(find.byIcon(Icons.clear_rounded));
      await tester.pumpAndSettle();
      expect(find.text('Samantha'), findsOneWidget);

      // Exit search mode
      await tester.tap(find.byIcon(Icons.arrow_back_rounded));
      await tester.pumpAndSettle();

      // Verify Banner is removed completely
      expect(find.textContaining('Manage your farm workers'), findsNothing);

      // Verify swipe navigation: swipe left to Wage Logs
      await tester.fling(find.text('Farm Workers (2)'), const Offset(-500, 0), 1000);
      await tester.pumpAndSettle();

      // Verify Wage Logs elements
      expect(find.text('Add Wage Log'), findsOneWidget);

      // Worker-first card hierarchy: worker names and shift displays
      expect(find.text('Silkworm Feeding & Cleaning'), findsOneWidget);
      expect(find.text('Mulberry Field Work'), findsOneWidget);
      expect(find.text('Paid'), findsWidgets);
      expect(find.text('Unpaid'), findsWidgets);

      // Long press on wage log to open action sheet with edit, mark status, and delete options
      await tester.longPress(find.text('Silkworm Feeding & Cleaning').first);
      await tester.pumpAndSettle();

      expect(find.text('Wage Log Options'), findsOneWidget);
      expect(find.text('Edit Wage Log'), findsOneWidget);
      // Since Silkworm Feeding & Cleaning is Paid, it cannot be reverted to Unpaid
      expect(find.text('Mark as Unpaid'), findsNothing);
      expect(find.text('Mark as Paid'), findsNothing);
      expect(find.text('Delete Wage Log'), findsOneWidget);

      // Tap Delete Wage Log to open confirmation dialog
      await tester.tap(find.text('Delete Wage Log'));
      await tester.pumpAndSettle();

      expect(find.text('Delete Wage Log?'), findsOneWidget);
      expect(find.textContaining('permanently delete this wage log'), findsOneWidget);
      expect(find.text('Worker'), findsOneWidget);
      expect(find.text('Work Type'), findsOneWidget);
      expect(find.text('Cancel'), findsOneWidget);
      expect(find.text('Delete'), findsOneWidget);

      // Cancel deletion
      await tester.tap(find.text('Cancel'));
      await tester.pumpAndSettle();

      // Now long press on Mulberry Field Work (Unpaid) to verify contextual actions
      await tester.longPress(find.text('Mulberry Field Work').first);
      await tester.pumpAndSettle();

      expect(find.text('Wage Log Options'), findsOneWidget);
      expect(find.text('Edit Wage Log'), findsOneWidget);
      // Since Mulberry Field Work is Unpaid, it MUST show Mark as Paid and NEVER Mark as Unpaid
      expect(find.text('Mark as Paid'), findsOneWidget);
      expect(find.text('Mark as Unpaid'), findsNothing);
      expect(find.text('Delete Wage Log'), findsOneWidget);

      // Tap Mark as Paid to open confirmation dialog
      await tester.tap(find.text('Mark as Paid'));
      await tester.pumpAndSettle();

      expect(find.text('Mark as Paid?'), findsOneWidget);
      expect(find.textContaining('This will mark the wage as paid.'), findsOneWidget);
      expect(find.text('Cancel'), findsOneWidget);

      // Cancel Mark as Paid dialog
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

    testWidgets('Screen 3: WorkerDetailsScreen has 2 tabs, top-right menu for Edit/Remove, and bottom Add Wage Log', (tester) async {
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

      // Exactly 2 Sub-tabs (Overview & Wage Logs, NO Edit tab)
      expect(find.text('Overview'), findsOneWidget);
      expect(find.text('Wage Logs'), findsOneWidget);
      expect(find.text('Edit'), findsNothing);

      // Bottom fixed action button: + Add Today's Work
      expect(find.text("+ Add Today's Work"), findsOneWidget);

      // Verify Edit and Remove are in the top-right overflow popup menu
      final popupMenu = find.byType(PopupMenuButton<String>);
      expect(popupMenu, findsOneWidget);

      await tester.tap(popupMenu);
      await tester.pumpAndSettle();

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

    testWidgets('Screen 5: AttendanceScreen renders selectors, shift picker, and status chips', (tester) async {
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
      expect(find.text('Shift *'), findsOneWidget);
      expect(find.text('Day Shift'), findsOneWidget);
      expect(find.text('Date *'), findsOneWidget);
      expect(find.text('Wage Amount *'), findsOneWidget);
      expect(find.text('Payment Status *'), findsOneWidget);
      expect(find.text('Paid'), findsOneWidget);
      expect(find.text('Unpaid'), findsOneWidget);
      expect(find.text('Save Wage Log'), findsOneWidget);
      expect(find.text('Cancel'), findsOneWidget);

      // Tap Shift card to open SelectShiftSheet
      await tester.tap(find.text('Day Shift'));
      await tester.pumpAndSettle();

      expect(find.text('Select Shift'), findsOneWidget);
      expect(find.text('Early Morning Shift'), findsOneWidget);
      expect(find.text('Day Shift'), findsWidgets);

      // Select Early Morning Shift and confirm Done
      await tester.tap(find.text('Early Morning Shift'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Done'));
      await tester.pumpAndSettle();
      expect(find.text('Early Morning Shift'), findsOneWidget);

      // Tap Unpaid status chip
      await tester.tap(find.text('Unpaid'));
      await tester.pumpAndSettle();
    });

    testWidgets('Wage Log Options Confirmation Dialogs render correct labels and respond to confirmation', (tester) async {
      bool paidConfirmed = false;
      bool pendingConfirmed = false;
      bool deleteConfirmed = false;

      // Test ConfirmMarkPaidDialog
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Builder(
              builder: (ctx) => ElevatedButton(
                onPressed: () {
                  ConfirmMarkPaidDialog.show(
                    ctx,
                    workerName: 'Nithin',
                    amount: 750,
                    formattedDate: '29 Oct 2026',
                    shiftName: 'Morning Shift',
                    onConfirm: () => paidConfirmed = true,
                  );
                },
                child: const Text('Open Paid Dialog'),
              ),
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();

      await tester.tap(find.text('Open Paid Dialog'));
      await tester.pumpAndSettle();

      expect(find.text('Mark as Paid?'), findsOneWidget);
      expect(find.text('This will mark the wage as paid.'), findsOneWidget);
      expect(find.text('Nithin'), findsOneWidget);
      expect(find.text('29 Oct 2026'), findsOneWidget);
      expect(find.text('Morning Shift'), findsOneWidget);
      expect(find.text('₹750'), findsOneWidget);

      await tester.tap(find.widgetWithText(ElevatedButton, 'Mark as Paid'));
      await tester.pumpAndSettle();
      expect(paidConfirmed, isTrue);

      // Test ConfirmMarkPendingDialog
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Builder(
              builder: (ctx) => ElevatedButton(
                onPressed: () {
                  ConfirmMarkPendingDialog.show(
                    ctx,
                    workerName: 'Samantha',
                    amount: 600,
                    formattedDate: '30 Oct 2026',
                    shiftName: 'Day Shift',
                    onConfirm: () => pendingConfirmed = true,
                  );
                },
                child: const Text('Open Pending Dialog'),
              ),
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();

      await tester.tap(find.text('Open Pending Dialog'));
      await tester.pumpAndSettle();

      expect(find.text('Mark as Unpaid?'), findsOneWidget);
      expect(find.text('This will revert the payment to pending dues.'), findsOneWidget);
      expect(find.text('Samantha'), findsOneWidget);
      expect(find.text('30 Oct 2026'), findsOneWidget);
      expect(find.text('Day Shift'), findsOneWidget);
      expect(find.text('₹600'), findsOneWidget);

      await tester.tap(find.widgetWithText(ElevatedButton, 'Mark as Unpaid'));
      await tester.pumpAndSettle();
      expect(pendingConfirmed, isTrue);

      // Test DeleteWageLogDialog
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Builder(
              builder: (ctx) => ElevatedButton(
                onPressed: () {
                  DeleteWageLogDialog.show(
                    ctx,
                    taskTitle: 'Silkworm Feeding',
                    workerName: 'Nithin',
                    amount: 500,
                    formattedDate: '28 Oct 2026',
                    shiftName: 'Early Morning Shift',
                    onConfirm: () => deleteConfirmed = true,
                  );
                },
                child: const Text('Open Delete Dialog'),
              ),
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();

      await tester.tap(find.text('Open Delete Dialog'));
      await tester.pumpAndSettle();

      expect(find.text('Delete Wage Log?'), findsOneWidget);
      expect(find.textContaining('This will permanently delete this wage log.'), findsOneWidget);
      expect(find.text('Silkworm Feeding'), findsOneWidget);
      expect(find.text('Nithin'), findsOneWidget);
      expect(find.text('28 Oct 2026'), findsOneWidget);
      expect(find.text('Early Morning Shift'), findsOneWidget);
      expect(find.text('₹500'), findsOneWidget);

      await tester.tap(find.widgetWithText(ElevatedButton, 'Delete'));
      await tester.pumpAndSettle();
      expect(deleteConfirmed, isTrue);
    });
  });
}
