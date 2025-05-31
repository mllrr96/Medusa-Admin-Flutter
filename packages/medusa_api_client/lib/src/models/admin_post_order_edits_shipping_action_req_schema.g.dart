// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_post_order_edits_shipping_action_req_schema.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AdminPostOrderEditsShippingActionReqSchema
_$AdminPostOrderEditsShippingActionReqSchemaFromJson(
  Map<String, dynamic> json,
) => _AdminPostOrderEditsShippingActionReqSchema(
  customAmount: (json['custom_amount'] as num).toDouble(),
  internalNote: json['internal_note'] as String,
  metadata: json['metadata'] as Map<String, dynamic>,
);

Map<String, dynamic> _$AdminPostOrderEditsShippingActionReqSchemaToJson(
  _AdminPostOrderEditsShippingActionReqSchema instance,
) => <String, dynamic>{
  'custom_amount': instance.customAmount,
  'internal_note': instance.internalNote,
  'metadata': instance.metadata,
};
