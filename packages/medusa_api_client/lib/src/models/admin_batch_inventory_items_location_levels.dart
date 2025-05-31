/// AdminBatchInventoryItemsLocationLevels
/// {
///     "properties": {
///         "create": {
///             "type": "array",
///             "items": {
///                 "$ref": "#/components/schemas/AdminBatchCreateInventoryItemsLocationLevels"
///             },
///             "description": "The inventory levels to create."
///         },
///         "update": {
///             "type": "array",
///             "items": {
///                 "$ref": "#/components/schemas/AdminBatchUpdateInventoryItemsLocationLevels"
///             },
///             "description": "The inventory levels to update."
///         },
///         "delete": {
///             "type": "array",
///             "items": {
///                 "type": "string",
///                 "description": "The ID of the inventory level to delete.",
///                 "title": "delete"
///             },
///             "description": "The IDs of the inventory levels to delete."
///         },
///         "force": {
///             "type": "boolean",
///             "description": "Whether to delete specified inventory levels even if they have a non-zero stocked quantity.",
///             "title": "force"
///         }
///     },
///     "type": "object",
///     "required": [
///         "create",
///         "update",
///         "delete"
///     ],
///     "description": "The inventory levels to manage."
/// }
library;

import 'exports.dart';
part 'admin_batch_inventory_items_location_levels.freezed.dart';
part 'admin_batch_inventory_items_location_levels.g.dart'; // AdminBatchInventoryItemsLocationLevels

@freezed
abstract class AdminBatchInventoryItemsLocationLevels
    with _$AdminBatchInventoryItemsLocationLevels {
  const AdminBatchInventoryItemsLocationLevels._();

  @jsonSerializable
  const factory AdminBatchInventoryItemsLocationLevels({
    /// create
    @JsonKey(name: AdminBatchInventoryItemsLocationLevels.createKey)
    required List<AdminBatchCreateInventoryItemsLocationLevels> create,

    /// update
    @JsonKey(name: AdminBatchInventoryItemsLocationLevels.updateKey)
    required List<AdminBatchUpdateInventoryItemsLocationLevels> update,

    /// delete
    @JsonKey(name: AdminBatchInventoryItemsLocationLevels.deleteKey)
    required List<String> delete,

    /// force
    @JsonKey(name: AdminBatchInventoryItemsLocationLevels.forceKey)
    required bool force,
  }) = _AdminBatchInventoryItemsLocationLevels;

  factory AdminBatchInventoryItemsLocationLevels.fromJson(
    Map<String, dynamic> json,
  ) => _$AdminBatchInventoryItemsLocationLevelsFromJson(json);

  static const String createKey = r'create';

  static const String updateKey = r'update';

  static const String deleteKey = r'delete';

  static const String forceKey = r'force';
}
