// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_fulfillment_set.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AdminFulfillmentSet _$AdminFulfillmentSetFromJson(Map<String, dynamic> json) =>
    _AdminFulfillmentSet(
      id: json['id'] as String,
      name: json['name'] as String,
      type: json['type'] as String,
      location: AdminStockLocation.fromJson(
        json['location'] as Map<String, dynamic>,
      ),
      serviceZones: (json['service_zones'] as List<dynamic>)
          .map((e) => AdminServiceZone.fromJson(e as Map<String, dynamic>))
          .toList(),
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
      deletedAt: DateTime.parse(json['deleted_at'] as String),
    );

Map<String, dynamic> _$AdminFulfillmentSetToJson(
  _AdminFulfillmentSet instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'type': instance.type,
  'location': instance.location,
  'service_zones': instance.serviceZones,
  'created_at': instance.createdAt.toIso8601String(),
  'updated_at': instance.updatedAt.toIso8601String(),
  'deleted_at': instance.deletedAt.toIso8601String(),
};
