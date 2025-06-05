// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_orders_id_query_parameters.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GetOrdersIdQueryParametersImpl _$$GetOrdersIdQueryParametersImplFromJson(
  Map<String, dynamic> json,
) => _$GetOrdersIdQueryParametersImpl(
  fields: json['fields'] as String,
  id: json['id'],
  status: json['status'],
  version: (json['version'] as num).toDouble(),
  createdAt: json['created_at'],
  updatedAt: json['updated_at'],
  deletedAt: json['deleted_at'],
);

Map<String, dynamic> _$$GetOrdersIdQueryParametersImplToJson(
  _$GetOrdersIdQueryParametersImpl instance,
) => <String, dynamic>{
  'fields': instance.fields,
  'id': instance.id,
  'status': instance.status,
  'version': instance.version,
  'created_at': instance.createdAt,
  'updated_at': instance.updatedAt,
  'deleted_at': instance.deletedAt,
};
