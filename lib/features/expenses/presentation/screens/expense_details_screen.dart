import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../shared/widgets/layout_components.dart';
import '../../../../shared/widgets/buttons_and_cards.dart';
import '../../../../shared/extensions/extensions.dart';
import '../../../../core/theme/spacing.dart';
import '../../domain/entities/expense_entities.dart';
import '../../application/providers/expense_notifier.dart';

class ExpenseDetailsScreen extends ConsumerWidget {
  final Expense expense;

  const ExpenseDetailsScreen({super.key, required this.expense});

  void _confirmDelete(BuildContext context, WidgetRef ref) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Delete Expense?'),
        content: const Text(
          'Are you sure you want to delete this expense record? This action cannot be undone.',
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
              final success = await ref.read(expenseNotifierProvider.notifier).deleteExpense(expense.id);
              if (context.mounted) {
                context.pop();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(success ? 'Expense deleted successfully.' : 'Failed to delete expense.'),
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
        title: const Text('Expense Details'),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () => context.push('/expenses/${expense.id}/edit', extra: expense),
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
            tag: 'expense_card_${expense.id}',
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
                          child: Icon(Icons.receipt_long, size: 40, color: Theme.of(context).colorScheme.onPrimaryContainer),
                        ),
                        const SizedBox(height: AppSpacing.md),
                        Text(
                          expense.amount.toCurrency(),
                          style: Theme.of(context).textTheme.displaySmall?.copyWith(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: AppSpacing.xs),
                        Text(expense.description, style: Theme.of(context).textTheme.titleMedium),
                      ],
                    ),
                  ),
                  const SizedBox(height: AppSpacing.md),
                  AppCard(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildDetailRow(context, 'Category', expense.category.name, Icons.category),
                        if (expense.quantity != null) ...[
                          const SizedBox(height: AppSpacing.sm),
                          _buildDetailRow(context, 'Quantity', expense.quantity.toString(), Icons.numbers),
                        ],
                        const Divider(),
                        _buildDetailRow(context, 'Date', expense.date.toShortDate(), Icons.calendar_today),
                        const Divider(),
                        _buildDetailRow(context, 'Payment Method', expense.paymentMethod, Icons.payment),
                        if (expense.batchId != null) ...[
                          const Divider(),
                          _buildDetailRow(context, 'Batch', expense.batchId!, Icons.agriculture),
                        ],
                      ],
                    ),
                  ),
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
