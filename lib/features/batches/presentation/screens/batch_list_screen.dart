import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../shared/widgets/layout_components.dart';
import '../../../../shared/widgets/feedback_views.dart';
import '../../../../core/theme/spacing.dart';
import '../widgets/batch_card.dart';
import '../../application/providers/batch_notifier.dart';
import '../../application/providers/batch_state.dart';

class BatchListScreen extends ConsumerWidget {
  const BatchListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(batchNotifierProvider);

    return BaseScaffold(
      appBar: AppBar(
        title: const Text('Batches'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => context.push('/batch/add'),
        icon: const Icon(Icons.add),
        label: const Text('New Batch'),
      ),
      body: switch (state) {
        BatchStateInitial() => const DashboardSkeletonLoader(),
        BatchStateLoading() => const DashboardSkeletonLoader(),
        BatchStateError(message: final m) => ErrorView(
          error: m,
          onRetry: () => ref.read(batchNotifierProvider.notifier).loadBatches(),
        ),
        BatchStateData(batches: final batches) => batches.isEmpty
          ? const EmptyStateView(
              title: 'No Batches Found',
              message: 'Start a new rearing cycle by creating a batch.',
              icon: Icons.bug_report,
            )
          : RefreshIndicator(
              onRefresh: () => ref.read(batchNotifierProvider.notifier).loadBatches(),
              child: ListView.separated(
                padding: const EdgeInsets.all(AppSpacing.md),
                itemCount: batches.length,
                separatorBuilder: (ctx, i) => const SizedBox(height: AppSpacing.sm),
                itemBuilder: (context, index) {
                  final batch = batches[index];
                  return BatchCard(
                    batch: batch,
                    onTap: () => context.push('/batch/${batch.id}', extra: batch),
                  );
                },
              ),
            ),
        _ => const SizedBox.shrink(),
      },
    );
  }
}
