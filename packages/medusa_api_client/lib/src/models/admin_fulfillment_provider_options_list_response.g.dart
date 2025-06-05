// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_fulfillment_provider_options_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AdminFulfillmentProviderOptionsListResponseImpl
_$$AdminFulfillmentProviderOptionsListResponseImplFromJson(
  Map<String, dynamic> json,
) => _$AdminFulfillmentProviderOptionsListResponseImpl(
  limit: (json['limit'] as num).toInt(),
  offset: (json['offset'] as num).toInt(),
  count: (json['count'] as num).toInt(),
  fulfillmentOptions: (json['fulfillment_options'] as List<dynamic>)
      .map(
        (e) =>
            AdminFulfillmentProviderOption.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  estimateCount: (json['estimate_count'] as num).toDouble(),
);

Map<String, dynamic> _$$AdminFulfillmentProviderOptionsListResponseImplToJson(
  _$AdminFulfillmentProviderOptionsListResponseImpl instance,
) => <String, dynamic>{
  'limit': instance.limit,
  'offset': instance.offset,
  'count': instance.count,
  'fulfillment_options': instance.fulfillmentOptions,
  'estimate_count': instance.estimateCount,
};
