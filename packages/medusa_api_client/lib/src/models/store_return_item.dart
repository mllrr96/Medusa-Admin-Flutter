/// StoreReturnItem
/// {
///     "properties": {
///         "id": {
///             "type": "string",
///             "description": "The item's ID.",
///             "title": "id"
///         },
///         "quantity": {
///             "type": "number",
///             "description": "The item's quantity.",
///             "title": "quantity"
///         },
///         "received_quantity": {
///             "type": "number",
///             "description": "The item's received quantity.",
///             "title": "received_quantity"
///         },
///         "damaged_quantity": {
///             "type": "number",
///             "description": "The item's damaged quantity.",
///             "title": "damaged_quantity"
///         },
///         "reason_id": {
///             "type": "string",
///             "description": "The ID of the item's reason.",
///             "title": "reason_id"
///         },
///         "note": {
///             "type": "string",
///             "description": "A note with more details on why the item is returned.",
///             "title": "note"
///         },
///         "item_id": {
///             "type": "string",
///             "description": "The ID of the item in the order.",
///             "title": "item_id"
///         },
///         "return_id": {
///             "type": "string",
///             "description": "The ID of the return this item belongs to.",
///             "title": "return_id"
///         },
///         "metadata": {
///             "type": "object",
///             "description": "The item's metadata, can hold custom key-value pairs."
///         }
///     },
///     "type": "object",
///     "required": [
///         "id",
///         "quantity",
///         "received_quantity",
///         "damaged_quantity",
///         "item_id",
///         "return_id"
///     ],
///     "description": "The return item's details."
/// }
library store_return_item;

import 'exports.dart';
part 'store_return_item.freezed.dart';
part 'store_return_item.g.dart'; // StoreReturnItem

@freezed
abstract class StoreReturnItem with _$StoreReturnItem {
  const StoreReturnItem._();

  @jsonSerializable
  const factory StoreReturnItem({
    /// id
    @JsonKey(name: StoreReturnItem.idKey) required String id,

    /// quantity
    @JsonKey(name: StoreReturnItem.quantityKey) required double quantity,

    /// receivedQuantity
    @JsonKey(name: StoreReturnItem.receivedQuantityKey)
    required double receivedQuantity,

    /// damagedQuantity
    @JsonKey(name: StoreReturnItem.damagedQuantityKey)
    required double damagedQuantity,

    /// reasonId
    @JsonKey(name: StoreReturnItem.reasonIdKey) required String reasonId,

    /// note
    @JsonKey(name: StoreReturnItem.noteKey) required String note,

    /// itemId
    @JsonKey(name: StoreReturnItem.itemIdKey) required String itemId,

    /// returnId
    @JsonKey(name: StoreReturnItem.returnIdKey) required String returnId,

    /// metadata
    @JsonKey(name: StoreReturnItem.metadataKey)
    required Map<String, dynamic> metadata,
  }) = _StoreReturnItem;

  factory StoreReturnItem.fromJson(Map<String, dynamic> json) =>
      _$StoreReturnItemFromJson(json);

  static const String idKey = r'id';

  static const String quantityKey = r'quantity';

  static const String receivedQuantityKey = r'received_quantity';

  static const String damagedQuantityKey = r'damaged_quantity';

  static const String reasonIdKey = r'reason_id';

  static const String noteKey = r'note';

  static const String itemIdKey = r'item_id';

  static const String returnIdKey = r'return_id';

  static const String metadataKey = r'metadata';
}
