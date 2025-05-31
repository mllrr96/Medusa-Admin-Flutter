// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_user_delete_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AdminUserDeleteResponse _$AdminUserDeleteResponseFromJson(
  Map<String, dynamic> json,
) => _AdminUserDeleteResponse(
  id: json['id'] as String,
  object: json['object'] as String? ?? 'user',
  deleted: json['deleted'] as bool,
);

Map<String, dynamic> _$AdminUserDeleteResponseToJson(
  _AdminUserDeleteResponse instance,
) => <String, dynamic>{
  'id': instance.id,
  'object': instance.object,
  'deleted': instance.deleted,
};
