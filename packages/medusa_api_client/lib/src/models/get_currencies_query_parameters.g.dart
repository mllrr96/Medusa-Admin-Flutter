// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_currencies_query_parameters.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GetCurrenciesQueryParametersImpl _$$GetCurrenciesQueryParametersImplFromJson(
  Map<String, dynamic> json,
) => _$GetCurrenciesQueryParametersImpl(
  fields: json['fields'] as String,
  offset: (json['offset'] as num).toInt(),
  limit: (json['limit'] as num).toInt(),
  order: json['order'] as String,
  q: json['q'] as String,
  code: json['code'],
  and: (json[r'$and'] as List<dynamic>)
      .map((e) => e as Map<String, dynamic>)
      .toList(),
  or: (json[r'$or'] as List<dynamic>)
      .map((e) => e as Map<String, dynamic>)
      .toList(),
);

Map<String, dynamic> _$$GetCurrenciesQueryParametersImplToJson(
  _$GetCurrenciesQueryParametersImpl instance,
) => <String, dynamic>{
  'fields': instance.fields,
  'offset': instance.offset,
  'limit': instance.limit,
  'order': instance.order,
  'q': instance.q,
  'code': instance.code,
  r'$and': instance.and,
  r'$or': instance.or,
};
