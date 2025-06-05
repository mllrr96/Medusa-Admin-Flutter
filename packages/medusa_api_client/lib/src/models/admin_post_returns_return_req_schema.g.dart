// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_post_returns_return_req_schema.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AdminPostReturnsReturnReqSchemaImpl
_$$AdminPostReturnsReturnReqSchemaImplFromJson(Map<String, dynamic> json) =>
    _$AdminPostReturnsReturnReqSchemaImpl(
      locationId: json['location_id'] as String,
      noNotification: json['no_notification'] as bool,
      metadata: json['metadata'] as Map<String, dynamic>,
    );

Map<String, dynamic> _$$AdminPostReturnsReturnReqSchemaImplToJson(
  _$AdminPostReturnsReturnReqSchemaImpl instance,
) => <String, dynamic>{
  'location_id': instance.locationId,
  'no_notification': instance.noNotification,
  'metadata': instance.metadata,
};
