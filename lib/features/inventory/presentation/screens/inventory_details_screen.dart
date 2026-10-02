import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../shared/widgets/layout_components.dart';
import '../../../../shared/widgets/buttons_and_cards.dart';
import '../../../../shared/extensions/extensions.dart';
import '../../../../core/theme/spacing.dart';
import '../../domain/entities/inventory_entities.dart';
import '../../application/providers/inventory_notifier.dart';

class InventoryDetailsScreen extends ConsumerWidget {
  final InventoryItem item;
  const InventoryDetailsScreen({super.key, required this.item});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final historyAsync = ref.watch(getStockHistoryUseCaseProvider).execute(item.id);

    return BaseScaffold(
      appBar: AppBar(
        title: Text(item.name),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () => context.push('/inventory/${item.id}/edit', extra: item),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // Open stock consumption dialog (mocked for simplicity, logic works on real implementation)
        },
        icon: const Icon(Icons.remove_circle_outline),
        label: const Text('Consume Stock'),
        backgroundColor: Colors.orange,
      ),
      body: ListView(
        padding: const EdgeInsets.all(AppSpacing.md),
        children: [
          AppCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Current Stock', style: Theme.of(context).textTheme.titleMedium),
                    Text('${item.currentQuantity} ${item.unit}', style: Theme.of(context).textTheme.headlineSmall?.copyWith(color: Theme.of(context).colorScheme.primary)),
                  ],
                ),
                const Divider(),
                Text('Category: ${item.category.name}'),
                Text('Purchase Price: ₹${item.purchasePrice}/${item.unit}'),
                Text('Min Stock Alert: ${item.minimumQuantity} ${item.unit}'),
              ],
            ),
          ),
          const SizedBox(height: AppSpacing.lg),
          Text('Stock History', style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: AppSpacing.md),
          FutureBuilder(
            future: historyAsync,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }
              final result = snapshot.data;
              if (result == null || result.isLeft()) {
                return const Text('Failed to load history');
              }
              final history = result.getOrElse((_) => []);
              
              if (history.isEmpty) return const Text('No history events recorded.');

              return Column(
                children: history.map((event) {
                  return ListTile(
                    leading: Icon(
                      event.type == TransactionType.consume ? Icons.arrow_downward : Icons.arrow_upward,
                      color: event.type == TransactionType.consume ? Colors.red : Colors.green,
                    ),
                    title: Text('${event.type.name.toUpperCase()} ${event.quantity} ${item.unit}'),
                    subtitle: Text(event.reason ?? (event.batchId != null ? 'Used for Batch ${event.batchId}' : '')),
                    trailing: Text(event.date.toShortDate()),
                  );
                }).toList(),
              );
            },
          ),
        ],
      ),
    );
  }
}
