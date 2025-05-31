// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_post_order_edits_update_item_quantity_req_schema.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AdminPostOrderEditsUpdateItemQuantityReqSchema
_$AdminPostOrderEditsUpdateItemQuantityReqSchemaFromJson(
  Map<String, dynamic> json,
) => _AdminPostOrderEditsUpdateItemQuantityReqSchema(
  quantity: (json['quantity'] as num).toDouble(),
  internalNote: json['internal_note'] as String,
  unitPrice: (json['unit_price'] as num).toDouble(),
  compareAtUnitPrice: (json['compare_at_unit_price'] as num).toDouble(),
);

Map<String, dynamic> _$AdminPostOrderEditsUpdateItemQuantityReqSchemaToJson(
  _AdminPostOrderEditsUpdateItemQuantityReqSchema instance,
) => <String, dynamic>{
  'quantity': instance.quantity,
  'internal_note': instance.internalNote,
  'unit_price': instance.unitPrice,
  'compare_at_unit_price': instance.compareAtUnitPrice,
};
