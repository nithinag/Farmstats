import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:farmstats/features/reports/presentation/screens/reports_dashboard_screen.dart';
import 'package:farmstats/features/reports/application/providers/reports_notifier.dart';
import 'package:farmstats/features/reports/application/providers/reports_state.dart';
import 'package:farmstats/features/reports/domain/entities/report_entities.dart';
import 'package:farmstats/features/expenses/application/providers/expense_notifier.dart';
import 'package:farmstats/features/expenses/application/providers/expense_state.dart';
import 'package:farmstats/features/expenses/domain/entities/expense_entities.dart';
import 'package:farmstats/features/income/application/providers/income_notifier.dart';
import 'package:farmstats/features/income/application/providers/income_state.dart';
import 'package:farmstats/features/income/domain/entities/income_entities.dart';
import 'package:farmstats/features/batches/application/providers/batch_notifier.dart';
import 'package:farmstats/features/batches/application/providers/batch_state.dart';
import 'package:farmstats/features/batches/domain/entities/batch_entities.dart';
import 'package:farmstats/features/harvest/application/providers/harvest_notifier.dart';
import 'package:farmstats/features/harvest/application/providers/harvest_state.dart';
import 'package:farmstats/features/harvest/domain/entities/harvest_entities.dart';

void main() {
  group('ReportsDashboardScreen Tests', () {
    testWidgets('renders Reports & Analytics header with top tabs and default Reports view', (tester) async {
      tester.view.physicalSize = const Size(1080, 2400);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(tester.view.resetPhysicalSize);

      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            reportsNotifierProvider.overrideWith(() => _MockReportsNotifier(const ReportsState.data(
              financial: FinancialReport(
                totalIncome: 0,
                totalExpenses: 0,
                netProfit: 0,
                expensesByCategory: {},
                incomeByBuyer: {},
              ),
              production: ProductionReport(
                averageYieldPercentage: 0,
                averageSurvivalRate: 0,
                totalGrossWeight: 0,
                totalNetSaleableWeight: 0,
                gradeDistribution: {},
              ),
            ))),
            expenseNotifierProvider.overrideWith(() => _MockExpenseNotifier(const ExpenseState.data([]))),
            incomeNotifierProvider.overrideWith(() => _MockIncomeNotifier(const IncomeState.data([]))),
            batchNotifierProvider.overrideWith(() => _MockBatchNotifier(const BatchState.data([]))),
            harvestNotifierProvider.overrideWith(() => _MockHarvestNotifier(const HarvestState.data([]))),
          ],
          child: const MaterialApp(home: ReportsDashboardScreen()),
        ),
      );
      await tester.pumpAndSettle();

      // Verify Header & Top Tabs
      expect(find.text('Reports & Analytics'), findsOneWidget);
      expect(find.text('Reports'), findsOneWidget);
      expect(find.text('Analytics'), findsOneWidget);

      // Verify Sub-filters
      expect(find.text('Month'), findsOneWidget);
      expect(find.text('Year'), findsOneWidget);
      expect(find.text('Batch'), findsOneWidget);
      expect(find.text('All'), findsOneWidget);

      // Verify Reports Default 2x2 KPI Cards
      expect(find.text('Total Revenue'), findsOneWidget);
      expect(find.text('Total Expenses'), findsOneWidget);
      expect(find.text('Net Profit'), findsOneWidget);
      expect(find.text('Profit Margin'), findsOneWidget);

      // Verify Sections
      expect(find.text('Expense Breakdown by Category'), findsOneWidget);
      expect(find.text('Cash Flow Trend'), findsOneWidget);
      expect(find.text('Batch Performance Ledger'), findsOneWidget);
    });

    testWidgets('switches to Analytics tab and displays production metrics and insights', (tester) async {
      tester.view.physicalSize = const Size(1080, 2400);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(tester.view.resetPhysicalSize);

      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            reportsNotifierProvider.overrideWith(() => _MockReportsNotifier(const ReportsState.data(
              financial: FinancialReport(
                totalIncome: 0,
                totalExpenses: 0,
                netProfit: 0,
                expensesByCategory: {},
                incomeByBuyer: {},
              ),
              production: ProductionReport(
                averageYieldPercentage: 0,
                averageSurvivalRate: 0,
                totalGrossWeight: 0,
                totalNetSaleableWeight: 0,
                gradeDistribution: {},
              ),
            ))),
            expenseNotifierProvider.overrideWith(() => _MockExpenseNotifier(const ExpenseState.data([]))),
            incomeNotifierProvider.overrideWith(() => _MockIncomeNotifier(const IncomeState.data([]))),
            batchNotifierProvider.overrideWith(() => _MockBatchNotifier(const BatchState.data([]))),
            harvestNotifierProvider.overrideWith(() => _MockHarvestNotifier(const HarvestState.data([]))),
          ],
          child: const MaterialApp(home: ReportsDashboardScreen()),
        ),
      );
      await tester.pumpAndSettle();

      // Tap on Analytics tab
      await tester.tap(find.text('Analytics'));
      await tester.pumpAndSettle();

      // Verify Analytics Production KPI row
      expect(find.text('Total Batches'), findsOneWidget);
      expect(find.text('Cocoon Produced'), findsOneWidget);
      expect(find.text('Avg. Yield'), findsOneWidget);
      expect(find.text('DFL Used'), findsOneWidget);

      // Verify Analytics Sections
      expect(find.text('Cocoon Production Trend'), findsOneWidget);
      expect(find.text('Batch Performance'), findsOneWidget);
      expect(find.text('Yield Comparison'), findsOneWidget);
      expect(find.text('Expense Insights'), findsOneWidget);
    });

    testWidgets('calculates correct financial KPIs with real transaction records', (tester) async {
      tester.view.physicalSize = const Size(1080, 2400);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(tester.view.resetPhysicalSize);

      final now = DateTime.now();
      final expenses = [
        Expense(
          id: 'e1',
          amount: 10500.0,
          date: now,
          category: const ExpenseCategory(id: 'c1', name: 'DFL Cost', colorCode: '#165B33', iconName: 'egg'),
          paymentMethod: 'Cash',
          description: 'DFLs for batch 1',
        ),
      ];
      final incomes = [
        Income(
          id: 'i1',
          saleDate: now,
          buyer: const Buyer(id: 'b1', name: 'Govt Market', contact: '1234567890'),
          category: const IncomeCategory(id: 'ic1', name: 'Cocoon Sale', colorCode: '#16A34A', iconName: 'store'),
          cocoonGrade: 'A',
          quantity: 50.0,
          rate: 500.0,
          grossAmount: 25000.0,
          transportCharges: 500.0,
          commission: 500.0,
          netAmount: 24000.0,
          paymentMethod: 'Bank Transfer',
          paymentStatus: 'Received',
        ),
      ];

      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            reportsNotifierProvider.overrideWith(() => _MockReportsNotifier(const ReportsState.data(
              financial: FinancialReport(
                totalIncome: 24000,
                totalExpenses: 10500,
                netProfit: 13500,
                expensesByCategory: {'DFL Cost': 10500},
                incomeByBuyer: {'Govt Market': 24000},
              ),
              production: ProductionReport(
                averageYieldPercentage: 0,
                averageSurvivalRate: 0,
                totalGrossWeight: 0,
                totalNetSaleableWeight: 0,
                gradeDistribution: {},
              ),
            ))),
            expenseNotifierProvider.overrideWith(() => _MockExpenseNotifier(ExpenseState.data(expenses))),
            incomeNotifierProvider.overrideWith(() => _MockIncomeNotifier(IncomeState.data(incomes))),
            batchNotifierProvider.overrideWith(() => _MockBatchNotifier(const BatchState.data([]))),
            harvestNotifierProvider.overrideWith(() => _MockHarvestNotifier(const HarvestState.data([]))),
          ],
          child: const MaterialApp(home: ReportsDashboardScreen()),
        ),
      );
      await tester.pumpAndSettle();

      // Net profit = 24000 - 10500 = 13500 (Profitable)
      expect(find.text('Profitable'), findsOneWidget);
      expect(find.text('+1 Sales'), findsOneWidget);
      expect(find.text('1 Logs'), findsOneWidget);
    });

    testWidgets('handles loss scenario with Deficit/Loss indicator', (tester) async {
      tester.view.physicalSize = const Size(1080, 2400);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(tester.view.resetPhysicalSize);

      final now = DateTime.now();
      final expenses = [
        Expense(
          id: 'e1',
          amount: 10500.0,
          date: now,
          category: const ExpenseCategory(id: 'c1', name: 'DFL Cost', colorCode: '#165B33', iconName: 'egg'),
          paymentMethod: 'Cash',
          description: 'DFLs for batch 1',
        ),
      ];

      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            reportsNotifierProvider.overrideWith(() => _MockReportsNotifier(const ReportsState.data(
              financial: FinancialReport(
                totalIncome: 0,
                totalExpenses: 10500,
                netProfit: -10500,
                expensesByCategory: {'DFL Cost': 10500},
                incomeByBuyer: {},
              ),
              production: ProductionReport(
                averageYieldPercentage: 0,
                averageSurvivalRate: 0,
                totalGrossWeight: 0,
                totalNetSaleableWeight: 0,
                gradeDistribution: {},
              ),
            ))),
            expenseNotifierProvider.overrideWith(() => _MockExpenseNotifier(ExpenseState.data(expenses))),
            incomeNotifierProvider.overrideWith(() => _MockIncomeNotifier(const IncomeState.data([]))),
            batchNotifierProvider.overrideWith(() => _MockBatchNotifier(const BatchState.data([]))),
            harvestNotifierProvider.overrideWith(() => _MockHarvestNotifier(const HarvestState.data([]))),
          ],
          child: const MaterialApp(home: ReportsDashboardScreen()),
        ),
      );
      await tester.pumpAndSettle();

      // Negative net profit -> Loss
      expect(find.text('Loss'), findsOneWidget);
      expect(find.text('0 Logs'), findsNothing);
      expect(find.text('1 Logs'), findsOneWidget);
      expect(find.text('+0 Sales'), findsOneWidget);
    });

    testWidgets('tapping export button opens export bottom sheet with CSV and PDF options', (tester) async {
      tester.view.physicalSize = const Size(1080, 2400);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(tester.view.resetPhysicalSize);

      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            reportsNotifierProvider.overrideWith(() => _MockReportsNotifier(const ReportsState.data(
              financial: FinancialReport(
                totalIncome: 0,
                totalExpenses: 0,
                netProfit: 0,
                expensesByCategory: {},
                incomeByBuyer: {},
              ),
              production: ProductionReport(
                averageYieldPercentage: 0,
                averageSurvivalRate: 0,
                totalGrossWeight: 0,
                totalNetSaleableWeight: 0,
                gradeDistribution: {},
              ),
            ))),
            expenseNotifierProvider.overrideWith(() => _MockExpenseNotifier(const ExpenseState.data([]))),
            incomeNotifierProvider.overrideWith(() => _MockIncomeNotifier(const IncomeState.data([]))),
            batchNotifierProvider.overrideWith(() => _MockBatchNotifier(const BatchState.data([]))),
            harvestNotifierProvider.overrideWith(() => _MockHarvestNotifier(const HarvestState.data([]))),
          ],
          child: const MaterialApp(home: ReportsDashboardScreen()),
        ),
      );
      await tester.pumpAndSettle();

      // Tap download icon in AppBar
      final exportBtn = find.byIcon(Icons.file_download_outlined);
      expect(exportBtn, findsOneWidget);
      await tester.tap(exportBtn);
      await tester.pumpAndSettle();

      // Verify modal bottom sheet options
      expect(find.text('Export Reports & Records'), findsOneWidget);
      expect(find.text('Export Filtered Records (CSV)'), findsOneWidget);
      expect(find.text('Export Summary Audit (PDF)'), findsOneWidget);
    });

    testWidgets('renders batch performance and harvest data across reports and analytics', (tester) async {
      tester.view.physicalSize = const Size(1080, 2400);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(tester.view.resetPhysicalSize);

      final now = DateTime.now();
      final batch = Batch(
        id: 'b1',
        batchName: 'Batch Alpha #01',
        startDate: now,
        expectedHarvestDate: now.add(const Duration(days: 30)),
        silkwormVariety: 'FC2 x FC1',
        eggSource: 'NSSP',
        numberOfDfls: 100,
        mulberryVariety: 'V1',
        rearingHouse: 'House 1',
        currentStage: InstarStage.spinning,
        currentAgeDays: 25,
        status: BatchStatus.active,
        healthStatus: HealthStatus.excellent,
        temperature: 26.0,
        humidity: 75.0,
      );

      final harvest = HarvestRecord(
        id: 'h1',
        batchId: 'b1',
        harvestDate: now,
        actualHarvestDuration: 4.0,
        grossWeight: 75.0,
        netSaleableWeight: 72.5,
        rejectedWeight: 2.5,
        moisturePercentage: 11.0,
        wastePercentage: 3.0,
        averageCocoonSize: 3.2,
        gradeDistribution: const CocoonGrade(
          gradeAWeight: 60.0,
          gradeBWeight: 10.0,
          gradeCWeight: 2.5,
          rejectedWeight: 2.5,
        ),
        metrics: const ProductionMetrics(
          yieldPercentage: 72.5,
          survivalRate: 90.0,
          feedConversionRatio: 2.1,
          mortalityPercentage: 5.0,
          harvestEfficiency: 95.0,
        ),
      );

      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            reportsNotifierProvider.overrideWith(() => _MockReportsNotifier(const ReportsState.data(
              financial: FinancialReport(
                totalIncome: 0,
                totalExpenses: 0,
                netProfit: 0,
                expensesByCategory: {},
                incomeByBuyer: {},
              ),
              production: ProductionReport(
                averageYieldPercentage: 72.5,
                averageSurvivalRate: 90,
                totalGrossWeight: 75,
                totalNetSaleableWeight: 72.5,
                gradeDistribution: {},
              ),
            ))),
            expenseNotifierProvider.overrideWith(() => _MockExpenseNotifier(const ExpenseState.data([]))),
            incomeNotifierProvider.overrideWith(() => _MockIncomeNotifier(const IncomeState.data([]))),
            batchNotifierProvider.overrideWith(() => _MockBatchNotifier(BatchState.data([batch]))),
            harvestNotifierProvider.overrideWith(() => _MockHarvestNotifier(HarvestState.data([harvest]))),
          ],
          child: const MaterialApp(home: ReportsDashboardScreen()),
        ),
      );
      await tester.pumpAndSettle();

      // Reports Ledger shows Batch Alpha #01
      expect(find.text('Batch Alpha #01'), findsOneWidget);
      expect(find.textContaining('72.5 kg'), findsWidgets);

      // Switch to Analytics
      await tester.tap(find.text('Analytics'));
      await tester.pumpAndSettle();

      expect(find.text('73 kg'), findsWidgets);
      expect(find.text('Batch Alpha #01'), findsWidgets);
    });
  });
}

class _MockReportsNotifier extends ReportsNotifier {
  final ReportsState _initial;
  _MockReportsNotifier(this._initial);

  @override
  ReportsState build() => _initial;

  @override
  Future<void> loadReports() async {}
}

class _MockExpenseNotifier extends ExpenseNotifier {
  final ExpenseState _initial;
  _MockExpenseNotifier(this._initial);

  @override
  ExpenseState build() => _initial;

  @override
  Future<void> loadExpenses() async {}
}

class _MockIncomeNotifier extends IncomeNotifier {
  final IncomeState _initial;
  _MockIncomeNotifier(this._initial);

  @override
  IncomeState build() => _initial;

  @override
  Future<void> loadIncomes() async {}
}

class _MockBatchNotifier extends BatchNotifier {
  final BatchState _initial;
  _MockBatchNotifier(this._initial);

  @override
  BatchState build() => _initial;

  @override
  Future<void> loadBatches() async {}
}

class _MockHarvestNotifier extends HarvestNotifier {
  final HarvestState _initial;
  _MockHarvestNotifier(this._initial);

  @override
  HarvestState build() => _initial;

  @override
  Future<void> loadHarvests() async {}
}
