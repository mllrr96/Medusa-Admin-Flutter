// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_fulfillment_provider_options_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AdminFulfillmentProviderOptionsListResponse
_$AdminFulfillmentProviderOptionsListResponseFromJson(
  Map<String, dynamic> json,
) => _AdminFulfillmentProviderOptionsListResponse(
  limit: (json['limit'] as num).toDouble(),
  offset: (json['offset'] as num).toDouble(),
  count: (json['count'] as num).toDouble(),
  fulfillmentOptions: (json['fulfillment_options'] as List<dynamic>)
      .map(
        (e) =>
            AdminFulfillmentProviderOption.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  estimateCount: (json['estimate_count'] as num).toDouble(),
);

Map<String, dynamic> _$AdminFulfillmentProviderOptionsListResponseToJson(
  _AdminFulfillmentProviderOptionsListResponse instance,
) => <String, dynamic>{
  'limit': instance.limit,
  'offset': instance.offset,
  'count': instance.count,
  'fulfillment_options': instance.fulfillmentOptions,
  'estimate_count': instance.estimateCount,
};
