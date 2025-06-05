// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_fulfillment_provider_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AdminFulfillmentProviderListResponseImpl
_$$AdminFulfillmentProviderListResponseImplFromJson(
  Map<String, dynamic> json,
) => _$AdminFulfillmentProviderListResponseImpl(
  limit: (json['limit'] as num).toInt(),
  offset: (json['offset'] as num).toInt(),
  count: (json['count'] as num).toInt(),
  fulfillmentProviders: (json['fulfillment_providers'] as List<dynamic>)
      .map((e) => AdminFulfillmentProvider.fromJson(e as Map<String, dynamic>))
      .toList(),
  estimateCount: (json['estimate_count'] as num).toDouble(),
);

Map<String, dynamic> _$$AdminFulfillmentProviderListResponseImplToJson(
  _$AdminFulfillmentProviderListResponseImpl instance,
) => <String, dynamic>{
  'limit': instance.limit,
  'offset': instance.offset,
  'count': instance.count,
  'fulfillment_providers': instance.fulfillmentProviders,
  'estimate_count': instance.estimateCount,
};
