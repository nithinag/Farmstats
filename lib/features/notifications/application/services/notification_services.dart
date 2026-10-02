import 'package:uuid/uuid.dart';
import '../../domain/entities/notification_entities.dart';

class NotificationRuleService {
  /// Evaluates business rules and returns a list of generated notifications
  /// In a real app, this would query InventoryDao, BatchDao, etc.
  static List<NotificationItem> evaluateRules({
    required double currentStock,
    required double minStockThreshold,
    required int daysSinceLastFeeding,
  }) {
    final List<NotificationItem> notifications = [];

    // Rule 1: Low Stock Alert
    if (currentStock < minStockThreshold) {
      notifications.add(
        NotificationItem(
          id: const Uuid().v4(),
          title: 'Low Stock Alert',
          message: 'Inventory is below the minimum threshold ($minStockThreshold). Current stock: $currentStock.',
          category: NotificationCategory.inventory,
          priority: PriorityLevel.high,
          timestamp: DateTime.now(),
          isRead: false,
        ),
      );
    }

    // Rule 2: Missed Feeding
    if (daysSinceLastFeeding > 0) {
      notifications.add(
        NotificationItem(
          id: const Uuid().v4(),
          title: 'Missed Feeding',
          message: 'No feeding logged for the past $daysSinceLastFeeding day(s).',
          category: NotificationCategory.feeding,
          priority: PriorityLevel.critical,
          timestamp: DateTime.now(),
          isRead: false,
        ),
      );
    }

    return notifications;
  }
}
