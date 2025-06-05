// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_geo_zone.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AdminGeoZoneImpl _$$AdminGeoZoneImplFromJson(Map<String, dynamic> json) =>
    _$AdminGeoZoneImpl(
      id: json['id'] as String,
      type: $enumDecode(_$NullEnumEnumMap, json['type']),
      countryCode: json['country_code'] as String,
      provinceCode: json['province_code'] as String,
      city: json['city'] as String,
      postalExpression: json['postal_expression'] as Map<String, dynamic>,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
      deletedAt: DateTime.parse(json['deleted_at'] as String),
    );

Map<String, dynamic> _$$AdminGeoZoneImplToJson(_$AdminGeoZoneImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'country_code': instance.countryCode,
      'province_code': instance.provinceCode,
      'city': instance.city,
      'postal_expression': instance.postalExpression,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
      'deleted_at': instance.deletedAt.toIso8601String(),
    };

const _$NullEnumEnumMap = {
  NullEnum.secret: 'secret',
  NullEnum.publishable: 'publishable',
};
