import 'package:drift/drift.dart';
import '../app_database.dart';
import '../tables/notification_tables.dart';

part 'notification_dao.g.dart';

@DriftAccessor(tables: [NotificationsTable])
class NotificationDao extends DatabaseAccessor<AppDatabase> with _$NotificationDaoMixin {
  NotificationDao(super.db);

  Future<List<NotificationDbModel>> getAllNotifications() => 
      (select(notificationsTable)..orderBy([(t) => OrderingTerm(expression: t.timestamp, mode: OrderingMode.desc)])).get();

  Future<List<NotificationDbModel>> getUnreadNotifications() =>
      (select(notificationsTable)..where((t) => t.isRead.equals(false))
      ..orderBy([(t) => OrderingTerm(expression: t.timestamp, mode: OrderingMode.desc)])).get();

  Future<int> insertNotification(NotificationDbModel notification) => into(notificationsTable).insert(notification, mode: InsertMode.insertOrReplace);

  Future<void> insertMultipleNotifications(List<NotificationDbModel> notifications) async {
    await batch((batch) {
      batch.insertAll(notificationsTable, notifications, mode: InsertMode.insertOrIgnore);
    });
  }

  Future<int> markAsRead(String id) => (update(notificationsTable)..where((t) => t.id.equals(id))).write(const NotificationsTableCompanion(isRead: Value(true)));
  
  Future<int> markAllAsRead() => update(notificationsTable).write(const NotificationsTableCompanion(isRead: Value(true)));

  Future<int> deleteNotification(String id) => (delete(notificationsTable)..where((t) => t.id.equals(id))).go();
}
