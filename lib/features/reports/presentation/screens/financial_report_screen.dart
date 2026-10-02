import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../shared/widgets/layout_components.dart';
import '../../../../core/theme/spacing.dart';
import '../../application/providers/reports_notifier.dart';
import '../../application/providers/reports_state.dart';

class FinancialReportScreen extends ConsumerWidget {
  const FinancialReportScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(reportsNotifierProvider);

    if (state is! ReportsStateData) {
      return BaseScaffold(
        appBar: AppBar(title: const Text('Financial Report')),
        body: const Center(child: CircularProgressIndicator()),
      );
    }

    final fin = state.financial;

    return BaseScaffold(
      appBar: AppBar(
        title: const Text('Financial Report'),
        actions: [
          IconButton(
            icon: const Icon(Icons.download),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('CSV Export Started...')));
            },
          )
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(AppSpacing.md),
        children: [
          Card(
            color: Colors.green.withValues(alpha: 0.1),
            child: Padding(
              padding: const EdgeInsets.all(AppSpacing.lg),
              child: Column(
                children: [
                  const Text('Net Profit', style: TextStyle(fontSize: 16)),
                  Text(
                    '₹${fin.netProfit.toStringAsFixed(2)}', 
                    style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.green)
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: AppSpacing.md),
          Row(
            children: [
              Expanded(
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(AppSpacing.md),
                    child: Column(
                      children: [
                        const Text('Total Income'),
                        Text('₹${fin.totalIncome.toStringAsFixed(2)}', style: const TextStyle(color: Colors.blue)),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(width: AppSpacing.sm),
              Expanded(
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(AppSpacing.md),
                    child: Column(
                      children: [
                        const Text('Total Expenses'),
                        Text('₹${fin.totalExpenses.toStringAsFixed(2)}', style: const TextStyle(color: Colors.red)),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.xl),
          const Center(child: Text('Detailed charts will appear here using fl_chart in production.')),
        ],
      ),
    );
  }
}
