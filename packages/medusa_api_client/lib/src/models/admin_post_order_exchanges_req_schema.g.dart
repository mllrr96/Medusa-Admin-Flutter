// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_post_order_exchanges_req_schema.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AdminPostOrderExchangesReqSchemaImpl
_$$AdminPostOrderExchangesReqSchemaImplFromJson(Map<String, dynamic> json) =>
    _$AdminPostOrderExchangesReqSchemaImpl(
      orderId: json['order_id'] as String,
      description: json['description'] as String,
      internalNote: json['internal_note'] as String,
      metadata: json['metadata'] as Map<String, dynamic>,
    );

Map<String, dynamic> _$$AdminPostOrderExchangesReqSchemaImplToJson(
  _$AdminPostOrderExchangesReqSchemaImpl instance,
) => <String, dynamic>{
  'order_id': instance.orderId,
  'description': instance.description,
  'internal_note': instance.internalNote,
  'metadata': instance.metadata,
};
