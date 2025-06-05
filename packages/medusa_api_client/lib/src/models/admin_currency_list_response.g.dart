// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_currency_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AdminCurrencyListResponseImpl _$$AdminCurrencyListResponseImplFromJson(
  Map<String, dynamic> json,
) => _$AdminCurrencyListResponseImpl(
  limit: (json['limit'] as num).toInt(),
  offset: (json['offset'] as num).toInt(),
  count: (json['count'] as num).toInt(),
  currencies: (json['currencies'] as List<dynamic>)
      .map((e) => AdminCurrency.fromJson(e as Map<String, dynamic>))
      .toList(),
  estimateCount: (json['estimate_count'] as num).toDouble(),
);

Map<String, dynamic> _$$AdminCurrencyListResponseImplToJson(
  _$AdminCurrencyListResponseImpl instance,
) => <String, dynamic>{
  'limit': instance.limit,
  'offset': instance.offset,
  'count': instance.count,
  'currencies': instance.currencies,
  'estimate_count': instance.estimateCount,
};
