// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_shipping_option_price_rule.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AdminShippingOptionPriceRule _$AdminShippingOptionPriceRuleFromJson(
  Map<String, dynamic> json,
) => _AdminShippingOptionPriceRule(
  id: json['id'] as String,
  value: json['value'],
  operatorAA: $enumDecode(_$NullEnumEnumMap, json['operator']),
  attribute: json['attribute'] as String,
  priceId: json['price_id'] as String,
  priority: (json['priority'] as num).toDouble(),
  createdAt: DateTime.parse(json['created_at'] as String),
  updatedAt: DateTime.parse(json['updated_at'] as String),
  deletedAt: DateTime.parse(json['deleted_at'] as String),
);

Map<String, dynamic> _$AdminShippingOptionPriceRuleToJson(
  _AdminShippingOptionPriceRule instance,
) => <String, dynamic>{
  'id': instance.id,
  'value': instance.value,
  'operator': instance.operatorAA,
  'attribute': instance.attribute,
  'price_id': instance.priceId,
  'priority': instance.priority,
  'created_at': instance.createdAt.toIso8601String(),
  'updated_at': instance.updatedAt.toIso8601String(),
  'deleted_at': instance.deletedAt.toIso8601String(),
};

const _$NullEnumEnumMap = {
  NullEnum.secret: 'secret',
  NullEnum.publishable: 'publishable',
};
