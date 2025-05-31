// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_post_order_edits_shipping_req_schema.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AdminPostOrderEditsShippingReqSchema
_$AdminPostOrderEditsShippingReqSchemaFromJson(Map<String, dynamic> json) =>
    _AdminPostOrderEditsShippingReqSchema(
      shippingOptionId: json['shipping_option_id'] as String,
      customAmount: (json['custom_amount'] as num).toDouble(),
      description: json['description'] as String,
      internalNote: json['internal_note'] as String,
      metadata: json['metadata'] as Map<String, dynamic>,
    );

Map<String, dynamic> _$AdminPostOrderEditsShippingReqSchemaToJson(
  _AdminPostOrderEditsShippingReqSchema instance,
) => <String, dynamic>{
  'shipping_option_id': instance.shippingOptionId,
  'custom_amount': instance.customAmount,
  'description': instance.description,
  'internal_note': instance.internalNote,
  'metadata': instance.metadata,
};
