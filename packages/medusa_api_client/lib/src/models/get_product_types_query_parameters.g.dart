// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_product_types_query_parameters.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GetProductTypesQueryParametersImpl
_$$GetProductTypesQueryParametersImplFromJson(Map<String, dynamic> json) =>
    _$GetProductTypesQueryParametersImpl(
      fields: json['fields'] as String,
      offset: (json['offset'] as num).toInt(),
      limit: (json['limit'] as num).toInt(),
      order: json['order'] as String,
      q: json['q'] as String,
      id: json['id'],
      value: json['value'],
      createdAt: json['created_at'] as Map<String, dynamic>,
      updatedAt: json['updated_at'] as Map<String, dynamic>,
      deletedAt: json['deleted_at'] as Map<String, dynamic>,
      and: (json[r'$and'] as List<dynamic>)
          .map((e) => e as Map<String, dynamic>)
          .toList(),
      or: (json[r'$or'] as List<dynamic>)
          .map((e) => e as Map<String, dynamic>)
          .toList(),
    );

Map<String, dynamic> _$$GetProductTypesQueryParametersImplToJson(
  _$GetProductTypesQueryParametersImpl instance,
) => <String, dynamic>{
  'fields': instance.fields,
  'offset': instance.offset,
  'limit': instance.limit,
  'order': instance.order,
  'q': instance.q,
  'id': instance.id,
  'value': instance.value,
  'created_at': instance.createdAt,
  'updated_at': instance.updatedAt,
  'deleted_at': instance.deletedAt,
  r'$and': instance.and,
  r'$or': instance.or,
};
