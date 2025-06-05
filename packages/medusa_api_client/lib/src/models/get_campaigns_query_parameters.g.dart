// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_campaigns_query_parameters.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GetCampaignsQueryParametersImpl _$$GetCampaignsQueryParametersImplFromJson(
  Map<String, dynamic> json,
) => _$GetCampaignsQueryParametersImpl(
  fields: json['fields'] as String,
  offset: (json['offset'] as num).toInt(),
  limit: (json['limit'] as num).toInt(),
  order: json['order'] as String,
);

Map<String, dynamic> _$$GetCampaignsQueryParametersImplToJson(
  _$GetCampaignsQueryParametersImpl instance,
) => <String, dynamic>{
  'fields': instance.fields,
  'offset': instance.offset,
  'limit': instance.limit,
  'order': instance.order,
};
