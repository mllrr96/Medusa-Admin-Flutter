// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_cart_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UpdateCartData _$UpdateCartDataFromJson(Map<String, dynamic> json) =>
    _UpdateCartData(
      regionId: json['region_id'] as String,
      customerId: json['customer_id'] as String,
      salesChannelId: json['sales_channel_id'] as String,
      email: json['email'] as String,
      currencyCode: json['currency_code'] as String,
      shippingAddressId: json['shipping_address_id'] as String,
      billingAddressId: json['billing_address_id'] as String,
      billingAddress: const CreateAddressOrUpdateAddressUnionMapJsonConverter()
          .fromJson(json['billing_address'] as Map<String, dynamic>),
      shippingAddress: const CreateAddressOrUpdateAddressUnionMapJsonConverter()
          .fromJson(json['shipping_address'] as Map<String, dynamic>),
      metadata: json['metadata'] as Map<String, dynamic>,
    );

Map<String, dynamic> _$UpdateCartDataToJson(
  _UpdateCartData instance,
) => <String, dynamic>{
  'region_id': instance.regionId,
  'customer_id': instance.customerId,
  'sales_channel_id': instance.salesChannelId,
  'email': instance.email,
  'currency_code': instance.currencyCode,
  'shipping_address_id': instance.shippingAddressId,
  'billing_address_id': instance.billingAddressId,
  'billing_address': const CreateAddressOrUpdateAddressUnionMapJsonConverter()
      .toJson(instance.billingAddress),
  'shipping_address': const CreateAddressOrUpdateAddressUnionMapJsonConverter()
      .toJson(instance.shippingAddress),
  'metadata': instance.metadata,
};
