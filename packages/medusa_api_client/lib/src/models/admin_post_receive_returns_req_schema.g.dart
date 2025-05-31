// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_post_receive_returns_req_schema.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AdminPostReceiveReturnsReqSchema _$AdminPostReceiveReturnsReqSchemaFromJson(
  Map<String, dynamic> json,
) => _AdminPostReceiveReturnsReqSchema(
  internalNote: json['internal_note'] as String,
  description: json['description'] as String,
  metadata: json['metadata'] as Map<String, dynamic>,
);

Map<String, dynamic> _$AdminPostReceiveReturnsReqSchemaToJson(
  _AdminPostReceiveReturnsReqSchema instance,
) => <String, dynamic>{
  'internal_note': instance.internalNote,
  'description': instance.description,
  'metadata': instance.metadata,
};
