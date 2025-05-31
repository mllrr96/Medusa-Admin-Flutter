// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_post_returns_return_req_schema.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AdminPostReturnsReturnReqSchema _$AdminPostReturnsReturnReqSchemaFromJson(
  Map<String, dynamic> json,
) => _AdminPostReturnsReturnReqSchema(
  locationId: json['location_id'] as String,
  noNotification: json['no_notification'] as bool,
  metadata: json['metadata'] as Map<String, dynamic>,
);

Map<String, dynamic> _$AdminPostReturnsReturnReqSchemaToJson(
  _AdminPostReturnsReturnReqSchema instance,
) => <String, dynamic>{
  'location_id': instance.locationId,
  'no_notification': instance.noNotification,
  'metadata': instance.metadata,
};
