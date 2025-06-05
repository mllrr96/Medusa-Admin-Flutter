// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_products_id_options_query_parameters.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GetProductsIdOptionsQueryParametersImpl
_$$GetProductsIdOptionsQueryParametersImplFromJson(Map<String, dynamic> json) =>
    _$GetProductsIdOptionsQueryParametersImpl(
      fields: json['fields'] as String,
      offset: (json['offset'] as num).toInt(),
      limit: (json['limit'] as num).toInt(),
      order: json['order'] as String,
      q: json['q'] as String,
      id: json['id'],
      title: json['title'],
      and: (json[r'$and'] as List<dynamic>)
          .map((e) => e as Map<String, dynamic>)
          .toList(),
      or: (json[r'$or'] as List<dynamic>)
          .map((e) => e as Map<String, dynamic>)
          .toList(),
    );

Map<String, dynamic> _$$GetProductsIdOptionsQueryParametersImplToJson(
  _$GetProductsIdOptionsQueryParametersImpl instance,
) => <String, dynamic>{
  'fields': instance.fields,
  'offset': instance.offset,
  'limit': instance.limit,
  'order': instance.order,
  'q': instance.q,
  'id': instance.id,
  'title': instance.title,
  r'$and': instance.and,
  r'$or': instance.or,
};
