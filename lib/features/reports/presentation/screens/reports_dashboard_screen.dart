import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:intl/intl.dart';
import 'package:go_router/go_router.dart';
import '../../../../shared/widgets/feedback_views.dart';
import '../../../../core/theme/spacing.dart';
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
import '../../application/services/report_services.dart';

class ReportsDashboardScreen extends ConsumerStatefulWidget {
  const ReportsDashboardScreen({super.key});

  @override
  ConsumerState<ReportsDashboardScreen> createState() => _ReportsDashboardScreenState();
}

class _ReportsDashboardScreenState extends ConsumerState<ReportsDashboardScreen> {
  String _timeFilter = 'Month'; // Month, Year, Batch, All
  DateTime _currentDate = DateTime.now();

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

    return Scaffold(
      backgroundColor: const Color(0xFFF8FAF8),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF1E293B)),
          onPressed: () {
            if (context.canPop()) {
              context.pop();
            } else {
              context.go('/');
            }
          },
        ),
        title: const Text(
          'Financial & Crop Reports',
          style: TextStyle(
            color: Color(0xFF1E293B),
            fontWeight: FontWeight.w700,
            fontSize: 18,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.file_download_outlined, color: AppColorScheme.primary),
            tooltip: 'Export CSV',
            onPressed: () async {
              try {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Generating financial export CSV...')),
                );
                final path = await ExportService.exportFinancialReportToCsv(
                  expenses: expenses,
                  incomes: incomes,
                );
                if (context.mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Saved report to $path'),
                      backgroundColor: AppColorScheme.forestGreen,
                    ),
                  );
                }
              } catch (e) {
                if (context.mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Export failed: $e'),
                      backgroundColor: AppColorScheme.error,
                    ),
                  );
                }
              }
            },
          ),
          const SizedBox(width: AppSpacing.xs),
        ],
      ),
      body: switch (state) {
        ReportsStateInitial() => const Center(child: CircularProgressIndicator(color: AppColorScheme.forestGreen)),
        ReportsStateLoading() => const Center(child: CircularProgressIndicator(color: AppColorScheme.forestGreen)),
        ReportsStateError(message: final m) => ErrorView(
            error: m,
            onRetry: () => ref.read(reportsNotifierProvider.notifier).loadReports(),
          ),
        ReportsStateData() => _buildBody(context, expenses, incomes, batches, harvestState),
        _ => const SizedBox.shrink(),
      },
    );
  }

  Widget _buildBody(
    BuildContext context,
    List<Expense> allExpenses,
    List<Income> allIncomes,
    List<Batch> batches,
    dynamic harvestState,
  ) {
    final currency = NumberFormat.currency(symbol: '₹', decimalDigits: 0, locale: 'en_IN');

    // Filter by selected period
    List<Expense> filteredExpenses;
    List<Income> filteredIncomes;

    if (_timeFilter == 'Month') {
      filteredExpenses = allExpenses.where((e) => e.date.year == _currentDate.year && e.date.month == _currentDate.month).toList();
      filteredIncomes = allIncomes.where((i) => i.saleDate.year == _currentDate.year && i.saleDate.month == _currentDate.month).toList();
    } else if (_timeFilter == 'Year') {
      filteredExpenses = allExpenses.where((e) => e.date.year == _currentDate.year).toList();
      filteredIncomes = allIncomes.where((i) => i.saleDate.year == _currentDate.year).toList();
    } else {
      filteredExpenses = allExpenses;
      filteredIncomes = allIncomes;
    }

    final totalRevenue = filteredIncomes.fold(0.0, (sum, i) => sum + i.netAmount);
    final totalExpenses = filteredExpenses.fold(0.0, (sum, e) => sum + e.amount);
    final netProfit = totalRevenue - totalExpenses;
    final margin = totalRevenue > 0 ? (netProfit / totalRevenue) * 100 : 0.0;

    // Group expenses by category
    final Map<String, double> categoryTotals = {};
    for (final e in filteredExpenses) {
      final name = e.category.name;
      categoryTotals[name] = (categoryTotals[name] ?? 0.0) + e.amount;
    }
    final sortedCategories = categoryTotals.entries.toList()..sort((a, b) => b.value.compareTo(a.value));

    return RefreshIndicator(
      onRefresh: () async {
        await ref.read(expenseNotifierProvider.notifier).loadExpenses();
        await ref.read(incomeNotifierProvider.notifier).loadIncomes();
        await ref.read(batchNotifierProvider.notifier).loadBatches();
        await ref.read(reportsNotifierProvider.notifier).loadReports();
      },
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
        children: [
          // 1. Time Period Selector Segmented Control
          Container(
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: const Color(0xFFE2E8F0),
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
                        color: isSelected ? Colors.white : Colors.transparent,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: isSelected
                            ? [
                                BoxShadow(
                                  color: Colors.black.withValues(alpha: 0.06),
                                  blurRadius: 4,
                                  offset: const Offset(0, 2),
                                ),
                              ]
                            : null,
                      ),
                      child: Center(
                        child: Text(
                          t,
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
                            color: isSelected ? const Color(0xFF1E293B) : const Color(0xFF64748B),
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
          const SizedBox(height: 12),

          // 2. Date Navigator (< October 2026 >)
          if (_timeFilter != 'All' && _timeFilter != 'Batch') ...[
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
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
                  Text(
                    _timeFilter == 'Month'
                        ? DateFormat('MMMM yyyy').format(_currentDate)
                        : DateFormat('yyyy').format(_currentDate),
                    style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 15, color: Color(0xFF1E293B)),
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
            ),
            const SizedBox(height: 16),
          ],

          // 3. 2x2 Financial KPI Grid (Revenue, Expenses, Net Profit, Margin)
          Row(
            children: [
              Expanded(
                child: _reportKpiCard(
                  title: 'Revenue',
                  amount: currency.format(totalRevenue),
                  icon: Icons.trending_up,
                  iconBg: const Color(0xFFDCFCE7),
                  iconColor: const Color(0xFF16A34A),
                  badgeText: '+${filteredIncomes.length} Sales',
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _reportKpiCard(
                  title: 'Expenses',
                  amount: currency.format(totalExpenses),
                  icon: Icons.receipt_long,
                  iconBg: const Color(0xFFFFE4E6),
                  iconColor: const Color(0xFFE11D48),
                  badgeText: '${filteredExpenses.length} Logs',
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: _reportKpiCard(
                  title: 'Net Profit',
                  amount: currency.format(netProfit),
                  icon: Icons.account_balance_wallet_outlined,
                  iconBg: netProfit >= 0 ? const Color(0xFFDCFCE7) : const Color(0xFFFFE4E6),
                  iconColor: netProfit >= 0 ? const Color(0xFF16A34A) : const Color(0xFFE11D48),
                  badgeText: netProfit >= 0 ? 'Profitable' : 'Deficit',
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _reportKpiCard(
                  title: 'Margin',
                  amount: '${margin.toStringAsFixed(1)}%',
                  icon: Icons.percent,
                  iconBg: const Color(0xFFEFF6FF),
                  iconColor: const Color(0xFF2563EB),
                  badgeText: 'ROI Score',
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),

          // 4. Cash Flow & Profit Breakdown Chart
          Container(
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
                      'Cash Flow & Profit Breakdown',
                      style: TextStyle(fontWeight: FontWeight.w700, fontSize: 14, color: Color(0xFF1E293B)),
                    ),
                    Row(
                      children: [
                        _chartLegendDot(const Color(0xFF16A34A), 'Revenue'),
                        const SizedBox(width: 10),
                        _chartLegendDot(const Color(0xFFE11D48), 'Expense'),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                SizedBox(
                  height: 160,
                  child: totalRevenue == 0 && totalExpenses == 0
                      ? const Center(
                          child: Text('No transactions in this period', style: TextStyle(color: Color(0xFF94A3B8), fontSize: 12)),
                        )
                      : BarChart(
                          BarChartData(
                            alignment: BarChartAlignment.spaceAround,
                            maxY: (totalRevenue > totalExpenses ? totalRevenue : totalExpenses) * 1.25 + 1000,
                            barTouchData: const BarTouchData(enabled: true),
                            titlesData: FlTitlesData(
                              show: true,
                              topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                              rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                              leftTitles: AxisTitles(
                                sideTitles: SideTitles(
                                  showTitles: true,
                                  reservedSize: 34,
                                  getTitlesWidget: (v, meta) => Text(
                                    v >= 1000 ? '${(v / 1000).toStringAsFixed(0)}k' : v.toInt().toString(),
                                    style: const TextStyle(fontSize: 10, color: Color(0xFF94A3B8)),
                                  ),
                                ),
                              ),
                              bottomTitles: AxisTitles(
                                sideTitles: SideTitles(
                                  showTitles: true,
                                  getTitlesWidget: (val, meta) {
                                    if (val == 0) return const Padding(padding: EdgeInsets.only(top: 6), child: Text('Revenue', style: TextStyle(fontSize: 11, color: Color(0xFF16A34A), fontWeight: FontWeight.w600)));
                                    if (val == 1) return const Padding(padding: EdgeInsets.only(top: 6), child: Text('Expense', style: TextStyle(fontSize: 11, color: Color(0xFFE11D48), fontWeight: FontWeight.w600)));
                                    if (val == 2) return const Padding(padding: EdgeInsets.only(top: 6), child: Text('Profit', style: TextStyle(fontSize: 11, color: Color(0xFF2563EB), fontWeight: FontWeight.w600)));
                                    return const Text('');
                                  },
                                ),
                              ),
                            ),
                            gridData: FlGridData(
                              show: true,
                              drawVerticalLine: false,
                              getDrawingHorizontalLine: (v) => const FlLine(color: Color(0xFFF1F5F9), strokeWidth: 1),
                            ),
                            borderData: FlBorderData(show: false),
                            barGroups: [
                              BarChartGroupData(x: 0, barRods: [
                                BarChartRodData(toY: totalRevenue, color: const Color(0xFF16A34A), width: 28, borderRadius: const BorderRadius.vertical(top: Radius.circular(6))),
                              ]),
                              BarChartGroupData(x: 1, barRods: [
                                BarChartRodData(toY: totalExpenses, color: const Color(0xFFE11D48), width: 28, borderRadius: const BorderRadius.vertical(top: Radius.circular(6))),
                              ]),
                              BarChartGroupData(x: 2, barRods: [
                                BarChartRodData(toY: netProfit.clamp(0, double.infinity), color: const Color(0xFF2563EB), width: 28, borderRadius: const BorderRadius.vertical(top: Radius.circular(6))),
                              ]),
                            ],
                          ),
                        ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),

          // 5. Category Expense Breakdown
          Container(
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
                      style: TextStyle(fontWeight: FontWeight.w700, fontSize: 14, color: Color(0xFF1E293B)),
                    ),
                    Text(
                      currency.format(totalExpenses),
                      style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 14, color: Color(0xFFE11D48)),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                if (sortedCategories.isEmpty)
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    child: Center(
                      child: Text('No expenses recorded in this period', style: TextStyle(color: Color(0xFF94A3B8), fontSize: 12)),
                    ),
                  )
                else
                  ...sortedCategories.map((entry) {
                    final percentage = totalExpenses > 0 ? (entry.value / totalExpenses) * 100 : 0.0;
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 6.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(entry.key, style: const TextStyle(fontSize: 12.5, fontWeight: FontWeight.w600, color: Color(0xFF334155))),
                              Text(
                                '${currency.format(entry.value)} (${percentage.toStringAsFixed(1)}%)',
                                style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w700, color: Color(0xFF1E293B)),
                              ),
                            ],
                          ),
                          const SizedBox(height: 4),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(4),
                            child: LinearProgressIndicator(
                              value: percentage / 100.0,
                              minHeight: 6,
                              backgroundColor: const Color(0xFFF1F5F9),
                              valueColor: const AlwaysStoppedAnimation<Color>(AppColorScheme.primary),
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
              ],
            ),
          ),
          const SizedBox(height: 20),

          // 6. Batch Crop Performance Ledger
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: const Color(0xFFE2E8F0)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Batch Performance Ledger',
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 14, color: Color(0xFF1E293B)),
                ),
                const SizedBox(height: 12),
                if (batches.isEmpty)
                  const Center(child: Text('No batches found', style: TextStyle(color: Color(0xFF94A3B8))))
                else
                  ...batches.map((b) {
                    final bExp = allExpenses.where((e) => e.batchId == b.id).fold(0.0, (sum, e) => sum + e.amount);
                    final bRev = allIncomes.where((i) => i.batchId == b.id).fold(0.0, (sum, i) => sum + i.netAmount);
                    final bProfit = bRev - bExp;

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
                              Text('${b.numberOfDfls} DFLs • ${b.status.name.toUpperCase()}', style: const TextStyle(fontSize: 11, color: Color(0xFF64748B))),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(currency.format(bRev), style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 13, color: Color(0xFF16A34A))),
                              Text(
                                bProfit >= 0 ? '+${currency.format(bProfit)}' : currency.format(bProfit),
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
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
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

  Widget _reportKpiCard({
    required String title,
    required String amount,
    required IconData icon,
    required Color iconBg,
    required Color iconColor,
    required String badgeText,
  }) {
    return Container(
      padding: const EdgeInsets.all(14),
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
                style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: Color(0xFF64748B)),
              ),
              Container(
                width: 28,
                height: 28,
                decoration: BoxDecoration(color: iconBg, shape: BoxShape.circle),
                child: Icon(icon, size: 16, color: iconColor),
              ),
            ],
          ),
          const SizedBox(height: 6),
          Text(
            amount,
            style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w800, color: Color(0xFF1E293B)),
          ),
          const SizedBox(height: 4),
          Text(
            badgeText,
            style: TextStyle(fontSize: 10.5, fontWeight: FontWeight.w600, color: iconColor),
          ),
        ],
      ),
    );
  }
}
