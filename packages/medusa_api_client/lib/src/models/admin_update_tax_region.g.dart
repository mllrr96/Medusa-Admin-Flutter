// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_update_tax_region.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AdminUpdateTaxRegion _$AdminUpdateTaxRegionFromJson(
  Map<String, dynamic> json,
) => _AdminUpdateTaxRegion(
  provinceCode: json['province_code'] as String,
  metadata: json['metadata'] as Map<String, dynamic>,
  providerId: json['provider_id'] as String,
);

Map<String, dynamic> _$AdminUpdateTaxRegionToJson(
  _AdminUpdateTaxRegion instance,
) => <String, dynamic>{
  'province_code': instance.provinceCode,
  'metadata': instance.metadata,
  'provider_id': instance.providerId,
};
