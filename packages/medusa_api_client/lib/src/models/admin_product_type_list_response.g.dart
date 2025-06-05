// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_product_type_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AdminProductTypeListResponseImpl _$$AdminProductTypeListResponseImplFromJson(
  Map<String, dynamic> json,
) => _$AdminProductTypeListResponseImpl(
  limit: (json['limit'] as num).toInt(),
  offset: (json['offset'] as num).toInt(),
  count: (json['count'] as num).toInt(),
  productTypes: (json['product_types'] as List<dynamic>)
      .map((e) => AdminProductType.fromJson(e as Map<String, dynamic>))
      .toList(),
  estimateCount: (json['estimate_count'] as num).toDouble(),
);

Map<String, dynamic> _$$AdminProductTypeListResponseImplToJson(
  _$AdminProductTypeListResponseImpl instance,
) => <String, dynamic>{
  'limit': instance.limit,
  'offset': instance.offset,
  'count': instance.count,
  'product_types': instance.productTypes,
  'estimate_count': instance.estimateCount,
};
