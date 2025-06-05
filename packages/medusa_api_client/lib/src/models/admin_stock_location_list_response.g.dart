// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_stock_location_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AdminStockLocationListResponseImpl
_$$AdminStockLocationListResponseImplFromJson(Map<String, dynamic> json) =>
    _$AdminStockLocationListResponseImpl(
      limit: (json['limit'] as num).toInt(),
      offset: (json['offset'] as num).toInt(),
      count: (json['count'] as num).toInt(),
      stockLocations: (json['stock_locations'] as List<dynamic>)
          .map((e) => AdminStockLocation.fromJson(e as Map<String, dynamic>))
          .toList(),
      estimateCount: (json['estimate_count'] as num).toDouble(),
    );

Map<String, dynamic> _$$AdminStockLocationListResponseImplToJson(
  _$AdminStockLocationListResponseImpl instance,
) => <String, dynamic>{
  'limit': instance.limit,
  'offset': instance.offset,
  'count': instance.count,
  'stock_locations': instance.stockLocations,
  'estimate_count': instance.estimateCount,
};
