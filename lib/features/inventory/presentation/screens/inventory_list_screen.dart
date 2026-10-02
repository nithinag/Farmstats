import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../shared/widgets/layout_components.dart';
import '../../../../shared/widgets/feedback_views.dart';
import '../../../../core/theme/spacing.dart';
import '../widgets/inventory_card.dart';
import '../../application/providers/inventory_notifier.dart';
import '../../application/providers/inventory_state.dart';

class InventoryListScreen extends ConsumerWidget {
  const InventoryListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(inventoryNotifierProvider);

    return BaseScaffold(
      appBar: AppBar(
        title: const Text('Inventory'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => context.push('/inventory/add'),
        icon: const Icon(Icons.add),
        label: const Text('Add Item'),
      ),
      body: switch (state) {
        InventoryStateInitial() => const DashboardSkeletonLoader(),
        InventoryStateLoading() => const DashboardSkeletonLoader(),
        InventoryStateError(message: final m) => ErrorView(
          error: m,
          onRetry: () => ref.read(inventoryNotifierProvider.notifier).loadInventory(),
        ),
        InventoryStateData(items: final items) => items.isEmpty
          ? const EmptyStateView(
              title: 'No Inventory Items',
              message: 'Add items to track your stocks and materials.',
              icon: Icons.inventory_2,
            )
          : RefreshIndicator(
              onRefresh: () => ref.read(inventoryNotifierProvider.notifier).loadInventory(),
              child: ListView.separated(
                padding: const EdgeInsets.all(AppSpacing.md),
                itemCount: items.length,
                separatorBuilder: (ctx, i) => const SizedBox(height: AppSpacing.sm),
                itemBuilder: (context, index) {
                  final item = items[index];
                  return InventoryCard(
                    item: item,
                    onTap: () => context.push('/inventory/${item.id}', extra: item),
                  );
                },
              ),
            ),
        _ => const SizedBox.shrink(),
      },
    );
  }
}
