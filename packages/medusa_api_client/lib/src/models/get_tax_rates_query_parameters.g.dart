// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_tax_rates_query_parameters.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GetTaxRatesQueryParametersImpl _$$GetTaxRatesQueryParametersImplFromJson(
  Map<String, dynamic> json,
) => _$GetTaxRatesQueryParametersImpl(
  fields: json['fields'] as String,
  offset: (json['offset'] as num).toInt(),
  limit: (json['limit'] as num).toInt(),
  order: json['order'] as String,
  q: json['q'] as String,
  taxRegionId: json['tax_region_id'],
  isDefault: $enumDecode(_$NullEnumEnumMap, json['is_default']),
  createdAt: json['created_at'] as Map<String, dynamic>,
  updatedAt: json['updated_at'] as Map<String, dynamic>,
  deletedAt: json['deleted_at'] as Map<String, dynamic>,
  and: (json[r'$and'] as List<dynamic>)
      .map((e) => e as Map<String, dynamic>)
      .toList(),
  or: (json[r'$or'] as List<dynamic>)
      .map((e) => e as Map<String, dynamic>)
      .toList(),
  serviceZoneId: json['service_zone_id'] as String,
  shippingProfileId: json['shipping_profile_id'] as String,
  providerId: json['provider_id'] as String,
  shippingOptionTypeId: json['shipping_option_type_id'] as String,
);

Map<String, dynamic> _$$GetTaxRatesQueryParametersImplToJson(
  _$GetTaxRatesQueryParametersImpl instance,
) => <String, dynamic>{
  'fields': instance.fields,
  'offset': instance.offset,
  'limit': instance.limit,
  'order': instance.order,
  'q': instance.q,
  'tax_region_id': instance.taxRegionId,
  'is_default': instance.isDefault,
  'created_at': instance.createdAt,
  'updated_at': instance.updatedAt,
  'deleted_at': instance.deletedAt,
  r'$and': instance.and,
  r'$or': instance.or,
  'service_zone_id': instance.serviceZoneId,
  'shipping_profile_id': instance.shippingProfileId,
  'provider_id': instance.providerId,
  'shipping_option_type_id': instance.shippingOptionTypeId,
};

const _$NullEnumEnumMap = {
  NullEnum.secret: 'secret',
  NullEnum.publishable: 'publishable',
};
