// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_fulfillment_provider_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AdminFulfillmentProviderListResponse
_$AdminFulfillmentProviderListResponseFromJson(Map<String, dynamic> json) =>
    _AdminFulfillmentProviderListResponse(
      limit: (json['limit'] as num).toDouble(),
      offset: (json['offset'] as num).toDouble(),
      count: (json['count'] as num).toDouble(),
      fulfillmentProviders: (json['fulfillment_providers'] as List<dynamic>)
          .map(
            (e) => AdminFulfillmentProvider.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
      estimateCount: (json['estimate_count'] as num).toDouble(),
    );

Map<String, dynamic> _$AdminFulfillmentProviderListResponseToJson(
  _AdminFulfillmentProviderListResponse instance,
) => <String, dynamic>{
  'limit': instance.limit,
  'offset': instance.offset,
  'count': instance.count,
  'fulfillment_providers': instance.fulfillmentProviders,
  'estimate_count': instance.estimateCount,
};
