// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_shipping_option_rule.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AdminShippingOptionRule _$AdminShippingOptionRuleFromJson(
  Map<String, dynamic> json,
) => _AdminShippingOptionRule(
  id: json['id'] as String,
  attribute: json['attribute'] as String,
  operatorAA: $enumDecode(_$NullEnumEnumMap, json['operator']),
  value: json['value'] as String,
  shippingOptionId: json['shipping_option_id'] as String,
  createdAt: DateTime.parse(json['created_at'] as String),
  updatedAt: DateTime.parse(json['updated_at'] as String),
  deletedAt: DateTime.parse(json['deleted_at'] as String),
);

Map<String, dynamic> _$AdminShippingOptionRuleToJson(
  _AdminShippingOptionRule instance,
) => <String, dynamic>{
  'id': instance.id,
  'attribute': instance.attribute,
  'operator': instance.operatorAA,
  'value': instance.value,
  'shipping_option_id': instance.shippingOptionId,
  'created_at': instance.createdAt.toIso8601String(),
  'updated_at': instance.updatedAt.toIso8601String(),
  'deleted_at': instance.deletedAt.toIso8601String(),
};

const _$NullEnumEnumMap = {
  NullEnum.secret: 'secret',
  NullEnum.publishable: 'publishable',
};
