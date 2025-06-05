// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_claim_request_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AdminClaimRequestResponseImpl _$$AdminClaimRequestResponseImplFromJson(
  Map<String, dynamic> json,
) => _$AdminClaimRequestResponseImpl(
  returnAA: AdminReturn.fromJson(json['return'] as Map<String, dynamic>),
  orderPreview: AdminOrderPreview.fromJson(
    json['order_preview'] as Map<String, dynamic>,
  ),
  claim: AdminClaim.fromJson(json['claim'] as Map<String, dynamic>),
);

Map<String, dynamic> _$$AdminClaimRequestResponseImplToJson(
  _$AdminClaimRequestResponseImpl instance,
) => <String, dynamic>{
  'return': instance.returnAA,
  'order_preview': instance.orderPreview,
  'claim': instance.claim,
};
