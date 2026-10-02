import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../shared/widgets/layout_components.dart';
import '../../../../core/theme/spacing.dart';
import '../../application/providers/harvest_notifier.dart';
import '../../application/providers/harvest_state.dart';

class HarvestListScreen extends ConsumerWidget {
  const HarvestListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(harvestNotifierProvider);

    return BaseScaffold(
      appBar: AppBar(title: const Text('Harvest & Production')),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => context.push('/harvest/add'),
        icon: const Icon(Icons.add),
        label: const Text('Log Harvest'),
      ),
      body: switch (state) {
        HarvestStateInitial() => const Center(child: Text('Initializing...')),
        HarvestStateLoading() => const Center(child: CircularProgressIndicator()),
        HarvestStateError(message: final m) => Center(child: Text('Error: $m')),
        HarvestStateData(harvests: final harvests) => harvests.isEmpty
            ? const Center(child: Text('No harvests found. Log the first batch harvest.'))
            : ListView.builder(
                padding: const EdgeInsets.all(AppSpacing.md),
                itemCount: harvests.length,
                itemBuilder: (context, index) {
                  final h = harvests[index];
                  return Card(
                    child: ListTile(
                      leading: const CircleAvatar(child: Icon(Icons.inventory_2)),
                      title: Text('Batch: ${h.batchId}'),
                      subtitle: Text('Yield: ${h.metrics.yieldPercentage.toStringAsFixed(1)}% | Net: ${h.netSaleableWeight} kg'),
                      trailing: const Icon(Icons.chevron_right),
                      onTap: () => context.push('/harvest/${h.id}', extra: h),
                    ),
                  );
                },
              ),
        _ => const SizedBox.shrink(),
      },
    );
  }
}
