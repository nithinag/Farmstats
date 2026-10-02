import 'package:freezed_annotation/freezed_annotation.dart';

part 'notification_entities.freezed.dart';

enum NotificationCategory {
  feeding,
  harvest,
  inventory,
  health,
  environmental,
  labour,
  system
}

enum PriorityLevel {
  critical,
  high,
  medium,
  low
}

@freezed
abstract class NotificationItem with _$NotificationItem {
  const factory NotificationItem({
    required String id,
    required String title,
    required String message,
    required NotificationCategory category,
    required PriorityLevel priority,
    required DateTime timestamp,
    required bool isRead,
    String? referenceId, // E.g., batch_id or inventory_id
  }) = _NotificationItem;
}
