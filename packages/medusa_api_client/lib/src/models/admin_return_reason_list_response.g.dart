// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_return_reason_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AdminReturnReasonListResponse _$AdminReturnReasonListResponseFromJson(
  Map<String, dynamic> json,
) => _AdminReturnReasonListResponse(
  limit: (json['limit'] as num).toDouble(),
  offset: (json['offset'] as num).toDouble(),
  count: (json['count'] as num).toDouble(),
  returnReasons: (json['return_reasons'] as List<dynamic>)
      .map((e) => AdminReturnReason.fromJson(e as Map<String, dynamic>))
      .toList(),
  estimateCount: (json['estimate_count'] as num).toDouble(),
);

Map<String, dynamic> _$AdminReturnReasonListResponseToJson(
  _AdminReturnReasonListResponse instance,
) => <String, dynamic>{
  'limit': instance.limit,
  'offset': instance.offset,
  'count': instance.count,
  'return_reasons': instance.returnReasons,
  'estimate_count': instance.estimateCount,
};
