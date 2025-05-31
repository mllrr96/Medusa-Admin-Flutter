// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_product_category_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AdminProductCategoryListResponse _$AdminProductCategoryListResponseFromJson(
  Map<String, dynamic> json,
) => _AdminProductCategoryListResponse(
  limit: (json['limit'] as num).toDouble(),
  offset: (json['offset'] as num).toDouble(),
  count: (json['count'] as num).toDouble(),
  productCategories: (json['product_categories'] as List<dynamic>)
      .map((e) => AdminProductCategory.fromJson(e as Map<String, dynamic>))
      .toList(),
  estimateCount: (json['estimate_count'] as num).toDouble(),
);

Map<String, dynamic> _$AdminProductCategoryListResponseToJson(
  _AdminProductCategoryListResponse instance,
) => <String, dynamic>{
  'limit': instance.limit,
  'offset': instance.offset,
  'count': instance.count,
  'product_categories': instance.productCategories,
  'estimate_count': instance.estimateCount,
};
