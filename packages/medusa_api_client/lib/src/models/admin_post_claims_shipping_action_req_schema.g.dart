// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_post_claims_shipping_action_req_schema.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AdminPostClaimsShippingActionReqSchema
_$AdminPostClaimsShippingActionReqSchemaFromJson(Map<String, dynamic> json) =>
    _AdminPostClaimsShippingActionReqSchema(
      customAmount: (json['custom_amount'] as num).toDouble(),
      internalNote: json['internal_note'] as String,
      metadata: json['metadata'] as Map<String, dynamic>,
    );

Map<String, dynamic> _$AdminPostClaimsShippingActionReqSchemaToJson(
  _AdminPostClaimsShippingActionReqSchema instance,
) => <String, dynamic>{
  'custom_amount': instance.customAmount,
  'internal_note': instance.internalNote,
  'metadata': instance.metadata,
};
