// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_invites_query_parameters.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_GetInvitesQueryParameters _$GetInvitesQueryParametersFromJson(
  Map<String, dynamic> json,
) => _GetInvitesQueryParameters(
  fields: json['fields'] as String,
  offset: (json['offset'] as num).toDouble(),
  limit: (json['limit'] as num).toDouble(),
  order: json['order'] as String,
  q: json['q'] as String,
  id: json['id'],
  email: json['email'],
  createdAt: json['created_at'] as Map<String, dynamic>,
  updatedAt: json['updated_at'] as Map<String, dynamic>,
  deletedAt: json['deleted_at'] as Map<String, dynamic>,
  and: (json[r'$and'] as List<dynamic>)
      .map((e) => e as Map<String, dynamic>)
      .toList(),
  or: (json[r'$or'] as List<dynamic>)
      .map((e) => e as Map<String, dynamic>)
      .toList(),
);

Map<String, dynamic> _$GetInvitesQueryParametersToJson(
  _GetInvitesQueryParameters instance,
) => <String, dynamic>{
  'fields': instance.fields,
  'offset': instance.offset,
  'limit': instance.limit,
  'order': instance.order,
  'q': instance.q,
  'id': instance.id,
  'email': instance.email,
  'created_at': instance.createdAt,
  'updated_at': instance.updatedAt,
  'deleted_at': instance.deletedAt,
  r'$and': instance.and,
  r'$or': instance.or,
};
