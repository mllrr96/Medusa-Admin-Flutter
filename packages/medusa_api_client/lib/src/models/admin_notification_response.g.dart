// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_notification_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AdminNotificationResponse _$AdminNotificationResponseFromJson(
  Map<String, dynamic> json,
) => _AdminNotificationResponse(
  notification: AdminNotification.fromJson(
    json['notification'] as Map<String, dynamic>,
  ),
);

Map<String, dynamic> _$AdminNotificationResponseToJson(
  _AdminNotificationResponse instance,
) => <String, dynamic>{'notification': instance.notification};
