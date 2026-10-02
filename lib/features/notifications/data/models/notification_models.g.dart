// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_NotificationItemModel _$NotificationItemModelFromJson(
        Map<String, dynamic> json) =>
    _NotificationItemModel(
      id: json['id'] as String,
      title: json['title'] as String,
      message: json['message'] as String,
      category: json['category'] as String,
      priority: json['priority'] as String,
      timestamp: json['timestamp'] as String,
      isRead: json['isRead'] as bool,
      referenceId: json['referenceId'] as String?,
    );

Map<String, dynamic> _$NotificationItemModelToJson(
        _NotificationItemModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'message': instance.message,
      'category': instance.category,
      'priority': instance.priority,
      'timestamp': instance.timestamp,
      'isRead': instance.isRead,
      'referenceId': instance.referenceId,
    };
