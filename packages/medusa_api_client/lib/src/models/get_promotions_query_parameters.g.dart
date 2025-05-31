// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_promotions_query_parameters.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_GetPromotionsQueryParameters _$GetPromotionsQueryParametersFromJson(
  Map<String, dynamic> json,
) => _GetPromotionsQueryParameters(
  fields: json['fields'] as String,
  offset: (json['offset'] as num).toDouble(),
  limit: (json['limit'] as num).toDouble(),
  order: json['order'] as String,
  q: json['q'] as String,
  code: json['code'],
  campaignId: json['campaign_id'],
  applicationMethod: json['application_method'] as Map<String, dynamic>,
  createdAt: json['created_at'] as Map<String, dynamic>,
  updatedAt: json['updated_at'] as Map<String, dynamic>,
  deletedAt: json['deleted_at'] as Map<String, dynamic>,
  and: (json[r'$and'] as List<dynamic>)
      .map((e) => e as Map<String, dynamic>)
      .toList(),
  or: (json[r'$or'] as List<dynamic>)
      .map((e) => e as Map<String, dynamic>)
      .toList(),
  currencyCode: json['currency_code'],
  applicationMethodType: json['application_method_type'],
);

Map<String, dynamic> _$GetPromotionsQueryParametersToJson(
  _GetPromotionsQueryParameters instance,
) => <String, dynamic>{
  'fields': instance.fields,
  'offset': instance.offset,
  'limit': instance.limit,
  'order': instance.order,
  'q': instance.q,
  'code': instance.code,
  'campaign_id': instance.campaignId,
  'application_method': instance.applicationMethod,
  'created_at': instance.createdAt,
  'updated_at': instance.updatedAt,
  'deleted_at': instance.deletedAt,
  r'$and': instance.and,
  r'$or': instance.or,
  'currency_code': instance.currencyCode,
  'application_method_type': instance.applicationMethodType,
};
