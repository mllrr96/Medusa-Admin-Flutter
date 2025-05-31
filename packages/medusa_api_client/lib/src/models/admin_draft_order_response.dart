/// AdminDraftOrderResponse
/// {
///     "properties": {
///         "draft_order": {
///             "$ref": "#/components/schemas/AdminDraftOrder"
///         }
///     },
///     "type": "object",
///     "required": [
///         "draft_order"
///     ],
///     "description": "The draft order's details."
/// }
library admin_draft_order_response;

import 'exports.dart';
part 'admin_draft_order_response.freezed.dart';
part 'admin_draft_order_response.g.dart'; // AdminDraftOrderResponse

@freezed
abstract class AdminDraftOrderResponse with _$AdminDraftOrderResponse {
  const AdminDraftOrderResponse._();

  @jsonSerializable
  const factory AdminDraftOrderResponse({
    /// draftOrder
    @JsonKey(name: AdminDraftOrderResponse.draftOrderKey)
    required AdminDraftOrder draftOrder,
  }) = _AdminDraftOrderResponse;

  factory AdminDraftOrderResponse.fromJson(Map<String, dynamic> json) =>
      _$AdminDraftOrderResponseFromJson(json);

  static const String draftOrderKey = r'draft_order';
}
