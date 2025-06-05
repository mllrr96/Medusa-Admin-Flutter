// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_users_query_parameters.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GetUsersQueryParametersImpl _$$GetUsersQueryParametersImplFromJson(
  Map<String, dynamic> json,
) => _$GetUsersQueryParametersImpl(
  fields: json['fields'] as String,
  offset: (json['offset'] as num).toInt(),
  limit: (json['limit'] as num).toInt(),
  order: json['order'] as String,
  q: json['q'] as String,
  id: json['id'],
  email: json['email'] as String,
  firstName: json['first_name'] as String,
  lastName: json['last_name'] as String,
  createdAt: json['created_at'] as Map<String, dynamic>,
  updatedAt: json['updated_at'] as Map<String, dynamic>,
  deletedAt: json['deleted_at'] as Map<String, dynamic>,
);

Map<String, dynamic> _$$GetUsersQueryParametersImplToJson(
  _$GetUsersQueryParametersImpl instance,
) => <String, dynamic>{
  'fields': instance.fields,
  'offset': instance.offset,
  'limit': instance.limit,
  'order': instance.order,
  'q': instance.q,
  'id': instance.id,
  'email': instance.email,
  'first_name': instance.firstName,
  'last_name': instance.lastName,
  'created_at': instance.createdAt,
  'updated_at': instance.updatedAt,
  'deleted_at': instance.deletedAt,
};
