// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_shipping_profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AdminShippingProfileImpl _$$AdminShippingProfileImplFromJson(
  Map<String, dynamic> json,
) => _$AdminShippingProfileImpl(
  id: json['id'] as String,
  name: json['name'] as String,
  type: json['type'] as String,
  metadata: json['metadata'] as Map<String, dynamic>,
  createdAt: DateTime.parse(json['created_at'] as String),
  updatedAt: DateTime.parse(json['updated_at'] as String),
  deletedAt: DateTime.parse(json['deleted_at'] as String),
);

Map<String, dynamic> _$$AdminShippingProfileImplToJson(
  _$AdminShippingProfileImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'type': instance.type,
  'metadata': instance.metadata,
  'created_at': instance.createdAt.toIso8601String(),
  'updated_at': instance.updatedAt.toIso8601String(),
  'deleted_at': instance.deletedAt.toIso8601String(),
};
