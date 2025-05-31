// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_post_order_edits_req_schema.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AdminPostOrderEditsReqSchema _$AdminPostOrderEditsReqSchemaFromJson(
  Map<String, dynamic> json,
) => _AdminPostOrderEditsReqSchema(
  orderId: json['order_id'] as String,
  description: json['description'] as String,
  internalNote: json['internal_note'] as String,
  metadata: json['metadata'] as Map<String, dynamic>,
);

Map<String, dynamic> _$AdminPostOrderEditsReqSchemaToJson(
  _AdminPostOrderEditsReqSchema instance,
) => <String, dynamic>{
  'order_id': instance.orderId,
  'description': instance.description,
  'internal_note': instance.internalNote,
  'metadata': instance.metadata,
};
