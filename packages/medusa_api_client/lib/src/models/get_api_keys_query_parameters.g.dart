// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_api_keys_query_parameters.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GetApiKeysQueryParametersImpl _$$GetApiKeysQueryParametersImplFromJson(
  Map<String, dynamic> json,
) => _$GetApiKeysQueryParametersImpl(
  fields: json['fields'] as String,
  offset: (json['offset'] as num).toInt(),
  limit: (json['limit'] as num).toInt(),
  order: json['order'] as String,
  q: json['q'] as String,
  id: json['id'],
  title: json['title'],
  token: json['token'],
  type: $enumDecode(_$NullEnumEnumMap, json['type']),
  createdAt: json['created_at'] as Map<String, dynamic>,
  updatedAt: json['updated_at'] as Map<String, dynamic>,
  deletedAt: json['deleted_at'] as Map<String, dynamic>,
  revokedAt: json['revoked_at'] as Map<String, dynamic>,
  and: (json[r'$and'] as List<dynamic>)
      .map((e) => e as Map<String, dynamic>)
      .toList(),
  or: (json[r'$or'] as List<dynamic>)
      .map((e) => e as Map<String, dynamic>)
      .toList(),
);

Map<String, dynamic> _$$GetApiKeysQueryParametersImplToJson(
  _$GetApiKeysQueryParametersImpl instance,
) => <String, dynamic>{
  'fields': instance.fields,
  'offset': instance.offset,
  'limit': instance.limit,
  'order': instance.order,
  'q': instance.q,
  'id': instance.id,
  'title': instance.title,
  'token': instance.token,
  'type': instance.type,
  'created_at': instance.createdAt,
  'updated_at': instance.updatedAt,
  'deleted_at': instance.deletedAt,
  'revoked_at': instance.revokedAt,
  r'$and': instance.and,
  r'$or': instance.or,
};

const _$NullEnumEnumMap = {
  NullEnum.secret: 'secret',
  NullEnum.publishable: 'publishable',
};
