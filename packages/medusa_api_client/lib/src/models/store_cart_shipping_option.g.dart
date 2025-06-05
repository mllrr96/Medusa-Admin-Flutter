// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store_cart_shipping_option.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StoreCartShippingOptionImpl _$$StoreCartShippingOptionImplFromJson(
  Map<String, dynamic> json,
) => _$StoreCartShippingOptionImpl(
  id: json['id'] as String,
  name: json['name'] as String,
  priceType: $enumDecode(_$NullEnumEnumMap, json['price_type']),
  serviceZoneId: json['service_zone_id'] as String,
  providerId: json['provider_id'] as String,
  provider: json['provider'] as Map<String, dynamic>,
  type: json['type'] as Map<String, dynamic>,
  shippingProfileId: json['shipping_profile_id'] as String,
  amount: (json['amount'] as num).toDouble(),
  data: json['data'] as Map<String, dynamic>,
  prices: (json['prices'] as List<dynamic>)
      .map((e) => StorePrice.fromJson(e as Map<String, dynamic>))
      .toList(),
  calculatedPrice: StoreCalculatedPrice.fromJson(
    json['calculated_price'] as Map<String, dynamic>,
  ),
  insufficientInventory: json['insufficient_inventory'] as bool,
);

Map<String, dynamic> _$$StoreCartShippingOptionImplToJson(
  _$StoreCartShippingOptionImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'price_type': instance.priceType,
  'service_zone_id': instance.serviceZoneId,
  'provider_id': instance.providerId,
  'provider': instance.provider,
  'type': instance.type,
  'shipping_profile_id': instance.shippingProfileId,
  'amount': instance.amount,
  'data': instance.data,
  'prices': instance.prices,
  'calculated_price': instance.calculatedPrice,
  'insufficient_inventory': instance.insufficientInventory,
};

const _$NullEnumEnumMap = {
  NullEnum.secret: 'secret',
  NullEnum.publishable: 'publishable',
};
