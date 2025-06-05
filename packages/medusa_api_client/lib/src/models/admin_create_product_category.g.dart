// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_create_product_category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AdminCreateProductCategoryImpl _$$AdminCreateProductCategoryImplFromJson(
  Map<String, dynamic> json,
) => _$AdminCreateProductCategoryImpl(
  name: json['name'] as String,
  description: json['description'] as String,
  handle: json['handle'] as String,
  isInternal: json['is_internal'] as bool,
  isActive: json['is_active'] as bool,
  parentCategoryId: json['parent_category_id'] as String,
  rank: (json['rank'] as num).toDouble(),
  metadata: json['metadata'] as Map<String, dynamic>,
);

Map<String, dynamic> _$$AdminCreateProductCategoryImplToJson(
  _$AdminCreateProductCategoryImpl instance,
) => <String, dynamic>{
  'name': instance.name,
  'description': instance.description,
  'handle': instance.handle,
  'is_internal': instance.isInternal,
  'is_active': instance.isActive,
  'parent_category_id': instance.parentCategoryId,
  'rank': instance.rank,
  'metadata': instance.metadata,
};
