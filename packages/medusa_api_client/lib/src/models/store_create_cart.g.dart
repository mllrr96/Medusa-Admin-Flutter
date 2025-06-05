// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store_create_cart.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StoreCreateCartImpl _$$StoreCreateCartImplFromJson(
  Map<String, dynamic> json,
) => _$StoreCreateCartImpl(
  regionId: json['region_id'] as String,
  shippingAddress: StoreCartAddress.fromJson(
    json['shipping_address'] as Map<String, dynamic>,
  ),
  billingAddress: StoreCartAddress.fromJson(
    json['billing_address'] as Map<String, dynamic>,
  ),
  email: json['email'] as String,
  currencyCode: json['currency_code'] as String,
  items: (json['items'] as List<dynamic>)
      .map((e) => StoreCartLineItem.fromJson(e as Map<String, dynamic>))
      .toList(),
  salesChannelId: json['sales_channel_id'] as String,
  metadata: json['metadata'] as Map<String, dynamic>,
);

Map<String, dynamic> _$$StoreCreateCartImplToJson(
  _$StoreCreateCartImpl instance,
) => <String, dynamic>{
  'region_id': instance.regionId,
  'shipping_address': instance.shippingAddress,
  'billing_address': instance.billingAddress,
  'email': instance.email,
  'currency_code': instance.currencyCode,
  'items': instance.items,
  'sales_channel_id': instance.salesChannelId,
  'metadata': instance.metadata,
};
