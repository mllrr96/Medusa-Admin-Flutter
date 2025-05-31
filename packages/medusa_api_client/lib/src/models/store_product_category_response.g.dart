// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store_product_category_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_StoreProductCategoryResponse _$StoreProductCategoryResponseFromJson(
  Map<String, dynamic> json,
) => _StoreProductCategoryResponse(
  productCategory: StoreProductCategory.fromJson(
    json['product_category'] as Map<String, dynamic>,
  ),
);

Map<String, dynamic> _$StoreProductCategoryResponseToJson(
  _StoreProductCategoryResponse instance,
) => <String, dynamic>{'product_category': instance.productCategory};
