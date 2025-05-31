// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_draft_orders_query_parameters.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_GetDraftOrdersQueryParameters _$GetDraftOrdersQueryParametersFromJson(
  Map<String, dynamic> json,
) => _GetDraftOrdersQueryParameters(
  fields: json['fields'] as String,
  offset: (json['offset'] as num).toDouble(),
  limit: (json['limit'] as num).toDouble(),
  order: json['order'] as String,
  id: json['id'],
  status: json['status'],
  and: (json[r'$and'] as List<dynamic>)
      .map((e) => e as Map<String, dynamic>)
      .toList(),
  or: (json[r'$or'] as List<dynamic>)
      .map((e) => e as Map<String, dynamic>)
      .toList(),
  salesChannelId: (json['sales_channel_id'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
  regionId: json['region_id'],
  q: json['q'] as String,
  createdAt: json['created_at'] as Map<String, dynamic>,
  updatedAt: json['updated_at'] as Map<String, dynamic>,
  customerId: json['customer_id'],
);

Map<String, dynamic> _$GetDraftOrdersQueryParametersToJson(
  _GetDraftOrdersQueryParameters instance,
) => <String, dynamic>{
  'fields': instance.fields,
  'offset': instance.offset,
  'limit': instance.limit,
  'order': instance.order,
  'id': instance.id,
  'status': instance.status,
  r'$and': instance.and,
  r'$or': instance.or,
  'sales_channel_id': instance.salesChannelId,
  'region_id': instance.regionId,
  'q': instance.q,
  'created_at': instance.createdAt,
  'updated_at': instance.updatedAt,
  'customer_id': instance.customerId,
};
