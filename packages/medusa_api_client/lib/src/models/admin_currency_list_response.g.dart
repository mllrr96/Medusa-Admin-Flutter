// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_currency_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AdminCurrencyListResponse _$AdminCurrencyListResponseFromJson(
  Map<String, dynamic> json,
) => _AdminCurrencyListResponse(
  limit: (json['limit'] as num).toDouble(),
  offset: (json['offset'] as num).toDouble(),
  count: (json['count'] as num).toDouble(),
  currencies: (json['currencies'] as List<dynamic>)
      .map((e) => AdminCurrency.fromJson(e as Map<String, dynamic>))
      .toList(),
  estimateCount: (json['estimate_count'] as num).toDouble(),
);

Map<String, dynamic> _$AdminCurrencyListResponseToJson(
  _AdminCurrencyListResponse instance,
) => <String, dynamic>{
  'limit': instance.limit,
  'offset': instance.offset,
  'count': instance.count,
  'currencies': instance.currencies,
  'estimate_count': instance.estimateCount,
};
