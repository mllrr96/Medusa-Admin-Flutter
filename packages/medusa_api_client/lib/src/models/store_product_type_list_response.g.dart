// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store_product_type_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_StoreProductTypeListResponse _$StoreProductTypeListResponseFromJson(
  Map<String, dynamic> json,
) => _StoreProductTypeListResponse(
  limit: (json['limit'] as num).toDouble(),
  offset: (json['offset'] as num).toDouble(),
  count: (json['count'] as num).toDouble(),
  productTypes: (json['product_types'] as List<dynamic>)
      .map((e) => StoreProductType.fromJson(e as Map<String, dynamic>))
      .toList(),
  estimateCount: (json['estimate_count'] as num).toDouble(),
);

Map<String, dynamic> _$StoreProductTypeListResponseToJson(
  _StoreProductTypeListResponse instance,
) => <String, dynamic>{
  'limit': instance.limit,
  'offset': instance.offset,
  'count': instance.count,
  'product_types': instance.productTypes,
  'estimate_count': instance.estimateCount,
};
