// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_claim_request_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AdminClaimRequestResponse _$AdminClaimRequestResponseFromJson(
  Map<String, dynamic> json,
) => _AdminClaimRequestResponse(
  returnAA: AdminReturn.fromJson(json['return'] as Map<String, dynamic>),
  orderPreview: AdminOrderPreview.fromJson(
    json['order_preview'] as Map<String, dynamic>,
  ),
  claim: AdminClaim.fromJson(json['claim'] as Map<String, dynamic>),
);

Map<String, dynamic> _$AdminClaimRequestResponseToJson(
  _AdminClaimRequestResponse instance,
) => <String, dynamic>{
  'return': instance.returnAA,
  'order_preview': instance.orderPreview,
  'claim': instance.claim,
};
