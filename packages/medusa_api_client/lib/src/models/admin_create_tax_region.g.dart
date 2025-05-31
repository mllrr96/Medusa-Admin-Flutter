// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_create_tax_region.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AdminCreateTaxRegion _$AdminCreateTaxRegionFromJson(
  Map<String, dynamic> json,
) => _AdminCreateTaxRegion(
  countryCode: json['country_code'] as String,
  provinceCode: json['province_code'] as String,
  parentId: json['parent_id'] as String,
  defaultTaxRate: json['default_tax_rate'] as Map<String, dynamic>,
  metadata: json['metadata'] as Map<String, dynamic>,
  providerId: json['provider_id'] as String,
);

Map<String, dynamic> _$AdminCreateTaxRegionToJson(
  _AdminCreateTaxRegion instance,
) => <String, dynamic>{
  'country_code': instance.countryCode,
  'province_code': instance.provinceCode,
  'parent_id': instance.parentId,
  'default_tax_rate': instance.defaultTaxRate,
  'metadata': instance.metadata,
  'provider_id': instance.providerId,
};
