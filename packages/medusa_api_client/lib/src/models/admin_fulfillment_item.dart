/// AdminFulfillmentItem
/// {
///     "properties": {
///         "id": {
///             "type": "string",
///             "description": "The item's ID.",
///             "title": "id"
///         },
///         "title": {
///             "type": "string",
///             "description": "The item's title.",
///             "title": "title"
///         },
///         "quantity": {
///             "type": "number",
///             "description": "The item's quantity to be fulfilled.",
///             "title": "quantity"
///         },
///         "sku": {
///             "type": "string",
///             "description": "The item's SKU.",
///             "title": "sku"
///         },
///         "barcode": {
///             "type": "string",
///             "description": "The item's barcode.",
///             "title": "barcode"
///         },
///         "line_item_id": {
///             "type": "string",
///             "description": "The ID of the order's line item to be fulfilled.",
///             "title": "line_item_id"
///         },
///         "inventory_item_id": {
///             "type": "string",
///             "description": "The ID of the inventory item of the underlying product variant.",
///             "title": "inventory_item_id"
///         },
///         "fulfillment_id": {
///             "type": "string",
///             "description": "The ID of the fulfillment the item belongs to.",
///             "title": "fulfillment_id"
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
///         "deleted_at": {
///             "type": "string",
///             "format": "date-time",
///             "description": "The date the item was deleted.",
///             "title": "deleted_at"
///         }
///     },
///     "type": "object",
///     "required": [
///         "id",
///         "title",
///         "quantity",
///         "sku",
///         "barcode",
///         "line_item_id",
///         "inventory_item_id",
///         "fulfillment_id",
///         "created_at",
///         "updated_at",
///         "deleted_at"
///     ],
///     "description": "The details of a fulfillment's item."
/// }
library;

import 'exports.dart';
part 'admin_fulfillment_item.freezed.dart';
part 'admin_fulfillment_item.g.dart'; // AdminFulfillmentItem

@freezed
abstract class AdminFulfillmentItem with _$AdminFulfillmentItem {
  const AdminFulfillmentItem._();

  @jsonSerializable
  const factory AdminFulfillmentItem({
    /// id
    @JsonKey(name: AdminFulfillmentItem.idKey) required String id,

    /// title
    @JsonKey(name: AdminFulfillmentItem.titleKey) required String title,

    /// quantity
    @JsonKey(name: AdminFulfillmentItem.quantityKey) required double quantity,

    /// sku
    @JsonKey(name: AdminFulfillmentItem.skuKey) required String sku,

    /// barcode
    @JsonKey(name: AdminFulfillmentItem.barcodeKey) required String barcode,

    /// lineItemId
    @JsonKey(name: AdminFulfillmentItem.lineItemIdKey)
    required String lineItemId,

    /// inventoryItemId
    @JsonKey(name: AdminFulfillmentItem.inventoryItemIdKey)
    required String inventoryItemId,

    /// fulfillmentId
    @JsonKey(name: AdminFulfillmentItem.fulfillmentIdKey)
    required String fulfillmentId,

    /// createdAt
    @JsonKey(name: AdminFulfillmentItem.createdAtKey)
    required DateTime createdAt,

    /// updatedAt
    @JsonKey(name: AdminFulfillmentItem.updatedAtKey)
    required DateTime updatedAt,

    /// deletedAt
    @JsonKey(name: AdminFulfillmentItem.deletedAtKey)
    required DateTime deletedAt,
  }) = _AdminFulfillmentItem;

  factory AdminFulfillmentItem.fromJson(Map<String, dynamic> json) =>
      _$AdminFulfillmentItemFromJson(json);

  static const String idKey = r'id';

  static const String titleKey = r'title';

  static const String quantityKey = r'quantity';

  static const String skuKey = r'sku';

  static const String barcodeKey = r'barcode';

  static const String lineItemIdKey = r'line_item_id';

  static const String inventoryItemIdKey = r'inventory_item_id';

  static const String fulfillmentIdKey = r'fulfillment_id';

  static const String createdAtKey = r'created_at';

  static const String updatedAtKey = r'updated_at';

  static const String deletedAtKey = r'deleted_at';
}
