// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_claim_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AdminClaimListResponseImpl _$$AdminClaimListResponseImplFromJson(
  Map<String, dynamic> json,
) => _$AdminClaimListResponseImpl(
  limit: (json['limit'] as num).toInt(),
  offset: (json['offset'] as num).toInt(),
  count: (json['count'] as num).toInt(),
  claims: (json['claims'] as List<dynamic>)
      .map((e) => AdminClaim.fromJson(e as Map<String, dynamic>))
      .toList(),
  estimateCount: (json['estimate_count'] as num).toDouble(),
);

Map<String, dynamic> _$$AdminClaimListResponseImplToJson(
  _$AdminClaimListResponseImpl instance,
) => <String, dynamic>{
  'limit': instance.limit,
  'offset': instance.offset,
  'count': instance.count,
  'claims': instance.claims,
  'estimate_count': instance.estimateCount,
};
