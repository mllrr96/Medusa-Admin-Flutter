// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_application_method.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AdminApplicationMethodImpl _$$AdminApplicationMethodImplFromJson(
  Map<String, dynamic> json,
) => _$AdminApplicationMethodImpl(
  promotion: json['promotion'] as Map<String, dynamic>,
  targetRules: (json['target_rules'] as List<dynamic>)
      .map((e) => AdminPromotionRule.fromJson(e as Map<String, dynamic>))
      .toList(),
  buyRules: (json['buy_rules'] as List<dynamic>)
      .map((e) => AdminPromotionRule.fromJson(e as Map<String, dynamic>))
      .toList(),
  id: json['id'] as String,
  type: $enumDecode(_$NullEnumEnumMap, json['type']),
  targetType: $enumDecode(_$NullEnumEnumMap, json['target_type']),
  allocation: $enumDecode(_$NullEnumEnumMap, json['allocation']),
  value: (json['value'] as num).toDouble(),
  currencyCode: json['currency_code'] as String,
  maxQuantity: (json['max_quantity'] as num).toDouble(),
  buyRulesMinQuantity: (json['buy_rules_min_quantity'] as num).toDouble(),
  applyToQuantity: (json['apply_to_quantity'] as num).toDouble(),
);

Map<String, dynamic> _$$AdminApplicationMethodImplToJson(
  _$AdminApplicationMethodImpl instance,
) => <String, dynamic>{
  'promotion': instance.promotion,
  'target_rules': instance.targetRules,
  'buy_rules': instance.buyRules,
  'id': instance.id,
  'type': instance.type,
  'target_type': instance.targetType,
  'allocation': instance.allocation,
  'value': instance.value,
  'currency_code': instance.currencyCode,
  'max_quantity': instance.maxQuantity,
  'buy_rules_min_quantity': instance.buyRulesMinQuantity,
  'apply_to_quantity': instance.applyToQuantity,
};

const _$NullEnumEnumMap = {
  NullEnum.secret: 'secret',
  NullEnum.publishable: 'publishable',
};
