// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_post_order_claims_req_schema.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AdminPostOrderClaimsReqSchemaImpl
_$$AdminPostOrderClaimsReqSchemaImplFromJson(Map<String, dynamic> json) =>
    _$AdminPostOrderClaimsReqSchemaImpl(
      type: $enumDecode(_$NullEnumEnumMap, json['type']),
      orderId: json['order_id'] as String,
      description: json['description'] as String,
      internalNote: json['internal_note'] as String,
      reasonId: json['reason_id'] as String,
      metadata: json['metadata'] as Map<String, dynamic>,
    );

Map<String, dynamic> _$$AdminPostOrderClaimsReqSchemaImplToJson(
  _$AdminPostOrderClaimsReqSchemaImpl instance,
) => <String, dynamic>{
  'type': instance.type,
  'order_id': instance.orderId,
  'description': instance.description,
  'internal_note': instance.internalNote,
  'reason_id': instance.reasonId,
  'metadata': instance.metadata,
};

const _$NullEnumEnumMap = {
  NullEnum.secret: 'secret',
  NullEnum.publishable: 'publishable',
};
