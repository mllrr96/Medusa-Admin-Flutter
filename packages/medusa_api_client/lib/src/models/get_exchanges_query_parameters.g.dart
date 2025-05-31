// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_exchanges_query_parameters.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_GetExchangesQueryParameters _$GetExchangesQueryParametersFromJson(
  Map<String, dynamic> json,
) => _GetExchangesQueryParameters(
  fields: json['fields'] as String,
  offset: (json['offset'] as num).toDouble(),
  limit: (json['limit'] as num).toDouble(),
  order: json['order'] as String,
  deletedAt: json['deleted_at'] as Map<String, dynamic>,
  id: json['id'],
  orderId: json['order_id'],
  status: json['status'],
  createdAt: json['created_at'] as Map<String, dynamic>,
  updatedAt: json['updated_at'] as Map<String, dynamic>,
);

Map<String, dynamic> _$GetExchangesQueryParametersToJson(
  _GetExchangesQueryParameters instance,
) => <String, dynamic>{
  'fields': instance.fields,
  'offset': instance.offset,
  'limit': instance.limit,
  'order': instance.order,
  'deleted_at': instance.deletedAt,
  'id': instance.id,
  'order_id': instance.orderId,
  'status': instance.status,
  'created_at': instance.createdAt,
  'updated_at': instance.updatedAt,
};
