// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_rule_attribute_option.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AdminRuleAttributeOption _$AdminRuleAttributeOptionFromJson(
  Map<String, dynamic> json,
) => _AdminRuleAttributeOption(
  id: json['id'] as String,
  value: json['value'] as String,
  label: json['label'] as String,
  operators: (json['operators'] as List<dynamic>)
      .map((e) => BaseRuleOperatorOptions.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$AdminRuleAttributeOptionToJson(
  _AdminRuleAttributeOption instance,
) => <String, dynamic>{
  'id': instance.id,
  'value': instance.value,
  'label': instance.label,
  'operators': instance.operators,
};
