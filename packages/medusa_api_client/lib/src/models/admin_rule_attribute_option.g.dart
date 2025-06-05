// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_rule_attribute_option.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AdminRuleAttributeOptionImpl _$$AdminRuleAttributeOptionImplFromJson(
  Map<String, dynamic> json,
) => _$AdminRuleAttributeOptionImpl(
  id: json['id'] as String,
  value: json['value'] as String,
  label: json['label'] as String,
  operators: (json['operators'] as List<dynamic>)
      .map((e) => BaseRuleOperatorOptions.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$$AdminRuleAttributeOptionImplToJson(
  _$AdminRuleAttributeOptionImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'value': instance.value,
  'label': instance.label,
  'operators': instance.operators,
};
