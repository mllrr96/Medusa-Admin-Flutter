// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_price_preferences_query_parameters.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_GetPricePreferencesQueryParameters
_$GetPricePreferencesQueryParametersFromJson(Map<String, dynamic> json) =>
    _GetPricePreferencesQueryParameters(
      fields: json['fields'] as String,
      offset: (json['offset'] as num).toDouble(),
      limit: (json['limit'] as num).toDouble(),
      order: json['order'] as String,
      id: json['id'],
      attribute: json['attribute'],
      value: json['value'],
      q: json['q'] as String,
      and: (json[r'$and'] as List<dynamic>)
          .map((e) => e as Map<String, dynamic>)
          .toList(),
      or: (json[r'$or'] as List<dynamic>)
          .map((e) => e as Map<String, dynamic>)
          .toList(),
    );

Map<String, dynamic> _$GetPricePreferencesQueryParametersToJson(
  _GetPricePreferencesQueryParameters instance,
) => <String, dynamic>{
  'fields': instance.fields,
  'offset': instance.offset,
  'limit': instance.limit,
  'order': instance.order,
  'id': instance.id,
  'attribute': instance.attribute,
  'value': instance.value,
  'q': instance.q,
  r'$and': instance.and,
  r'$or': instance.or,
};
