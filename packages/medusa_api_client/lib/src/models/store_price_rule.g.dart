// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store_price_rule.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StorePriceRuleImpl _$$StorePriceRuleImplFromJson(Map<String, dynamic> json) =>
    _$StorePriceRuleImpl(
      id: json['id'] as String,
      attribute: json['attribute'] as String,
      operatorAA: $enumDecode(_$NullEnumEnumMap, json['operator']),
      value: json['value'] as String,
    );

Map<String, dynamic> _$$StorePriceRuleImplToJson(
  _$StorePriceRuleImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'attribute': instance.attribute,
  'operator': instance.operatorAA,
  'value': instance.value,
};

const _$NullEnumEnumMap = {
  NullEnum.secret: 'secret',
  NullEnum.publishable: 'publishable',
};
