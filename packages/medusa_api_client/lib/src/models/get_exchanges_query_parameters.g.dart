// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_exchanges_query_parameters.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GetExchangesQueryParametersImpl _$$GetExchangesQueryParametersImplFromJson(
  Map<String, dynamic> json,
) => _$GetExchangesQueryParametersImpl(
  fields: json['fields'] as String,
  offset: (json['offset'] as num).toInt(),
  limit: (json['limit'] as num).toInt(),
  order: json['order'] as String,
  deletedAt: json['deleted_at'] as Map<String, dynamic>,
  id: json['id'],
  orderId: json['order_id'],
  status: json['status'],
  createdAt: json['created_at'] as Map<String, dynamic>,
  updatedAt: json['updated_at'] as Map<String, dynamic>,
);

Map<String, dynamic> _$$GetExchangesQueryParametersImplToJson(
  _$GetExchangesQueryParametersImpl instance,
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
