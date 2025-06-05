// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store_product_category_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StoreProductCategoryListResponseImpl
_$$StoreProductCategoryListResponseImplFromJson(Map<String, dynamic> json) =>
    _$StoreProductCategoryListResponseImpl(
      limit: (json['limit'] as num).toInt(),
      offset: (json['offset'] as num).toInt(),
      count: (json['count'] as num).toInt(),
      productCategories: (json['product_categories'] as List<dynamic>)
          .map((e) => StoreProductCategory.fromJson(e as Map<String, dynamic>))
          .toList(),
      estimateCount: (json['estimate_count'] as num).toDouble(),
    );

Map<String, dynamic> _$$StoreProductCategoryListResponseImplToJson(
  _$StoreProductCategoryListResponseImpl instance,
) => <String, dynamic>{
  'limit': instance.limit,
  'offset': instance.offset,
  'count': instance.count,
  'product_categories': instance.productCategories,
  'estimate_count': instance.estimateCount,
};
