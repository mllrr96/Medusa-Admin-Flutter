// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_draft_order_preview_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AdminDraftOrderPreviewResponse _$AdminDraftOrderPreviewResponseFromJson(
  Map<String, dynamic> json,
) => _AdminDraftOrderPreviewResponse(
  draftOrderPreview: AdminDraftOrderPreview.fromJson(
    json['draft_order_preview'] as Map<String, dynamic>,
  ),
);

Map<String, dynamic> _$AdminDraftOrderPreviewResponseToJson(
  _AdminDraftOrderPreviewResponse instance,
) => <String, dynamic>{'draft_order_preview': instance.draftOrderPreview};
