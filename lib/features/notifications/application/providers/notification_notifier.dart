
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/repositories/i_notification_repository.dart';
import '../../data/repositories/notification_repository_impl.dart';
import '../../data/datasources/i_notification_datasource.dart';
import '../../data/datasources/notification_drift_datasource.dart';
import '../../../../data/providers/database_provider.dart';
import '../usecases/notification_usecases.dart';
import 'notification_state.dart';

final notificationDataSourceProvider = Provider<INotificationDataSource>((ref) {
  return NotificationDriftDataSourceImpl(ref.watch(appDatabaseProvider).notificationDao);
});

final notificationRepositoryProvider = Provider<INotificationRepository>((ref) {
  return NotificationRepositoryImpl(ref.watch(notificationDataSourceProvider));
});

final getNotificationsUseCaseProvider = Provider((ref) => GetNotificationsUseCase(ref.watch(notificationRepositoryProvider)));
final evaluateRulesUseCaseProvider = Provider((ref) => EvaluateRulesUseCase(ref.watch(notificationRepositoryProvider)));
final markNotificationAsReadUseCaseProvider = Provider((ref) => MarkNotificationAsReadUseCase(ref.watch(notificationRepositoryProvider)));
final markAllNotificationsAsReadUseCaseProvider = Provider((ref) => MarkAllNotificationsAsReadUseCase(ref.watch(notificationRepositoryProvider)));

final notificationNotifierProvider = NotifierProvider<NotificationNotifier, NotificationState>(() {
  return NotificationNotifier();
});

class NotificationNotifier extends Notifier<NotificationState> {
  @override
  NotificationState build() {
    // Lazily evaluate rules when the notifier is first built
    _evaluateAndLoad();
    return const NotificationState.initial();
  }

  Future<void> _evaluateAndLoad() async {
    state = const NotificationState.loading();
    // 1. Evaluate rules (generates new notifications if conditions are met)
    await ref.read(evaluateRulesUseCaseProvider).execute();
    // 2. Load all notifications
    await loadNotifications();
  }

  Future<void> loadNotifications() async {
    if (state is! NotificationStateLoading) {
      state = const NotificationState.loading();
    }
    
    final result = await ref.read(getNotificationsUseCaseProvider).execute();
    state = result.fold(
      (failure) => NotificationState.error(failure.message),
      (notifications) => NotificationState.data(notifications: notifications),
    );
  }

  Future<void> markAsRead(String id) async {
    await ref.read(markNotificationAsReadUseCaseProvider).execute(id);
    await loadNotifications();
  }

  Future<void> markAllAsRead() async {
    await ref.read(markAllNotificationsAsReadUseCaseProvider).execute();
    await loadNotifications();
  }
}
