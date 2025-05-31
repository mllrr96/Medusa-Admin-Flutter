// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_post_returns_req_schema.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AdminPostReturnsReqSchema _$AdminPostReturnsReqSchemaFromJson(
  Map<String, dynamic> json,
) => _AdminPostReturnsReqSchema(
  orderId: json['order_id'] as String,
  locationId: json['location_id'] as String,
  description: json['description'] as String,
  internalNote: json['internal_note'] as String,
  noNotification: json['no_notification'] as bool,
  metadata: json['metadata'] as Map<String, dynamic>,
);

Map<String, dynamic> _$AdminPostReturnsReqSchemaToJson(
  _AdminPostReturnsReqSchema instance,
) => <String, dynamic>{
  'order_id': instance.orderId,
  'location_id': instance.locationId,
  'description': instance.description,
  'internal_note': instance.internalNote,
  'no_notification': instance.noNotification,
  'metadata': instance.metadata,
};
