import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:intl/intl.dart';
import '../../../../shared/widgets/layout_components.dart';
import '../../../../shared/widgets/feedback_views.dart';
import '../../../../core/theme/spacing.dart';
import '../../../../core/theme/radius.dart';
import '../../../../core/theme/color_scheme.dart';
import '../../application/providers/reports_notifier.dart';
import '../../application/providers/reports_state.dart';
import '../../domain/entities/report_entities.dart';
import '../../../expenses/application/providers/expense_notifier.dart';
import '../../../expenses/application/providers/expense_state.dart';
import '../../../expenses/domain/entities/expense_entities.dart';
import '../../../income/application/providers/income_notifier.dart';
import '../../../income/application/providers/income_state.dart';
import '../../../income/domain/entities/income_entities.dart';
import '../../application/services/report_services.dart';

class ReportsDashboardScreen extends ConsumerStatefulWidget {
  const ReportsDashboardScreen({super.key});

  @override
  ConsumerState<ReportsDashboardScreen> createState() => _ReportsDashboardScreenState();
}

class _ReportsDashboardScreenState extends ConsumerState<ReportsDashboardScreen> {
  String _timeFilter = 'Monthly';
  DateTime _currentDate = DateTime.now();
  String _analyticsTab = 'Profit';

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(reportsNotifierProvider);
    final expenseState = ref.watch(expenseNotifierProvider);
    final incomeState = ref.watch(incomeNotifierProvider);

    final expenses = expenseState.maybeWhen(
      data: (list) => list,
      orElse: () => <Expense>[],
    );
    final incomes = incomeState.maybeWhen(
      data: (list) => list,
      orElse: () => <Income>[],
    );

    return DefaultTabController(
      length: 2,
      child: BaseScaffold(
        appBar: AppBar(
          title: const Text('Reports & Analytics'),
          actions: [
            IconButton(
              icon: const Icon(Icons.file_download_outlined),
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
                        backgroundColor: AppColorScheme.primaryLight,
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
          bottom: TabBar(
            indicatorColor: AppColorScheme.primaryLight,
            indicatorWeight: 3,
            labelColor: AppColorScheme.primaryLight,
            unselectedLabelColor: Colors.grey[600],
            labelStyle: const TextStyle(fontWeight: FontWeight.bold),
            tabs: const [
              Tab(text: 'Reports'),
              Tab(text: 'Analytics'),
            ],
          ),
        ),
        body: switch (state) {
          ReportsStateInitial() => const Center(child: Text('Initializing...')),
          ReportsStateLoading() => const Center(child: CircularProgressIndicator()),
          ReportsStateError(message: final m) => ErrorView(
              error: m,
              onRetry: () => ref.read(reportsNotifierProvider.notifier).setFilter(TimeFilter.monthly),
            ),
          ReportsStateData(financial: final fin, production: final prod) => TabBarView(
              children: [
                _buildReportsTab(context, fin, prod, expenses, incomes),
                _buildAnalyticsTab(context, fin, expenses, incomes),
              ],
            ),
          _ => const SizedBox.shrink(),
        },
      ),
    );
  }

  Widget _buildReportsTab(
    BuildContext context,
    FinancialReport fin,
    ProductionReport prod,
    List<Expense> allExpenses,
    List<Income> allIncomes,
  ) {
    final currencyFormatter = NumberFormat.currency(symbol: '₹', decimalDigits: 0, locale: 'en_IN');
    final isDark = Theme.of(context).brightness == Brightness.dark;

    // Filter transactions for the selected period dynamically
    final periodExpenses = allExpenses.where((e) {
      if (_timeFilter == 'Monthly') {
        return e.date.year == _currentDate.year && e.date.month == _currentDate.month;
      } else {
        return e.date.year == _currentDate.year;
      }
    }).toList();

    final periodIncomes = allIncomes.where((i) {
      if (_timeFilter == 'Monthly') {
        return i.saleDate.year == _currentDate.year && i.saleDate.month == _currentDate.month;
      } else {
        return i.saleDate.year == _currentDate.year;
      }
    }).toList();

    final totalIncome = periodIncomes.fold(0.0, (sum, i) => sum + i.netAmount);
    final totalExpenses = periodExpenses.fold(0.0, (sum, e) => sum + e.amount);
    final netProfit = totalIncome - totalExpenses;
    final profitMargin = totalIncome > 0 ? (netProfit / totalIncome * 100) : 0.0;

    // Calculate category breakdown for period
    final Map<String, double> categoryBreakdown = {};
    for (final e in periodExpenses) {
      final name = e.category.name;
      categoryBreakdown[name] = (categoryBreakdown[name] ?? 0.0) + e.amount;
    }

    return ListView(
      padding: const EdgeInsets.all(AppSpacing.md),
      children: [
        // Monthly / Yearly segmented control
        Center(
          child: Container(
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: isDark ? AppColorScheme.surfaceContainerDark : Colors.grey.withValues(alpha: 0.12),
              borderRadius: BorderRadius.circular(AppRadius.pill),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildSegmentButton('Monthly'),
                _buildSegmentButton('Yearly'),
              ],
            ),
          ),
        ),
        const SizedBox(height: AppSpacing.md),

        // Date selector with chevrons
        Container(
          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.sm, vertical: 4),
          decoration: BoxDecoration(
            color: isDark ? AppColorScheme.surfaceDark : Colors.white,
            borderRadius: BorderRadius.circular(AppRadius.md),
            border: Border.all(
              color: isDark ? AppColorScheme.cardBorderDark : AppColorScheme.cardBorderLight,
              width: 1,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: const Icon(Icons.chevron_left),
                onPressed: () => setState(() {
                  if (_timeFilter == 'Monthly') {
                    _currentDate = DateTime(_currentDate.year, _currentDate.month - 1);
                  } else {
                    _currentDate = DateTime(_currentDate.year - 1, 1);
                  }
                }),
              ),
              Row(
                children: [
                  const Icon(Icons.calendar_month, size: 18, color: AppColorScheme.primaryLight),
                  const SizedBox(width: 8),
                  Text(
                    _timeFilter == 'Monthly'
                        ? DateFormat('MMMM yyyy').format(_currentDate)
                        : DateFormat('yyyy').format(_currentDate),
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w700,
                        ),
                  ),
                ],
              ),
              IconButton(
                icon: const Icon(Icons.chevron_right),
                onPressed: () => setState(() {
                  if (_timeFilter == 'Monthly') {
                    _currentDate = DateTime(_currentDate.year, _currentDate.month + 1);
                  } else {
                    _currentDate = DateTime(_currentDate.year + 1, 1);
                  }
                }),
              ),
            ],
          ),
        ),
        const SizedBox(height: AppSpacing.md),

        // 2x2 Grid of Financial KPI Cards
        GridView.count(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisCount: 2,
          crossAxisSpacing: AppSpacing.sm,
          mainAxisSpacing: AppSpacing.sm,
          childAspectRatio: 1.5,
          children: [
            _buildReportKpiCard(
              context,
              'Total Revenue',
              currencyFormatter.format(totalIncome),
              isDark ? AppColorScheme.surfaceDark : Colors.white,
              const Color(0xFF2E7D32),
              Icons.arrow_downward,
            ),
            _buildReportKpiCard(
              context,
              'Total Expenses',
              currencyFormatter.format(totalExpenses),
              isDark ? AppColorScheme.surfaceDark : Colors.white,
              const Color(0xFFC62828),
              Icons.arrow_upward,
            ),
            _buildReportKpiCard(
              context,
              'Net Profit',
              currencyFormatter.format(netProfit),
              isDark ? AppColorScheme.surfaceDark : Colors.white,
              netProfit >= 0 ? const Color(0xFF2E7D32) : const Color(0xFFC62828),
              netProfit >= 0 ? Icons.trending_up : Icons.trending_down,
            ),
            _buildReportKpiCard(
              context,
              'Profit Margin',
              '${profitMargin.toStringAsFixed(2)}%',
              isDark ? AppColorScheme.surfaceDark : Colors.white,
              profitMargin >= 0 ? const Color(0xFF1565C0) : const Color(0xFFC62828),
              Icons.percent,
            ),
          ],
        ),
        const SizedBox(height: AppSpacing.lg),

        // Expense Breakdown Section
        Text(
          'Expense Breakdown',
          style: Theme.of(context).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w700),
        ),
        const SizedBox(height: AppSpacing.sm),
        Container(
          padding: const EdgeInsets.all(AppSpacing.md),
          decoration: BoxDecoration(
            color: isDark ? AppColorScheme.surfaceDark : Colors.white,
            borderRadius: BorderRadius.circular(AppRadius.md),
            border: Border.all(
              color: isDark ? AppColorScheme.cardBorderDark : AppColorScheme.cardBorderLight,
              width: 1,
            ),
          ),
          child: categoryBreakdown.isEmpty
              ? Container(
                  height: 140,
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.pie_chart_outline, size: 36, color: Colors.grey[400]),
                      const SizedBox(height: AppSpacing.xs),
                      Text(
                        'No expenses recorded for this period',
                        style: TextStyle(color: Colors.grey[600], fontSize: 12, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                )
              : Column(
                  children: [
                    SizedBox(
                      height: 180,
                      child: PieChart(
                        PieChartData(
                          sectionsSpace: 2,
                          centerSpaceRadius: 42,
                          sections: _getPieChartSections(categoryBreakdown),
                        ),
                      ),
                    ),
                    const SizedBox(height: AppSpacing.md),
                    _buildPieChartLegend(categoryBreakdown),
                  ],
                ),
        ),
        const SizedBox(height: AppSpacing.lg),
      ],
    );
  }

  Widget _buildAnalyticsTab(
    BuildContext context,
    FinancialReport fin,
    List<Expense> expenses,
    List<Income> incomes,
  ) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return ListView(
      padding: const EdgeInsets.all(AppSpacing.md),
      children: [
        // Sub-tabs: Revenue / Expenses / Profit
        Center(
          child: Container(
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: isDark ? AppColorScheme.surfaceContainerDark : Colors.grey.withValues(alpha: 0.12),
              borderRadius: BorderRadius.circular(AppRadius.pill),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildAnalyticsSegment('Revenue'),
                _buildAnalyticsSegment('Expenses'),
                _buildAnalyticsSegment('Profit'),
              ],
            ),
          ),
        ),
        const SizedBox(height: AppSpacing.lg),

        // Line Chart Header
        Text(
          '$_analyticsTab Trend (Past 6 Months)',
          style: Theme.of(context).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w700),
        ),
        const SizedBox(height: AppSpacing.sm),
        Container(
          padding: const EdgeInsets.all(AppSpacing.md),
          decoration: BoxDecoration(
            color: isDark ? AppColorScheme.surfaceDark : Colors.white,
            borderRadius: BorderRadius.circular(AppRadius.md),
            border: Border.all(
              color: isDark ? AppColorScheme.cardBorderDark : AppColorScheme.cardBorderLight,
              width: 1,
            ),
          ),
          child: AspectRatio(
            aspectRatio: 1.7,
            child: Builder(
              builder: (context) {
                final spots = _getLineChartSpots(_analyticsTab, fin, expenses, incomes);
                final maxVal = spots.isEmpty ? 1000.0 : spots.map((s) => s.y).reduce((a, b) => a > b ? a : b);
                final chartMaxY = maxVal > 0 ? maxVal * 1.25 : 1000.0;
                final intervalY = chartMaxY / 3;

                return LineChart(
                  LineChartData(
                    gridData: FlGridData(
                      show: true,
                      drawVerticalLine: false,
                      getDrawingHorizontalLine: (value) => FlLine(
                        color: Colors.grey.withValues(alpha: 0.12),
                        strokeWidth: 1,
                      ),
                    ),
                    titlesData: FlTitlesData(
                      show: true,
                      rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                      topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                      leftTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          reservedSize: 34,
                          interval: intervalY > 0 ? intervalY : 1,
                          getTitlesWidget: (value, meta) {
                            if (value == 0) return const Text('0', style: TextStyle(fontSize: 10, color: Colors.grey));
                            if (value >= 1000) {
                              return Text('${(value / 1000).toStringAsFixed(0)}k', style: const TextStyle(fontSize: 10, color: Colors.grey));
                            }
                            return Text(value.toStringAsFixed(0), style: const TextStyle(fontSize: 10, color: Colors.grey));
                          },
                        ),
                      ),
                      bottomTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          getTitlesWidget: (value, meta) {
                            final now = DateTime.now();
                            final m = DateTime(now.year, now.month - (5 - value.toInt()), 1);
                            if (value >= 0 && value <= 5) {
                              return Text(
                                DateFormat('MMM').format(m),
                                style: const TextStyle(color: Colors.grey, fontWeight: FontWeight.w600, fontSize: 10),
                              );
                            }
                            return const Text('');
                          },
                        ),
                      ),
                    ),
                    borderData: FlBorderData(show: false),
                    minX: 0,
                    maxX: 5,
                    minY: 0,
                    maxY: chartMaxY,
                    lineBarsData: [
                      LineChartBarData(
                        spots: spots,
                        isCurved: true,
                        color: _getAnalyticsColor(_analyticsTab),
                        barWidth: 2.8,
                        dotData: const FlDotData(show: true),
                        belowBarData: BarAreaData(
                          show: true,
                          color: _getAnalyticsColor(_analyticsTab).withValues(alpha: 0.1),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
        const SizedBox(height: AppSpacing.lg),

        // Donut Chart for Categories
        Text(
          'Top Expense Categories (All Time)',
          style: Theme.of(context).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w700),
        ),
        const SizedBox(height: AppSpacing.sm),
        Container(
          padding: const EdgeInsets.all(AppSpacing.md),
          decoration: BoxDecoration(
            color: isDark ? AppColorScheme.surfaceDark : Colors.white,
            borderRadius: BorderRadius.circular(AppRadius.md),
            border: Border.all(
              color: isDark ? AppColorScheme.cardBorderDark : AppColorScheme.cardBorderLight,
              width: 1,
            ),
          ),
          child: Column(
            children: [
              SizedBox(
                height: 180,
                child: PieChart(
                  PieChartData(
                    sectionsSpace: 2,
                    centerSpaceRadius: 42,
                    sections: _getPieChartSections(fin.expensesByCategory),
                  ),
                ),
              ),
              const SizedBox(height: AppSpacing.md),
              _buildPieChartLegend(fin.expensesByCategory),
            ],
          ),
        ),
        const SizedBox(height: AppSpacing.lg),
      ],
    );
  }

  Widget _buildSegmentButton(String text) {
    final isSelected = _timeFilter == text;
    return GestureDetector(
      onTap: () => setState(() => _timeFilter = text),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? AppColorScheme.primaryLight : Colors.transparent,
          borderRadius: BorderRadius.circular(AppRadius.pill),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: isSelected ? Colors.white : Theme.of(context).colorScheme.onSurface,
            fontWeight: FontWeight.bold,
            fontSize: 13,
          ),
        ),
      ),
    );
  }

  Widget _buildAnalyticsSegment(String text) {
    final isSelected = _analyticsTab == text;
    return GestureDetector(
      onTap: () => setState(() => _analyticsTab = text),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? _getAnalyticsColor(text) : Colors.transparent,
          borderRadius: BorderRadius.circular(AppRadius.pill),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: isSelected ? Colors.white : Theme.of(context).colorScheme.onSurface,
            fontWeight: FontWeight.bold,
            fontSize: 13,
          ),
        ),
      ),
    );
  }

  Color _getAnalyticsColor(String tab) {
    switch (tab) {
      case 'Revenue': return const Color(0xFF2E7D32);
      case 'Expenses': return const Color(0xFFC62828);
      default: return const Color(0xFF1565C0);
    }
  }

  List<FlSpot> _getLineChartSpots(String tab, FinancialReport fin, List<Expense> expenses, List<Income> incomes) {
    final now = DateTime.now();
    final months = List.generate(6, (i) {
      return DateTime(now.year, now.month - (5 - i), 1);
    });

    final spots = <FlSpot>[];
    for (int i = 0; i < months.length; i++) {
      final m = months[i];
      final monthIncomes = incomes.where((item) => item.saleDate.year == m.year && item.saleDate.month == m.month);
      final monthExpenses = expenses.where((item) => item.date.year == m.year && item.date.month == m.month);
      
      double val = 0.0;
      if (tab == 'Revenue') {
        val = monthIncomes.fold(0.0, (sum, item) => sum + item.netAmount);
      } else if (tab == 'Expenses') {
        val = monthExpenses.fold(0.0, (sum, item) => sum + item.amount);
      } else {
        val = monthIncomes.fold(0.0, (sum, item) => sum + item.netAmount) - 
              monthExpenses.fold(0.0, (sum, item) => sum + item.amount);
      }
      
      spots.add(FlSpot(i.toDouble(), val < 0 ? 0.0 : val));
    }
    return spots;
  }

  Widget _buildReportKpiCard(
    BuildContext context,
    String title,
    String value,
    Color backgroundColor,
    Color valueColor,
    IconData icon,
  ) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(AppRadius.md),
        border: Border.all(
          color: isDark ? AppColorScheme.cardBorderDark : AppColorScheme.cardBorderLight,
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.7),
                      fontWeight: FontWeight.w600,
                      fontSize: 11,
                    ),
              ),
              Icon(icon, size: 14, color: valueColor),
            ],
          ),
          const SizedBox(height: 6),
          Text(
            value,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w800,
                  color: valueColor,
                  fontSize: 17,
                ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }

  Color _getCategoryColor(String categoryName) {
    switch (categoryName.toLowerCase()) {
      case 'dfl cost': return const Color(0xFF2E7D32);
      case 'mulberry leaves': return const Color(0xFF558B2F);
      case 'fertilizer': return const Color(0xFFEF6C00);
      case 'labour': return const Color(0xFFD32F2F);
      case 'electricity': return const Color(0xFFFBC02D);
      case 'medicine': return const Color(0xFFC2185B);
      case 'transport': return const Color(0xFF1976D2);
      default: return const Color(0xFF757575);
    }
  }

  List<PieChartSectionData> _getPieChartSections(Map<String, double> categoryData) {
    if (categoryData.isEmpty) {
      return [
        PieChartSectionData(
          color: Colors.grey[300],
          value: 100,
          title: 'No Data',
          radius: 28,
          titleStyle: const TextStyle(color: Colors.black54, fontWeight: FontWeight.bold, fontSize: 11),
        ),
      ];
    }

    final total = categoryData.values.fold(0.0, (sum, val) => sum + val);

    return categoryData.entries.map((entry) {
      final percentage = total > 0 ? (entry.value / total * 100) : 0.0;
      return PieChartSectionData(
        color: _getCategoryColor(entry.key),
        value: entry.value,
        title: '${percentage.toStringAsFixed(0)}%',
        radius: 28,
        titleStyle: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 10,
        ),
      );
    }).toList();
  }

  Widget _buildPieChartLegend(Map<String, double> categoryData) {
    if (categoryData.isEmpty) return const SizedBox.shrink();
    
    final total = categoryData.values.fold(0.0, (sum, val) => sum + val);

    return Wrap(
      spacing: AppSpacing.sm,
      runSpacing: AppSpacing.xs,
      alignment: WrapAlignment.center,
      children: categoryData.entries.map((entry) {
        final percentage = total > 0 ? (entry.value / total * 100) : 0.0;
        final color = _getCategoryColor(entry.key);
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
          decoration: BoxDecoration(
            color: color.withValues(alpha: 0.08),
            borderRadius: BorderRadius.circular(AppRadius.xs),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(width: 8, height: 8, decoration: BoxDecoration(color: color, shape: BoxShape.circle)),
              const SizedBox(width: 5),
              Text(
                '${entry.key}: ${percentage.toStringAsFixed(0)}%',
                style: TextStyle(fontSize: 11, fontWeight: FontWeight.w700, color: color),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}

