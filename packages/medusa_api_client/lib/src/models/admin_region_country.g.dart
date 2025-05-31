// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_region_country.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AdminRegionCountry _$AdminRegionCountryFromJson(Map<String, dynamic> json) =>
    _AdminRegionCountry(
      id: json['id'] as String,
      iso2: json['iso_2'] as String,
      iso3: json['iso_3'] as String,
      numCode: json['num_code'] as String,
      name: json['name'] as String,
      displayName: json['display_name'] as String,
    );

Map<String, dynamic> _$AdminRegionCountryToJson(_AdminRegionCountry instance) =>
    <String, dynamic>{
      'id': instance.id,
      'iso_2': instance.iso2,
      'iso_3': instance.iso3,
      'num_code': instance.numCode,
      'name': instance.name,
      'display_name': instance.displayName,
    };
