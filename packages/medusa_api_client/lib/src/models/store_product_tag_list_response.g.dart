// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store_product_tag_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StoreProductTagListResponseImpl _$$StoreProductTagListResponseImplFromJson(
  Map<String, dynamic> json,
) => _$StoreProductTagListResponseImpl(
  limit: (json['limit'] as num).toInt(),
  offset: (json['offset'] as num).toInt(),
  count: (json['count'] as num).toInt(),
  productTags: (json['product_tags'] as List<dynamic>)
      .map((e) => StoreProductTag.fromJson(e as Map<String, dynamic>))
      .toList(),
  estimateCount: (json['estimate_count'] as num).toDouble(),
);

Map<String, dynamic> _$$StoreProductTagListResponseImplToJson(
  _$StoreProductTagListResponseImpl instance,
) => <String, dynamic>{
  'limit': instance.limit,
  'offset': instance.offset,
  'count': instance.count,
  'product_tags': instance.productTags,
  'estimate_count': instance.estimateCount,
};
