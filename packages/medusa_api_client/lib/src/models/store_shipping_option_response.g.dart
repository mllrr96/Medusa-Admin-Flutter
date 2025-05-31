// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store_shipping_option_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_StoreShippingOptionResponse _$StoreShippingOptionResponseFromJson(
  Map<String, dynamic> json,
) => _StoreShippingOptionResponse(
  shippingOption: StoreCartShippingOption.fromJson(
    json['shipping_option'] as Map<String, dynamic>,
  ),
);

Map<String, dynamic> _$StoreShippingOptionResponseToJson(
  _StoreShippingOptionResponse instance,
) => <String, dynamic>{'shipping_option': instance.shippingOption};
