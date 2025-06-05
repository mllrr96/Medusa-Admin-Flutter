// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_tax_regions_id_query_parameters.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GetTaxRegionsIdQueryParametersImpl
_$$GetTaxRegionsIdQueryParametersImplFromJson(Map<String, dynamic> json) =>
    _$GetTaxRegionsIdQueryParametersImpl(
      fields: json['fields'] as String,
      provinceCode: json['province_code'] as String,
      providerId: json['provider_id'] as String,
      metadata: json['metadata'] as Map<String, dynamic>,
    );

Map<String, dynamic> _$$GetTaxRegionsIdQueryParametersImplToJson(
  _$GetTaxRegionsIdQueryParametersImpl instance,
) => <String, dynamic>{
  'fields': instance.fields,
  'province_code': instance.provinceCode,
  'provider_id': instance.providerId,
  'metadata': instance.metadata,
};
