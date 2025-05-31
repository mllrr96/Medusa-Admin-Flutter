// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_refund_reasons_query_parameters.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_GetRefundReasonsQueryParameters _$GetRefundReasonsQueryParametersFromJson(
  Map<String, dynamic> json,
) => _GetRefundReasonsQueryParameters(
  fields: json['fields'] as String,
  offset: (json['offset'] as num).toDouble(),
  limit: (json['limit'] as num).toDouble(),
  order: json['order'] as String,
  id: json['id'],
  q: json['q'] as String,
  and: (json[r'$and'] as List<dynamic>)
      .map((e) => e as Map<String, dynamic>)
      .toList(),
  or: (json[r'$or'] as List<dynamic>)
      .map((e) => e as Map<String, dynamic>)
      .toList(),
);

Map<String, dynamic> _$GetRefundReasonsQueryParametersToJson(
  _GetRefundReasonsQueryParameters instance,
) => <String, dynamic>{
  'fields': instance.fields,
  'offset': instance.offset,
  'limit': instance.limit,
  'order': instance.order,
  'id': instance.id,
  'q': instance.q,
  r'$and': instance.and,
  r'$or': instance.or,
};
