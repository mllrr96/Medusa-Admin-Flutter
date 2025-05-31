// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_product_type_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AdminProductTypeListResponse _$AdminProductTypeListResponseFromJson(
  Map<String, dynamic> json,
) => _AdminProductTypeListResponse(
  limit: (json['limit'] as num).toDouble(),
  offset: (json['offset'] as num).toDouble(),
  count: (json['count'] as num).toDouble(),
  productTypes: (json['product_types'] as List<dynamic>)
      .map((e) => AdminProductType.fromJson(e as Map<String, dynamic>))
      .toList(),
  estimateCount: (json['estimate_count'] as num).toDouble(),
);

Map<String, dynamic> _$AdminProductTypeListResponseToJson(
  _AdminProductTypeListResponse instance,
) => <String, dynamic>{
  'limit': instance.limit,
  'offset': instance.offset,
  'count': instance.count,
  'product_types': instance.productTypes,
  'estimate_count': instance.estimateCount,
};
