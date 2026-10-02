import '../../../../data/database/app_database.dart';
import '../../../../data/database/daos/notification_dao.dart';
import '../models/notification_models.dart';
import 'i_notification_datasource.dart';

class NotificationDriftDataSourceImpl implements INotificationDataSource {
  final NotificationDao _dao;

  NotificationDriftDataSourceImpl(this._dao);

  @override
  Future<List<NotificationItemModel>> getAllNotifications() async {
    final dbModels = await _dao.getAllNotifications();
    return dbModels.map((db) => NotificationItemModel(
      id: db.id,
      title: db.title,
      message: db.message,
      category: db.category,
      priority: db.priority,
      timestamp: db.timestamp.toIso8601String(),
      isRead: db.isRead,
      referenceId: db.referenceId,
    )).toList();
  }

  @override
  Future<void> saveNotifications(List<NotificationItemModel> notifications) async {
    final dbModels = notifications.map((model) => NotificationDbModel(
      id: model.id,
      title: model.title,
      message: model.message,
      category: model.category,
      priority: model.priority,
      timestamp: DateTime.parse(model.timestamp),
      isRead: model.isRead,
      referenceId: model.referenceId,
    )).toList();
    
    await _dao.insertMultipleNotifications(dbModels);
  }

  @override
  Future<void> markAsRead(String id) async {
    await _dao.markAsRead(id);
  }
  
  @override
  Future<void> markAllAsRead() async {
    await _dao.markAllAsRead();
  }
}
