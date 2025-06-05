// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_update_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AdminUpdateUserImpl _$$AdminUpdateUserImplFromJson(
  Map<String, dynamic> json,
) => _$AdminUpdateUserImpl(
  firstName: json['first_name'] as String,
  lastName: json['last_name'] as String,
  avatarUrl: json['avatar_url'] as String,
  metadata: json['metadata'] as Map<String, dynamic>,
);

Map<String, dynamic> _$$AdminUpdateUserImplToJson(
  _$AdminUpdateUserImpl instance,
) => <String, dynamic>{
  'first_name': instance.firstName,
  'last_name': instance.lastName,
  'avatar_url': instance.avatarUrl,
  'metadata': instance.metadata,
};
