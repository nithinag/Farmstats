import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/theme/color_scheme.dart';
import '../../../notifications/application/providers/notification_notifier.dart';
import '../../../notifications/application/providers/notification_state.dart';
import '../../../notifications/domain/entities/notification_entities.dart';

class FarmRemindersScreen extends ConsumerWidget {
  const FarmRemindersScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(notificationNotifierProvider);

    return Scaffold(
      backgroundColor: const Color(0xFFF7F9F8),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        scrolledUnderElevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF1E293B)),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Farm Reminders',
          style: TextStyle(
            color: Color(0xFF0F1E36),
            fontWeight: FontWeight.w700,
            fontSize: 18,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.done_all, color: AppColorScheme.primary),
            tooltip: 'Mark All as Read',
            onPressed: () => ref.read(notificationNotifierProvider.notifier).markAllAsRead(),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        children: [
          // Automated Reminder Configuration Summary Card
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: const Color(0xFFF1F5F9)),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFF1E293B).withValues(alpha: 0.03),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Row(
                  children: [
                    Icon(Icons.notifications_active_outlined, color: AppColorScheme.primary, size: 20),
                    SizedBox(width: 8),
                    Text(
                      'Automated Sericulture Monitoring',
                      style: TextStyle(
                        fontSize: 14.5,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF0F1E36),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Text(
                  'FARMSTATS continuously monitors feeding intervals, inventory thresholds, and worker attendance to alert you of timely farm tasks.',
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.grey.shade600,
                    height: 1.4,
                  ),
                ),
                const SizedBox(height: 12),
                const Divider(height: 1, color: Color(0xFFF1F5F9)),
                const SizedBox(height: 12),
                _buildRuleChip(icon: Icons.eco_outlined, label: 'Daily Feeding Schedule Alerts'),
                const SizedBox(height: 8),
                _buildRuleChip(icon: Icons.inventory_2_outlined, label: 'Low Stock & Disinfectant Warnings'),
                const SizedBox(height: 8),
                _buildRuleChip(icon: Icons.people_outline, label: 'Worker Attendance & Wage Reminders'),
              ],
            ),
          ),
          const SizedBox(height: 20),

          // Section Title
          const Padding(
            padding: EdgeInsets.only(left: 4, bottom: 10),
            child: Text(
              'ACTIVE ALERTS & REMINDERS',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w700,
                color: Color(0xFF64748B),
                letterSpacing: 0.8,
              ),
            ),
          ),

          // Active Reminders List
          switch (state) {
            NotificationStateInitial() || NotificationStateLoading() => const Center(
                child: Padding(
                  padding: EdgeInsets.all(32.0),
                  child: CircularProgressIndicator(),
                ),
              ),
            NotificationStateError(message: final m) => Center(
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Text(
                    'Error loading reminders: $m',
                    style: const TextStyle(color: Colors.red),
                  ),
                ),
              ),
            NotificationStateData(notifications: final notifs) => notifs.isEmpty
                ? Container(
                    padding: const EdgeInsets.symmetric(vertical: 36, horizontal: 20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: const Color(0xFFF1F5F9)),
                    ),
                    child: Column(
                      children: [
                        Container(
                          width: 52,
                          height: 52,
                          decoration: const BoxDecoration(
                            color: Color(0xFFE8F5EC),
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(Icons.check_circle_outline, color: Color(0xFF165B33), size: 28),
                        ),
                        const SizedBox(height: 14),
                        const Text(
                          'All caught up!',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF0F1E36),
                          ),
                        ),
                        const SizedBox(height: 4),
                        const Text(
                          'No pending sericulture reminders right now.',
                          style: TextStyle(
                            fontSize: 13,
                            color: Color(0xFF64748B),
                          ),
                        ),
                      ],
                    ),
                  )
                : Column(
                    children: notifs.map((n) => _buildReminderItem(context, ref, n)).toList(),
                  ),
            _ => const SizedBox.shrink(),
          },
        ],
      ),
    );
  }

  Widget _buildRuleChip({required IconData icon, required String label}) {
    return Row(
      children: [
        Icon(icon, size: 16, color: const Color(0xFF165B33)),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            label,
            style: const TextStyle(
              fontSize: 12.5,
              fontWeight: FontWeight.w500,
              color: Color(0xFF334155),
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
          decoration: BoxDecoration(
            color: const Color(0xFFE8F5EC),
            borderRadius: BorderRadius.circular(6),
          ),
          child: const Text(
            'Active',
            style: TextStyle(
              fontSize: 10.5,
              fontWeight: FontWeight.w700,
              color: Color(0xFF165B33),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildReminderItem(BuildContext context, WidgetRef ref, NotificationItem n) {
    Color badgeColor;
    IconData iconData;

    switch (n.category) {
      case NotificationCategory.feeding:
        badgeColor = const Color(0xFF165B33);
        iconData = Icons.eco_outlined;
        break;
      case NotificationCategory.inventory:
        badgeColor = const Color(0xFFE65100);
        iconData = Icons.inventory_2_outlined;
        break;
      case NotificationCategory.labour:
        badgeColor = const Color(0xFF1565C0);
        iconData = Icons.people_outline;
        break;
      case NotificationCategory.harvest:
        badgeColor = const Color(0xFF6A1B9A);
        iconData = Icons.inventory_outlined;
        break;
      default:
        badgeColor = const Color(0xFF455A64);
        iconData = Icons.notifications_none;
    }

    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: n.isRead ? Colors.white : const Color(0xFFF0FDF4),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: n.isRead ? const Color(0xFFF1F5F9) : const Color(0xFFBBF7D0),
          width: 1,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 38,
              height: 38,
              decoration: BoxDecoration(
                color: badgeColor.withValues(alpha: 0.12),
                shape: BoxShape.circle,
              ),
              child: Icon(iconData, size: 20, color: badgeColor),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          n.title,
                          style: TextStyle(
                            fontSize: 14.5,
                            fontWeight: n.isRead ? FontWeight.w600 : FontWeight.w700,
                            color: const Color(0xFF0F1E36),
                          ),
                        ),
                      ),
                      if (n.priority == PriorityLevel.critical)
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                          decoration: BoxDecoration(
                            color: const Color(0xFFFEE2E2),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: const Text(
                            'Urgent',
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w700,
                              color: Color(0xFFDC2626),
                            ),
                          ),
                        ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    n.message,
                    style: const TextStyle(
                      fontSize: 13,
                      color: Color(0xFF475569),
                      height: 1.3,
                    ),
                  ),
                ],
              ),
            ),
            if (!n.isRead) ...[
              const SizedBox(width: 8),
              IconButton(
                icon: const Icon(Icons.check_circle_outline, size: 20, color: Color(0xFF165B33)),
                tooltip: 'Mark as read',
                onPressed: () => ref.read(notificationNotifierProvider.notifier).markAsRead(n.id),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
