// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_notification_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AdminNotificationListResponse _$AdminNotificationListResponseFromJson(
  Map<String, dynamic> json,
) => _AdminNotificationListResponse(
  limit: (json['limit'] as num).toDouble(),
  offset: (json['offset'] as num).toDouble(),
  count: (json['count'] as num).toDouble(),
  notifications: (json['notifications'] as List<dynamic>)
      .map((e) => AdminNotification.fromJson(e as Map<String, dynamic>))
      .toList(),
  estimateCount: (json['estimate_count'] as num).toDouble(),
);

Map<String, dynamic> _$AdminNotificationListResponseToJson(
  _AdminNotificationListResponse instance,
) => <String, dynamic>{
  'limit': instance.limit,
  'offset': instance.offset,
  'count': instance.count,
  'notifications': instance.notifications,
  'estimate_count': instance.estimateCount,
};
