// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_customers_query_parameters.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GetCustomersQueryParametersImpl _$$GetCustomersQueryParametersImplFromJson(
  Map<String, dynamic> json,
) => _$GetCustomersQueryParametersImpl(
  fields: json['fields'] as String,
  offset: (json['offset'] as num).toInt(),
  limit: (json['limit'] as num).toInt(),
  order: json['order'] as String,
  groups: json['groups'],
  q: json['q'] as String,
  id: json['id'],
  email: json['email'],
  companyName: json['company_name'],
  firstName: json['first_name'],
  lastName: json['last_name'],
  createdBy: json['created_by'],
  createdAt: json['created_at'] as Map<String, dynamic>,
  updatedAt: json['updated_at'] as Map<String, dynamic>,
  deletedAt: json['deleted_at'] as Map<String, dynamic>,
  and: (json[r'$and'] as List<dynamic>)
      .map((e) => e as Map<String, dynamic>)
      .toList(),
  or: (json[r'$or'] as List<dynamic>)
      .map((e) => e as Map<String, dynamic>)
      .toList(),
  hasAccount: json['has_account'] as bool,
);

Map<String, dynamic> _$$GetCustomersQueryParametersImplToJson(
  _$GetCustomersQueryParametersImpl instance,
) => <String, dynamic>{
  'fields': instance.fields,
  'offset': instance.offset,
  'limit': instance.limit,
  'order': instance.order,
  'groups': instance.groups,
  'q': instance.q,
  'id': instance.id,
  'email': instance.email,
  'company_name': instance.companyName,
  'first_name': instance.firstName,
  'last_name': instance.lastName,
  'created_by': instance.createdBy,
  'created_at': instance.createdAt,
  'updated_at': instance.updatedAt,
  'deleted_at': instance.deletedAt,
  r'$and': instance.and,
  r'$or': instance.or,
  'has_account': instance.hasAccount,
};
