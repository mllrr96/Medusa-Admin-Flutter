/// AdminUpdateDraftOrderItem
/// {
///     "properties": {
///         "quantity": {
///             "type": "number",
///             "description": "The item's quantity.",
///             "title": "quantity"
///         },
///         "unit_price": {
///             "type": "number",
///             "description": "The item's unit price.",
///             "title": "unit_price"
///         },
///         "compare_at_unit_price": {
///             "type": "number",
///             "description": "The original price of the item before a promotion or sale.",
///             "title": "compare_at_unit_price"
///         },
///         "internal_note": {
///             "type": "string",
///             "description": "A note viewed only by admin users about the item.",
///             "title": "internal_note"
///         }
///     },
///     "type": "object",
///     "required": [
///         "quantity"
///     ],
///     "description": "The updates to make on a draft order's item."
/// }
library;

import 'exports.dart';
part 'admin_update_draft_order_item.freezed.dart';
part 'admin_update_draft_order_item.g.dart'; // AdminUpdateDraftOrderItem

@freezed
abstract class AdminUpdateDraftOrderItem with _$AdminUpdateDraftOrderItem {
  const AdminUpdateDraftOrderItem._();

  @jsonSerializable
  const factory AdminUpdateDraftOrderItem({
    /// quantity
    @JsonKey(name: AdminUpdateDraftOrderItem.quantityKey)
    required double quantity,

    /// unitPrice
    @JsonKey(name: AdminUpdateDraftOrderItem.unitPriceKey)
    required double unitPrice,

    /// compareAtUnitPrice
    @JsonKey(name: AdminUpdateDraftOrderItem.compareAtUnitPriceKey)
    required double compareAtUnitPrice,

    /// internalNote
    @JsonKey(name: AdminUpdateDraftOrderItem.internalNoteKey)
    required String internalNote,
  }) = _AdminUpdateDraftOrderItem;

  factory AdminUpdateDraftOrderItem.fromJson(Map<String, dynamic> json) =>
      _$AdminUpdateDraftOrderItemFromJson(json);

  static const String quantityKey = r'quantity';

  static const String unitPriceKey = r'unit_price';

  static const String compareAtUnitPriceKey = r'compare_at_unit_price';

  static const String internalNoteKey = r'internal_note';
}
