/// AdminDraftOrderPreviewResponse
/// {
///     "properties": {
///         "draft_order_preview": {
///             "$ref": "#/components/schemas/AdminDraftOrderPreview"
///         }
///     },
///     "type": "object",
///     "required": [
///         "draft_order_preview"
///     ],
///     "description": "The details of the preview on the draft order."
/// }
library;

import 'exports.dart';
part 'admin_draft_order_preview_response.freezed.dart';
part 'admin_draft_order_preview_response.g.dart'; // AdminDraftOrderPreviewResponse

@freezed
abstract class AdminDraftOrderPreviewResponse
    with _$AdminDraftOrderPreviewResponse {
  const AdminDraftOrderPreviewResponse._();

  @jsonSerializable
  const factory AdminDraftOrderPreviewResponse({
    /// draftOrderPreview
    @JsonKey(name: AdminDraftOrderPreviewResponse.draftOrderPreviewKey)
    required AdminDraftOrderPreview draftOrderPreview,
  }) = _AdminDraftOrderPreviewResponse;

  factory AdminDraftOrderPreviewResponse.fromJson(Map<String, dynamic> json) =>
      _$AdminDraftOrderPreviewResponseFromJson(json);

  static const String draftOrderPreviewKey = r'draft_order_preview';
}
