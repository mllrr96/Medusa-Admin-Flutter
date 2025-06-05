// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_post_claims_shipping_action_req_schema.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AdminPostClaimsShippingActionReqSchemaImpl
_$$AdminPostClaimsShippingActionReqSchemaImplFromJson(
  Map<String, dynamic> json,
) => _$AdminPostClaimsShippingActionReqSchemaImpl(
  customAmount: (json['custom_amount'] as num).toDouble(),
  internalNote: json['internal_note'] as String,
  metadata: json['metadata'] as Map<String, dynamic>,
);

Map<String, dynamic> _$$AdminPostClaimsShippingActionReqSchemaImplToJson(
  _$AdminPostClaimsShippingActionReqSchemaImpl instance,
) => <String, dynamic>{
  'custom_amount': instance.customAmount,
  'internal_note': instance.internalNote,
  'metadata': instance.metadata,
};
