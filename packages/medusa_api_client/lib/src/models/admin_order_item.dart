/// AdminOrderItem
/// {
///     "properties": {
///         "order_id": {
///             "type": "string",
///             "description": "The ID of the order this item belongs to.",
///             "title": "order_id"
///         },
///         "item_id": {
///             "type": "string",
///             "description": "The ID of the associated line item.",
///             "title": "item_id"
///         },
///         "version": {
///             "type": "number",
///             "description": "The order item's version.",
///             "title": "version"
///         },
///         "history": {
///             "type": "object",
///             "description": "The order item's history."
///         },
///         "item": {
///             "$ref": "#/components/schemas/AdminOrderLineItem"
///         }
///     },
///     "type": "object",
///     "required": [
///         "order_id",
///         "item_id",
///         "version",
///         "history",
///         "item"
///     ],
///     "description": "The order item's details."
/// }
library;

import 'exports.dart';
part 'admin_order_item.freezed.dart';
part 'admin_order_item.g.dart'; // AdminOrderItem

@freezed
abstract class AdminOrderItem with _$AdminOrderItem {
  const AdminOrderItem._();

  @jsonSerializable
  const factory AdminOrderItem({
    /// orderId
    @JsonKey(name: AdminOrderItem.orderIdKey) required String orderId,

    /// itemId
    @JsonKey(name: AdminOrderItem.itemIdKey) required String itemId,

    /// version
    @JsonKey(name: AdminOrderItem.versionKey) required double version,

    /// history
    @JsonKey(name: AdminOrderItem.historyKey)
    required Map<String, dynamic> history,

    /// item
    @JsonKey(name: AdminOrderItem.itemKey) required AdminOrderLineItem item,
  }) = _AdminOrderItem;

  factory AdminOrderItem.fromJson(Map<String, dynamic> json) =>
      _$AdminOrderItemFromJson(json);

  static const String orderIdKey = r'order_id';

  static const String itemIdKey = r'item_id';

  static const String versionKey = r'version';

  static const String historyKey = r'history';

  static const String itemKey = r'item';
}
