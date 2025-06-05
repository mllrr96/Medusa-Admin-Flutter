// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_collections_query_parameters.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GetCollectionsQueryParametersImpl
_$$GetCollectionsQueryParametersImplFromJson(Map<String, dynamic> json) =>
    _$GetCollectionsQueryParametersImpl(
      fields: json['fields'] as String,
      offset: (json['offset'] as num).toInt(),
      limit: (json['limit'] as num).toInt(),
      order: json['order'] as String,
      deletedAt: json['deleted_at'] as Map<String, dynamic>,
      q: json['q'] as String,
      id: json['id'],
      handle: json['handle'],
      title: json['title'],
      createdAt: json['created_at'] as Map<String, dynamic>,
      updatedAt: json['updated_at'] as Map<String, dynamic>,
      and: (json[r'$and'] as List<dynamic>)
          .map((e) => e as Map<String, dynamic>)
          .toList(),
      or: (json[r'$or'] as List<dynamic>)
          .map((e) => e as Map<String, dynamic>)
          .toList(),
    );

Map<String, dynamic> _$$GetCollectionsQueryParametersImplToJson(
  _$GetCollectionsQueryParametersImpl instance,
) => <String, dynamic>{
  'fields': instance.fields,
  'offset': instance.offset,
  'limit': instance.limit,
  'order': instance.order,
  'deleted_at': instance.deletedAt,
  'q': instance.q,
  'id': instance.id,
  'handle': instance.handle,
  'title': instance.title,
  'created_at': instance.createdAt,
  'updated_at': instance.updatedAt,
  r'$and': instance.and,
  r'$or': instance.or,
};
