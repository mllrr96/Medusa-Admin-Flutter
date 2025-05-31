// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_campaigns_query_parameters.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_GetCampaignsQueryParameters _$GetCampaignsQueryParametersFromJson(
  Map<String, dynamic> json,
) => _GetCampaignsQueryParameters(
  fields: json['fields'] as String,
  offset: (json['offset'] as num).toDouble(),
  limit: (json['limit'] as num).toDouble(),
  order: json['order'] as String,
);

Map<String, dynamic> _$GetCampaignsQueryParametersToJson(
  _GetCampaignsQueryParameters instance,
) => <String, dynamic>{
  'fields': instance.fields,
  'offset': instance.offset,
  'limit': instance.limit,
  'order': instance.order,
};
