/// AdminInventoryLevel
/// {
///     "properties": {
///         "id": {
///             "type": "string",
///             "description": "The location level's ID.",
///             "title": "id"
///         },
///         "created_at": {
///             "type": "string",
///             "format": "date-time",
///             "description": "The location level's created at.",
///             "title": "created_at"
///         },
///         "updated_at": {
///             "type": "string",
///             "format": "date-time",
///             "description": "The location level's updated at.",
///             "title": "updated_at"
///         },
///         "deleted_at": {
///             "type": "string",
///             "format": "date-time",
///             "description": "The location level's deleted at.",
///             "title": "deleted_at"
///         },
///         "inventory_item_id": {
///             "type": "string",
///             "description": "The location level's inventory item id.",
///             "title": "inventory_item_id"
///         },
///         "location_id": {
///             "type": "string",
///             "description": "The location level's location id.",
///             "title": "location_id"
///         },
///         "stocked_quantity": {
///             "type": "number",
///             "description": "The location level's stocked quantity.",
///             "title": "stocked_quantity"
///         },
///         "reserved_quantity": {
///             "type": "number",
///             "description": "The location level's reserved quantity.",
///             "title": "reserved_quantity"
///         },
///         "incoming_quantity": {
///             "type": "number",
///             "description": "The location level's incoming quantity.",
///             "title": "incoming_quantity"
///         },
///         "metadata": {
///             "type": "object",
///             "description": "The location level's metadata."
///         },
///         "inventory_item": {
///             "type": "object"
///         },
///         "available_quantity": {
///             "type": "number",
///             "description": "The location level's available quantity.",
///             "title": "available_quantity"
///         }
///     },
///     "type": "object",
///     "required": [
///         "id",
///         "created_at",
///         "updated_at",
///         "deleted_at",
///         "inventory_item_id",
///         "location_id",
///         "stocked_quantity",
///         "reserved_quantity",
///         "incoming_quantity",
///         "metadata",
///         "available_quantity"
///     ],
///     "description": "The location level's location levels."
/// }
library;

import 'exports.dart';
part 'admin_inventory_level.freezed.dart';
part 'admin_inventory_level.g.dart'; // AdminInventoryLevel

@freezed
abstract class AdminInventoryLevel with _$AdminInventoryLevel {
  const AdminInventoryLevel._();

  @jsonSerializable
  const factory AdminInventoryLevel({
    /// id
    @JsonKey(name: AdminInventoryLevel.idKey) required String id,

    /// createdAt
    @JsonKey(name: AdminInventoryLevel.createdAtKey)
    required DateTime createdAt,

    /// updatedAt
    @JsonKey(name: AdminInventoryLevel.updatedAtKey)
    required DateTime updatedAt,

    /// deletedAt
    @JsonKey(name: AdminInventoryLevel.deletedAtKey)
    required DateTime deletedAt,

    /// inventoryItemId
    @JsonKey(name: AdminInventoryLevel.inventoryItemIdKey)
    required String inventoryItemId,

    /// locationId
    @JsonKey(name: AdminInventoryLevel.locationIdKey)
    required String locationId,

    /// stockedQuantity
    @JsonKey(name: AdminInventoryLevel.stockedQuantityKey)
    required double stockedQuantity,

    /// reservedQuantity
    @JsonKey(name: AdminInventoryLevel.reservedQuantityKey)
    required double reservedQuantity,

    /// incomingQuantity
    @JsonKey(name: AdminInventoryLevel.incomingQuantityKey)
    required double incomingQuantity,

    /// metadata
    @JsonKey(name: AdminInventoryLevel.metadataKey)
    required Map<String, dynamic> metadata,

    /// inventoryItem
    @JsonKey(name: AdminInventoryLevel.inventoryItemKey)
    required Map<String, dynamic> inventoryItem,

    /// availableQuantity
    @JsonKey(name: AdminInventoryLevel.availableQuantityKey)
    required double availableQuantity,
  }) = _AdminInventoryLevel;

  factory AdminInventoryLevel.fromJson(Map<String, dynamic> json) =>
      _$AdminInventoryLevelFromJson(json);

  static const String idKey = r'id';

  static const String createdAtKey = r'created_at';

  static const String updatedAtKey = r'updated_at';

  static const String deletedAtKey = r'deleted_at';

  static const String inventoryItemIdKey = r'inventory_item_id';

  static const String locationIdKey = r'location_id';

  static const String stockedQuantityKey = r'stocked_quantity';

  static const String reservedQuantityKey = r'reserved_quantity';

  static const String incomingQuantityKey = r'incoming_quantity';

  static const String metadataKey = r'metadata';

  static const String inventoryItemKey = r'inventory_item';

  static const String availableQuantityKey = r'available_quantity';
}
