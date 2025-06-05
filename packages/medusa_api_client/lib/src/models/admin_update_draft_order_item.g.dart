// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_update_draft_order_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AdminUpdateDraftOrderItemImpl _$$AdminUpdateDraftOrderItemImplFromJson(
  Map<String, dynamic> json,
) => _$AdminUpdateDraftOrderItemImpl(
  quantity: (json['quantity'] as num).toDouble(),
  unitPrice: (json['unit_price'] as num).toDouble(),
  compareAtUnitPrice: (json['compare_at_unit_price'] as num).toDouble(),
  internalNote: json['internal_note'] as String,
);

Map<String, dynamic> _$$AdminUpdateDraftOrderItemImplToJson(
  _$AdminUpdateDraftOrderItemImpl instance,
) => <String, dynamic>{
  'quantity': instance.quantity,
  'unit_price': instance.unitPrice,
  'compare_at_unit_price': instance.compareAtUnitPrice,
  'internal_note': instance.internalNote,
};
