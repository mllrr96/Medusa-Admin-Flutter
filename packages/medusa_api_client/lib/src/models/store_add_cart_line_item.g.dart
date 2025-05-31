// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store_add_cart_line_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_StoreAddCartLineItem _$StoreAddCartLineItemFromJson(
  Map<String, dynamic> json,
) => _StoreAddCartLineItem(
  variantId: json['variant_id'] as String,
  quantity: (json['quantity'] as num).toDouble(),
  metadata: json['metadata'] as Map<String, dynamic>,
);

Map<String, dynamic> _$StoreAddCartLineItemToJson(
  _StoreAddCartLineItem instance,
) => <String, dynamic>{
  'variant_id': instance.variantId,
  'quantity': instance.quantity,
  'metadata': instance.metadata,
};
