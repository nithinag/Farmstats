import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../shared/widgets/layout_components.dart';
import '../../../../shared/widgets/feedback_views.dart';
import '../../../../core/theme/spacing.dart';
import '../widgets/worker_card.dart';
import '../../application/providers/labour_notifier.dart';
import '../../application/providers/labour_state.dart';

class WorkerListScreen extends ConsumerWidget {
  const WorkerListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(labourNotifierProvider);

    return BaseScaffold(
      appBar: AppBar(
        title: const Text('Labour Management'),
        actions: [
          IconButton(
            icon: const Icon(Icons.assignment),
            tooltip: 'Attendance',
            onPressed: () => context.push('/labour/attendance'),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => context.push('/labour/add'),
        icon: const Icon(Icons.person_add),
        label: const Text('Add Worker'),
      ),
      body: switch (state) {
        LabourStateInitial() => const DashboardSkeletonLoader(),
        LabourStateLoading() => const DashboardSkeletonLoader(),
        LabourStateError(message: final m) => ErrorView(
          error: m,
          onRetry: () => ref.read(labourNotifierProvider.notifier).loadWorkers(),
        ),
        LabourStateData(workers: final workers) => workers.isEmpty
          ? const EmptyStateView(
              title: 'No Workers Found',
              message: 'Add workers to track attendance and assignments.',
              icon: Icons.engineering,
            )
          : RefreshIndicator(
              onRefresh: () => ref.read(labourNotifierProvider.notifier).loadWorkers(),
              child: ListView.separated(
                padding: const EdgeInsets.all(AppSpacing.md),
                itemCount: workers.length,
                separatorBuilder: (ctx, i) => const SizedBox(height: AppSpacing.sm),
                itemBuilder: (context, index) {
                  final worker = workers[index];
                  return WorkerCard(
                    worker: worker,
                    onTap: () => context.push('/labour/${worker.id}', extra: worker),
                  );
                },
              ),
            ),
        _ => const SizedBox.shrink(),
      },
    );
  }
}
