// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_service_zone_delete_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AdminServiceZoneDeleteResponse _$AdminServiceZoneDeleteResponseFromJson(
  Map<String, dynamic> json,
) => _AdminServiceZoneDeleteResponse(
  id: json['id'] as String,
  object: json['object'] as String? ?? 'service_zone',
  deleted: json['deleted'] as bool,
  parent: AdminFulfillmentSet.fromJson(json['parent'] as Map<String, dynamic>),
);

Map<String, dynamic> _$AdminServiceZoneDeleteResponseToJson(
  _AdminServiceZoneDeleteResponse instance,
) => <String, dynamic>{
  'id': instance.id,
  'object': instance.object,
  'deleted': instance.deleted,
  'parent': instance.parent,
};
