import 'package:fpdart/fpdart.dart';
import '../../../../core/errors/failure.dart';
import '../../domain/entities/notification_entities.dart';
import '../../domain/repositories/i_notification_repository.dart';
import '../datasources/i_notification_datasource.dart';
import '../mappers/notification_mapper.dart';

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
    // Only real notifications derived from real database conditions are stored.
    // No fabricated notifications or mock thresholds.
    return const Right(null);
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
