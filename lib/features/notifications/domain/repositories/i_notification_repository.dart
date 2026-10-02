import 'package:fpdart/fpdart.dart';
import '../../../../core/errors/failure.dart';
import '../entities/notification_entities.dart';

abstract class INotificationRepository {
  Future<Either<Failure, List<NotificationItem>>> getNotifications();
  Future<Either<Failure, void>> evaluateRulesAndSave();
  Future<Either<Failure, void>> markAsRead(String id);
  Future<Either<Failure, void>> markAllAsRead();
}
