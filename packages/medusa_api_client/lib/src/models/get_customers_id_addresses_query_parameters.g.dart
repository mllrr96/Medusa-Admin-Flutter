// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_customers_id_addresses_query_parameters.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_GetCustomersIdAddressesQueryParameters
_$GetCustomersIdAddressesQueryParametersFromJson(Map<String, dynamic> json) =>
    _GetCustomersIdAddressesQueryParameters(
      fields: json['fields'] as String,
      offset: (json['offset'] as num).toDouble(),
      limit: (json['limit'] as num).toDouble(),
      order: json['order'] as String,
      q: json['q'] as String,
      company: json['company'],
      city: json['city'],
      countryCode: json['country_code'],
      province: json['province'],
      postalCode: json['postal_code'],
      and: (json[r'$and'] as List<dynamic>)
          .map((e) => e as Map<String, dynamic>)
          .toList(),
      or: (json[r'$or'] as List<dynamic>)
          .map((e) => e as Map<String, dynamic>)
          .toList(),
    );

Map<String, dynamic> _$GetCustomersIdAddressesQueryParametersToJson(
  _GetCustomersIdAddressesQueryParameters instance,
) => <String, dynamic>{
  'fields': instance.fields,
  'offset': instance.offset,
  'limit': instance.limit,
  'order': instance.order,
  'q': instance.q,
  'company': instance.company,
  'city': instance.city,
  'country_code': instance.countryCode,
  'province': instance.province,
  'postal_code': instance.postalCode,
  r'$and': instance.and,
  r'$or': instance.or,
};
