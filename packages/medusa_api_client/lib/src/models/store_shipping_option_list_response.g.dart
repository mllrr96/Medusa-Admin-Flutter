// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store_shipping_option_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StoreShippingOptionListResponseImpl
_$$StoreShippingOptionListResponseImplFromJson(Map<String, dynamic> json) =>
    _$StoreShippingOptionListResponseImpl(
      shippingOptions: (json['shipping_options'] as List<dynamic>)
          .map(
            (e) => StoreCartShippingOption.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
    );

Map<String, dynamic> _$$StoreShippingOptionListResponseImplToJson(
  _$StoreShippingOptionListResponseImpl instance,
) => <String, dynamic>{'shipping_options': instance.shippingOptions};
