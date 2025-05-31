// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_tax_rate.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AdminTaxRate _$AdminTaxRateFromJson(Map<String, dynamic> json) =>
    _AdminTaxRate(
      id: json['id'] as String,
      rate: (json['rate'] as num).toDouble(),
      code: json['code'] as String,
      name: json['name'] as String,
      metadata: json['metadata'] as Map<String, dynamic>,
      taxRegionId: json['tax_region_id'] as String,
      isCombinable: json['is_combinable'] as bool,
      isDefault: json['is_default'] as bool,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
      deletedAt: DateTime.parse(json['deleted_at'] as String),
      createdBy: json['created_by'] as String,
      taxRegion: AdminTaxRegion.fromJson(
        json['tax_region'] as Map<String, dynamic>,
      ),
      rules: (json['rules'] as List<dynamic>)
          .map((e) => AdminTaxRateRule.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AdminTaxRateToJson(_AdminTaxRate instance) =>
    <String, dynamic>{
      'id': instance.id,
      'rate': instance.rate,
      'code': instance.code,
      'name': instance.name,
      'metadata': instance.metadata,
      'tax_region_id': instance.taxRegionId,
      'is_combinable': instance.isCombinable,
      'is_default': instance.isDefault,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
      'deleted_at': instance.deletedAt.toIso8601String(),
      'created_by': instance.createdBy,
      'tax_region': instance.taxRegion,
      'rules': instance.rules,
    };
