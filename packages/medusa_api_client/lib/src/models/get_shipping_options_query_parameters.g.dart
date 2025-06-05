// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_shipping_options_query_parameters.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GetShippingOptionsQueryParametersImpl
_$$GetShippingOptionsQueryParametersImplFromJson(Map<String, dynamic> json) =>
    _$GetShippingOptionsQueryParametersImpl(
      fields: json['fields'] as String,
      offset: (json['offset'] as num).toInt(),
      limit: (json['limit'] as num).toInt(),
      order: json['order'] as String,
      id: json['id'],
      q: json['q'] as String,
      serviceZoneId: json['service_zone_id'],
      shippingProfileId: json['shipping_profile_id'],
      providerId: json['provider_id'],
      shippingOptionTypeId: json['shipping_option_type_id'],
      createdAt: json['created_at'] as Map<String, dynamic>,
      updatedAt: json['updated_at'] as Map<String, dynamic>,
      deletedAt: json['deleted_at'] as Map<String, dynamic>,
      stockLocationId: json['stock_location_id'],
      isReturn: json['is_return'] as bool,
      adminOnly: json['admin_only'] as bool,
    );

Map<String, dynamic> _$$GetShippingOptionsQueryParametersImplToJson(
  _$GetShippingOptionsQueryParametersImpl instance,
) => <String, dynamic>{
  'fields': instance.fields,
  'offset': instance.offset,
  'limit': instance.limit,
  'order': instance.order,
  'id': instance.id,
  'q': instance.q,
  'service_zone_id': instance.serviceZoneId,
  'shipping_profile_id': instance.shippingProfileId,
  'provider_id': instance.providerId,
  'shipping_option_type_id': instance.shippingOptionTypeId,
  'created_at': instance.createdAt,
  'updated_at': instance.updatedAt,
  'deleted_at': instance.deletedAt,
  'stock_location_id': instance.stockLocationId,
  'is_return': instance.isReturn,
  'admin_only': instance.adminOnly,
};
