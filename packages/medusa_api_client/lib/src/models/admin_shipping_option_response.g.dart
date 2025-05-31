// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_shipping_option_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AdminShippingOptionResponse _$AdminShippingOptionResponseFromJson(
  Map<String, dynamic> json,
) => _AdminShippingOptionResponse(
  shippingOption: AdminShippingOption.fromJson(
    json['shipping_option'] as Map<String, dynamic>,
  ),
);

Map<String, dynamic> _$AdminShippingOptionResponseToJson(
  _AdminShippingOptionResponse instance,
) => <String, dynamic>{'shipping_option': instance.shippingOption};
