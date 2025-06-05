// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_user_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AdminUserListResponseImpl _$$AdminUserListResponseImplFromJson(
  Map<String, dynamic> json,
) => _$AdminUserListResponseImpl(
  limit: (json['limit'] as num).toInt(),
  offset: (json['offset'] as num).toInt(),
  count: (json['count'] as num).toInt(),
  users: (json['users'] as List<dynamic>)
      .map((e) => AdminUser.fromJson(e as Map<String, dynamic>))
      .toList(),
  estimateCount: (json['estimate_count'] as num).toDouble(),
);

Map<String, dynamic> _$$AdminUserListResponseImplToJson(
  _$AdminUserListResponseImpl instance,
) => <String, dynamic>{
  'limit': instance.limit,
  'offset': instance.offset,
  'count': instance.count,
  'users': instance.users,
  'estimate_count': instance.estimateCount,
};
