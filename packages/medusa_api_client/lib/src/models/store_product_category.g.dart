// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store_product_category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StoreProductCategoryImpl _$$StoreProductCategoryImplFromJson(
  Map<String, dynamic> json,
) => _$StoreProductCategoryImpl(
  id: json['id'] as String,
  name: json['name'] as String,
  description: json['description'] as String,
  handle: json['handle'] as String,
  rank: (json['rank'] as num).toDouble(),
  parentCategoryId: json['parent_category_id'] as String,
  parentCategory: json['parent_category'] as Map<String, dynamic>,
  categoryChildren: (json['category_children'] as List<dynamic>)
      .map((e) => e as Map<String, dynamic>)
      .toList(),
  metadata: json['metadata'] as Map<String, dynamic>,
  createdAt: DateTime.parse(json['created_at'] as String),
  updatedAt: DateTime.parse(json['updated_at'] as String),
  deletedAt: DateTime.parse(json['deleted_at'] as String),
  products: (json['products'] as List<dynamic>)
      .map((e) => StoreProduct.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$$StoreProductCategoryImplToJson(
  _$StoreProductCategoryImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'description': instance.description,
  'handle': instance.handle,
  'rank': instance.rank,
  'parent_category_id': instance.parentCategoryId,
  'parent_category': instance.parentCategory,
  'category_children': instance.categoryChildren,
  'metadata': instance.metadata,
  'created_at': instance.createdAt.toIso8601String(),
  'updated_at': instance.updatedAt.toIso8601String(),
  'deleted_at': instance.deletedAt.toIso8601String(),
  'products': instance.products,
};
