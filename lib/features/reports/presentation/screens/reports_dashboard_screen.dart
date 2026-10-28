import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:intl/intl.dart';
import 'package:go_router/go_router.dart';
import '../../../../shared/widgets/feedback_views.dart';
import '../../../../core/theme/color_scheme.dart';
import '../../application/providers/reports_notifier.dart';
import '../../application/providers/reports_state.dart';
import '../../../expenses/application/providers/expense_notifier.dart';
import '../../../expenses/application/providers/expense_state.dart';
import '../../../expenses/domain/entities/expense_entities.dart';
import '../../../income/application/providers/income_notifier.dart';
import '../../../income/application/providers/income_state.dart';
import '../../../income/domain/entities/income_entities.dart';
import '../../../batches/application/providers/batch_notifier.dart';
import '../../../batches/application/providers/batch_state.dart';
import '../../../batches/domain/entities/batch_entities.dart';
import '../../../harvest/application/providers/harvest_notifier.dart';
import '../../../harvest/application/providers/harvest_state.dart';
import '../../../harvest/domain/entities/harvest_entities.dart';
import '../../application/services/report_services.dart' as report_services;
import '../../../../core/services/export_service.dart' as core_export;
import '../../../../data/providers/database_provider.dart';

class ReportsDashboardScreen extends ConsumerStatefulWidget {
  const ReportsDashboardScreen({super.key});

  @override
  ConsumerState<ReportsDashboardScreen> createState() => _ReportsDashboardScreenState();
}

class _ReportsDashboardScreenState extends ConsumerState<ReportsDashboardScreen> {
  int _selectedTab = 0; // 0: Reports, 1: Analytics
  String _timeFilter = 'Month'; // Month, Year, Batch, All
  DateTime _currentDate = DateTime.now();
  String? _selectedBatchId;
  String _productionUnit = 'kg';

  final NumberFormat _currencyFormat = NumberFormat.currency(
    symbol: '₹',
    decimalDigits: 0,
    locale: 'en_IN',
  );

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(reportsNotifierProvider);
    final expenseState = ref.watch(expenseNotifierProvider);
    final incomeState = ref.watch(incomeNotifierProvider);
    final batchState = ref.watch(batchNotifierProvider);
    final harvestState = ref.watch(harvestNotifierProvider);

    final expenses = switch (expenseState) {
      ExpenseStateData(expenses: final list) => list,
      _ => <Expense>[],
    };
    final incomes = switch (incomeState) {
      IncomeStateData(incomes: final list) => list,
      _ => <Income>[],
    };
    final batches = switch (batchState) {
      BatchStateData(batches: final list) => list,
      _ => <Batch>[],
    };
    final harvests = switch (harvestState) {
      HarvestStateData(harvests: final list) => list,
      _ => <HarvestRecord>[],
    };

    // Auto-select first batch if Batch filter is active but no batch selected
    if (_timeFilter == 'Batch' && _selectedBatchId == null && batches.isNotEmpty) {
      _selectedBatchId = batches.first.id;
    }

    // Filter datasets based on active filters
    final filteredData = _applyFilters(
      allExpenses: expenses,
      allIncomes: incomes,
      batches: batches,
      harvests: harvests,
    );

    return Scaffold(
      backgroundColor: const Color(0xFFF8FAF8),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        scrolledUnderElevation: 0,
        leading: Navigator.maybeOf(context)?.canPop() == true
            ? IconButton(
                icon: const Icon(Icons.arrow_back, color: Color(0xFF1E293B)),
                onPressed: () {
                  if (Navigator.of(context).canPop()) {
                    Navigator.of(context).pop();
                  }
                },
              )
            : null,
        title: const Text(
          'Reports & Analytics',
          style: TextStyle(
            color: Color(0xFF0F1E36),
            fontWeight: FontWeight.w700,
            fontSize: 18,
            letterSpacing: -0.3,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.file_download_outlined, color: AppColorScheme.primary),
            tooltip: 'Export Reports',
            onPressed: () => _showExportBottomSheet(
              context,
              filteredData.expenses,
              filteredData.incomes,
            ),
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: switch (state) {
        ReportsStateInitial() => const Center(child: CircularProgressIndicator(color: AppColorScheme.forestGreen)),
        ReportsStateLoading() => const Center(child: CircularProgressIndicator(color: AppColorScheme.forestGreen)),
        ReportsStateError(message: final m) => ErrorView(
            error: m,
            onRetry: () => ref.read(reportsNotifierProvider.notifier).loadReports(),
          ),
        _ => RefreshIndicator(
            color: AppColorScheme.forestGreen,
            onRefresh: () async {
              await ref.read(expenseNotifierProvider.notifier).loadExpenses();
              await ref.read(incomeNotifierProvider.notifier).loadIncomes();
              await ref.read(batchNotifierProvider.notifier).loadBatches();
              await ref.read(harvestNotifierProvider.notifier).loadHarvests();
              await ref.read(reportsNotifierProvider.notifier).loadReports();
            },
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
              children: [
                // Top Tab Switcher: Reports vs Analytics
                _buildTopTabSwitcher(),
                const SizedBox(height: 12),

                // Period Filter: Month | Year | Batch | All
                _buildPeriodFilterBar(),
                const SizedBox(height: 12),

                // Date / Batch Navigator
                _buildDateNavigator(batches),
                const SizedBox(height: 16),

                // Active Tab Content
                if (_selectedTab == 0)
                  _buildReportsView(
                    expenses: filteredData.expenses,
                    incomes: filteredData.incomes,
                    allExpenses: expenses,
                    allIncomes: incomes,
                    batches: batches,
                    harvests: harvests,
                  )
                else
                  _buildAnalyticsView(
                    expenses: filteredData.expenses,
                    incomes: filteredData.incomes,
                    batches: filteredData.batches,
                    allBatches: batches,
                    harvests: filteredData.harvests,
                    allHarvests: harvests,
                  ),
                const SizedBox(height: 32),
              ],
            ),
          ),
      },
    );
  }

  // ==========================================
  // TOP TABS (Reports vs Analytics)
  // ==========================================
  Widget _buildTopTabSwitcher() {
    return Row(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () {
              if (_selectedTab != 0) setState(() => _selectedTab = 0);
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 150),
              height: 44,
              decoration: BoxDecoration(
                color: _selectedTab == 0 ? const Color(0xFF165B33) : Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: const Color(0xFF165B33),
                  width: 1.2,
                ),
                boxShadow: _selectedTab == 0
                    ? [
                        BoxShadow(
                          color: const Color(0xFF165B33).withValues(alpha: 0.16),
                          blurRadius: 8,
                          offset: const Offset(0, 2),
                        ),
                      ]
                    : null,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.bar_chart_rounded,
                    size: 20,
                    color: _selectedTab == 0 ? Colors.white : const Color(0xFF165B33),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    'Reports',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: _selectedTab == 0 ? Colors.white : const Color(0xFF165B33),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: GestureDetector(
            onTap: () {
              if (_selectedTab != 1) setState(() => _selectedTab = 1);
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 150),
              height: 44,
              decoration: BoxDecoration(
                color: _selectedTab == 1 ? const Color(0xFF165B33) : Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: const Color(0xFF165B33),
                  width: 1.2,
                ),
                boxShadow: _selectedTab == 1
                    ? [
                        BoxShadow(
                          color: const Color(0xFF165B33).withValues(alpha: 0.16),
                          blurRadius: 8,
                          offset: const Offset(0, 2),
                        ),
                      ]
                    : null,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.trending_up_rounded,
                    size: 20,
                    color: _selectedTab == 1 ? Colors.white : const Color(0xFF165B33),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    'Analytics',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: _selectedTab == 1 ? Colors.white : const Color(0xFF165B33),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  // ==========================================
  // PERIOD FILTER BAR (Month, Year, Batch, All)
  // ==========================================
  Widget _buildPeriodFilterBar() {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: const Color(0xFFEAEFEA),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: ['Month', 'Year', 'Batch', 'All'].map((t) {
          final isSelected = _timeFilter == t;
          return Expanded(
            child: GestureDetector(
              onTap: () => setState(() => _timeFilter = t),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 150),
                padding: const EdgeInsets.symmetric(vertical: 8),
                decoration: BoxDecoration(
                  color: isSelected ? const Color(0xFF165B33) : Colors.transparent,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: isSelected
                      ? [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.08),
                            blurRadius: 4,
                            offset: const Offset(0, 1),
                          ),
                        ]
                      : null,
                ),
                child: Center(
                  child: Text(
                    t,
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: isSelected ? FontWeight.w700 : FontWeight.w600,
                      color: isSelected ? Colors.white : const Color(0xFF64748B),
                    ),
                  ),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  // ==========================================
  // DATE / BATCH NAVIGATOR
  // ==========================================
  Widget _buildDateNavigator(List<Batch> batches) {
    if (_timeFilter == 'All') {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: const Color(0xFFE2E8F0)),
        ),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.calendar_today_outlined, size: 16, color: Color(0xFF165B33)),
            SizedBox(width: 8),
            Text(
              'All Historical Records',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 14,
                color: Color(0xFF1E293B),
              ),
            ),
          ],
        ),
      );
    }

    if (_timeFilter == 'Batch') {
      final selectedBatch = batches.where((b) => b.id == _selectedBatchId).firstOrNull ?? batches.firstOrNull;
      final batchIndex = selectedBatch != null ? batches.indexOf(selectedBatch) : -1;

      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: const Color(0xFFE2E8F0)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: const Icon(Icons.chevron_left, color: Color(0xFF64748B)),
              onPressed: batches.isNotEmpty && batchIndex > 0
                  ? () {
                      setState(() {
                        _selectedBatchId = batches[batchIndex - 1].id;
                      });
                    }
                  : null,
            ),
            GestureDetector(
              onTap: batches.isNotEmpty ? () => _showBatchPicker(batches) : null,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.layers_outlined, size: 16, color: Color(0xFF165B33)),
                  const SizedBox(width: 8),
                  Text(
                    selectedBatch?.batchName ?? (batches.isEmpty ? 'No Batches Available' : 'Select Batch'),
                    style: const TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 14.5,
                      color: Color(0xFF1E293B),
                    ),
                  ),
                  if (batches.isNotEmpty) ...[
                    const SizedBox(width: 4),
                    const Icon(Icons.arrow_drop_down, color: Color(0xFF64748B), size: 18),
                  ],
                ],
              ),
            ),
            IconButton(
              icon: const Icon(Icons.chevron_right, color: Color(0xFF64748B)),
              onPressed: batches.isNotEmpty && batchIndex < batches.length - 1
                  ? () {
                      setState(() {
                        _selectedBatchId = batches[batchIndex + 1].id;
                      });
                    }
                  : null,
            ),
          ],
        ),
      );
    }

    // Month or Year navigation
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFE2E8F0)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: const Icon(Icons.chevron_left, color: Color(0xFF64748B)),
            onPressed: () {
              setState(() {
                if (_timeFilter == 'Month') {
                  _currentDate = DateTime(_currentDate.year, _currentDate.month - 1);
                } else {
                  _currentDate = DateTime(_currentDate.year - 1);
                }
              });
            },
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.calendar_today_outlined, size: 16, color: Color(0xFF165B33)),
              const SizedBox(width: 8),
              Text(
                _timeFilter == 'Month'
                    ? DateFormat('MMMM yyyy').format(_currentDate)
                    : DateFormat('yyyy').format(_currentDate),
                style: const TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 15,
                  color: Color(0xFF1E293B),
                ),
              ),
            ],
          ),
          IconButton(
            icon: const Icon(Icons.chevron_right, color: Color(0xFF64748B)),
            onPressed: () {
              setState(() {
                if (_timeFilter == 'Month') {
                  _currentDate = DateTime(_currentDate.year, _currentDate.month + 1);
                } else {
                  _currentDate = DateTime(_currentDate.year + 1);
                }
              });
            },
          ),
        ],
      ),
    );
  }

  void _showBatchPicker(List<Batch> batches) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (ctx) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  'Select Batch for Reporting',
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
                ),
              ),
              const Divider(height: 1),
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: batches.length,
                  itemBuilder: (ctx, index) {
                    final b = batches[index];
                    final isSelected = b.id == _selectedBatchId;
                    return ListTile(
                      title: Text(b.batchName, style: TextStyle(fontWeight: isSelected ? FontWeight.bold : FontWeight.normal)),
                      subtitle: Text('${b.numberOfDfls} DFLs • ${b.status.name.toUpperCase()}'),
                      trailing: isSelected ? const Icon(Icons.check, color: AppColorScheme.forestGreen) : null,
                      onTap: () {
                        setState(() => _selectedBatchId = b.id);
                        Navigator.pop(ctx);
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  // ==========================================
  // TAB 1: REPORTS VIEW
  // ==========================================
  Widget _buildReportsView({
    required List<Expense> expenses,
    required List<Income> incomes,
    required List<Expense> allExpenses,
    required List<Income> allIncomes,
    required List<Batch> batches,
    required List<HarvestRecord> harvests,
  }) {
    final totalRevenue = incomes.fold(0.0, (sum, i) => sum + i.netAmount);
    final totalExpenses = expenses.fold(0.0, (sum, e) => sum + e.amount);
    final netProfit = totalRevenue - totalExpenses;
    final margin = totalRevenue > 0 ? (netProfit / totalRevenue) * 100 : 0.0;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // 2x2 Financial KPI Grid
        Row(
          children: [
            Expanded(
              child: _financialKpiCard(
                title: 'Total Revenue',
                amount: _currencyFormat.format(totalRevenue),
                icon: Icons.arrow_downward,
                iconColor: const Color(0xFF16A34A),
                iconBg: const Color(0xFFDCFCE7),
                badgeText: '+${incomes.length} Sales',
                badgeColor: const Color(0xFF16A34A),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _financialKpiCard(
                title: 'Total Expenses',
                amount: _currencyFormat.format(totalExpenses),
                amountColor: const Color(0xFFE11D48),
                icon: Icons.arrow_upward,
                iconColor: const Color(0xFFE11D48),
                iconBg: const Color(0xFFFFE4E6),
                badgeText: '${expenses.length} Logs',
                badgeColor: const Color(0xFFE11D48),
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: _financialKpiCard(
                title: 'Net Profit',
                amount: netProfit < 0
                    ? '-${_currencyFormat.format(netProfit.abs())}'
                    : _currencyFormat.format(netProfit),
                amountColor: netProfit < 0
                    ? const Color(0xFFDC2626)
                    : (netProfit > 0 ? const Color(0xFF16A34A) : const Color(0xFF1E293B)),
                icon: Icons.show_chart,
                iconColor: netProfit < 0 ? const Color(0xFFDC2626) : const Color(0xFF16A34A),
                iconBg: netProfit < 0 ? const Color(0xFFFFE4E6) : const Color(0xFFDCFCE7),
                badgeText: netProfit < 0 ? 'Loss' : (netProfit > 0 ? 'Profitable' : 'Break-even'),
                badgeColor: netProfit < 0 ? const Color(0xFFDC2626) : const Color(0xFF16A34A),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _financialKpiCard(
                title: 'Profit Margin',
                amount: '${margin.toStringAsFixed(2)}%',
                amountColor: const Color(0xFF2563EB),
                icon: Icons.percent,
                iconColor: const Color(0xFF2563EB),
                iconBg: const Color(0xFFEFF6FF),
                badgeText: 'ROI Score',
                badgeColor: const Color(0xFF2563EB),
              ),
            ),
          ],
        ),
        const SizedBox(height: 18),

        // Expense Breakdown by Category (Doughnut Chart + Table)
        _buildExpenseBreakdownCard(expenses, totalExpenses),
        const SizedBox(height: 18),

        // Cash Flow Trend (Monthly/Period Dual Bar Chart)
        _buildCashFlowTrendCard(allExpenses, allIncomes),
        const SizedBox(height: 18),

        // Batch Performance Ledger
        _buildBatchPerformanceLedger(allExpenses, allIncomes, batches, harvests),
      ],
    );
  }

  // ==========================================
  // TAB 2: ANALYTICS VIEW
  // ==========================================
  Widget _buildAnalyticsView({
    required List<Expense> expenses,
    required List<Income> incomes,
    required List<Batch> batches,
    required List<Batch> allBatches,
    required List<HarvestRecord> harvests,
    required List<HarvestRecord> allHarvests,
  }) {
    final totalBatchesCount = batches.length;
    final totalCocoonKg = harvests.fold(0.0, (sum, h) => sum + h.netSaleableWeight);
    final totalDfls = batches.fold(0, (sum, b) => sum + b.numberOfDfls);
    final avgYieldKg = totalBatchesCount > 0 && totalCocoonKg > 0 ? (totalCocoonKg / totalBatchesCount) : 0.0;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // 4 Summary Metrics (Image 1: Total Batches, Cocoon Produced, Avg. Yield, DFL Used)
        Row(
          children: [
            Expanded(
              child: _analyticsMiniCard(
                label: 'Total Batches',
                value: '$totalBatchesCount',
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: _analyticsMiniCard(
                label: 'Cocoon Produced',
                value: '${totalCocoonKg.toStringAsFixed(0)} $_productionUnit',
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: _analyticsMiniCard(
                label: 'Avg. Yield',
                value: '${avgYieldKg.toStringAsFixed(0)} $_productionUnit',
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: _analyticsMiniCard(
                label: 'DFL Used',
                value: '$totalDfls',
              ),
            ),
          ],
        ),
        const SizedBox(height: 18),

        // Cocoon Production Trend Card
        _buildCocoonProductionTrendCard(allHarvests),
        const SizedBox(height: 18),

        // Batch Performance Insights Card
        _buildBatchComparisonCard(allBatches, expenses, incomes, harvests),
        const SizedBox(height: 18),

        // Yield Comparison Card
        _buildYieldComparisonCard(batches, harvests),
        const SizedBox(height: 18),

        // Expense Insights Card
        _buildExpenseInsightsCard(expenses, totalCocoonKg),
      ],
    );
  }

  // ==========================================
  // REUSABLE CARDS & SECTIONS
  // ==========================================

  Widget _financialKpiCard({
    required String title,
    required String amount,
    Color? amountColor,
    required IconData icon,
    required Color iconColor,
    required Color iconBg,
    required String badgeText,
    required Color badgeColor,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFE2E8F0)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.02),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF64748B),
                ),
              ),
              Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  color: iconBg,
                  shape: BoxShape.circle,
                ),
                child: Icon(icon, size: 14, color: iconColor),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            amount,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w800,
              color: amountColor ?? const Color(0xFF1E293B),
              letterSpacing: -0.3,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            badgeText,
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w600,
              color: badgeColor,
            ),
          ),
        ],
      ),
    );
  }

  Widget _analyticsMiniCard({
    required String label,
    required String value,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFE2E8F0)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w600,
              color: Color(0xFF64748B),
            ),
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w800,
              color: Color(0xFF1E293B),
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  // ------------------------------------------
  // Expense Breakdown by Category (Doughnut Chart + Table)
  // ------------------------------------------
  Widget _buildExpenseBreakdownCard(List<Expense> expenses, double totalExpenses) {
    // Standard Sericulture expense categories and color mapping
    final Map<String, Color> categoryColorMap = {
      'DFL Cost': const Color(0xFF165B33),
      'Labour': const Color(0xFF2563EB),
      'Utilities': const Color(0xFF0D9488),
      'Transport': const Color(0xFF8B5CF6),
      'Others': const Color(0xFF64748B),
      'Feeding': const Color(0xFFD97706),
      'Disinfection': const Color(0xFF0284C7),
      'Equipment': const Color(0xFF475569),
    };

    final Map<String, double> categorySums = {};
    for (final e in expenses) {
      final name = e.category.name;
      categorySums[name] = (categorySums[name] ?? 0.0) + e.amount;
    }

    // Default categories to show if empty or standard
    final standardKeys = ['DFL Cost', 'Labour', 'Utilities', 'Transport', 'Others'];
    for (final key in standardKeys) {
      categorySums.putIfAbsent(key, () => 0.0);
    }

    final sortedList = categorySums.entries.toList()
      ..sort((a, b) => b.value.compareTo(a.value));

    // Calculate doughnut sections
    final List<PieChartSectionData> sections = [];
    double dominantPercentage = 0.0;

    if (totalExpenses > 0) {
      for (final entry in sortedList) {
        if (entry.value > 0) {
          final pct = (entry.value / totalExpenses) * 100;
          if (pct > dominantPercentage) dominantPercentage = pct;
          final color = categoryColorMap[entry.key] ?? const Color(0xFF165B33);
          sections.add(
            PieChartSectionData(
              color: color,
              value: entry.value,
              showTitle: false,
              radius: 16,
            ),
          );
        }
      }
    }

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFE2E8F0)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Expense Breakdown by Category',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 14,
                  color: Color(0xFF1E293B),
                ),
              ),
              Text(
                _currencyFormat.format(totalExpenses),
                style: const TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: 14,
                  color: Color(0xFFE11D48),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Doughnut Chart
              SizedBox(
                width: 104,
                height: 104,
                child: totalExpenses == 0
                    ? Stack(
                        alignment: Alignment.center,
                        children: [
                          PieChart(
                            PieChartData(
                              sectionsSpace: 0,
                              centerSpaceRadius: 36,
                              startDegreeOffset: -90,
                              sections: [
                                PieChartSectionData(
                                  color: const Color(0xFFF1F5F9),
                                  value: 1,
                                  showTitle: false,
                                  radius: 14,
                                ),
                              ],
                            ),
                          ),
                          const Text(
                            '0%',
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w700,
                              color: Color(0xFF94A3B8),
                            ),
                          ),
                        ],
                      )
                    : Stack(
                        alignment: Alignment.center,
                        children: [
                          PieChart(
                            PieChartData(
                              sectionsSpace: 2,
                              centerSpaceRadius: 36,
                              startDegreeOffset: -90,
                              sections: sections,
                            ),
                          ),
                          Text(
                            '${dominantPercentage.toStringAsFixed(0)}%',
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w800,
                              color: Color(0xFF165B33),
                            ),
                          ),
                        ],
                      ),
              ),
              const SizedBox(width: 16),

              // Breakdown Table on the right
              Expanded(
                child: Column(
                  children: sortedList.take(5).map((entry) {
                    final pct = totalExpenses > 0 ? (entry.value / totalExpenses) * 100 : 0.0;
                    final color = categoryColorMap[entry.key] ?? const Color(0xFF64748B);
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 3.0),
                      child: Row(
                        children: [
                          Container(
                            width: 8,
                            height: 8,
                            decoration: BoxDecoration(color: color, shape: BoxShape.circle),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              entry.key,
                              style: const TextStyle(
                                fontSize: 11.5,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF334155),
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Text(
                            '${pct.toStringAsFixed(0)}%',
                            style: const TextStyle(
                              fontSize: 11.5,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF64748B),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Text(
                            _currencyFormat.format(entry.value),
                            style: const TextStyle(
                              fontSize: 11.5,
                              fontWeight: FontWeight.w700,
                              color: Color(0xFF1E293B),
                            ),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // ------------------------------------------
  // Cash Flow Trend (Monthly Paired Bar Chart)
  // ------------------------------------------
  Widget _buildCashFlowTrendCard(List<Expense> allExpenses, List<Income> allIncomes) {
    // Generate 10-12 months for current year
    final activeYear = _currentDate.year;
    final months = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
    final monthLabels = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct'];

    double maxVal = 0.0;
    bool hasAnyTransactions = false;

    final barGroups = <BarChartGroupData>[];

    for (int i = 0; i < months.length; i++) {
      final m = months[i];
      final rev = allIncomes
          .where((inc) => inc.saleDate.year == activeYear && inc.saleDate.month == m)
          .fold(0.0, (sum, inc) => sum + inc.netAmount);
      final exp = allExpenses
          .where((e) => e.date.year == activeYear && e.date.month == m)
          .fold(0.0, (sum, e) => sum + e.amount);

      if (rev > 0 || exp > 0) hasAnyTransactions = true;
      if (rev > maxVal) maxVal = rev;
      if (exp > maxVal) maxVal = exp;

      barGroups.add(
        BarChartGroupData(
          x: i,
          barRods: [
            BarChartRodData(
              toY: rev,
              color: const Color(0xFF16A34A),
              width: 5,
              borderRadius: const BorderRadius.vertical(top: Radius.circular(3)),
            ),
            BarChartRodData(
              toY: exp,
              color: const Color(0xFFE11D48),
              width: 5,
              borderRadius: const BorderRadius.vertical(top: Radius.circular(3)),
            ),
          ],
        ),
      );
    }

    final maxY = maxVal > 0 ? (maxVal * 1.25).ceilToDouble() : 30000.0;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFE2E8F0)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Row(
                children: [
                  Icon(Icons.bar_chart_rounded, size: 18, color: Color(0xFF165B33)),
                  SizedBox(width: 6),
                  Text(
                    'Cash Flow Trend',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 14,
                      color: Color(0xFF1E293B),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  _chartLegendDot(const Color(0xFF16A34A), 'Revenue'),
                  const SizedBox(width: 10),
                  _chartLegendDot(const Color(0xFFE11D48), 'Expenses'),
                ],
              ),
            ],
          ),
          const SizedBox(height: 16),
          SizedBox(
            height: 150,
            child: !hasAnyTransactions
                ? const Center(
                    child: Text(
                      'No transactions in this period',
                      style: TextStyle(color: Color(0xFF94A3B8), fontSize: 12),
                    ),
                  )
                : BarChart(
                    BarChartData(
                      maxY: maxY,
                      barGroups: barGroups,
                      alignment: BarChartAlignment.spaceAround,
                      gridData: FlGridData(
                        show: true,
                        drawVerticalLine: false,
                        getDrawingHorizontalLine: (v) => const FlLine(
                          color: Color(0xFFF1F5F9),
                          strokeWidth: 1,
                        ),
                      ),
                      borderData: FlBorderData(show: false),
                      titlesData: FlTitlesData(
                        show: true,
                        topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                        rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                        leftTitles: AxisTitles(
                          sideTitles: SideTitles(
                            showTitles: true,
                            reservedSize: 28,
                            getTitlesWidget: (v, meta) {
                              if (v == 0) return const Text('0', style: TextStyle(fontSize: 9, color: Color(0xFF94A3B8)));
                              if (v >= 1000) return Text('${(v / 1000).toStringAsFixed(0)}K', style: const TextStyle(fontSize: 9, color: Color(0xFF94A3B8)));
                              return Text(v.toInt().toString(), style: const TextStyle(fontSize: 9, color: Color(0xFF94A3B8)));
                            },
                          ),
                        ),
                        bottomTitles: AxisTitles(
                          sideTitles: SideTitles(
                            showTitles: true,
                            getTitlesWidget: (v, meta) {
                              final idx = v.toInt();
                              if (idx >= 0 && idx < monthLabels.length) {
                                return Padding(
                                  padding: const EdgeInsets.only(top: 4.0),
                                  child: Text(
                                    monthLabels[idx],
                                    style: const TextStyle(fontSize: 10, color: Color(0xFF64748B)),
                                  ),
                                );
                              }
                              return const SizedBox.shrink();
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
          ),
        ],
      ),
    );
  }

  // ------------------------------------------
  // Batch Performance Ledger
  // ------------------------------------------
  Widget _buildBatchPerformanceLedger(
    List<Expense> allExpenses,
    List<Income> allIncomes,
    List<Batch> batches,
    List<HarvestRecord> harvests,
  ) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFE2E8F0)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              Icon(Icons.layers_outlined, size: 18, color: Color(0xFF165B33)),
              SizedBox(width: 6),
              Text(
                'Batch Performance Ledger',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 14,
                  color: Color(0xFF1E293B),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          if (batches.isEmpty)
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 16),
              child: Center(
                child: Text('No batches found', style: TextStyle(color: Color(0xFF94A3B8), fontSize: 12)),
              ),
            )
          else
            ...batches.map((b) {
              final bExp = allExpenses.where((e) => e.batchId == b.id).fold(0.0, (sum, e) => sum + e.amount);
              final bRev = allIncomes.where((i) => i.batchId == b.id).fold(0.0, (sum, i) => sum + i.netAmount);
              final bProfit = bRev - bExp;
              final bHarvestKg = harvests.where((h) => h.batchId == b.id).fold(0.0, (sum, h) => sum + h.netSaleableWeight);

              return Container(
                margin: const EdgeInsets.only(bottom: 8),
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: const Color(0xFFF8FAFC),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: const Color(0xFFE2E8F0)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            b.batchName,
                            style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 13, color: Color(0xFF1E293B)),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            '${b.numberOfDfls} DFLs • ${b.status.name.toUpperCase()}${bHarvestKg > 0 ? ' • ${bHarvestKg.toStringAsFixed(1)} kg' : ''}',
                            style: const TextStyle(fontSize: 11, color: Color(0xFF64748B)),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          _currencyFormat.format(bRev),
                          style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 13, color: Color(0xFF16A34A)),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          bProfit >= 0 ? '+${_currencyFormat.format(bProfit)}' : '-${_currencyFormat.format(bProfit.abs())}',
                          style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.bold,
                            color: bProfit >= 0 ? const Color(0xFF16A34A) : const Color(0xFFDC2626),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            }),
        ],
      ),
    );
  }

  // ------------------------------------------
  // Cocoon Production Trend Card
  // ------------------------------------------
  Widget _buildCocoonProductionTrendCard(List<HarvestRecord> allHarvests) {
    final activeYear = _currentDate.year;
    final months = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
    final monthLabels = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct'];

    final spots = <FlSpot>[];
    double maxHarvest = 0.0;
    bool hasData = false;

    for (int i = 0; i < months.length; i++) {
      final m = months[i];
      final kg = allHarvests
          .where((h) => h.harvestDate.year == activeYear && h.harvestDate.month == m)
          .fold(0.0, (sum, h) => sum + h.netSaleableWeight);

      if (kg > 0) hasData = true;
      if (kg > maxHarvest) maxHarvest = kg;
      spots.add(FlSpot(i.toDouble(), kg));
    }

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFE2E8F0)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Row(
                children: [
                  Icon(Icons.eco_outlined, size: 18, color: Color(0xFF165B33)),
                  SizedBox(width: 6),
                  Text(
                    'Cocoon Production Trend',
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 14, color: Color(0xFF1E293B)),
                  ),
                ],
              ),
              GestureDetector(
                onTap: () => setState(() => _productionUnit = _productionUnit == 'kg' ? 'quintal' : 'kg'),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF1F5F9),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: const Color(0xFFE2E8F0)),
                  ),
                  child: Row(
                    children: [
                      Text(_productionUnit, style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w600, color: Color(0xFF475569))),
                      const Icon(Icons.arrow_drop_down, size: 14, color: Color(0xFF64748B)),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          SizedBox(
            height: 140,
            child: !hasData
                ? const Center(
                    child: Text(
                      'No production data in this period',
                      style: TextStyle(color: Color(0xFF94A3B8), fontSize: 12),
                    ),
                  )
                : LineChart(
                    LineChartData(
                      maxY: maxHarvest > 0 ? (maxHarvest * 1.3).ceilToDouble() : 30.0,
                      minY: 0,
                      lineBarsData: [
                        LineChartBarData(
                          spots: spots,
                          isCurved: true,
                          color: const Color(0xFF165B33),
                          barWidth: 2.5,
                          dotData: const FlDotData(show: true),
                          belowBarData: BarAreaData(
                            show: true,
                            color: const Color(0xFF165B33).withValues(alpha: 0.1),
                          ),
                        ),
                      ],
                      gridData: FlGridData(
                        show: true,
                        drawVerticalLine: false,
                        getDrawingHorizontalLine: (v) => const FlLine(color: Color(0xFFF1F5F9), strokeWidth: 1),
                      ),
                      borderData: FlBorderData(show: false),
                      titlesData: FlTitlesData(
                        topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                        rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                        leftTitles: AxisTitles(
                          sideTitles: SideTitles(
                            showTitles: true,
                            reservedSize: 24,
                            getTitlesWidget: (v, meta) => Text(
                              v.toInt().toString(),
                              style: const TextStyle(fontSize: 9, color: Color(0xFF94A3B8)),
                            ),
                          ),
                        ),
                        bottomTitles: AxisTitles(
                          sideTitles: SideTitles(
                            showTitles: true,
                            getTitlesWidget: (v, meta) {
                              final idx = v.toInt();
                              if (idx >= 0 && idx < monthLabels.length) {
                                return Padding(
                                  padding: const EdgeInsets.only(top: 4.0),
                                  child: Text(
                                    monthLabels[idx],
                                    style: const TextStyle(fontSize: 10, color: Color(0xFF64748B)),
                                  ),
                                );
                              }
                              return const SizedBox.shrink();
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
          ),
        ],
      ),
    );
  }

  // ------------------------------------------
  // Batch Performance / Comparison Card
  // ------------------------------------------
  Widget _buildBatchComparisonCard(
    List<Batch> batches,
    List<Expense> expenses,
    List<Income> incomes,
    List<HarvestRecord> harvests,
  ) {
    final hasBatchesWithData = batches.any((b) =>
        expenses.any((e) => e.batchId == b.id) ||
        incomes.any((i) => i.batchId == b.id) ||
        harvests.any((h) => h.batchId == b.id));

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFE2E8F0)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Row(
                children: [
                  Icon(Icons.insights_rounded, size: 18, color: Color(0xFF165B33)),
                  SizedBox(width: 6),
                  Text(
                    'Batch Performance',
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 14, color: Color(0xFF1E293B)),
                  ),
                ],
              ),
              GestureDetector(
                onTap: () {
                  try {
                    context.go('/batches-tab');
                  } catch (_) {}
                },
                child: const Row(
                  children: [
                    Text(
                      'View All',
                      style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: Color(0xFF165B33)),
                    ),
                    Icon(Icons.chevron_right, size: 16, color: Color(0xFF165B33)),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          if (!hasBatchesWithData)
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 12.0),
                child: Column(
                  children: [
                    Container(
                      width: 44,
                      height: 44,
                      decoration: const BoxDecoration(
                        color: Color(0xFFF1F5F9),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.access_time, color: Color(0xFF64748B), size: 22),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'No batch data available',
                      style: TextStyle(fontWeight: FontWeight.w700, fontSize: 13, color: Color(0xFF1E293B)),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      'Create and complete batches to see\nperformance insights here',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 11.5, color: Color(0xFF64748B)),
                    ),
                  ],
                ),
              ),
            )
          else
            Column(
              children: batches.map((b) {
                final bHarvest = harvests.where((h) => h.batchId == b.id).fold(0.0, (s, h) => s + h.netSaleableWeight);
                final bCost = expenses.where((e) => e.batchId == b.id).fold(0.0, (s, e) => s + e.amount);
                final bRev = incomes.where((i) => i.batchId == b.id).fold(0.0, (s, i) => s + i.netAmount);
                final bProfit = bRev - bCost;

                return Container(
                  margin: const EdgeInsets.only(bottom: 8),
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF8FAFC),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: const Color(0xFFE2E8F0)),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(b.batchName, style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 13)),
                          Text(
                            'Yield: ${bHarvest > 0 ? '${bHarvest.toStringAsFixed(1)} kg' : 'Pending'} • Cost: ${_currencyFormat.format(bCost)}',
                            style: const TextStyle(fontSize: 11, color: Color(0xFF64748B)),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            _currencyFormat.format(bRev),
                            style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 13, color: Color(0xFF16A34A)),
                          ),
                          Text(
                            bProfit >= 0 ? '+${_currencyFormat.format(bProfit)}' : '-${_currencyFormat.format(bProfit.abs())}',
                            style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.bold,
                              color: bProfit >= 0 ? const Color(0xFF16A34A) : const Color(0xFFDC2626),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
        ],
      ),
    );
  }

  // ------------------------------------------
  // Yield Comparison Card
  // ------------------------------------------
  Widget _buildYieldComparisonCard(List<Batch> batches, List<HarvestRecord> harvests) {
    final hasYieldData = harvests.any((h) => h.netSaleableWeight > 0);

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFE2E8F0)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Row(
                children: [
                  Icon(Icons.analytics_outlined, size: 18, color: Color(0xFF165B33)),
                  SizedBox(width: 6),
                  Text(
                    'Yield Comparison',
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 14, color: Color(0xFF1E293B)),
                  ),
                ],
              ),
              GestureDetector(
                onTap: () => setState(() => _productionUnit = _productionUnit == 'kg' ? 'quintal' : 'kg'),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF1F5F9),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: const Color(0xFFE2E8F0)),
                  ),
                  child: Row(
                    children: [
                      Text(_productionUnit, style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w600, color: Color(0xFF475569))),
                      const Icon(Icons.arrow_drop_down, size: 14, color: Color(0xFF64748B)),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          if (!hasYieldData)
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 12.0),
                child: Column(
                  children: [
                    Container(
                      width: 44,
                      height: 44,
                      decoration: const BoxDecoration(
                        color: Color(0xFFF1F5F9),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.access_time, color: Color(0xFF64748B), size: 22),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'No data to display',
                      style: TextStyle(fontWeight: FontWeight.w700, fontSize: 13, color: Color(0xFF1E293B)),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      'Select a time period to view yield comparison',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 11.5, color: Color(0xFF64748B)),
                    ),
                  ],
                ),
              ),
            )
          else
            Column(
              children: harvests.take(4).map((h) {
                final batch = batches.where((b) => b.id == h.batchId).firstOrNull;
                final batchName = batch?.batchName ?? 'Batch ${h.batchId}';
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(batchName, style: const TextStyle(fontSize: 12.5, fontWeight: FontWeight.w600)),
                      Text(
                        '${h.netSaleableWeight.toStringAsFixed(1)} kg',
                        style: const TextStyle(fontSize: 12.5, fontWeight: FontWeight.w700, color: Color(0xFF165B33)),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
        ],
      ),
    );
  }

  // ------------------------------------------
  // Expense Insights Card
  // ------------------------------------------
  Widget _buildExpenseInsightsCard(List<Expense> expenses, double totalCocoonKg) {
    final totalExp = expenses.fold(0.0, (s, e) => s + e.amount);

    // Find highest expense category
    final Map<String, double> catSums = {};
    for (final e in expenses) {
      catSums[e.category.name] = (catSums[e.category.name] ?? 0.0) + e.amount;
    }
    final sortedCats = catSums.entries.toList()..sort((a, b) => b.value.compareTo(a.value));
    final topCat = sortedCats.firstOrNull;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFE2E8F0)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              Icon(Icons.pie_chart_outline_rounded, size: 18, color: Color(0xFF165B33)),
              SizedBox(width: 6),
              Text(
                'Expense Insights',
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 14, color: Color(0xFF1E293B)),
              ),
            ],
          ),
          const SizedBox(height: 12),
          if (expenses.isEmpty)
            const Text(
              'No expense logs found for this period. Add expenses to receive cost optimization insights.',
              style: TextStyle(fontSize: 12, color: Color(0xFF64748B)),
            )
          else ...[
            if (topCat != null)
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: const Color(0xFFF8FAFC),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: const Color(0xFFE2E8F0)),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.trending_up, color: Color(0xFFE11D48), size: 18),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        'Highest Expense: ${topCat.key} (${_currencyFormat.format(topCat.value)}, ${(topCat.value / (totalExp > 0 ? totalExp : 1) * 100).toStringAsFixed(0)}% of total)',
                        style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: Color(0xFF1E293B)),
                      ),
                    ),
                  ],
                ),
              ),
            const SizedBox(height: 8),
            if (totalCocoonKg > 0 && totalExp > 0)
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: const Color(0xFFF8FAFC),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: const Color(0xFFE2E8F0)),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.scale_outlined, color: Color(0xFF165B33), size: 18),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        'Production Cost Efficiency: ${_currencyFormat.format(totalExp / totalCocoonKg)} per kg produced',
                        style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: Color(0xFF1E293B)),
                      ),
                    ),
                  ],
                ),
              ),
          ],
        ],
      ),
    );
  }

  // ==========================================
  // EXPORT BOTTOM SHEET & LOGIC
  // ==========================================
  void _showExportBottomSheet(
    BuildContext context,
    List<Expense> filteredExpenses,
    List<Income> filteredIncomes,
  ) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (ctx) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Export Reports & Records',
                      style: TextStyle(fontWeight: FontWeight.w700, fontSize: 17, color: Color(0xFF0F1E36)),
                    ),
                    IconButton(
                      icon: const Icon(Icons.close, size: 20, color: Color(0xFF64748B)),
                      onPressed: () => Navigator.pop(ctx),
                    ),
                  ],
                ),
                Text(
                  'Active Filter: $_timeFilter (${_getFilterLabel()})',
                  style: const TextStyle(fontSize: 12, color: Color(0xFF64748B)),
                ),
                const SizedBox(height: 16),
                ListTile(
                  leading: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(color: const Color(0xFFDCFCE7), borderRadius: BorderRadius.circular(10)),
                    child: const Icon(Icons.table_chart_outlined, color: Color(0xFF165B33)),
                  ),
                  title: const Text('Export Filtered Records (CSV)', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14)),
                  subtitle: Text('Exports ${filteredIncomes.length} sales and ${filteredExpenses.length} expense rows'),
                  onTap: () async {
                    Navigator.pop(ctx);
                    await _executeCsvExport(filteredExpenses, filteredIncomes);
                  },
                ),
                const SizedBox(height: 6),
                ListTile(
                  leading: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(color: const Color(0xFFFFE4E6), borderRadius: BorderRadius.circular(10)),
                    child: const Icon(Icons.picture_as_pdf_outlined, color: Color(0xFFE11D48)),
                  ),
                  title: const Text('Export Summary Audit (PDF)', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14)),
                  subtitle: const Text('Full formatted financial overview document'),
                  onTap: () async {
                    Navigator.pop(ctx);
                    await _executePdfExport();
                  },
                ),
                const SizedBox(height: 12),
              ],
            ),
          ),
        );
      },
    );
  }

  Future<void> _executeCsvExport(List<Expense> expenses, List<Income> incomes) async {
    try {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Generating financial export CSV...')),
      );
      final path = await report_services.ExportService.exportFinancialReportToCsv(
        expenses: expenses,
        incomes: incomes,
      );
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Saved report to $path'),
            backgroundColor: AppColorScheme.forestGreen,
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Export failed: $e'),
            backgroundColor: AppColorScheme.error,
          ),
        );
      }
    }
  }

  Future<void> _executePdfExport() async {
    try {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Generating summary audit PDF...')),
      );
      final pdfService = core_export.ExportService(ref.read(appDatabaseProvider));
      final path = await pdfService.generatePdfReport();
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(path != null ? 'PDF saved to $path' : 'PDF Report Generated'),
            backgroundColor: AppColorScheme.forestGreen,
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('PDF Export failed: $e'),
            backgroundColor: AppColorScheme.error,
          ),
        );
      }
    }
  }

  String _getFilterLabel() {
    if (_timeFilter == 'Month') return DateFormat('MMMM yyyy').format(_currentDate);
    if (_timeFilter == 'Year') return DateFormat('yyyy').format(_currentDate);
    if (_timeFilter == 'Batch') return _selectedBatchId != null ? 'Batch $_selectedBatchId' : 'Selected Batch';
    return 'All Time';
  }

  Widget _chartLegendDot(Color color, String label) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(width: 8, height: 8, decoration: BoxDecoration(color: color, shape: BoxShape.circle)),
        const SizedBox(width: 4),
        Text(label, style: const TextStyle(fontSize: 11, color: Color(0xFF64748B), fontWeight: FontWeight.w500)),
      ],
    );
  }

  // ==========================================
  // FILTERING HELPER
  // ==========================================
  _FilteredData _applyFilters({
    required List<Expense> allExpenses,
    required List<Income> allIncomes,
    required List<Batch> batches,
    required List<HarvestRecord> harvests,
  }) {
    List<Expense> exp;
    List<Income> inc;
    List<HarvestRecord> harv;
    List<Batch> bat;

    if (_timeFilter == 'Month') {
      exp = allExpenses.where((e) => e.date.year == _currentDate.year && e.date.month == _currentDate.month).toList();
      inc = allIncomes.where((i) => i.saleDate.year == _currentDate.year && i.saleDate.month == _currentDate.month).toList();
      harv = harvests.where((h) => h.harvestDate.year == _currentDate.year && h.harvestDate.month == _currentDate.month).toList();
      bat = batches.where((b) => b.startDate.year == _currentDate.year && b.startDate.month == _currentDate.month).toList();
      if (bat.isEmpty) bat = batches;
    } else if (_timeFilter == 'Year') {
      exp = allExpenses.where((e) => e.date.year == _currentDate.year).toList();
      inc = allIncomes.where((i) => i.saleDate.year == _currentDate.year).toList();
      harv = harvests.where((h) => h.harvestDate.year == _currentDate.year).toList();
      bat = batches.where((b) => b.startDate.year == _currentDate.year).toList();
      if (bat.isEmpty) bat = batches;
    } else if (_timeFilter == 'Batch') {
      final bId = _selectedBatchId;
      exp = allExpenses.where((e) => e.batchId == bId).toList();
      inc = allIncomes.where((i) => i.batchId == bId).toList();
      harv = harvests.where((h) => h.batchId == bId).toList();
      bat = batches.where((b) => b.id == bId).toList();
      if (bat.isEmpty) bat = batches;
    } else {
      exp = allExpenses;
      inc = allIncomes;
      harv = harvests;
      bat = batches;
    }

    return _FilteredData(expenses: exp, incomes: inc, harvests: harv, batches: bat);
  }
}

class _FilteredData {
  final List<Expense> expenses;
  final List<Income> incomes;
  final List<HarvestRecord> harvests;
  final List<Batch> batches;

  _FilteredData({
    required this.expenses,
    required this.incomes,
    required this.harvests,
    required this.batches,
  });
}
