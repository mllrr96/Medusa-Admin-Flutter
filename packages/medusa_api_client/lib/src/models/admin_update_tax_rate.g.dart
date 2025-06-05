// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_update_tax_rate.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AdminUpdateTaxRateImpl _$$AdminUpdateTaxRateImplFromJson(
  Map<String, dynamic> json,
) => _$AdminUpdateTaxRateImpl(
  rate: (json['rate'] as num).toDouble(),
  code: json['code'] as String,
  rules: (json['rules'] as List<dynamic>)
      .map((e) => e as Map<String, dynamic>)
      .toList(),
  name: json['name'] as String,
  isDefault: json['is_default'] as bool,
  isCombinable: json['is_combinable'] as bool,
  metadata: json['metadata'] as Map<String, dynamic>,
);

Map<String, dynamic> _$$AdminUpdateTaxRateImplToJson(
  _$AdminUpdateTaxRateImpl instance,
) => <String, dynamic>{
  'rate': instance.rate,
  'code': instance.code,
  'rules': instance.rules,
  'name': instance.name,
  'is_default': instance.isDefault,
  'is_combinable': instance.isCombinable,
  'metadata': instance.metadata,
};
