// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store_currency_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StoreCurrencyListResponseImpl _$$StoreCurrencyListResponseImplFromJson(
  Map<String, dynamic> json,
) => _$StoreCurrencyListResponseImpl(
  limit: (json['limit'] as num).toInt(),
  offset: (json['offset'] as num).toInt(),
  count: (json['count'] as num).toInt(),
  currencies: (json['currencies'] as List<dynamic>)
      .map((e) => StoreCurrency.fromJson(e as Map<String, dynamic>))
      .toList(),
  estimateCount: (json['estimate_count'] as num).toDouble(),
);

Map<String, dynamic> _$$StoreCurrencyListResponseImplToJson(
  _$StoreCurrencyListResponseImpl instance,
) => <String, dynamic>{
  'limit': instance.limit,
  'offset': instance.offset,
  'count': instance.count,
  'currencies': instance.currencies,
  'estimate_count': instance.estimateCount,
};
