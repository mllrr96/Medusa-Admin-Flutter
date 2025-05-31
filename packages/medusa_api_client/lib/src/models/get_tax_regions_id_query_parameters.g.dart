// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_tax_regions_id_query_parameters.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_GetTaxRegionsIdQueryParameters _$GetTaxRegionsIdQueryParametersFromJson(
  Map<String, dynamic> json,
) => _GetTaxRegionsIdQueryParameters(
  fields: json['fields'] as String,
  provinceCode: json['province_code'] as String,
  providerId: json['provider_id'] as String,
  metadata: json['metadata'] as Map<String, dynamic>,
);

Map<String, dynamic> _$GetTaxRegionsIdQueryParametersToJson(
  _GetTaxRegionsIdQueryParameters instance,
) => <String, dynamic>{
  'fields': instance.fields,
  'province_code': instance.provinceCode,
  'provider_id': instance.providerId,
  'metadata': instance.metadata,
};
