// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store_update_cart_line_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StoreUpdateCartLineItemImpl _$$StoreUpdateCartLineItemImplFromJson(
  Map<String, dynamic> json,
) => _$StoreUpdateCartLineItemImpl(
  quantity: (json['quantity'] as num).toDouble(),
  metadata: json['metadata'] as Map<String, dynamic>,
);

Map<String, dynamic> _$$StoreUpdateCartLineItemImplToJson(
  _$StoreUpdateCartLineItemImpl instance,
) => <String, dynamic>{
  'quantity': instance.quantity,
  'metadata': instance.metadata,
};
