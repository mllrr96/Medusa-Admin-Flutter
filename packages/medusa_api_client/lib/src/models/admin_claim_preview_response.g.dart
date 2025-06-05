// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_claim_preview_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AdminClaimPreviewResponseImpl _$$AdminClaimPreviewResponseImplFromJson(
  Map<String, dynamic> json,
) => _$AdminClaimPreviewResponseImpl(
  orderPreview: AdminOrderPreview.fromJson(
    json['order_preview'] as Map<String, dynamic>,
  ),
  claim: AdminClaim.fromJson(json['claim'] as Map<String, dynamic>),
);

Map<String, dynamic> _$$AdminClaimPreviewResponseImplToJson(
  _$AdminClaimPreviewResponseImpl instance,
) => <String, dynamic>{
  'order_preview': instance.orderPreview,
  'claim': instance.claim,
};
