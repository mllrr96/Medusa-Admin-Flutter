/// AdminBatchUpdateInventoryItemsLocationLevels
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
///         },
///         "id": {
///             "type": "string",
///             "description": "The update's ID.",
///             "title": "id"
///         }
///     },
///     "type": "object",
///     "required": [
///         "location_id",
///         "inventory_item_id"
///     ],
///     "description": "The details of an inventory level to update."
/// }
library;

import 'exports.dart';
part 'admin_batch_update_inventory_items_location_levels.freezed.dart';
part 'admin_batch_update_inventory_items_location_levels.g.dart'; // AdminBatchUpdateInventoryItemsLocationLevels

@freezed
abstract class AdminBatchUpdateInventoryItemsLocationLevels
    with _$AdminBatchUpdateInventoryItemsLocationLevels {
  const AdminBatchUpdateInventoryItemsLocationLevels._();

  @jsonSerializable
  const factory AdminBatchUpdateInventoryItemsLocationLevels({
    /// locationId
    @JsonKey(name: AdminBatchUpdateInventoryItemsLocationLevels.locationIdKey)
    required String locationId,

    /// inventoryItemId
    @JsonKey(
      name: AdminBatchUpdateInventoryItemsLocationLevels.inventoryItemIdKey,
    )
    required String inventoryItemId,

    /// stockedQuantity
    @JsonKey(
      name: AdminBatchUpdateInventoryItemsLocationLevels.stockedQuantityKey,
    )
    required double stockedQuantity,

    /// incomingQuantity
    @JsonKey(
      name: AdminBatchUpdateInventoryItemsLocationLevels.incomingQuantityKey,
    )
    required double incomingQuantity,

    /// id
    @JsonKey(name: AdminBatchUpdateInventoryItemsLocationLevels.idKey)
    required String id,
  }) = _AdminBatchUpdateInventoryItemsLocationLevels;

  factory AdminBatchUpdateInventoryItemsLocationLevels.fromJson(
    Map<String, dynamic> json,
  ) => _$AdminBatchUpdateInventoryItemsLocationLevelsFromJson(json);

  static const String locationIdKey = r'location_id';

  static const String inventoryItemIdKey = r'inventory_item_id';

  static const String stockedQuantityKey = r'stocked_quantity';

  static const String incomingQuantityKey = r'incoming_quantity';

  static const String idKey = r'id';
}
