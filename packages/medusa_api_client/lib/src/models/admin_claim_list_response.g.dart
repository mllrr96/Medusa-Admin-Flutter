// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_claim_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AdminClaimListResponse _$AdminClaimListResponseFromJson(
  Map<String, dynamic> json,
) => _AdminClaimListResponse(
  limit: (json['limit'] as num).toDouble(),
  offset: (json['offset'] as num).toDouble(),
  count: (json['count'] as num).toDouble(),
  claims: (json['claims'] as List<dynamic>)
      .map((e) => AdminClaim.fromJson(e as Map<String, dynamic>))
      .toList(),
  estimateCount: (json['estimate_count'] as num).toDouble(),
);

Map<String, dynamic> _$AdminClaimListResponseToJson(
  _AdminClaimListResponse instance,
) => <String, dynamic>{
  'limit': instance.limit,
  'offset': instance.offset,
  'count': instance.count,
  'claims': instance.claims,
  'estimate_count': instance.estimateCount,
};
