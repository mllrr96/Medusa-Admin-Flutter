// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_post_claims_items_action_req_schema.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AdminPostClaimsItemsActionReqSchemaImpl
_$$AdminPostClaimsItemsActionReqSchemaImplFromJson(Map<String, dynamic> json) =>
    _$AdminPostClaimsItemsActionReqSchemaImpl(
      quantity: (json['quantity'] as num).toDouble(),
      reasonId: json['reason_id'] as String,
      internalNote: json['internal_note'] as String,
    );

Map<String, dynamic> _$$AdminPostClaimsItemsActionReqSchemaImplToJson(
  _$AdminPostClaimsItemsActionReqSchemaImpl instance,
) => <String, dynamic>{
  'quantity': instance.quantity,
  'reason_id': instance.reasonId,
  'internal_note': instance.internalNote,
};
