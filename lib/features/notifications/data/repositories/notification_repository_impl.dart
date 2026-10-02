import 'package:fpdart/fpdart.dart';
import '../../../../core/errors/failure.dart';
import '../../domain/entities/notification_entities.dart';
import '../../domain/repositories/i_notification_repository.dart';
import '../datasources/i_notification_datasource.dart';
import '../mappers/notification_mapper.dart';
import '../../application/services/notification_services.dart';

class NotificationRepositoryImpl implements INotificationRepository {
  final INotificationDataSource _dataSource;

  NotificationRepositoryImpl(this._dataSource);

  @override
  Future<Either<Failure, List<NotificationItem>>> getNotifications() async {
    try {
      final models = await _dataSource.getAllNotifications();
      final entities = models.map(NotificationMapper.fromModel).toList();
      return Right(entities);
    } catch (e) {
      return Left(Failure('Failed to load notifications: $e'));
    }
  }

  @override
  Future<Either<Failure, void>> evaluateRulesAndSave() async {
    try {
      // In a real app, you would pass actual values from InventoryDao/BatchDao
      // Mocking the values for demonstration
      final newNotifications = NotificationRuleService.evaluateRules(
        currentStock: 4.0, // Triggers low stock alert if min is 10
        minStockThreshold: 10.0,
        daysSinceLastFeeding: 1, // Triggers missed feeding
      );
      
      if (newNotifications.isNotEmpty) {
        final models = newNotifications.map(NotificationMapper.toModel).toList();
        await _dataSource.saveNotifications(models);
      }
      return const Right(null);
    } catch (e) {
      return Left(Failure('Failed to evaluate rules: $e'));
    }
  }

  @override
  Future<Either<Failure, void>> markAsRead(String id) async {
    try {
      await _dataSource.markAsRead(id);
      return const Right(null);
    } catch (e) {
      return Left(Failure('Failed to mark notification as read: $e'));
    }
  }

  @override
  Future<Either<Failure, void>> markAllAsRead() async {
    try {
      await _dataSource.markAllAsRead();
      return const Right(null);
    } catch (e) {
      return Left(Failure('Failed to mark all as read: $e'));
    }
  }
}
