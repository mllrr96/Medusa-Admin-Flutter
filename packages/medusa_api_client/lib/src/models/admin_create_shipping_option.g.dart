// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_create_shipping_option.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AdminCreateShippingOption _$AdminCreateShippingOptionFromJson(
  Map<String, dynamic> json,
) => _AdminCreateShippingOption(
  name: json['name'] as String,
  serviceZoneId: json['service_zone_id'] as String,
  shippingProfileId: json['shipping_profile_id'] as String,
  data: json['data'] as Map<String, dynamic>,
  priceType: $enumDecode(_$NullEnumEnumMap, json['price_type']),
  providerId: json['provider_id'] as String,
  type: AdminCreateShippingOptionType.fromJson(
    json['type'] as Map<String, dynamic>,
  ),
  prices: json['prices'] as List<dynamic>,
  rules: (json['rules'] as List<dynamic>)
      .map(
        (e) =>
            AdminCreateShippingOptionRule.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
);

Map<String, dynamic> _$AdminCreateShippingOptionToJson(
  _AdminCreateShippingOption instance,
) => <String, dynamic>{
  'name': instance.name,
  'service_zone_id': instance.serviceZoneId,
  'shipping_profile_id': instance.shippingProfileId,
  'data': instance.data,
  'price_type': instance.priceType,
  'provider_id': instance.providerId,
  'type': instance.type,
  'prices': instance.prices,
  'rules': instance.rules,
};

const _$NullEnumEnumMap = {
  NullEnum.secret: 'secret',
  NullEnum.publishable: 'publishable',
};
