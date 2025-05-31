// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_orders_id_query_parameters.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_GetOrdersIdQueryParameters _$GetOrdersIdQueryParametersFromJson(
  Map<String, dynamic> json,
) => _GetOrdersIdQueryParameters(
  fields: json['fields'] as String,
  id: json['id'],
  status: json['status'],
  version: (json['version'] as num).toDouble(),
  createdAt: json['created_at'],
  updatedAt: json['updated_at'],
  deletedAt: json['deleted_at'],
);

Map<String, dynamic> _$GetOrdersIdQueryParametersToJson(
  _GetOrdersIdQueryParameters instance,
) => <String, dynamic>{
  'fields': instance.fields,
  'id': instance.id,
  'status': instance.status,
  'version': instance.version,
  'created_at': instance.createdAt,
  'updated_at': instance.updatedAt,
  'deleted_at': instance.deletedAt,
};
