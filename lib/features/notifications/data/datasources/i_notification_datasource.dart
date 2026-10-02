import '../models/notification_models.dart';

abstract class INotificationDataSource {
  Future<List<NotificationItemModel>> getAllNotifications();
  Future<void> saveNotifications(List<NotificationItemModel> notifications);
  Future<void> markAsRead(String id);
  Future<void> markAllAsRead();
}
