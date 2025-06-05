// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_product_tag_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AdminProductTagListResponseImpl _$$AdminProductTagListResponseImplFromJson(
  Map<String, dynamic> json,
) => _$AdminProductTagListResponseImpl(
  limit: (json['limit'] as num).toInt(),
  offset: (json['offset'] as num).toInt(),
  count: (json['count'] as num).toInt(),
  productTags: (json['product_tags'] as List<dynamic>)
      .map((e) => AdminProductTag.fromJson(e as Map<String, dynamic>))
      .toList(),
  estimateCount: (json['estimate_count'] as num).toDouble(),
);

Map<String, dynamic> _$$AdminProductTagListResponseImplToJson(
  _$AdminProductTagListResponseImpl instance,
) => <String, dynamic>{
  'limit': instance.limit,
  'offset': instance.offset,
  'count': instance.count,
  'product_tags': instance.productTags,
  'estimate_count': instance.estimateCount,
};
