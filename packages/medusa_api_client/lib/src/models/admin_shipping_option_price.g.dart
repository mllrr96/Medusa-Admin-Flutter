// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_shipping_option_price.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AdminShippingOptionPriceImpl _$$AdminShippingOptionPriceImplFromJson(
  Map<String, dynamic> json,
) => _$AdminShippingOptionPriceImpl(
  priceRules: (json['price_rules'] as List<dynamic>)
      .map(
        (e) => AdminShippingOptionPriceRule.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  rulesCount: (json['rules_count'] as num).toDouble(),
  id: json['id'] as String,
  title: json['title'] as String,
  currencyCode: json['currency_code'] as String,
  amount: (json['amount'] as num).toDouble(),
  rawAmount: json['raw_amount'] as Map<String, dynamic>,
  minQuantity: (json['min_quantity'] as num).toDouble(),
  maxQuantity: (json['max_quantity'] as num).toDouble(),
  priceSetId: json['price_set_id'] as String,
  createdAt: DateTime.parse(json['created_at'] as String),
  updatedAt: DateTime.parse(json['updated_at'] as String),
  deletedAt: DateTime.parse(json['deleted_at'] as String),
);

Map<String, dynamic> _$$AdminShippingOptionPriceImplToJson(
  _$AdminShippingOptionPriceImpl instance,
) => <String, dynamic>{
  'price_rules': instance.priceRules,
  'rules_count': instance.rulesCount,
  'id': instance.id,
  'title': instance.title,
  'currency_code': instance.currencyCode,
  'amount': instance.amount,
  'raw_amount': instance.rawAmount,
  'min_quantity': instance.minQuantity,
  'max_quantity': instance.maxQuantity,
  'price_set_id': instance.priceSetId,
  'created_at': instance.createdAt.toIso8601String(),
  'updated_at': instance.updatedAt.toIso8601String(),
  'deleted_at': instance.deletedAt.toIso8601String(),
};
