/// InventoryLevel
/// {
///     "properties": {
///         "id": {
///             "type": "string",
///             "description": "The inventory level's ID.",
///             "title": "id"
///         },
///         "inventory_item_id": {
///             "type": "string",
///             "description": "The ID of the associated inventory item.",
///             "title": "inventory_item_id"
///         },
///         "location_id": {
///             "type": "string",
///             "description": "The ID of the associated location.",
///             "title": "location_id"
///         },
///         "stocked_quantity": {
///             "type": "number",
///             "description": "The inventory level's stocked quantity.",
///             "title": "stocked_quantity"
///         },
///         "reserved_quantity": {
///             "type": "number",
///             "description": "The inventory level's reserved quantity.",
///             "title": "reserved_quantity"
///         },
///         "available_quantity": {
///             "type": "number",
///             "description": "The inventory level's available quantity.",
///             "title": "available_quantity"
///         },
///         "incoming_quantity": {
///             "type": "number",
///             "description": "The inventory level's incoming quantity.",
///             "title": "incoming_quantity"
///         },
///         "metadata": {
///             "type": "object",
///             "description": "The inventory level's metadata, can hold custom key-value pairs."
///         }
///     },
///     "type": "object",
///     "required": [
///         "id",
///         "inventory_item_id",
///         "location_id",
///         "stocked_quantity",
///         "reserved_quantity",
///         "available_quantity",
///         "incoming_quantity"
///     ],
///     "description": "The inventory level's details"
/// }
library inventory_level;

import 'exports.dart';
part 'inventory_level.freezed.dart';
part 'inventory_level.g.dart'; // InventoryLevel

@freezed
abstract class InventoryLevel with _$InventoryLevel {
  const InventoryLevel._();

  @jsonSerializable
  const factory InventoryLevel({
    /// id
    @JsonKey(name: InventoryLevel.idKey) required String id,

    /// inventoryItemId
    @JsonKey(name: InventoryLevel.inventoryItemIdKey)
    required String inventoryItemId,

    /// locationId
    @JsonKey(name: InventoryLevel.locationIdKey) required String locationId,

    /// stockedQuantity
    @JsonKey(name: InventoryLevel.stockedQuantityKey)
    required double stockedQuantity,

    /// reservedQuantity
    @JsonKey(name: InventoryLevel.reservedQuantityKey)
    required double reservedQuantity,

    /// availableQuantity
    @JsonKey(name: InventoryLevel.availableQuantityKey)
    required double availableQuantity,

    /// incomingQuantity
    @JsonKey(name: InventoryLevel.incomingQuantityKey)
    required double incomingQuantity,

    /// metadata
    @JsonKey(name: InventoryLevel.metadataKey)
    required Map<String, dynamic> metadata,
  }) = _InventoryLevel;

  factory InventoryLevel.fromJson(Map<String, dynamic> json) =>
      _$InventoryLevelFromJson(json);

  static const String idKey = r'id';

  static const String inventoryItemIdKey = r'inventory_item_id';

  static const String locationIdKey = r'location_id';

  static const String stockedQuantityKey = r'stocked_quantity';

  static const String reservedQuantityKey = r'reserved_quantity';

  static const String availableQuantityKey = r'available_quantity';

  static const String incomingQuantityKey = r'incoming_quantity';

  static const String metadataKey = r'metadata';
}
