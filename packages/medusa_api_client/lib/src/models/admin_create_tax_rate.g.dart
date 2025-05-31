// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_create_tax_rate.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AdminCreateTaxRate _$AdminCreateTaxRateFromJson(Map<String, dynamic> json) =>
    _AdminCreateTaxRate(
      name: json['name'] as String,
      taxRegionId: json['tax_region_id'] as String,
      rate: (json['rate'] as num).toDouble(),
      code: json['code'] as String,
      rules: (json['rules'] as List<dynamic>)
          .map(
            (e) => AdminCreateTaxRateRule.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
      isDefault: json['is_default'] as bool,
      isCombinable: json['is_combinable'] as bool,
      metadata: json['metadata'] as Map<String, dynamic>,
    );

Map<String, dynamic> _$AdminCreateTaxRateToJson(_AdminCreateTaxRate instance) =>
    <String, dynamic>{
      'name': instance.name,
      'tax_region_id': instance.taxRegionId,
      'rate': instance.rate,
      'code': instance.code,
      'rules': instance.rules,
      'is_default': instance.isDefault,
      'is_combinable': instance.isCombinable,
      'metadata': instance.metadata,
    };
