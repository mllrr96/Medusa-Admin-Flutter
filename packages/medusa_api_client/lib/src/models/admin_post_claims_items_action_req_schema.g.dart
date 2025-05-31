// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_post_claims_items_action_req_schema.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AdminPostClaimsItemsActionReqSchema
_$AdminPostClaimsItemsActionReqSchemaFromJson(Map<String, dynamic> json) =>
    _AdminPostClaimsItemsActionReqSchema(
      quantity: (json['quantity'] as num).toDouble(),
      reasonId: json['reason_id'] as String,
      internalNote: json['internal_note'] as String,
    );

Map<String, dynamic> _$AdminPostClaimsItemsActionReqSchemaToJson(
  _AdminPostClaimsItemsActionReqSchema instance,
) => <String, dynamic>{
  'quantity': instance.quantity,
  'reason_id': instance.reasonId,
  'internal_note': instance.internalNote,
};
