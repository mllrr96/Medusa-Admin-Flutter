// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_notification.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AdminNotification _$AdminNotificationFromJson(Map<String, dynamic> json) =>
    _AdminNotification(
      id: json['id'] as String,
      to: json['to'] as String,
      channel: json['channel'] as String,
      template: json['template'] as String,
      data: json['data'] as Map<String, dynamic>,
      triggerType: json['trigger_type'] as String,
      resourceId: json['resource_id'] as String,
      resourceType: json['resource_type'] as String,
      receiverId: json['receiver_id'] as String,
      originalNotificationId: json['original_notification_id'] as String,
      externalId: json['external_id'] as String,
      providerId: json['provider_id'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
    );

Map<String, dynamic> _$AdminNotificationToJson(_AdminNotification instance) =>
    <String, dynamic>{
      'id': instance.id,
      'to': instance.to,
      'channel': instance.channel,
      'template': instance.template,
      'data': instance.data,
      'trigger_type': instance.triggerType,
      'resource_id': instance.resourceId,
      'resource_type': instance.resourceType,
      'receiver_id': instance.receiverId,
      'original_notification_id': instance.originalNotificationId,
      'external_id': instance.externalId,
      'provider_id': instance.providerId,
      'created_at': instance.createdAt.toIso8601String(),
    };
