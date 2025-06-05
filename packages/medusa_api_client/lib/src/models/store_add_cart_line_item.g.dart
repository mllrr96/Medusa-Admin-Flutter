// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store_add_cart_line_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StoreAddCartLineItemImpl _$$StoreAddCartLineItemImplFromJson(
  Map<String, dynamic> json,
) => _$StoreAddCartLineItemImpl(
  variantId: json['variant_id'] as String,
  quantity: (json['quantity'] as num).toDouble(),
  metadata: json['metadata'] as Map<String, dynamic>,
);

Map<String, dynamic> _$$StoreAddCartLineItemImplToJson(
  _$StoreAddCartLineItemImpl instance,
) => <String, dynamic>{
  'variant_id': instance.variantId,
  'quantity': instance.quantity,
  'metadata': instance.metadata,
};
