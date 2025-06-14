// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_orders_query_parameters.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GetOrdersQueryParametersImpl _$$GetOrdersQueryParametersImplFromJson(
  Map<String, dynamic> json,
) => _$GetOrdersQueryParametersImpl(
  fields: json['fields'] as String?,
  offset: (json['offset'] as num?)?.toInt(),
  limit: (json['limit'] as num?)?.toInt(),
  order: json['order'] as String?,
  id: json['id'] as String?,
  status: json['status'] as String?,
  and: (json[r'$and'] as List<dynamic>?)
      ?.map((e) => e as Map<String, dynamic>)
      .toList(),
  or: (json[r'$or'] as List<dynamic>?)
      ?.map((e) => e as Map<String, dynamic>)
      .toList(),
  salesChannelId: (json['sales_channel_id'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  regionId: json['region_id'] as String?,
  q: json['q'] as String?,
  createdAt: json['created_at'] == null
      ? null
      : DateTime.parse(json['created_at'] as String),
  updatedAt: json['updated_at'] == null
      ? null
      : DateTime.parse(json['updated_at'] as String),
  customerId: json['customer_id'] as String?,
);

Map<String, dynamic> _$$GetOrdersQueryParametersImplToJson(
  _$GetOrdersQueryParametersImpl instance,
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
  'created_at': instance.createdAt?.toIso8601String(),
  'updated_at': instance.updatedAt?.toIso8601String(),
  'customer_id': instance.customerId,
};
