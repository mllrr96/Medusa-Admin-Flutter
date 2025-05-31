// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_shipping_profiles_query_parameters.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_GetShippingProfilesQueryParameters
_$GetShippingProfilesQueryParametersFromJson(Map<String, dynamic> json) =>
    _GetShippingProfilesQueryParameters(
      fields: json['fields'] as String,
      offset: (json['offset'] as num).toDouble(),
      limit: (json['limit'] as num).toDouble(),
      order: json['order'] as String,
      id: json['id'],
      q: json['q'] as String,
      type: json['type'] as String,
      name: json['name'] as String,
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

Map<String, dynamic> _$GetShippingProfilesQueryParametersToJson(
  _GetShippingProfilesQueryParameters instance,
) => <String, dynamic>{
  'fields': instance.fields,
  'offset': instance.offset,
  'limit': instance.limit,
  'order': instance.order,
  'id': instance.id,
  'q': instance.q,
  'type': instance.type,
  'name': instance.name,
  'created_at': instance.createdAt,
  'updated_at': instance.updatedAt,
  'deleted_at': instance.deletedAt,
  r'$and': instance.and,
  r'$or': instance.or,
};
