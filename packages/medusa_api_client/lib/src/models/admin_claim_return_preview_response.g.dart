// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_claim_return_preview_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AdminClaimReturnPreviewResponseImpl
_$$AdminClaimReturnPreviewResponseImplFromJson(Map<String, dynamic> json) =>
    _$AdminClaimReturnPreviewResponseImpl(
      orderPreview: AdminOrderPreview.fromJson(
        json['order_preview'] as Map<String, dynamic>,
      ),
      returnAA: AdminReturn.fromJson(json['return'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$AdminClaimReturnPreviewResponseImplToJson(
  _$AdminClaimReturnPreviewResponseImpl instance,
) => <String, dynamic>{
  'order_preview': instance.orderPreview,
  'return': instance.returnAA,
};
