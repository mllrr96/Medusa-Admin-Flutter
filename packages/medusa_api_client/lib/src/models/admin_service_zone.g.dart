// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_service_zone.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AdminServiceZoneImpl _$$AdminServiceZoneImplFromJson(
  Map<String, dynamic> json,
) => _$AdminServiceZoneImpl(
  id: json['id'] as String,
  name: json['name'] as String,
  fulfillmentSetId: json['fulfillment_set_id'] as String,
  fulfillmentSet: json['fulfillment_set'] as Map<String, dynamic>,
  geoZones: (json['geo_zones'] as List<dynamic>)
      .map((e) => AdminGeoZone.fromJson(e as Map<String, dynamic>))
      .toList(),
  shippingOptions: (json['shipping_options'] as List<dynamic>)
      .map((e) => AdminShippingOption.fromJson(e as Map<String, dynamic>))
      .toList(),
  createdAt: DateTime.parse(json['created_at'] as String),
  updatedAt: DateTime.parse(json['updated_at'] as String),
  deletedAt: DateTime.parse(json['deleted_at'] as String),
);

Map<String, dynamic> _$$AdminServiceZoneImplToJson(
  _$AdminServiceZoneImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'fulfillment_set_id': instance.fulfillmentSetId,
  'fulfillment_set': instance.fulfillmentSet,
  'geo_zones': instance.geoZones,
  'shipping_options': instance.shippingOptions,
  'created_at': instance.createdAt.toIso8601String(),
  'updated_at': instance.updatedAt.toIso8601String(),
  'deleted_at': instance.deletedAt.toIso8601String(),
};
