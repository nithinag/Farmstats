import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/notification_entities.dart';

part 'notification_state.freezed.dart';

@freezed
abstract class NotificationState with _$NotificationState {
  const factory NotificationState.initial() = NotificationStateInitial;
  const factory NotificationState.loading() = NotificationStateLoading;
  const factory NotificationState.data({
    required List<NotificationItem> notifications,
  }) = NotificationStateData;
  const factory NotificationState.error(String message) = NotificationStateError;
}
