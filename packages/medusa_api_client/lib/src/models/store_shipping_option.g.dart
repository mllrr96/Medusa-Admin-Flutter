// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store_shipping_option.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_StoreShippingOption _$StoreShippingOptionFromJson(Map<String, dynamic> json) =>
    _StoreShippingOption(
      id: json['id'] as String,
      name: json['name'] as String,
      priceType: $enumDecode(_$NullEnumEnumMap, json['price_type']),
      serviceZoneId: json['service_zone_id'] as String,
      providerId: json['provider_id'] as String,
      provider: BaseFulfillmentProvider.fromJson(
        json['provider'] as Map<String, dynamic>,
      ),
      shippingOptionTypeId: json['shipping_option_type_id'] as String,
      type: StoreShippingOptionType.fromJson(
        json['type'] as Map<String, dynamic>,
      ),
      shippingProfileId: json['shipping_profile_id'] as String,
      amount: (json['amount'] as num).toDouble(),
      isTaxInclusive: json['is_tax_inclusive'] as bool,
      data: json['data'] as Map<String, dynamic>,
      metadata: json['metadata'] as Map<String, dynamic>,
    );

Map<String, dynamic> _$StoreShippingOptionToJson(
  _StoreShippingOption instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'price_type': instance.priceType,
  'service_zone_id': instance.serviceZoneId,
  'provider_id': instance.providerId,
  'provider': instance.provider,
  'shipping_option_type_id': instance.shippingOptionTypeId,
  'type': instance.type,
  'shipping_profile_id': instance.shippingProfileId,
  'amount': instance.amount,
  'is_tax_inclusive': instance.isTaxInclusive,
  'data': instance.data,
  'metadata': instance.metadata,
};

const _$NullEnumEnumMap = {
  NullEnum.secret: 'secret',
  NullEnum.publishable: 'publishable',
};
