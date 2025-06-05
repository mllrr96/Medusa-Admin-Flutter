// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_price_list_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AdminPriceListListResponseImpl _$$AdminPriceListListResponseImplFromJson(
  Map<String, dynamic> json,
) => _$AdminPriceListListResponseImpl(
  limit: (json['limit'] as num).toInt(),
  offset: (json['offset'] as num).toInt(),
  count: (json['count'] as num).toInt(),
  priceLists: (json['price_lists'] as List<dynamic>)
      .map((e) => AdminPriceList.fromJson(e as Map<String, dynamic>))
      .toList(),
  estimateCount: (json['estimate_count'] as num).toDouble(),
);

Map<String, dynamic> _$$AdminPriceListListResponseImplToJson(
  _$AdminPriceListListResponseImpl instance,
) => <String, dynamic>{
  'limit': instance.limit,
  'offset': instance.offset,
  'count': instance.count,
  'price_lists': instance.priceLists,
  'estimate_count': instance.estimateCount,
};
