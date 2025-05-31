// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_admin_session_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AuthAdminSessionResponse _$AuthAdminSessionResponseFromJson(
  Map<String, dynamic> json,
) => _AuthAdminSessionResponse(
  user: AdminUser.fromJson(json['user'] as Map<String, dynamic>),
);

Map<String, dynamic> _$AuthAdminSessionResponseToJson(
  _AuthAdminSessionResponse instance,
) => <String, dynamic>{'user': instance.user};
