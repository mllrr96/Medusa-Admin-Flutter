// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_user_delete_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AdminUserDeleteResponseImpl _$$AdminUserDeleteResponseImplFromJson(
  Map<String, dynamic> json,
) => _$AdminUserDeleteResponseImpl(
  id: json['id'] as String,
  object: json['object'] as String? ?? 'user',
  deleted: json['deleted'] as bool,
);

Map<String, dynamic> _$$AdminUserDeleteResponseImplToJson(
  _$AdminUserDeleteResponseImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'object': instance.object,
  'deleted': instance.deleted,
};
