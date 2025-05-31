// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_post_returns_shipping_action_req_schema.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AdminPostReturnsShippingActionReqSchema
_$AdminPostReturnsShippingActionReqSchemaFromJson(Map<String, dynamic> json) =>
    _AdminPostReturnsShippingActionReqSchema(
      customAmount: (json['custom_amount'] as num).toDouble(),
      internalNote: json['internal_note'] as String,
      metadata: json['metadata'] as Map<String, dynamic>,
    );

Map<String, dynamic> _$AdminPostReturnsShippingActionReqSchemaToJson(
  _AdminPostReturnsShippingActionReqSchema instance,
) => <String, dynamic>{
  'custom_amount': instance.customAmount,
  'internal_note': instance.internalNote,
  'metadata': instance.metadata,
};
