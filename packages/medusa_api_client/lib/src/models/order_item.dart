/// OrderItem
/// {
///     "properties": {
///         "id": {
///             "type": "string",
///             "description": "The item's ID.",
///             "title": "id"
///         },
///         "item_id": {
///             "type": "string",
///             "description": "The ID of the associated line item.",
///             "title": "item_id"
///         },
///         "item": {
///             "type": "object"
///         },
///         "quantity": {
///             "type": "number",
///             "description": "The item's quantity.",
///             "title": "quantity"
///         },
///         "fulfilled_quantity": {
///             "type": "number",
///             "description": "The item's fulfilled quantity.",
///             "title": "fulfilled_quantity"
///         },
///         "delivered_quantity": {
///             "type": "number",
///             "description": "The item's delivered quantity.",
///             "title": "delivered_quantity"
///         },
///         "shipped_quantity": {
///             "type": "number",
///             "description": "The item's shipped quantity.",
///             "title": "shipped_quantity"
///         },
///         "return_requested_quantity": {
///             "type": "number",
///             "description": "The item's quantity that's requested to be returned.",
///             "title": "return_requested_quantity"
///         },
///         "return_received_quantity": {
///             "type": "number",
///             "description": "The item's quantity that's received through a return.",
///             "title": "return_received_quantity"
///         },
///         "return_dismissed_quantity": {
///             "type": "number",
///             "description": "The item's quantity that's returned but dismissed because it's damaged.",
///             "title": "return_dismissed_quantity"
///         },
///         "written_off_quantity": {
///             "type": "number",
///             "description": "The item's quantity that's removed due to an order change.",
///             "title": "written_off_quantity"
///         },
///         "metadata": {
///             "type": "object",
///             "description": "The item's metadata, can hold custom key-value pairs."
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
///         }
///     },
///     "type": "object",
///     "required": [
///         "id",
///         "item_id",
///         "item",
///         "quantity",
///         "fulfilled_quantity",
///         "delivered_quantity",
///         "shipped_quantity",
///         "return_requested_quantity",
///         "return_received_quantity",
///         "return_dismissed_quantity",
///         "written_off_quantity",
///         "metadata",
///         "created_at",
///         "updated_at"
///     ],
///     "description": "The order item's detail."
/// }
library;

import 'exports.dart';
part 'order_item.freezed.dart';
part 'order_item.g.dart'; // OrderItem

@freezed
abstract class OrderItem with _$OrderItem {
  const OrderItem._();

  @jsonSerializable
  const factory OrderItem({
    /// id
    @JsonKey(name: OrderItem.idKey) required String id,

    /// itemId
    @JsonKey(name: OrderItem.itemIdKey) required String itemId,

    /// item
    @JsonKey(name: OrderItem.itemKey) required Map<String, dynamic> item,

    /// quantity
    @JsonKey(name: OrderItem.quantityKey) required double quantity,

    /// fulfilledQuantity
    @JsonKey(name: OrderItem.fulfilledQuantityKey)
    required double fulfilledQuantity,

    /// deliveredQuantity
    @JsonKey(name: OrderItem.deliveredQuantityKey)
    required double deliveredQuantity,

    /// shippedQuantity
    @JsonKey(name: OrderItem.shippedQuantityKey)
    required double shippedQuantity,

    /// returnRequestedQuantity
    @JsonKey(name: OrderItem.returnRequestedQuantityKey)
    required double returnRequestedQuantity,

    /// returnReceivedQuantity
    @JsonKey(name: OrderItem.returnReceivedQuantityKey)
    required double returnReceivedQuantity,

    /// returnDismissedQuantity
    @JsonKey(name: OrderItem.returnDismissedQuantityKey)
    required double returnDismissedQuantity,

    /// writtenOffQuantity
    @JsonKey(name: OrderItem.writtenOffQuantityKey)
    required double writtenOffQuantity,

    /// metadata
    @JsonKey(name: OrderItem.metadataKey)
    required Map<String, dynamic> metadata,

    /// createdAt
    @JsonKey(name: OrderItem.createdAtKey) required DateTime createdAt,

    /// updatedAt
    @JsonKey(name: OrderItem.updatedAtKey) required DateTime updatedAt,
  }) = _OrderItem;

  factory OrderItem.fromJson(Map<String, dynamic> json) =>
      _$OrderItemFromJson(json);

  static const String idKey = r'id';

  static const String itemIdKey = r'item_id';

  static const String itemKey = r'item';

  static const String quantityKey = r'quantity';

  static const String fulfilledQuantityKey = r'fulfilled_quantity';

  static const String deliveredQuantityKey = r'delivered_quantity';

  static const String shippedQuantityKey = r'shipped_quantity';

  static const String returnRequestedQuantityKey = r'return_requested_quantity';

  static const String returnReceivedQuantityKey = r'return_received_quantity';

  static const String returnDismissedQuantityKey = r'return_dismissed_quantity';

  static const String writtenOffQuantityKey = r'written_off_quantity';

  static const String metadataKey = r'metadata';

  static const String createdAtKey = r'created_at';

  static const String updatedAtKey = r'updated_at';
}
