// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_stores_query_parameters.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_GetStoresQueryParameters _$GetStoresQueryParametersFromJson(
  Map<String, dynamic> json,
) => _GetStoresQueryParameters(
  fields: json['fields'] as String,
  offset: (json['offset'] as num).toDouble(),
  limit: (json['limit'] as num).toDouble(),
  order: json['order'] as String,
  q: json['q'] as String,
  id: json['id'],
  name: json['name'],
  and: (json[r'$and'] as List<dynamic>)
      .map((e) => e as Map<String, dynamic>)
      .toList(),
  or: (json[r'$or'] as List<dynamic>)
      .map((e) => e as Map<String, dynamic>)
      .toList(),
);

Map<String, dynamic> _$GetStoresQueryParametersToJson(
  _GetStoresQueryParameters instance,
) => <String, dynamic>{
  'fields': instance.fields,
  'offset': instance.offset,
  'limit': instance.limit,
  'order': instance.order,
  'q': instance.q,
  'id': instance.id,
  'name': instance.name,
  r'$and': instance.and,
  r'$or': instance.or,
};
