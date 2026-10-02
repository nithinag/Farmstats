import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../shared/widgets/layout_components.dart';
import '../../../../core/theme/spacing.dart';
import '../../application/providers/feeding_notifier.dart';
import '../../application/providers/feeding_state.dart';

class TodaysFeedingsScreen extends ConsumerWidget {
  const TodaysFeedingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(feedingNotifierProvider);

    return BaseScaffold(
      appBar: AppBar(
        title: const Text("Today's Operations"),
        actions: [
          IconButton(
            icon: const Icon(Icons.health_and_safety),
            tooltip: 'Health Tracking',
            onPressed: () => context.push('/feeding/health'),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => context.push('/feeding/add'),
        icon: const Icon(Icons.add),
        label: const Text('Log Feeding'),
      ),
      body: switch (state) {
        FeedingStateInitial() => const Center(child: Text('Select a batch to view feedings')),
        FeedingStateLoading() => const Center(child: CircularProgressIndicator()),
        FeedingStateError(message: final m) => Center(child: Text('Error: $m')),
        FeedingStateData(feedings: final feedings) => feedings.isEmpty
            ? const Center(child: Text('No feedings recorded today.'))
            : ListView.builder(
                padding: const EdgeInsets.all(AppSpacing.md),
                itemCount: feedings.length,
                itemBuilder: (context, index) {
                  final log = feedings[index];
                  return Card(
                    child: ListTile(
                      leading: const CircleAvatar(child: Icon(Icons.eco)),
                      title: Text('${log.leafType.name.toUpperCase()} - ${log.leafQuantity} kg'),
                      subtitle: Text('Round ${log.feedingRound} | Time: ${log.time}'),
                      trailing: const Icon(Icons.chevron_right),
                    ),
                  );
                },
              ),
        _ => const SizedBox.shrink(),
      },
    );
  }
}
