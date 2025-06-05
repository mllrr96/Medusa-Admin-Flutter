// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_update_promotion_rule.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AdminUpdatePromotionRuleImpl _$$AdminUpdatePromotionRuleImplFromJson(
  Map<String, dynamic> json,
) => _$AdminUpdatePromotionRuleImpl(
  id: json['id'] as String,
  operatorAA: $enumDecode(_$NullEnumEnumMap, json['operator']),
  description: json['description'] as String,
  attribute: json['attribute'] as String,
  values: json['values'],
);

Map<String, dynamic> _$$AdminUpdatePromotionRuleImplToJson(
  _$AdminUpdatePromotionRuleImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'operator': instance.operatorAA,
  'description': instance.description,
  'attribute': instance.attribute,
  'values': instance.values,
};

const _$NullEnumEnumMap = {
  NullEnum.secret: 'secret',
  NullEnum.publishable: 'publishable',
};
