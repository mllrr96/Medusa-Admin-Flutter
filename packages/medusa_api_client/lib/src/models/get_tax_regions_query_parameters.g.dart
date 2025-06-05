// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_tax_regions_query_parameters.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GetTaxRegionsQueryParametersImpl _$$GetTaxRegionsQueryParametersImplFromJson(
  Map<String, dynamic> json,
) => _$GetTaxRegionsQueryParametersImpl(
  fields: json['fields'] as String,
  offset: (json['offset'] as num).toInt(),
  limit: (json['limit'] as num).toInt(),
  order: json['order'] as String,
  q: json['q'] as String,
  id: json['id'],
  countryCode: json['country_code'],
  provinceCode: json['province_code'],
  parentId: json['parent_id'],
  createdBy: json['created_by'],
  createdAt: json['created_at'],
  updatedAt: json['updated_at'],
  deletedAt: json['deleted_at'],
  and: (json[r'$and'] as List<dynamic>)
      .map((e) => e as Map<String, dynamic>)
      .toList(),
  or: (json[r'$or'] as List<dynamic>)
      .map((e) => e as Map<String, dynamic>)
      .toList(),
);

Map<String, dynamic> _$$GetTaxRegionsQueryParametersImplToJson(
  _$GetTaxRegionsQueryParametersImpl instance,
) => <String, dynamic>{
  'fields': instance.fields,
  'offset': instance.offset,
  'limit': instance.limit,
  'order': instance.order,
  'q': instance.q,
  'id': instance.id,
  'country_code': instance.countryCode,
  'province_code': instance.provinceCode,
  'parent_id': instance.parentId,
  'created_by': instance.createdBy,
  'created_at': instance.createdAt,
  'updated_at': instance.updatedAt,
  'deleted_at': instance.deletedAt,
  r'$and': instance.and,
  r'$or': instance.or,
};
