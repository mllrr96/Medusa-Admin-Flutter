/// AdminBatchCreateInventoryItemsLocationLevels
/// {
///     "properties": {
///         "location_id": {
///             "type": "string",
///             "description": "The ID of the associated stock location.",
///             "title": "location_id"
///         },
///         "inventory_item_id": {
///             "type": "string",
///             "description": "The ID of the associated inventory item.",
///             "title": "inventory_item_id"
///         },
///         "stocked_quantity": {
///             "type": "number",
///             "description": "The stocked quantity.",
///             "title": "stocked_quantity"
///         },
///         "incoming_quantity": {
///             "type": "number",
///             "description": "The incoming quantity to be added to stock.",
///             "title": "incoming_quantity"
///         }
///     },
///     "type": "object",
///     "required": [
///         "location_id",
///         "inventory_item_id"
///     ],
///     "description": "The details of an inventory level to create."
/// }
library;

import 'exports.dart';
part 'admin_batch_create_inventory_items_location_levels.freezed.dart';
part 'admin_batch_create_inventory_items_location_levels.g.dart'; // AdminBatchCreateInventoryItemsLocationLevels

@freezed
abstract class AdminBatchCreateInventoryItemsLocationLevels
    with _$AdminBatchCreateInventoryItemsLocationLevels {
  const AdminBatchCreateInventoryItemsLocationLevels._();

  @jsonSerializable
  const factory AdminBatchCreateInventoryItemsLocationLevels({
    /// locationId
    @JsonKey(name: AdminBatchCreateInventoryItemsLocationLevels.locationIdKey)
    required String locationId,

    /// inventoryItemId
    @JsonKey(
      name: AdminBatchCreateInventoryItemsLocationLevels.inventoryItemIdKey,
    )
    required String inventoryItemId,

    /// stockedQuantity
    @JsonKey(
      name: AdminBatchCreateInventoryItemsLocationLevels.stockedQuantityKey,
    )
    required double stockedQuantity,

    /// incomingQuantity
    @JsonKey(
      name: AdminBatchCreateInventoryItemsLocationLevels.incomingQuantityKey,
    )
    required double incomingQuantity,
  }) = _AdminBatchCreateInventoryItemsLocationLevels;

  factory AdminBatchCreateInventoryItemsLocationLevels.fromJson(
    Map<String, dynamic> json,
  ) => _$AdminBatchCreateInventoryItemsLocationLevelsFromJson(json);

  static const String locationIdKey = r'location_id';

  static const String inventoryItemIdKey = r'inventory_item_id';

  static const String stockedQuantityKey = r'stocked_quantity';

  static const String incomingQuantityKey = r'incoming_quantity';
}
