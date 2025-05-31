// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_return_preview_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AdminReturnPreviewResponse _$AdminReturnPreviewResponseFromJson(
  Map<String, dynamic> json,
) => _AdminReturnPreviewResponse(
  orderPreview: AdminOrderPreview.fromJson(
    json['order_preview'] as Map<String, dynamic>,
  ),
  returnAA: AdminReturn.fromJson(json['return'] as Map<String, dynamic>),
);

Map<String, dynamic> _$AdminReturnPreviewResponseToJson(
  _AdminReturnPreviewResponse instance,
) => <String, dynamic>{
  'order_preview': instance.orderPreview,
  'return': instance.returnAA,
};
