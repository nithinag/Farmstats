import 'package:freezed_annotation/freezed_annotation.dart';

part 'notification_models.freezed.dart';
part 'notification_models.g.dart';

@freezed
abstract class NotificationItemModel with _$NotificationItemModel {
  const factory NotificationItemModel({
    required String id,
    required String title,
    required String message,
    required String category,
    required String priority,
    required String timestamp,
    required bool isRead,
    String? referenceId,
  }) = _NotificationItemModel;

  factory NotificationItemModel.fromJson(Map<String, dynamic> json) => _$NotificationItemModelFromJson(json);
}
