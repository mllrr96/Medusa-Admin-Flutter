// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_service_zone_delete_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AdminServiceZoneDeleteResponseImpl
_$$AdminServiceZoneDeleteResponseImplFromJson(Map<String, dynamic> json) =>
    _$AdminServiceZoneDeleteResponseImpl(
      id: json['id'] as String,
      object: json['object'] as String? ?? 'service_zone',
      deleted: json['deleted'] as bool,
      parent: AdminFulfillmentSet.fromJson(
        json['parent'] as Map<String, dynamic>,
      ),
    );

Map<String, dynamic> _$$AdminServiceZoneDeleteResponseImplToJson(
  _$AdminServiceZoneDeleteResponseImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'object': instance.object,
  'deleted': instance.deleted,
  'parent': instance.parent,
};
