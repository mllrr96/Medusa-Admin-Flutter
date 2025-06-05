// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_create_shipping_option_rule.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AdminCreateShippingOptionRuleImpl
_$$AdminCreateShippingOptionRuleImplFromJson(Map<String, dynamic> json) =>
    _$AdminCreateShippingOptionRuleImpl(
      operatorAA: $enumDecode(_$NullEnumEnumMap, json['operator']),
      attribute: json['attribute'] as String,
      value: json['value'],
    );

Map<String, dynamic> _$$AdminCreateShippingOptionRuleImplToJson(
  _$AdminCreateShippingOptionRuleImpl instance,
) => <String, dynamic>{
  'operator': instance.operatorAA,
  'attribute': instance.attribute,
  'value': instance.value,
};

const _$NullEnumEnumMap = {
  NullEnum.secret: 'secret',
  NullEnum.publishable: 'publishable',
};
