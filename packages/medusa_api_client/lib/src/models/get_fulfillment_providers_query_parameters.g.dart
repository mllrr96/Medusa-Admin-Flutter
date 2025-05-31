// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_fulfillment_providers_query_parameters.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_GetFulfillmentProvidersQueryParameters
_$GetFulfillmentProvidersQueryParametersFromJson(Map<String, dynamic> json) =>
    _GetFulfillmentProvidersQueryParameters(
      fields: json['fields'] as String,
      offset: (json['offset'] as num).toDouble(),
      limit: (json['limit'] as num).toDouble(),
      order: json['order'] as String,
      id: json['id'],
      isEnabled: json['is_enabled'] as bool,
      q: json['q'] as String,
      stockLocationId: json['stock_location_id'],
    );

Map<String, dynamic> _$GetFulfillmentProvidersQueryParametersToJson(
  _GetFulfillmentProvidersQueryParameters instance,
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
