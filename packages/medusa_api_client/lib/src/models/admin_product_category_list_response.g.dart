// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_product_category_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AdminProductCategoryListResponseImpl
_$$AdminProductCategoryListResponseImplFromJson(Map<String, dynamic> json) =>
    _$AdminProductCategoryListResponseImpl(
      limit: (json['limit'] as num).toInt(),
      offset: (json['offset'] as num).toInt(),
      count: (json['count'] as num).toInt(),
      productCategories: (json['product_categories'] as List<dynamic>)
          .map((e) => AdminProductCategory.fromJson(e as Map<String, dynamic>))
          .toList(),
      estimateCount: (json['estimate_count'] as num).toDouble(),
    );

Map<String, dynamic> _$$AdminProductCategoryListResponseImplToJson(
  _$AdminProductCategoryListResponseImpl instance,
) => <String, dynamic>{
  'limit': instance.limit,
  'offset': instance.offset,
  'count': instance.count,
  'product_categories': instance.productCategories,
  'estimate_count': instance.estimateCount,
};
