// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_order_edit_preview_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AdminOrderEditPreviewResponse _$AdminOrderEditPreviewResponseFromJson(
  Map<String, dynamic> json,
) => _AdminOrderEditPreviewResponse(
  orderPreview: AdminOrderPreview.fromJson(
    json['order_preview'] as Map<String, dynamic>,
  ),
);

Map<String, dynamic> _$AdminOrderEditPreviewResponseToJson(
  _AdminOrderEditPreviewResponse instance,
) => <String, dynamic>{'order_preview': instance.orderPreview};
