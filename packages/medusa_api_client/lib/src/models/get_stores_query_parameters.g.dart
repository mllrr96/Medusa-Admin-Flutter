// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_stores_query_parameters.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GetStoresQueryParametersImpl _$$GetStoresQueryParametersImplFromJson(
  Map<String, dynamic> json,
) => _$GetStoresQueryParametersImpl(
  fields: json['fields'] as String,
  offset: (json['offset'] as num).toInt(),
  limit: (json['limit'] as num).toInt(),
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

Map<String, dynamic> _$$GetStoresQueryParametersImplToJson(
  _$GetStoresQueryParametersImpl instance,
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
