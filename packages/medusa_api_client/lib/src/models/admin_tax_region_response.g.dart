// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_tax_region_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AdminTaxRegionResponse _$AdminTaxRegionResponseFromJson(
  Map<String, dynamic> json,
) => _AdminTaxRegionResponse(
  taxRegion: AdminTaxRegion.fromJson(
    json['tax_region'] as Map<String, dynamic>,
  ),
);

Map<String, dynamic> _$AdminTaxRegionResponseToJson(
  _AdminTaxRegionResponse instance,
) => <String, dynamic>{'tax_region': instance.taxRegion};
