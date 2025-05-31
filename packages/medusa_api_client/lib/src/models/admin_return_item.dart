/// AdminReturnItem
/// {
///     "properties": {
///         "id": {
///             "type": "string",
///             "description": "The return item's ID.",
///             "title": "id"
///         },
///         "quantity": {
///             "type": "number",
///             "description": "The return item's quantity.",
///             "title": "quantity"
///         },
///         "received_quantity": {
///             "type": "number",
///             "description": "The received quantity of the item. This quantity is added to the stocked inventory quantity of the item.",
///             "title": "received_quantity"
///         },
///         "damaged_quantity": {
///             "type": "number",
///             "description": "The received damaged quantity of the item, which isn't added to the stocked inventory quantity of the item.",
///             "title": "damaged_quantity"
///         },
///         "reason_id": {
///             "type": "string",
///             "description": "The ID of the return reason associated with the item.",
///             "title": "reason_id"
///         },
///         "note": {
///             "type": "string",
///             "description": "A note about why the item was returned.",
///             "title": "note"
///         },
///         "item_id": {
///             "type": "string",
///             "description": "The ID of the associated order item.",
///             "title": "item_id"
///         },
///         "return_id": {
///             "type": "string",
///             "description": "The ID of the return this return item belongs to.",
///             "title": "return_id"
///         },
///         "metadata": {
///             "type": "object",
///             "description": "The return item's metadata, can hold custom key-value pairs."
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
library admin_return_item;

import 'exports.dart';
part 'admin_return_item.freezed.dart';
part 'admin_return_item.g.dart'; // AdminReturnItem

@freezed
abstract class AdminReturnItem with _$AdminReturnItem {
  const AdminReturnItem._();

  @jsonSerializable
  const factory AdminReturnItem({
    /// id
    @JsonKey(name: AdminReturnItem.idKey) required String id,

    /// quantity
    @JsonKey(name: AdminReturnItem.quantityKey) required double quantity,

    /// receivedQuantity
    @JsonKey(name: AdminReturnItem.receivedQuantityKey)
    required double receivedQuantity,

    /// damagedQuantity
    @JsonKey(name: AdminReturnItem.damagedQuantityKey)
    required double damagedQuantity,

    /// reasonId
    @JsonKey(name: AdminReturnItem.reasonIdKey) required String reasonId,

    /// note
    @JsonKey(name: AdminReturnItem.noteKey) required String note,

    /// itemId
    @JsonKey(name: AdminReturnItem.itemIdKey) required String itemId,

    /// returnId
    @JsonKey(name: AdminReturnItem.returnIdKey) required String returnId,

    /// metadata
    @JsonKey(name: AdminReturnItem.metadataKey)
    required Map<String, dynamic> metadata,
  }) = _AdminReturnItem;

  factory AdminReturnItem.fromJson(Map<String, dynamic> json) =>
      _$AdminReturnItemFromJson(json);

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
