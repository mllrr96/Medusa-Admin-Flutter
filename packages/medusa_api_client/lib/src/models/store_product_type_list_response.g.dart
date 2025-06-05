// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store_product_type_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StoreProductTypeListResponseImpl _$$StoreProductTypeListResponseImplFromJson(
  Map<String, dynamic> json,
) => _$StoreProductTypeListResponseImpl(
  limit: (json['limit'] as num).toInt(),
  offset: (json['offset'] as num).toInt(),
  count: (json['count'] as num).toInt(),
  productTypes: (json['product_types'] as List<dynamic>)
      .map((e) => StoreProductType.fromJson(e as Map<String, dynamic>))
      .toList(),
  estimateCount: (json['estimate_count'] as num).toDouble(),
);

Map<String, dynamic> _$$StoreProductTypeListResponseImplToJson(
  _$StoreProductTypeListResponseImpl instance,
) => <String, dynamic>{
  'limit': instance.limit,
  'offset': instance.offset,
  'count': instance.count,
  'product_types': instance.productTypes,
  'estimate_count': instance.estimateCount,
};
