// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_claim_return_preview_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AdminClaimReturnPreviewResponse _$AdminClaimReturnPreviewResponseFromJson(
  Map<String, dynamic> json,
) => _AdminClaimReturnPreviewResponse(
  orderPreview: AdminOrderPreview.fromJson(
    json['order_preview'] as Map<String, dynamic>,
  ),
  returnAA: AdminReturn.fromJson(json['return'] as Map<String, dynamic>),
);

Map<String, dynamic> _$AdminClaimReturnPreviewResponseToJson(
  _AdminClaimReturnPreviewResponse instance,
) => <String, dynamic>{
  'order_preview': instance.orderPreview,
  'return': instance.returnAA,
};
