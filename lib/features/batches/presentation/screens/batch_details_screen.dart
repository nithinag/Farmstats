import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import '../../../../shared/widgets/layout_components.dart';
import '../../../../core/theme/spacing.dart';
import '../../../../core/theme/radius.dart';
import '../../../../core/theme/color_scheme.dart';
import '../../domain/entities/batch_entities.dart';
import '../../application/providers/batch_notifier.dart';
import '../../application/providers/batch_state.dart';
import '../../../income/application/providers/income_notifier.dart';
import '../../../income/application/providers/income_state.dart';
import '../../../expenses/application/providers/expense_notifier.dart';
import '../../../expenses/application/providers/expense_state.dart';
import '../../../harvest/application/providers/harvest_notifier.dart';
import '../../../harvest/application/providers/harvest_state.dart';
import '../../../expenses/domain/entities/expense_entities.dart';
import '../../../income/domain/entities/income_entities.dart';
import '../../../harvest/domain/entities/harvest_entities.dart';
import '../../../feeding/application/providers/feeding_notifier.dart';
import '../../../../data/database/app_database.dart';
import '../../../../data/providers/database_provider.dart';

class BatchDetailsScreen extends ConsumerStatefulWidget {
  final Batch batch;
  const BatchDetailsScreen({super.key, required this.batch});

  @override
  ConsumerState<BatchDetailsScreen> createState() => _BatchDetailsScreenState();
}

class _BatchDetailsScreenState extends ConsumerState<BatchDetailsScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  Future<void> _showCompleteBatchDialog(
    BuildContext context,
    Batch batch,
    double totalExp,
    double totalRev,
    double yieldKg,
  ) async {
    final currency = NumberFormat.currency(symbol: '₹', decimalDigits: 0, locale: 'en_IN');
    final profit = totalRev - totalExp;

    final confirmed = await showDialog<bool>(
      context: context,
      builder: (ctx) {
        return AlertDialog(
          title: Text('Complete ${batch.batchName}?'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Completing this batch will finalize its financials and archive it into your historical records.',
                style: TextStyle(fontSize: 13),
              ),
              const SizedBox(height: AppSpacing.md),
              Container(
                padding: const EdgeInsets.all(AppSpacing.md),
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(AppRadius.md),
                ),
                child: Column(
                  children: [
                    _dialogSummaryRow('DFLs', '${batch.numberOfDfls} DFLs'),
                    _dialogSummaryRow('Cocoon Yield', '${yieldKg.toStringAsFixed(1)} kg'),
                    _dialogSummaryRow('Total Batch Cost', currency.format(totalExp)),
                    _dialogSummaryRow('Net Revenue', currency.format(totalRev)),
                    const Divider(),
                    _dialogSummaryRow('Net Profit', currency.format(profit), isBold: true),
                  ],
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(ctx, false),
              child: const Text('Cancel'),
            ),
            FilledButton(
              onPressed: () => Navigator.pop(ctx, true),
              style: FilledButton.styleFrom(backgroundColor: AppColorScheme.primary),
              child: const Text('COMPLETE BATCH'),
            ),
          ],
        );
      },
    );

    if (confirmed == true && context.mounted) {
      await ref.read(batchNotifierProvider.notifier).completeBatch(batch);
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: AppColorScheme.success,
            content: Text('✓ ${batch.batchName} marked as COMPLETED and archived.'),
          ),
        );
        context.pop();
      }
    }
  }

  Widget _dialogSummaryRow(String label, String value, {bool isBold = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: TextStyle(fontSize: 12, fontWeight: isBold ? FontWeight.bold : FontWeight.normal)),
          Text(value, style: TextStyle(fontSize: 13, fontWeight: isBold ? FontWeight.bold : FontWeight.w600)),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final batchState = ref.watch(batchNotifierProvider);
    // Grab the latest version of this batch if updated
    final currentBatch = switch (batchState) {
      BatchStateData(batches: final list) =>
        list.where((b) => b.id == widget.batch.id).firstOrNull ?? widget.batch,
      _ => widget.batch,
    };

    final expensesState = ref.watch(expenseNotifierProvider);
    final incomesState = ref.watch(incomeNotifierProvider);
    final harvestsState = ref.watch(harvestNotifierProvider);
    final feedingState = ref.watch(feedingNotifierProvider);

    final currency = NumberFormat.currency(symbol: '₹', decimalDigits: 0, locale: 'en_IN');

    // Filter data for this batch
    final List<Expense> batchExpenses = (expensesState is ExpenseStateData)
        ? expensesState.expenses.where((e) => e.batchId == currentBatch.id).toList()
        : <Expense>[];
    final totalExpenses = batchExpenses.fold(0.0, (sum, e) => sum + e.amount);

    final List<Income> batchIncomes = (incomesState is IncomeStateData)
        ? incomesState.incomes.where((i) => i.batchId == currentBatch.id).toList()
        : <Income>[];
    final totalRevenue = batchIncomes.fold(0.0, (sum, i) => sum + i.netAmount);

    final List<HarvestRecord> batchHarvests = (harvestsState is HarvestStateData)
        ? harvestsState.harvests.where((h) => h.batchId == currentBatch.id).toList()
        : <HarvestRecord>[];
    final totalYieldKg = batchHarvests.fold(0.0, (sum, h) => sum + h.netSaleableWeight);

    final profit = totalRevenue - totalExpenses;
    final costPerKg = totalYieldKg > 0 ? (totalExpenses / totalYieldKg) : 0.0;
    final revPerKg = totalYieldKg > 0 ? (totalRevenue / totalYieldKg) : 0.0;
    final isCompleted = currentBatch.status == BatchStatus.completed;

    return BaseScaffold(
      appBar: AppBar(
        title: Text(currentBatch.batchName),
        backgroundColor: AppColorScheme.primary,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            tooltip: 'Edit Batch Info',
            onPressed: () => context.push('/batch/${currentBatch.id}/edit', extra: currentBatch),
          ),
          if (!isCompleted)
            IconButton(
              icon: const Icon(Icons.check_circle_outline),
              tooltip: 'Complete Batch',
              onPressed: () => _showCompleteBatchDialog(
                context,
                currentBatch,
                totalExpenses,
                totalRevenue,
                totalYieldKg,
              ),
            ),
        ],
      ),
      body: Column(
        children: [
          // 1. Batch Hero Header
          _buildHeroHeader(context, currentBatch, totalExpenses, totalRevenue, profit, currency),

          // 2. Action Bar
          if (!isCompleted) _buildOperationalActionBar(context, currentBatch),

          // 3. Tab Bar
          Container(
            color: Theme.of(context).colorScheme.surface,
            child: TabBar(
              controller: _tabController,
              isScrollable: true,
              labelColor: AppColorScheme.primary,
              indicatorColor: AppColorScheme.primaryLight,
              tabs: const [
                Tab(text: 'Timeline'),
                Tab(text: 'Expenses'),
                Tab(text: 'Cocoon Sales'),
                Tab(text: 'Feeding & Logs'),
                Tab(text: 'Profitability'),
              ],
            ),
          ),

          // 4. Tab Views
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                // TAB 1: TIMELINE
                _buildTimelineTab(currentBatch.id),

                // TAB 2: EXPENSES
                _buildExpensesTab(batchExpenses, currency, currentBatch),

                // TAB 3: COCOON SALES
                _buildSalesTab(batchIncomes, batchHarvests, currency, currentBatch),

                // TAB 4: FEEDING & LOGS
                _buildFeedingTab(feedingState, currentBatch),

                // TAB 5: PROFITABILITY
                _buildProfitabilityTab(currentBatch, totalExpenses, totalRevenue, profit, totalYieldKg, costPerKg, revPerKg, currency, batchExpenses),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeroHeader(
    BuildContext context,
    Batch batch,
    double expenses,
    double revenue,
    double profit,
    NumberFormat currency,
  ) {
    final durationDays = batch.expectedHarvestDate.difference(batch.startDate).inDays;
    final totalDuration = durationDays > 0 ? durationDays : 30;
    final currentDay = batch.currentAgeDays > 0 ? batch.currentAgeDays : (DateTime.now().difference(batch.startDate).inDays + 1);
    final progress = (currentDay / totalDuration.toDouble()).clamp(0.0, 1.0);
    final isCompleted = batch.status == BatchStatus.completed;

    return Container(
      width: double.infinity,
      color: AppColorScheme.primary,
      padding: const EdgeInsets.fromLTRB(AppSpacing.md, 0, AppSpacing.md, AppSpacing.md),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                isCompleted
                    ? '✓ COMPLETED ($totalDuration DAYS CYCLE)'
                    : 'Day ${currentDay.toString().padLeft(2, '0')} / $totalDuration • ${batch.currentStage.name.toUpperCase()} INSTAR',
                style: const TextStyle(color: Colors.white, fontSize: 13, fontWeight: FontWeight.bold),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                decoration: BoxDecoration(
                  color: isCompleted ? Colors.amber.shade700 : Colors.white.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(AppRadius.pill),
                ),
                child: Text(
                  isCompleted ? '✓ ARCHIVED' : '● ${batch.status.name.toUpperCase()}',
                  style: const TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          if (!isCompleted) ...[
            const SizedBox(height: 6),
            ClipRRect(
              borderRadius: BorderRadius.circular(AppRadius.pill),
              child: LinearProgressIndicator(
                value: progress,
                minHeight: 4,
                backgroundColor: Colors.white24,
                valueColor: const AlwaysStoppedAnimation<Color>(Color(0xFF81C784)),
              ),
            ),
          ],
          const SizedBox(height: AppSpacing.sm),

          // Mini Metric Cards
          Row(
            children: [
              Expanded(child: _headerCard('Batch Expenses', currency.format(expenses), Colors.red.shade100)),
              const SizedBox(width: AppSpacing.xs),
              Expanded(child: _headerCard('Batch Revenue', currency.format(revenue), Colors.green.shade100)),
              const SizedBox(width: AppSpacing.xs),
              Expanded(
                child: _headerCard(
                  'Net Profit',
                  currency.format(profit),
                  profit >= 0 ? Colors.green.shade200 : Colors.red.shade200,
                  isBold: true,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _headerCard(String label, String value, Color bgColor, {bool isBold = false}) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: AppSpacing.sm, horizontal: AppSpacing.xs),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(AppRadius.sm),
      ),
      child: Column(
        children: [
          Text(label, style: const TextStyle(color: Colors.white70, fontSize: 10)),
          const SizedBox(height: 2),
          Text(
            value,
            style: TextStyle(
              color: Colors.white,
              fontWeight: isBold ? FontWeight.w900 : FontWeight.bold,
              fontSize: 13,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOperationalActionBar(BuildContext context, Batch batch) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md, vertical: AppSpacing.sm),
      color: Colors.grey.shade100,
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: FilledButton.icon(
              onPressed: () => context.push('/cocoon-sale', extra: batch.id),
              style: FilledButton.styleFrom(
                backgroundColor: const Color(0xFF2E7D32),
                padding: const EdgeInsets.symmetric(vertical: 8),
              ),
              icon: const Icon(Icons.payments, size: 16),
              label: const Text('Cocoon Sale', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
            ),
          ),
          const SizedBox(width: AppSpacing.xs),
          Expanded(
            child: OutlinedButton(
              onPressed: () => context.push('/expenses/add', extra: batch.id),
              style: OutlinedButton.styleFrom(padding: const EdgeInsets.symmetric(vertical: 8)),
              child: const Text('+ Expense', style: TextStyle(fontSize: 11)),
            ),
          ),
          const SizedBox(width: AppSpacing.xs),
          Expanded(
            child: OutlinedButton(
              onPressed: () => context.push('/feeding/add', extra: batch.id),
              style: OutlinedButton.styleFrom(padding: const EdgeInsets.symmetric(vertical: 8)),
              child: const Text('+ Feed', style: TextStyle(fontSize: 11)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTimelineTab(String batchId) {
    final db = ref.watch(appDatabaseProvider);
    return FutureBuilder<List<BatchTimelineDbModel>>(
      future: db.batchDao.getTimeline(batchId),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return const Center(child: CircularProgressIndicator());
        final events = snapshot.data ?? <BatchTimelineDbModel>[];
        if (events.isEmpty) {
          return const Center(child: Text('No timeline events yet.'));
        }
        return ListView.builder(
          padding: const EdgeInsets.all(AppSpacing.md),
          itemCount: events.length,
          itemBuilder: (context, index) {
            final e = events[index];
            return Padding(
              padding: const EdgeInsets.only(bottom: AppSpacing.md),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      const CircleAvatar(
                        radius: 12,
                        backgroundColor: AppColorScheme.primaryLight,
                        child: Icon(Icons.circle, size: 8, color: Colors.white),
                      ),
                      if (index < events.length - 1)
                        Container(width: 2, height: 40, color: Colors.grey.shade300),
                    ],
                  ),
                  const SizedBox(width: AppSpacing.md),
                  Expanded(
                    child: Card(
                      elevation: 0,
                      color: Colors.grey.shade50,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(AppRadius.md),
                        side: BorderSide(color: Colors.grey.shade200),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(AppSpacing.sm),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(e.eventType, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
                                Text(DateFormat('dd MMM').format(e.timestamp), style: TextStyle(fontSize: 11, color: Colors.grey.shade600)),
                              ],
                            ),
                            const SizedBox(height: 2),
                            Text(e.description, style: TextStyle(fontSize: 12, color: Colors.grey.shade800)),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildExpensesTab(List<Expense> expenses, NumberFormat currency, Batch batch) {
    if (expenses.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.receipt_long_outlined, size: 48, color: Colors.grey),
            const SizedBox(height: AppSpacing.sm),
            const Text('No expenses recorded for this batch yet.'),
            const SizedBox(height: AppSpacing.md),
            FilledButton.icon(
              onPressed: () => context.push('/expenses/add', extra: batch.id),
              icon: const Icon(Icons.add),
              label: const Text('Add Expense'),
            ),
          ],
        ),
      );
    }
    return ListView.builder(
      padding: const EdgeInsets.all(AppSpacing.md),
      itemCount: expenses.length,
      itemBuilder: (context, index) {
        final e = expenses[index];
        return Card(
          elevation: 0,
          margin: const EdgeInsets.only(bottom: AppSpacing.sm),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppRadius.md),
            side: BorderSide(color: Colors.grey.shade200),
          ),
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: AppColorScheme.error.withValues(alpha: 0.1),
              child: const Icon(Icons.receipt_outlined, color: AppColorScheme.error),
            ),
            title: Text(e.description, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
            subtitle: Text('${e.category.name} • ${DateFormat('dd MMM yyyy').format(e.date)}'),
            trailing: Text(
              currency.format(e.amount),
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: AppColorScheme.error),
            ),
          ),
        );
      },
    );
  }

  Widget _buildSalesTab(List<Income> incomes, List<HarvestRecord> harvests, NumberFormat currency, Batch batch) {
    if (incomes.isEmpty && harvests.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.payments_outlined, size: 48, color: Colors.grey),
            const SizedBox(height: AppSpacing.sm),
            const Text('No Cocoon Sales recorded yet.'),
            const SizedBox(height: AppSpacing.md),
            FilledButton.icon(
              onPressed: () => context.push('/cocoon-sale', extra: batch.id),
              style: FilledButton.styleFrom(backgroundColor: const Color(0xFF2E7D32)),
              icon: const Icon(Icons.add),
              label: const Text('Record Cocoon Sale'),
            ),
          ],
        ),
      );
    }
    return ListView(
      padding: const EdgeInsets.all(AppSpacing.md),
      children: [
        ...incomes.map((inc) {
          return Card(
            elevation: 0,
            margin: const EdgeInsets.only(bottom: AppSpacing.sm),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppRadius.md),
              side: BorderSide(color: Colors.green.shade200),
            ),
            color: Colors.green.shade50,
            child: Padding(
              padding: const EdgeInsets.all(AppSpacing.md),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(inc.buyer.name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                      Text(
                        currency.format(inc.netAmount),
                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Color(0xFF2E7D32)),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text('${inc.quantity.toStringAsFixed(1)} kg • Grade: ${inc.cocoonGrade} • ${DateFormat('dd MMM yyyy').format(inc.saleDate)}'),
                  const Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Gross: ${currency.format(inc.grossAmount)}', style: const TextStyle(fontSize: 12)),
                      Text('Deductions: -${currency.format(inc.transportCharges + inc.commission)}', style: const TextStyle(fontSize: 12, color: AppColorScheme.error)),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                        decoration: BoxDecoration(
                          color: inc.paymentStatus == 'Paid' ? Colors.green.shade100 : Colors.orange.shade100,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text(inc.paymentStatus, style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold)),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        }),
      ],
    );
  }

  Widget _buildFeedingTab(dynamic feedingState, Batch batch) {
    return ListView(
      padding: const EdgeInsets.all(AppSpacing.md),
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Daily Feeding & Environment Logs', style: TextStyle(fontWeight: FontWeight.bold)),
            TextButton.icon(
              onPressed: () => context.push('/feeding/add', extra: batch.id),
              icon: const Icon(Icons.add, size: 16),
              label: const Text('Log Feeding'),
            ),
          ],
        ),
        const SizedBox(height: AppSpacing.sm),
        Card(
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppRadius.md),
            side: BorderSide(color: Colors.grey.shade200),
          ),
          child: Padding(
            padding: const EdgeInsets.all(AppSpacing.md),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _metricCol('Temp', '${batch.temperature}°C', Icons.thermostat),
                    _metricCol('Humidity', '${batch.humidity}%', Icons.water_drop),
                    _metricCol('Health', batch.healthStatus.name.toUpperCase(), Icons.favorite),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _metricCol(String label, String val, IconData icon) {
    return Column(
      children: [
        Icon(icon, size: 20, color: AppColorScheme.primaryLight),
        const SizedBox(height: 2),
        Text(val, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
        Text(label, style: TextStyle(fontSize: 11, color: Colors.grey.shade600)),
      ],
    );
  }

  Widget _buildProfitabilityTab(
    Batch batch,
    double totalExp,
    double totalRev,
    double profit,
    double yieldKg,
    double costPerKg,
    double revPerKg,
    NumberFormat currency,
    List<Expense> expenses,
  ) {
    final margin = totalRev > 0 ? ((profit / totalRev) * 100) : 0.0;

    return ListView(
      padding: const EdgeInsets.all(AppSpacing.md),
      children: [
        Card(
          elevation: 0,
          color: profit >= 0 ? Colors.green.shade50 : Colors.red.shade50,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppRadius.md),
            side: BorderSide(color: profit >= 0 ? Colors.green.shade200 : Colors.red.shade200),
          ),
          child: Padding(
            padding: const EdgeInsets.all(AppSpacing.md),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('BATCH FINANCIAL HEALTH', style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: Colors.grey.shade800)),
                const Divider(),
                _pnlRow('Total Cocoon Revenue', currency.format(totalRev)),
                _pnlRow('Total Batch Outflow', '- ${currency.format(totalExp)}', isExpense: true),
                const Divider(),
                _pnlRow('Net Profit', currency.format(profit), isBold: true, isProfit: true),
                _pnlRow('Profit Margin', totalRev > 0 ? '${margin.toStringAsFixed(1)}%' : '0.0%'),
              ],
            ),
          ),
        ),
        const SizedBox(height: AppSpacing.md),

        // Unit Economics
        Card(
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppRadius.md),
            side: BorderSide(color: Colors.grey.shade200),
          ),
          child: Padding(
            padding: const EdgeInsets.all(AppSpacing.md),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Unit Economics (Per kg of Cocoon)', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
                const Divider(),
                _pnlRow('Total Yield', '${yieldKg.toStringAsFixed(1)} kg'),
                _pnlRow('Cost / kg', currency.format(costPerKg)),
                _pnlRow('Revenue / kg', currency.format(revPerKg)),
                _pnlRow('Profit / kg', currency.format(revPerKg - costPerKg)),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _pnlRow(String label, String value, {bool isBold = false, bool isExpense = false, bool isProfit = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: TextStyle(fontSize: 13, fontWeight: isBold ? FontWeight.bold : FontWeight.normal)),
          Text(
            value,
            style: TextStyle(
              fontSize: 14,
              fontWeight: isBold ? FontWeight.bold : FontWeight.w600,
              color: isExpense
                  ? AppColorScheme.error
                  : (isProfit ? (value.contains('-') ? AppColorScheme.error : AppColorScheme.success) : Colors.black87),
            ),
          ),
        ],
      ),
    );
  }
}
