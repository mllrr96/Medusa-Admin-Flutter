// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store_price.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StorePriceImpl _$$StorePriceImplFromJson(Map<String, dynamic> json) =>
    _$StorePriceImpl(
      id: json['id'] as String,
      currencyCode: json['currency_code'] as String,
      amount: (json['amount'] as num).toDouble(),
      minQuantity: (json['min_quantity'] as num).toDouble(),
      maxQuantity: (json['max_quantity'] as num).toDouble(),
      priceRules: (json['price_rules'] as List<dynamic>)
          .map((e) => StorePriceRule.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$StorePriceImplToJson(_$StorePriceImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'currency_code': instance.currencyCode,
      'amount': instance.amount,
      'min_quantity': instance.minQuantity,
      'max_quantity': instance.maxQuantity,
      'price_rules': instance.priceRules,
    };
