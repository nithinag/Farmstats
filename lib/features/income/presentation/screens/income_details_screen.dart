import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../shared/widgets/layout_components.dart';
import '../../../../shared/widgets/buttons_and_cards.dart';
import '../../../../shared/extensions/extensions.dart';
import '../../../../core/theme/spacing.dart';
import '../../domain/entities/income_entities.dart';
import '../../application/providers/income_notifier.dart';

class IncomeDetailsScreen extends ConsumerWidget {
  final Income income;
  const IncomeDetailsScreen({super.key, required this.income});

  void _confirmDelete(BuildContext context, WidgetRef ref) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Delete Revenue Record?'),
        content: const Text(
          'Are you sure you want to delete this sale record? This action cannot be undone.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('Cancel'),
          ),
          FilledButton(
            style: FilledButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.error,
              foregroundColor: Theme.of(context).colorScheme.onError,
            ),
            onPressed: () async {
              Navigator.pop(ctx);
              final success = await ref.read(incomeNotifierProvider.notifier).deleteIncome(income.id);
              if (context.mounted) {
                context.pop();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(success ? 'Revenue record deleted successfully.' : 'Failed to delete record.'),
                  ),
                );
              }
            },
            child: const Text('Delete Record'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isWide = MediaQuery.of(context).size.width > 600;

    return BaseScaffold(
      appBar: AppBar(
        title: const Text('Sale Details'),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () => context.push('/income/${income.id}/edit', extra: income),
          ),
          IconButton(
            icon: const Icon(Icons.delete_outline),
            onPressed: () => _confirmDelete(context, ref),
          ),
        ],
      ),

      body: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: isWide ? 600 : double.infinity),
          child: Hero(
            tag: 'income_card_${income.id}',
            child: Material(
              color: Theme.of(context).scaffoldBackgroundColor,
              child: ListView(
                padding: const EdgeInsets.all(AppSpacing.md),
                children: [
                  AppCard(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 40,
                          backgroundColor: Theme.of(context).colorScheme.primaryContainer,
                          child: Icon(Icons.monetization_on, size: 40, color: Theme.of(context).colorScheme.onPrimaryContainer),
                        ),
                        const SizedBox(height: AppSpacing.md),
                        Text(
                          income.netAmount.toCurrency(),
                          style: Theme.of(context).textTheme.displaySmall?.copyWith(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: AppSpacing.xs),
                        Text(income.buyer.name, style: Theme.of(context).textTheme.titleMedium),
                        const SizedBox(height: AppSpacing.xs),
                        Text(income.paymentStatus, style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: income.paymentStatus == 'Paid' ? Colors.green : Theme.of(context).colorScheme.error,
                          fontWeight: FontWeight.bold,
                        )),
                      ],
                    ),
                  ),
                  const SizedBox(height: AppSpacing.md),
                  AppCard(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildDetailRow(context, 'Date', income.saleDate.toShortDate(), Icons.calendar_today),
                        const Divider(),
                        _buildDetailRow(context, 'Grade', income.cocoonGrade, Icons.grade),
                        const Divider(),
                        _buildDetailRow(context, 'Quantity', '${income.quantity} kg', Icons.scale),
                        const Divider(),
                        _buildDetailRow(context, 'Rate', income.rate.toCurrency(), Icons.sell),
                        const Divider(),
                        _buildDetailRow(context, 'Gross', income.grossAmount.toCurrency(), Icons.payments),
                      ],
                    ),
                  ),
                  const SizedBox(height: AppSpacing.md),
                  AppCard(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildDetailRow(context, 'Transport Deductions', '-${income.transportCharges.toCurrency()}', Icons.local_shipping),
                        const Divider(),
                        _buildDetailRow(context, 'Commission', '-${income.commission.toCurrency()}', Icons.money_off),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDetailRow(BuildContext context, String label, String value, IconData icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppSpacing.sm),
      child: Row(
        children: [
          Icon(icon, color: Theme.of(context).colorScheme.outline),
          const SizedBox(width: AppSpacing.md),
          Expanded(
            child: Text(label, style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Theme.of(context).colorScheme.outline)),
          ),
          Text(value, style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
