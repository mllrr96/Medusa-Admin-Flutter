// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_claims_query_parameters.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GetClaimsQueryParametersImpl _$$GetClaimsQueryParametersImplFromJson(
  Map<String, dynamic> json,
) => _$GetClaimsQueryParametersImpl(
  fields: json['fields'] as String,
  offset: (json['offset'] as num).toInt(),
  limit: (json['limit'] as num).toInt(),
  order: json['order'] as String,
  deletedAt: json['deleted_at'] as Map<String, dynamic>,
  q: json['q'] as String,
  id: json['id'],
  orderId: json['order_id'],
  status: json['status'],
  createdAt: json['created_at'] as Map<String, dynamic>,
  updatedAt: json['updated_at'] as Map<String, dynamic>,
  and: (json[r'$and'] as List<dynamic>)
      .map((e) => e as Map<String, dynamic>)
      .toList(),
  or: (json[r'$or'] as List<dynamic>)
      .map((e) => e as Map<String, dynamic>)
      .toList(),
);

Map<String, dynamic> _$$GetClaimsQueryParametersImplToJson(
  _$GetClaimsQueryParametersImpl instance,
) => <String, dynamic>{
  'fields': instance.fields,
  'offset': instance.offset,
  'limit': instance.limit,
  'order': instance.order,
  'deleted_at': instance.deletedAt,
  'q': instance.q,
  'id': instance.id,
  'order_id': instance.orderId,
  'status': instance.status,
  'created_at': instance.createdAt,
  'updated_at': instance.updatedAt,
  r'$and': instance.and,
  r'$or': instance.or,
};
