import '../../domain/entities/notification_entities.dart';
import '../models/notification_models.dart';

class NotificationMapper {
  static NotificationItem fromModel(NotificationItemModel model) {
    return NotificationItem(
      id: model.id,
      title: model.title,
      message: model.message,
      category: NotificationCategory.values.firstWhere((e) => e.name == model.category, orElse: () => NotificationCategory.system),
      priority: PriorityLevel.values.firstWhere((e) => e.name == model.priority, orElse: () => PriorityLevel.low),
      timestamp: DateTime.parse(model.timestamp),
      isRead: model.isRead,
      referenceId: model.referenceId,
    );
  }

  static NotificationItemModel toModel(NotificationItem entity) {
    return NotificationItemModel(
      id: entity.id,
      title: entity.title,
      message: entity.message,
      category: entity.category.name,
      priority: entity.priority.name,
      timestamp: entity.timestamp.toIso8601String(),
      isRead: entity.isRead,
      referenceId: entity.referenceId,
    );
  }
}
