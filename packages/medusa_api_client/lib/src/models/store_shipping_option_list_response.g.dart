// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store_shipping_option_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_StoreShippingOptionListResponse _$StoreShippingOptionListResponseFromJson(
  Map<String, dynamic> json,
) => _StoreShippingOptionListResponse(
  shippingOptions: (json['shipping_options'] as List<dynamic>)
      .map((e) => StoreCartShippingOption.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$StoreShippingOptionListResponseToJson(
  _StoreShippingOptionListResponse instance,
) => <String, dynamic>{'shipping_options': instance.shippingOptions};
