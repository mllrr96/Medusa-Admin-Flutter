// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_product_categories_query_parameters.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_GetProductCategoriesQueryParameters
_$GetProductCategoriesQueryParametersFromJson(Map<String, dynamic> json) =>
    _GetProductCategoriesQueryParameters(
      fields: json['fields'] as String,
      offset: (json['offset'] as num).toDouble(),
      limit: (json['limit'] as num).toDouble(),
      order: json['order'] as String,
      q: json['q'] as String,
      id: json['id'],
      description: json['description'],
      handle: json['handle'],
      parentCategoryId: json['parent_category_id'],
      includeAncestorsTree: json['include_ancestors_tree'] as bool,
      includeDescendantsTree: json['include_descendants_tree'] as bool,
      isInternal: json['is_internal'] as bool,
      isActive: json['is_active'] as bool,
      createdAt: json['created_at'] as Map<String, dynamic>,
      updatedAt: json['updated_at'] as Map<String, dynamic>,
      deletedAt: json['deleted_at'] as Map<String, dynamic>,
      and: (json[r'$and'] as List<dynamic>)
          .map((e) => e as Map<String, dynamic>)
          .toList(),
      or: (json[r'$or'] as List<dynamic>)
          .map((e) => e as Map<String, dynamic>)
          .toList(),
      name: json['name'],
    );

Map<String, dynamic> _$GetProductCategoriesQueryParametersToJson(
  _GetProductCategoriesQueryParameters instance,
) => <String, dynamic>{
  'fields': instance.fields,
  'offset': instance.offset,
  'limit': instance.limit,
  'order': instance.order,
  'q': instance.q,
  'id': instance.id,
  'description': instance.description,
  'handle': instance.handle,
  'parent_category_id': instance.parentCategoryId,
  'include_ancestors_tree': instance.includeAncestorsTree,
  'include_descendants_tree': instance.includeDescendantsTree,
  'is_internal': instance.isInternal,
  'is_active': instance.isActive,
  'created_at': instance.createdAt,
  'updated_at': instance.updatedAt,
  'deleted_at': instance.deletedAt,
  r'$and': instance.and,
  r'$or': instance.or,
  'name': instance.name,
};
