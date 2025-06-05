// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_create_promotion_rule.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AdminCreatePromotionRuleImpl _$$AdminCreatePromotionRuleImplFromJson(
  Map<String, dynamic> json,
) => _$AdminCreatePromotionRuleImpl(
  operatorAA: $enumDecode(_$NullEnumEnumMap, json['operator']),
  description: json['description'] as String,
  attribute: json['attribute'] as String,
  values: json['values'],
);

Map<String, dynamic> _$$AdminCreatePromotionRuleImplToJson(
  _$AdminCreatePromotionRuleImpl instance,
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
