// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_refund_reasons_query_parameters.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GetRefundReasonsQueryParametersImpl
_$$GetRefundReasonsQueryParametersImplFromJson(Map<String, dynamic> json) =>
    _$GetRefundReasonsQueryParametersImpl(
      fields: json['fields'] as String,
      offset: (json['offset'] as num).toInt(),
      limit: (json['limit'] as num).toInt(),
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

Map<String, dynamic> _$$GetRefundReasonsQueryParametersImplToJson(
  _$GetRefundReasonsQueryParametersImpl instance,
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
