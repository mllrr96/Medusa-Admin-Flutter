// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_tax_providers_query_parameters.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_GetTaxProvidersQueryParameters _$GetTaxProvidersQueryParametersFromJson(
  Map<String, dynamic> json,
) => _GetTaxProvidersQueryParameters(
  fields: json['fields'] as String,
  offset: (json['offset'] as num).toDouble(),
  limit: (json['limit'] as num).toDouble(),
  order: json['order'] as String,
  id: json['id'],
  isEnabled: json['is_enabled'] as bool,
  and: (json[r'$and'] as List<dynamic>)
      .map((e) => e as Map<String, dynamic>)
      .toList(),
  or: (json[r'$or'] as List<dynamic>)
      .map((e) => e as Map<String, dynamic>)
      .toList(),
);

Map<String, dynamic> _$GetTaxProvidersQueryParametersToJson(
  _GetTaxProvidersQueryParameters instance,
) => <String, dynamic>{
  'fields': instance.fields,
  'offset': instance.offset,
  'limit': instance.limit,
  'order': instance.order,
  'id': instance.id,
  'is_enabled': instance.isEnabled,
  r'$and': instance.and,
  r'$or': instance.or,
};
