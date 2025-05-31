// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store_product_category_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_StoreProductCategoryListResponse _$StoreProductCategoryListResponseFromJson(
  Map<String, dynamic> json,
) => _StoreProductCategoryListResponse(
  limit: (json['limit'] as num).toDouble(),
  offset: (json['offset'] as num).toDouble(),
  count: (json['count'] as num).toDouble(),
  productCategories: (json['product_categories'] as List<dynamic>)
      .map((e) => StoreProductCategory.fromJson(e as Map<String, dynamic>))
      .toList(),
  estimateCount: (json['estimate_count'] as num).toDouble(),
);

Map<String, dynamic> _$StoreProductCategoryListResponseToJson(
  _StoreProductCategoryListResponse instance,
) => <String, dynamic>{
  'limit': instance.limit,
  'offset': instance.offset,
  'count': instance.count,
  'product_categories': instance.productCategories,
  'estimate_count': instance.estimateCount,
};
