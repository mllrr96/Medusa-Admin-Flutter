// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_return_preview_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AdminReturnPreviewResponseImpl _$$AdminReturnPreviewResponseImplFromJson(
  Map<String, dynamic> json,
) => _$AdminReturnPreviewResponseImpl(
  orderPreview: AdminOrderPreview.fromJson(
    json['order_preview'] as Map<String, dynamic>,
  ),
  returnAA: AdminReturn.fromJson(json['return'] as Map<String, dynamic>),
);

Map<String, dynamic> _$$AdminReturnPreviewResponseImplToJson(
  _$AdminReturnPreviewResponseImpl instance,
) => <String, dynamic>{
  'order_preview': instance.orderPreview,
  'return': instance.returnAA,
};
