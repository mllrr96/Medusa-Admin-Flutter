/// AdminAddDraftOrderItems
/// {
///     "properties": {
///         "items": {
///             "type": "array",
///             "items": {
///                 "type": "object",
///                 "description": "The item's details"
///             },
///             "description": "The items to add to the draft order."
///         }
///     },
///     "type": "object",
///     "description": "The details of the items to add to a draft order."
/// }
library admin_add_draft_order_items;

import 'exports.dart';
part 'admin_add_draft_order_items.freezed.dart';
part 'admin_add_draft_order_items.g.dart'; // AdminAddDraftOrderItems

@freezed
abstract class AdminAddDraftOrderItems with _$AdminAddDraftOrderItems {
  const AdminAddDraftOrderItems._();

  @jsonSerializable
  const factory AdminAddDraftOrderItems({
    /// items
    @JsonKey(name: AdminAddDraftOrderItems.itemsKey)
    required List<Map<String, dynamic>> items,
  }) = _AdminAddDraftOrderItems;

  factory AdminAddDraftOrderItems.fromJson(Map<String, dynamic> json) =>
      _$AdminAddDraftOrderItemsFromJson(json);

  static const String itemsKey = r'items';
}
