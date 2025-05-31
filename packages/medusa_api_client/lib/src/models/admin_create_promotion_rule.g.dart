// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_create_promotion_rule.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AdminCreatePromotionRule _$AdminCreatePromotionRuleFromJson(
  Map<String, dynamic> json,
) => _AdminCreatePromotionRule(
  operatorAA: $enumDecode(_$NullEnumEnumMap, json['operator']),
  description: json['description'] as String,
  attribute: json['attribute'] as String,
  values: json['values'],
);

Map<String, dynamic> _$AdminCreatePromotionRuleToJson(
  _AdminCreatePromotionRule instance,
) => <String, dynamic>{
  'operator': instance.operatorAA,
  'description': instance.description,
  'attribute': instance.attribute,
  'values': instance.values,
};

const _$NullEnumEnumMap = {
  NullEnum.secret: 'secret',
  NullEnum.publishable: 'publishable',
};
