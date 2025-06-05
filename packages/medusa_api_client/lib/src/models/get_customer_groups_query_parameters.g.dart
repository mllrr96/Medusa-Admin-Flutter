// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_customer_groups_query_parameters.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GetCustomerGroupsQueryParametersImpl
_$$GetCustomerGroupsQueryParametersImplFromJson(Map<String, dynamic> json) =>
    _$GetCustomerGroupsQueryParametersImpl(
      fields: json['fields'] as String,
      offset: (json['offset'] as num).toInt(),
      limit: (json['limit'] as num).toInt(),
      order: json['order'] as String,
      q: json['q'] as String,
      id: json['id'],
      name: json['name'],
      customers: json['customers'],
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
    );

Map<String, dynamic> _$$GetCustomerGroupsQueryParametersImplToJson(
  _$GetCustomerGroupsQueryParametersImpl instance,
) => <String, dynamic>{
  'fields': instance.fields,
  'offset': instance.offset,
  'limit': instance.limit,
  'order': instance.order,
  'q': instance.q,
  'id': instance.id,
  'name': instance.name,
  'customers': instance.customers,
  'created_by': instance.createdBy,
  'created_at': instance.createdAt,
  'updated_at': instance.updatedAt,
  'deleted_at': instance.deletedAt,
  r'$and': instance.and,
  r'$or': instance.or,
};
