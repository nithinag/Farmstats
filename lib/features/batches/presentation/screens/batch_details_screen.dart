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
import 'package:drift/drift.dart' hide Column, Batch, Table;

class BatchDetailsScreen extends ConsumerStatefulWidget {
  final Batch batch;
  const BatchDetailsScreen({super.key, required this.batch});

  @override
  ConsumerState<BatchDetailsScreen> createState() => _BatchDetailsScreenState();
}

class _BatchDetailsScreenState extends ConsumerState<BatchDetailsScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late String _currentBatchId;

  @override
  void initState() {
    super.initState();
    _currentBatchId = widget.batch.id;
    _tabController = TabController(length: 4, vsync: this);
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
                'Completing this batch will finalize its rearing metrics and mark it as a completed milestone.',
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
            content: Text('✓ ${batch.batchName} marked as COMPLETED!'),
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
    final allBatches = switch (batchState) {
      BatchStateData(batches: final list) => list,
      _ => <Batch>[widget.batch],
    };

    final currentBatch = allBatches.where((b) => b.id == _currentBatchId).firstOrNull ?? widget.batch;

    final expensesState = ref.watch(expenseNotifierProvider);
    final incomesState = ref.watch(incomeNotifierProvider);
    final harvestsState = ref.watch(harvestNotifierProvider);
    final feedingState = ref.watch(feedingNotifierProvider);

    final currency = NumberFormat.currency(symbol: '₹', decimalDigits: 0, locale: 'en_IN');

    // Filter isolated data for this batch
    final List<Expense> batchExpenses = (expensesState is ExpenseStateData)
        ? expensesState.expenses.where((e) => e.batchId == currentBatch.id).toList()
        : <Expense>[];
    final totalExpenses = batchExpenses.fold(0.0, (sum, e) => sum + e.amount);

    final double batchLabourCost = batchExpenses
        .where((e) => e.category.id == 'c4' || e.category.name.toLowerCase().contains('labour'))
        .fold(0.0, (sum, e) => sum + e.amount);

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
        title: DropdownButtonHideUnderline(
          child: DropdownButton<String>(
            value: _currentBatchId,
            dropdownColor: AppColorScheme.primary,
            icon: const Icon(Icons.arrow_drop_down, color: Colors.white),
            style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 17),
            items: allBatches.map((b) {
              final isAct = b.status == BatchStatus.active;
              return DropdownMenuItem(
                value: b.id,
                child: Text(
                  '${b.batchName} (${isAct ? "Active" : "Completed"})',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: b.id == _currentBatchId ? FontWeight.bold : FontWeight.normal,
                  ),
                ),
              );
            }).toList(),
            onChanged: (newId) {
              if (newId != null) setState(() => _currentBatchId = newId);
            },
          ),
        ),
        backgroundColor: AppColorScheme.primary,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.edit_outlined),
            tooltip: 'Edit Batch',
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
          // 1. Batch Hero Capsule
          _buildHeroHeader(context, currentBatch, totalExpenses, batchLabourCost, totalRevenue, profit, currency),

          // 2. 4 Focused Tabs
          Container(
            color: Theme.of(context).colorScheme.surface,
            child: TabBar(
              controller: _tabController,
              labelColor: AppColorScheme.primary,
              indicatorColor: AppColorScheme.primaryLight,
              tabs: const [
                Tab(text: 'Overview'),
                Tab(text: 'Timeline'),
                Tab(text: 'Operations'),
                Tab(text: 'Financials'),
              ],
            ),
          ),

          // 3. Tab Views
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                // TAB 1: OVERVIEW
                _buildOverviewTab(context, currentBatch, totalExpenses, batchLabourCost, totalRevenue, totalYieldKg, profit, currency, batchExpenses),

                // TAB 2: TIMELINE
                _buildTimelineTab(currentBatch.id),

                // TAB 3: OPERATIONS (Labour, Feeding, Health)
                _buildOperationsTab(context, currentBatch, feedingState, currency),

                // TAB 4: FINANCIALS (Expenses, Sales, Profitability)
                _buildFinancialsTab(currentBatch, totalExpenses, totalRevenue, profit, totalYieldKg, costPerKg, revPerKg, currency, batchExpenses, batchIncomes),
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
    double labour,
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
                    ? '✓ $totalDuration DAYS COMPLETED'
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
                  isCompleted ? '✓ ARCHIVED' : '● ACTIVE',
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
              Expanded(child: _headerCard('Expenses', currency.format(expenses), Colors.red.shade100)),
              const SizedBox(width: AppSpacing.xs),
              Expanded(child: _headerCard('Labour', currency.format(labour), Colors.blue.shade100)),
              const SizedBox(width: AppSpacing.xs),
              Expanded(child: _headerCard('Revenue', currency.format(revenue), Colors.green.shade100)),
              const SizedBox(width: AppSpacing.xs),
              Expanded(
                child: _headerCard(
                  'Profit',
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
      padding: const EdgeInsets.symmetric(vertical: AppSpacing.sm, horizontal: 4),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.15),
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
              fontWeight: isBold ? FontWeight.bold : FontWeight.w600,
              fontSize: 11,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOverviewTab(
    BuildContext context,
    Batch batch,
    double expenses,
    double labour,
    double revenue,
    double yieldKg,
    double profit,
    NumberFormat currency,
    List<Expense> batchExpenses,
  ) {
    return ListView(
      padding: const EdgeInsets.all(AppSpacing.md),
      children: [
        // 1. Quick Actions Bar
        Text(
          'Quick Actions for ${batch.batchName}',
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
        ),
        const SizedBox(height: AppSpacing.xs),
        Row(
          children: [
            Expanded(
              child: _actionBtn(
                icon: Icons.receipt_long,
                label: '+ Expense',
                color: AppColorScheme.error,
                onTap: () => context.push('/expenses/add', extra: batch.id),
              ),
            ),
            const SizedBox(width: AppSpacing.xs),
            Expanded(
              child: _actionBtn(
                icon: Icons.people_outline,
                label: '+ Labour',
                color: const Color(0xFF1565C0),
                onTap: () => context.push('/labour/attendance', extra: batch.id),
              ),
            ),
            const SizedBox(width: AppSpacing.xs),
            Expanded(
              child: _actionBtn(
                icon: Icons.eco_outlined,
                label: '+ Feeding',
                color: const Color(0xFF2E7D32),
                onTap: () => context.push('/feeding/add', extra: batch.id),
              ),
            ),
            const SizedBox(width: AppSpacing.xs),
            Expanded(
              child: _actionBtn(
                icon: Icons.payments,
                label: '+ Cocoon Sale',
                color: const Color(0xFF2E7D32),
                onTap: () => context.push('/cocoon-sale', extra: batch.id),
              ),
            ),
          ],
        ),
        const SizedBox(height: AppSpacing.lg),

        // 2. Batch Specifications Card
        Card(
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppRadius.md),
            side: BorderSide(color: Colors.grey.shade300),
          ),
          child: Padding(
            padding: const EdgeInsets.all(AppSpacing.md),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('BATCH METRICS & DATES', style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: Colors.grey)),
                const SizedBox(height: AppSpacing.sm),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _specItem('DFLs Quantity', '${batch.numberOfDfls} DFLs'),
                    _specItem('Started On', DateFormat('dd MMM yyyy').format(batch.startDate)),
                    _specItem('Expected End', DateFormat('dd MMM yyyy').format(batch.expectedHarvestDate)),
                  ],
                ),
                const Divider(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _specItem('Harvest Yield', '${yieldKg.toStringAsFixed(1)} kg'),
                    _specItem('Total Incurred Cost', currency.format(expenses)),
                    _specItem('Net Margin', currency.format(profit), color: profit >= 0 ? AppColorScheme.success : AppColorScheme.error),
                  ],
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: AppSpacing.lg),

        // 3. Recent Expenses for this batch
        Text('Recent Expenses (${batchExpenses.length})', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
        const SizedBox(height: AppSpacing.xs),
        if (batchExpenses.isEmpty)
          const Text('No expenses recorded for this batch yet.', style: TextStyle(color: Colors.grey, fontSize: 12))
        else
          ...batchExpenses.take(4).map((e) => ListTile(
                dense: true,
                contentPadding: EdgeInsets.zero,
                leading: CircleAvatar(
                  radius: 16,
                  backgroundColor: AppColorScheme.primaryLight.withValues(alpha: 0.15),
                  child: const Icon(Icons.receipt, size: 16, color: AppColorScheme.primary),
                ),
                title: Text(e.description, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13)),
                subtitle: Text(DateFormat('dd MMM yyyy').format(e.date), style: const TextStyle(fontSize: 11)),
                trailing: Text(currency.format(e.amount), style: const TextStyle(fontWeight: FontWeight.bold)),
              )),
      ],
    );
  }

  Widget _specItem(String label, String value, {Color? color}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontSize: 11, color: Colors.grey)),
        const SizedBox(height: 2),
        Text(value, style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: color ?? Colors.black87)),
      ],
    );
  }

  Widget _actionBtn({
    required IconData icon,
    required String label,
    required Color color,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(AppRadius.sm),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 2),
        decoration: BoxDecoration(
          color: color.withValues(alpha: 0.08),
          borderRadius: BorderRadius.circular(AppRadius.sm),
          border: Border.all(color: color.withValues(alpha: 0.25)),
        ),
        child: Column(
          children: [
            Icon(icon, color: color, size: 18),
            const SizedBox(height: 2),
            Text(label, style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: color)),
          ],
        ),
      ),
    );
  }

  Widget _buildTimelineTab(String batchId) {
    final db = ref.watch(appDatabaseProvider);

    return FutureBuilder<List<BatchTimelineDbModel>>(
      future: (db.select(db.batchTimelinesTable)
            ..where((t) => t.batchId.equals(batchId))
            ..orderBy([(t) => OrderingTerm.desc(t.timestamp)]))
          .get(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        final events = snapshot.data ?? [];
        if (events.isEmpty) {
          return const Center(
            child: Padding(
              padding: EdgeInsets.all(AppSpacing.xl),
              child: Text(
                'No timeline events yet for this batch.\nActivities, feedings, and sales will appear here.',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey),
              ),
            ),
          );
        }

        return ListView.builder(
          padding: const EdgeInsets.all(AppSpacing.md),
          itemCount: events.length,
          itemBuilder: (context, index) {
            final ev = events[index];
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    const CircleAvatar(
                      radius: 12,
                      backgroundColor: AppColorScheme.primary,
                      child: Icon(Icons.check, size: 12, color: Colors.white),
                    ),
                    if (index < events.length - 1)
                      Container(width: 2, height: 40, color: Colors.grey.shade300),
                  ],
                ),
                const SizedBox(width: AppSpacing.md),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(ev.eventType.toUpperCase(), style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
                      Text(ev.description, style: TextStyle(color: Colors.grey.shade700, fontSize: 12)),
                      Text(DateFormat('dd MMM yyyy, hh:mm a').format(ev.timestamp), style: TextStyle(color: Colors.grey.shade500, fontSize: 10)),
                      const SizedBox(height: AppSpacing.sm),
                    ],
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }

  Widget _buildOperationsTab(
    BuildContext context,
    Batch batch,
    dynamic feedingState,
    NumberFormat currency,
  ) {
    final expenseState = ref.watch(expenseNotifierProvider);
    final List<Expense> batchLabour = (expenseState is ExpenseStateData)
        ? expenseState.expenses.where((e) => e.batchId == batch.id && (e.category.id == 'c4' || e.category.name.toLowerCase().contains('labour'))).toList()
        : <Expense>[];

    return ListView(
      padding: const EdgeInsets.all(AppSpacing.md),
      children: [
        // Labour Section
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Labour & Workers (${batchLabour.length})', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
            TextButton.icon(
              onPressed: () => context.push('/labour/attendance', extra: batch.id),
              icon: const Icon(Icons.add, size: 14),
              label: const Text('Log Labour', style: TextStyle(fontSize: 12)),
            ),
          ],
        ),
        if (batchLabour.isEmpty)
          const Text('No labour logged for this batch.', style: TextStyle(color: Colors.grey, fontSize: 12))
        else
          ...batchLabour.map((l) => Card(
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppRadius.sm),
                  side: BorderSide(color: Colors.grey.shade200),
                ),
                child: ListTile(
                  dense: true,
                  leading: const Icon(Icons.people, color: Color(0xFF1565C0)),
                  title: Text(l.description, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 12)),
                  subtitle: Text(DateFormat('dd MMM yyyy').format(l.date), style: const TextStyle(fontSize: 11)),
                  trailing: Text(currency.format(l.amount), style: const TextStyle(fontWeight: FontWeight.bold)),
                ),
              )),
        const SizedBox(height: AppSpacing.lg),

        // Feeding Section
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Silkworm Feeding & Health', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
            TextButton.icon(
              onPressed: () => context.push('/feeding/add', extra: batch.id),
              icon: const Icon(Icons.add, size: 14),
              label: const Text('Log Feeding', style: TextStyle(fontSize: 12)),
            ),
          ],
        ),
        Card(
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppRadius.sm),
            side: BorderSide(color: Colors.grey.shade200),
          ),
          child: ListTile(
            leading: const Icon(Icons.eco, color: AppColorScheme.primary),
            title: Text('Stage: ${batch.currentStage.name.toUpperCase()} INSTAR'),
            subtitle: const Text('Regular feeding schedule active'),
            trailing: FilledButton.tonal(
              onPressed: () => context.push('/feeding'),
              child: const Text('View Logs'),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildFinancialsTab(
    Batch batch,
    double expenses,
    double revenue,
    double profit,
    double yieldKg,
    double costPerKg,
    double revPerKg,
    NumberFormat currency,
    List<Expense> batchExpenses,
    List<Income> batchIncomes,
  ) {
    return ListView(
      padding: const EdgeInsets.all(AppSpacing.md),
      children: [
        // 1. Profitability Summary Card
        Card(
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppRadius.md),
            side: BorderSide(color: Colors.grey.shade300),
          ),
          child: Padding(
            padding: const EdgeInsets.all(AppSpacing.md),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('BATCH PROFITABILITY ANALYSIS', style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: Colors.grey)),
                const SizedBox(height: AppSpacing.sm),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _specItem('Gross Revenue', currency.format(revenue)),
                    _specItem('Total Expenses', currency.format(expenses)),
                    _specItem('Net Profit', currency.format(profit), color: profit >= 0 ? AppColorScheme.success : AppColorScheme.error),
                  ],
                ),
                const Divider(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _specItem('Total Yield', '${yieldKg.toStringAsFixed(1)} kg'),
                    _specItem('Cost / kg', currency.format(costPerKg)),
                    _specItem('Revenue / kg', currency.format(revPerKg)),
                  ],
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: AppSpacing.lg),

        // 2. Cocoon Sales Ledger
        Text('Cocoon Sales (${batchIncomes.length})', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
        const SizedBox(height: AppSpacing.xs),
        if (batchIncomes.isEmpty)
          const Text('No cocoon sales recorded for this batch yet.', style: TextStyle(color: Colors.grey, fontSize: 12))
        else
          ...batchIncomes.map((i) => Card(
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppRadius.sm),
                  side: BorderSide(color: Colors.grey.shade200),
                ),
                child: ListTile(
                  dense: true,
                  leading: const Icon(Icons.payments, color: Color(0xFF2E7D32)),
                  title: Text('${i.quantity.toStringAsFixed(1)} kg Cocoon Sold', style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13)),
                  subtitle: Text(
                    '${DateFormat('dd MMM yyyy').format(i.saleDate)} • Rate: ₹${i.rate.toStringAsFixed(0)}/kg • Status: ${i.paymentStatus}',
                    style: const TextStyle(fontSize: 11),
                  ),
                  trailing: Text(currency.format(i.netAmount), style: const TextStyle(fontWeight: FontWeight.bold, color: AppColorScheme.primary)),
                ),
              )),
        const SizedBox(height: AppSpacing.lg),

        // 3. Expense Ledger
        Text('Expense Ledger (${batchExpenses.length})', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
        const SizedBox(height: AppSpacing.xs),
        if (batchExpenses.isEmpty)
          const Text('No expenses recorded for this batch.', style: TextStyle(color: Colors.grey, fontSize: 12))
        else
          ...batchExpenses.map((e) => Card(
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppRadius.sm),
                  side: BorderSide(color: Colors.grey.shade200),
                ),
                child: ListTile(
                  dense: true,
                  leading: const Icon(Icons.receipt_long, color: AppColorScheme.error),
                  title: Text(e.description, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 12)),
                  subtitle: Text('${DateFormat('dd MMM yyyy').format(e.date)} • ${e.paymentMethod}', style: const TextStyle(fontSize: 11)),
                  trailing: Text(currency.format(e.amount), style: const TextStyle(fontWeight: FontWeight.bold)),
                ),
              )),
      ],
    );
  }
}
