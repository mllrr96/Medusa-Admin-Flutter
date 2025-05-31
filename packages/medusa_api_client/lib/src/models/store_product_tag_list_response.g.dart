// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store_product_tag_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_StoreProductTagListResponse _$StoreProductTagListResponseFromJson(
  Map<String, dynamic> json,
) => _StoreProductTagListResponse(
  limit: (json['limit'] as num).toDouble(),
  offset: (json['offset'] as num).toDouble(),
  count: (json['count'] as num).toDouble(),
  productTags: (json['product_tags'] as List<dynamic>)
      .map((e) => StoreProductTag.fromJson(e as Map<String, dynamic>))
      .toList(),
  estimateCount: (json['estimate_count'] as num).toDouble(),
);

Map<String, dynamic> _$StoreProductTagListResponseToJson(
  _StoreProductTagListResponse instance,
) => <String, dynamic>{
  'limit': instance.limit,
  'offset': instance.offset,
  'count': instance.count,
  'product_tags': instance.productTags,
  'estimate_count': instance.estimateCount,
};
