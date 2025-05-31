// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_stock_location_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AdminStockLocationListResponse _$AdminStockLocationListResponseFromJson(
  Map<String, dynamic> json,
) => _AdminStockLocationListResponse(
  limit: (json['limit'] as num).toDouble(),
  offset: (json['offset'] as num).toDouble(),
  count: (json['count'] as num).toDouble(),
  stockLocations: (json['stock_locations'] as List<dynamic>)
      .map((e) => AdminStockLocation.fromJson(e as Map<String, dynamic>))
      .toList(),
  estimateCount: (json['estimate_count'] as num).toDouble(),
);

Map<String, dynamic> _$AdminStockLocationListResponseToJson(
  _AdminStockLocationListResponse instance,
) => <String, dynamic>{
  'limit': instance.limit,
  'offset': instance.offset,
  'count': instance.count,
  'stock_locations': instance.stockLocations,
  'estimate_count': instance.estimateCount,
};
