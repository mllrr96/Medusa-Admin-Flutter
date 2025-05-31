// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_update_shipping_option_rule.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AdminUpdateShippingOptionRule _$AdminUpdateShippingOptionRuleFromJson(
  Map<String, dynamic> json,
) => _AdminUpdateShippingOptionRule(
  id: json['id'] as String,
  operatorAA: $enumDecode(_$NullEnumEnumMap, json['operator']),
  attribute: json['attribute'] as String,
  value: json['value'],
);

Map<String, dynamic> _$AdminUpdateShippingOptionRuleToJson(
  _AdminUpdateShippingOptionRule instance,
) => <String, dynamic>{
  'id': instance.id,
  'operator': instance.operatorAA,
  'attribute': instance.attribute,
  'value': instance.value,
};

const _$NullEnumEnumMap = {
  NullEnum.secret: 'secret',
  NullEnum.publishable: 'publishable',
};
