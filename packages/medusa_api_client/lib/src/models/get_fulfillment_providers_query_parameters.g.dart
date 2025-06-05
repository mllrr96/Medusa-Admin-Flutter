// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_fulfillment_providers_query_parameters.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GetFulfillmentProvidersQueryParametersImpl
_$$GetFulfillmentProvidersQueryParametersImplFromJson(
  Map<String, dynamic> json,
) => _$GetFulfillmentProvidersQueryParametersImpl(
  fields: json['fields'] as String,
  offset: (json['offset'] as num).toInt(),
  limit: (json['limit'] as num).toInt(),
  order: json['order'] as String,
  id: json['id'],
  isEnabled: json['is_enabled'] as bool,
  q: json['q'] as String,
  stockLocationId: json['stock_location_id'],
);

Map<String, dynamic> _$$GetFulfillmentProvidersQueryParametersImplToJson(
  _$GetFulfillmentProvidersQueryParametersImpl instance,
) => <String, dynamic>{
  'fields': instance.fields,
  'offset': instance.offset,
  'limit': instance.limit,
  'order': instance.order,
  'id': instance.id,
  'is_enabled': instance.isEnabled,
  'q': instance.q,
  'stock_location_id': instance.stockLocationId,
};
