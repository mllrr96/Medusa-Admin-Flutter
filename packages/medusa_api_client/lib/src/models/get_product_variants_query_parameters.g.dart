// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_product_variants_query_parameters.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GetProductVariantsQueryParametersImpl
_$$GetProductVariantsQueryParametersImplFromJson(Map<String, dynamic> json) =>
    _$GetProductVariantsQueryParametersImpl(
      fields: json['fields'] as String,
      offset: (json['offset'] as num).toInt(),
      limit: (json['limit'] as num).toInt(),
      order: json['order'] as String,
      q: json['q'] as String,
      id: json['id'],
      manageInventory: json['manage_inventory'] as bool,
      allowBackorder: json['allow_backorder'] as bool,
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

Map<String, dynamic> _$$GetProductVariantsQueryParametersImplToJson(
  _$GetProductVariantsQueryParametersImpl instance,
) => <String, dynamic>{
  'fields': instance.fields,
  'offset': instance.offset,
  'limit': instance.limit,
  'order': instance.order,
  'q': instance.q,
  'id': instance.id,
  'manage_inventory': instance.manageInventory,
  'allow_backorder': instance.allowBackorder,
  'created_at': instance.createdAt,
  'updated_at': instance.updatedAt,
  'deleted_at': instance.deletedAt,
  r'$and': instance.and,
  r'$or': instance.or,
};
