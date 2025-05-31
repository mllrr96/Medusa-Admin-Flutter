// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store_update_cart_line_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_StoreUpdateCartLineItem _$StoreUpdateCartLineItemFromJson(
  Map<String, dynamic> json,
) => _StoreUpdateCartLineItem(
  quantity: (json['quantity'] as num).toDouble(),
  metadata: json['metadata'] as Map<String, dynamic>,
);

Map<String, dynamic> _$StoreUpdateCartLineItemToJson(
  _StoreUpdateCartLineItem instance,
) => <String, dynamic>{
  'quantity': instance.quantity,
  'metadata': instance.metadata,
};
