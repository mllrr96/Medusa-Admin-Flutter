/// OrderReturnItem
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
///         "reason_id": {
///             "type": "string",
///             "description": "The ID of the return reason associated with the item.",
///             "title": "reason_id"
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
///         },
///         "order_id": {
///             "type": "string",
///             "description": "The ID of the order the return belongs to.",
///             "title": "order_id"
///         },
///         "created_at": {
///             "type": "string",
///             "format": "date-time",
///             "description": "The date the item was created.",
///             "title": "created_at"
///         },
///         "updated_at": {
///             "type": "string",
///             "format": "date-time",
///             "description": "The date the item was updated.",
///             "title": "updated_at"
///         },
///         "damaged_quantity": {
///             "type": "number",
///             "description": "The item's damaged quantity.",
///             "title": "damaged_quantity"
///         }
///     },
///     "type": "object",
///     "required": [
///         "id",
///         "return_id",
///         "order_id",
///         "item_id",
///         "quantity"
///     ],
///     "description": "The item's items."
/// }
library order_return_item;

import 'exports.dart';
part 'order_return_item.freezed.dart';
part 'order_return_item.g.dart'; // OrderReturnItem

@freezed
abstract class OrderReturnItem with _$OrderReturnItem {
  const OrderReturnItem._();

  @jsonSerializable
  const factory OrderReturnItem({
    /// id
    @JsonKey(name: OrderReturnItem.idKey) required String id,

    /// quantity
    @JsonKey(name: OrderReturnItem.quantityKey) required double quantity,

    /// receivedQuantity
    @JsonKey(name: OrderReturnItem.receivedQuantityKey)
    required double receivedQuantity,

    /// reasonId
    @JsonKey(name: OrderReturnItem.reasonIdKey) required String reasonId,

    /// itemId
    @JsonKey(name: OrderReturnItem.itemIdKey) required String itemId,

    /// returnId
    @JsonKey(name: OrderReturnItem.returnIdKey) required String returnId,

    /// metadata
    @JsonKey(name: OrderReturnItem.metadataKey)
    required Map<String, dynamic> metadata,

    /// orderId
    @JsonKey(name: OrderReturnItem.orderIdKey) required String orderId,

    /// createdAt
    @JsonKey(name: OrderReturnItem.createdAtKey) required DateTime createdAt,

    /// updatedAt
    @JsonKey(name: OrderReturnItem.updatedAtKey) required DateTime updatedAt,

    /// damagedQuantity
    @JsonKey(name: OrderReturnItem.damagedQuantityKey)
    required double damagedQuantity,
  }) = _OrderReturnItem;

  factory OrderReturnItem.fromJson(Map<String, dynamic> json) =>
      _$OrderReturnItemFromJson(json);

  static const String idKey = r'id';

  static const String quantityKey = r'quantity';

  static const String receivedQuantityKey = r'received_quantity';

  static const String reasonIdKey = r'reason_id';

  static const String itemIdKey = r'item_id';

  static const String returnIdKey = r'return_id';

  static const String metadataKey = r'metadata';

  static const String orderIdKey = r'order_id';

  static const String createdAtKey = r'created_at';

  static const String updatedAtKey = r'updated_at';

  static const String damagedQuantityKey = r'damaged_quantity';
}
