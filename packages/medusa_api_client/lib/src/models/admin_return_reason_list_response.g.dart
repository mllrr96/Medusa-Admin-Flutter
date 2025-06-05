// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_return_reason_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AdminReturnReasonListResponseImpl
_$$AdminReturnReasonListResponseImplFromJson(Map<String, dynamic> json) =>
    _$AdminReturnReasonListResponseImpl(
      limit: (json['limit'] as num).toInt(),
      offset: (json['offset'] as num).toInt(),
      count: (json['count'] as num).toInt(),
      returnReasons: (json['return_reasons'] as List<dynamic>)
          .map((e) => AdminReturnReason.fromJson(e as Map<String, dynamic>))
          .toList(),
      estimateCount: (json['estimate_count'] as num).toDouble(),
    );

Map<String, dynamic> _$$AdminReturnReasonListResponseImplToJson(
  _$AdminReturnReasonListResponseImpl instance,
) => <String, dynamic>{
  'limit': instance.limit,
  'offset': instance.offset,
  'count': instance.count,
  'return_reasons': instance.returnReasons,
  'estimate_count': instance.estimateCount,
};
