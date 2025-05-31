// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_claim_preview_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AdminClaimPreviewResponse _$AdminClaimPreviewResponseFromJson(
  Map<String, dynamic> json,
) => _AdminClaimPreviewResponse(
  orderPreview: AdminOrderPreview.fromJson(
    json['order_preview'] as Map<String, dynamic>,
  ),
  claim: AdminClaim.fromJson(json['claim'] as Map<String, dynamic>),
);

Map<String, dynamic> _$AdminClaimPreviewResponseToJson(
  _AdminClaimPreviewResponse instance,
) => <String, dynamic>{
  'order_preview': instance.orderPreview,
  'claim': instance.claim,
};
