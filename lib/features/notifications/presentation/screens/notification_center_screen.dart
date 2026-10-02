import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../shared/widgets/layout_components.dart';
import '../../../../core/theme/spacing.dart';
import '../../application/providers/notification_notifier.dart';
import '../../application/providers/notification_state.dart';
import '../../domain/entities/notification_entities.dart';

class NotificationCenterScreen extends ConsumerWidget {
  const NotificationCenterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(notificationNotifierProvider);

    return BaseScaffold(
      appBar: AppBar(
        title: const Text('Notification Center'),
        actions: [
          IconButton(
            icon: const Icon(Icons.done_all),
            tooltip: 'Mark All as Read',
            onPressed: () => ref.read(notificationNotifierProvider.notifier).markAllAsRead(),
          )
        ],
      ),
      body: switch (state) {
        NotificationStateInitial() => const Center(child: Text('Initializing...')),
        NotificationStateLoading() => const Center(child: CircularProgressIndicator()),
        NotificationStateError(message: final m) => Center(child: Text('Error: $m')),
        NotificationStateData(notifications: final notifs) => notifs.isEmpty
            ? const Center(child: Text('No notifications right now!'))
            : ListView.builder(
                padding: const EdgeInsets.all(AppSpacing.md),
                itemCount: notifs.length,
                itemBuilder: (context, index) {
                  final n = notifs[index];
                  return Card(
                    color: n.isRead ? Colors.white : Colors.blue.shade50,
                    child: ListTile(
                      leading: _getIcon(n.category, n.priority),
                      title: Text(n.title, style: TextStyle(fontWeight: n.isRead ? FontWeight.normal : FontWeight.bold)),
                      subtitle: Text(n.message),
                      trailing: IconButton(
                        icon: const Icon(Icons.check_circle_outline),
                        onPressed: n.isRead ? null : () => ref.read(notificationNotifierProvider.notifier).markAsRead(n.id),
                      ),
                    ),
                  );
                },
              ),
        _ => const SizedBox.shrink(),
      },
    );
  }

  Widget _getIcon(NotificationCategory category, PriorityLevel priority) {
    IconData iconData;
    final Color color = priority == PriorityLevel.critical ? Colors.red : (priority == PriorityLevel.high ? Colors.orange : Colors.blue);

    switch (category) {
      case NotificationCategory.feeding:
        iconData = Icons.eco;
        break;
      case NotificationCategory.harvest:
        iconData = Icons.inventory_2;
        break;
      case NotificationCategory.inventory:
        iconData = Icons.inventory;
        break;
      case NotificationCategory.health:
        iconData = Icons.health_and_safety;
        break;
      case NotificationCategory.environmental:
        iconData = Icons.thermostat;
        break;
      case NotificationCategory.labour:
        iconData = Icons.people;
        break;
      case NotificationCategory.system:
        iconData = Icons.info;
        break;
    }

    return CircleAvatar(
      backgroundColor: color.withValues(alpha: 0.1),
      child: Icon(iconData, color: color),
    );
  }
}
