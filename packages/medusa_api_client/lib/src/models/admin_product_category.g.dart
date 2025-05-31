// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_product_category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AdminProductCategory _$AdminProductCategoryFromJson(
  Map<String, dynamic> json,
) => _AdminProductCategory(
  categoryChildren: (json['category_children'] as List<dynamic>)
      .map((e) => e as Map<String, dynamic>)
      .toList(),
  parentCategory: json['parent_category'] as Map<String, dynamic>,
  products: (json['products'] as List<dynamic>)
      .map((e) => e as Map<String, dynamic>)
      .toList(),
  name: json['name'] as String,
  description: json['description'] as String,
  id: json['id'] as String,
  metadata: json['metadata'] as Map<String, dynamic>,
  createdAt: DateTime.parse(json['created_at'] as String),
  updatedAt: DateTime.parse(json['updated_at'] as String),
  handle: json['handle'] as String,
  deletedAt: DateTime.parse(json['deleted_at'] as String),
  isActive: json['is_active'] as bool,
  isInternal: json['is_internal'] as bool,
  rank: (json['rank'] as num).toDouble(),
  parentCategoryId: json['parent_category_id'] as String,
);

Map<String, dynamic> _$AdminProductCategoryToJson(
  _AdminProductCategory instance,
) => <String, dynamic>{
  'category_children': instance.categoryChildren,
  'parent_category': instance.parentCategory,
  'products': instance.products,
  'name': instance.name,
  'description': instance.description,
  'id': instance.id,
  'metadata': instance.metadata,
  'created_at': instance.createdAt.toIso8601String(),
  'updated_at': instance.updatedAt.toIso8601String(),
  'handle': instance.handle,
  'deleted_at': instance.deletedAt.toIso8601String(),
  'is_active': instance.isActive,
  'is_internal': instance.isInternal,
  'rank': instance.rank,
  'parent_category_id': instance.parentCategoryId,
};
