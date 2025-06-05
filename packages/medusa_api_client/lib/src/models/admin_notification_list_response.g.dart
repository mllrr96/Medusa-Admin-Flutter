// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_notification_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AdminNotificationListResponseImpl
_$$AdminNotificationListResponseImplFromJson(Map<String, dynamic> json) =>
    _$AdminNotificationListResponseImpl(
      limit: (json['limit'] as num).toInt(),
      offset: (json['offset'] as num).toInt(),
      count: (json['count'] as num).toInt(),
      notifications: (json['notifications'] as List<dynamic>)
          .map((e) => AdminNotification.fromJson(e as Map<String, dynamic>))
          .toList(),
      estimateCount: (json['estimate_count'] as num).toDouble(),
    );

Map<String, dynamic> _$$AdminNotificationListResponseImplToJson(
  _$AdminNotificationListResponseImpl instance,
) => <String, dynamic>{
  'limit': instance.limit,
  'offset': instance.offset,
  'count': instance.count,
  'notifications': instance.notifications,
  'estimate_count': instance.estimateCount,
};
