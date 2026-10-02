import 'package:fpdart/fpdart.dart';
import '../../../../core/errors/failure.dart';
import '../../domain/entities/notification_entities.dart';
import '../../domain/repositories/i_notification_repository.dart';

class GetNotificationsUseCase {
  final INotificationRepository _repository;
  GetNotificationsUseCase(this._repository);

  Future<Either<Failure, List<NotificationItem>>> execute() => _repository.getNotifications();
}

class EvaluateRulesUseCase {
  final INotificationRepository _repository;
  EvaluateRulesUseCase(this._repository);

  Future<Either<Failure, void>> execute() => _repository.evaluateRulesAndSave();
}

class MarkNotificationAsReadUseCase {
  final INotificationRepository _repository;
  MarkNotificationAsReadUseCase(this._repository);

  Future<Either<Failure, void>> execute(String id) => _repository.markAsRead(id);
}

class MarkAllNotificationsAsReadUseCase {
  final INotificationRepository _repository;
  MarkAllNotificationsAsReadUseCase(this._repository);

  Future<Either<Failure, void>> execute() => _repository.markAllAsRead();
}
