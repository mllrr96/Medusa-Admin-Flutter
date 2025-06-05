// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_promotion_rule.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AdminPromotionRuleImpl _$$AdminPromotionRuleImplFromJson(
  Map<String, dynamic> json,
) => _$AdminPromotionRuleImpl(
  id: json['id'] as String,
  description: json['description'] as String,
  attribute: json['attribute'] as String,
  operatorAA: $enumDecode(_$NullEnumEnumMap, json['operator']),
  values: (json['values'] as List<dynamic>)
      .map((e) => BasePromotionRuleValue.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$$AdminPromotionRuleImplToJson(
  _$AdminPromotionRuleImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'description': instance.description,
  'attribute': instance.attribute,
  'operator': instance.operatorAA,
  'values': instance.values,
};

const _$NullEnumEnumMap = {
  NullEnum.secret: 'secret',
  NullEnum.publishable: 'publishable',
};
