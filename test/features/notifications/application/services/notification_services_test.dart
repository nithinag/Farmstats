import 'package:flutter_test/flutter_test.dart';
import 'package:farmstats/features/notifications/application/services/notification_services.dart';
import 'package:farmstats/features/notifications/domain/entities/notification_entities.dart';

void main() {
  group('NotificationRuleService Tests', () {
    test('evaluateRules generates low stock alert when stock < threshold', () {
      final notifications = NotificationRuleService.evaluateRules(
        currentStock: 5.0,
        minStockThreshold: 10.0,
        daysSinceLastFeeding: 0,
      );

      expect(notifications.length, 1);
      expect(notifications.first.category, NotificationCategory.inventory);
      expect(notifications.first.priority, PriorityLevel.high);
    });

    test('evaluateRules generates missed feeding alert when days > 0', () {
      final notifications = NotificationRuleService.evaluateRules(
        currentStock: 15.0,
        minStockThreshold: 10.0,
        daysSinceLastFeeding: 2,
      );

      expect(notifications.length, 1);
      expect(notifications.first.category, NotificationCategory.feeding);
      expect(notifications.first.priority, PriorityLevel.critical);
    });

    test('evaluateRules generates multiple alerts when both rules trigger', () {
      final notifications = NotificationRuleService.evaluateRules(
        currentStock: 2.0,
        minStockThreshold: 10.0,
        daysSinceLastFeeding: 1,
      );

      expect(notifications.length, 2);
    });

    test('evaluateRules generates no alerts when thresholds are safe', () {
      final notifications = NotificationRuleService.evaluateRules(
        currentStock: 20.0,
        minStockThreshold: 10.0,
        daysSinceLastFeeding: 0,
      );

      expect(notifications.isEmpty, true);
    });
  });
}
