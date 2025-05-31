// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_post_exchanges_shipping_action_req_schema.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AdminPostExchangesShippingActionReqSchema
_$AdminPostExchangesShippingActionReqSchemaFromJson(
  Map<String, dynamic> json,
) => _AdminPostExchangesShippingActionReqSchema(
  customAmount: (json['custom_amount'] as num).toDouble(),
  internalNote: json['internal_note'] as String,
  metadata: json['metadata'] as Map<String, dynamic>,
);

Map<String, dynamic> _$AdminPostExchangesShippingActionReqSchemaToJson(
  _AdminPostExchangesShippingActionReqSchema instance,
) => <String, dynamic>{
  'custom_amount': instance.customAmount,
  'internal_note': instance.internalNote,
  'metadata': instance.metadata,
};
