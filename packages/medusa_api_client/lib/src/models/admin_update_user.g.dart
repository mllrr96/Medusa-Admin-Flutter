// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_update_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AdminUpdateUser _$AdminUpdateUserFromJson(Map<String, dynamic> json) =>
    _AdminUpdateUser(
      firstName: json['first_name'] as String,
      lastName: json['last_name'] as String,
      avatarUrl: json['avatar_url'] as String,
      metadata: json['metadata'] as Map<String, dynamic>,
    );

Map<String, dynamic> _$AdminUpdateUserToJson(_AdminUpdateUser instance) =>
    <String, dynamic>{
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'avatar_url': instance.avatarUrl,
      'metadata': instance.metadata,
    };
