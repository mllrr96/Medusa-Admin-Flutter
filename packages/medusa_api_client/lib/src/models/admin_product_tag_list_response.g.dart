// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_product_tag_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AdminProductTagListResponse _$AdminProductTagListResponseFromJson(
  Map<String, dynamic> json,
) => _AdminProductTagListResponse(
  limit: (json['limit'] as num).toDouble(),
  offset: (json['offset'] as num).toDouble(),
  count: (json['count'] as num).toDouble(),
  productTags: (json['product_tags'] as List<dynamic>)
      .map((e) => AdminProductTag.fromJson(e as Map<String, dynamic>))
      .toList(),
  estimateCount: (json['estimate_count'] as num).toDouble(),
);

Map<String, dynamic> _$AdminProductTagListResponseToJson(
  _AdminProductTagListResponse instance,
) => <String, dynamic>{
  'limit': instance.limit,
  'offset': instance.offset,
  'count': instance.count,
  'product_tags': instance.productTags,
  'estimate_count': instance.estimateCount,
};
