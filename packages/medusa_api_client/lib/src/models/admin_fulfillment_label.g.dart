// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_fulfillment_label.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AdminFulfillmentLabelImpl _$$AdminFulfillmentLabelImplFromJson(
  Map<String, dynamic> json,
) => _$AdminFulfillmentLabelImpl(
  id: json['id'] as String,
  trackingNumber: json['tracking_number'] as String,
  trackingUrl: json['tracking_url'] as String,
  labelUrl: json['label_url'] as String,
  fulfillmentId: json['fulfillment_id'] as String,
  createdAt: DateTime.parse(json['created_at'] as String),
  updatedAt: DateTime.parse(json['updated_at'] as String),
  deletedAt: DateTime.parse(json['deleted_at'] as String),
);

Map<String, dynamic> _$$AdminFulfillmentLabelImplToJson(
  _$AdminFulfillmentLabelImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'tracking_number': instance.trackingNumber,
  'tracking_url': instance.trackingUrl,
  'label_url': instance.labelUrl,
  'fulfillment_id': instance.fulfillmentId,
  'created_at': instance.createdAt.toIso8601String(),
  'updated_at': instance.updatedAt.toIso8601String(),
  'deleted_at': instance.deletedAt.toIso8601String(),
};
