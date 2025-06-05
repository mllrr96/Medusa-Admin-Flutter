// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store_shipping_option_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StoreShippingOptionResponseImpl _$$StoreShippingOptionResponseImplFromJson(
  Map<String, dynamic> json,
) => _$StoreShippingOptionResponseImpl(
  shippingOption: StoreCartShippingOption.fromJson(
    json['shipping_option'] as Map<String, dynamic>,
  ),
);

Map<String, dynamic> _$$StoreShippingOptionResponseImplToJson(
  _$StoreShippingOptionResponseImpl instance,
) => <String, dynamic>{'shipping_option': instance.shippingOption};
