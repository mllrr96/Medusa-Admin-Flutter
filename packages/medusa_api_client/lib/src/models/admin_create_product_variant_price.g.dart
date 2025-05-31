// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_create_product_variant_price.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AdminCreateProductVariantPrice _$AdminCreateProductVariantPriceFromJson(
  Map<String, dynamic> json,
) => _AdminCreateProductVariantPrice(
  currencyCode: json['currency_code'] as String,
  amount: (json['amount'] as num).toDouble(),
  minQuantity: (json['min_quantity'] as num).toDouble(),
  maxQuantity: (json['max_quantity'] as num).toDouble(),
  rules: json['rules'] as Map<String, dynamic>,
);

Map<String, dynamic> _$AdminCreateProductVariantPriceToJson(
  _AdminCreateProductVariantPrice instance,
) => <String, dynamic>{
  'currency_code': instance.currencyCode,
  'amount': instance.amount,
  'min_quantity': instance.minQuantity,
  'max_quantity': instance.maxQuantity,
  'rules': instance.rules,
};
