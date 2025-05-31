// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_create_shipping_profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AdminCreateShippingProfile _$AdminCreateShippingProfileFromJson(
  Map<String, dynamic> json,
) => _AdminCreateShippingProfile(
  name: json['name'] as String,
  type: json['type'] as String,
  metadata: json['metadata'] as Map<String, dynamic>,
);

Map<String, dynamic> _$AdminCreateShippingProfileToJson(
  _AdminCreateShippingProfile instance,
) => <String, dynamic>{
  'name': instance.name,
  'type': instance.type,
  'metadata': instance.metadata,
};
