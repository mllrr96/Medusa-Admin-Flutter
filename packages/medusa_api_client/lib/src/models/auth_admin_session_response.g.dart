// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_admin_session_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AuthAdminSessionResponseImpl _$$AuthAdminSessionResponseImplFromJson(
  Map<String, dynamic> json,
) => _$AuthAdminSessionResponseImpl(
  user: AdminAuthUser.fromJson(json['user'] as Map<String, dynamic>),
);

Map<String, dynamic> _$$AuthAdminSessionResponseImplToJson(
  _$AuthAdminSessionResponseImpl instance,
) => <String, dynamic>{'user': instance.user};
