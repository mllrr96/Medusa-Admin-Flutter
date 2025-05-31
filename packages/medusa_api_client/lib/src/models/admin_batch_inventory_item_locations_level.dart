/// AdminBatchInventoryItemLocationsLevel
/// {
///     "properties": {
///         "create": {
///             "type": "array",
///             "items": {
///                 "type": "object",
///                 "description": "The inventory level's details."
///             },
///             "description": "The inventory levels to create."
///         },
///         "update": {
///             "type": "array",
///             "items": {
///                 "type": "object",
///                 "description": "The inventory level's details."
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
///             "description": "The inventory levels to delete."
///         },
///         "force": {
///             "type": "boolean",
///             "description": "Whether to delete specified inventory levels even if they have a non-zero stocked quantity.",
///             "title": "force"
///         }
///     },
///     "type": "object",
///     "description": "The inventory levels to create, update, or delete."
/// }
library;

import 'exports.dart';
part 'admin_batch_inventory_item_locations_level.freezed.dart';
part 'admin_batch_inventory_item_locations_level.g.dart'; // AdminBatchInventoryItemLocationsLevel

@freezed
abstract class AdminBatchInventoryItemLocationsLevel
    with _$AdminBatchInventoryItemLocationsLevel {
  const AdminBatchInventoryItemLocationsLevel._();

  @jsonSerializable
  const factory AdminBatchInventoryItemLocationsLevel({
    /// create
    @JsonKey(name: AdminBatchInventoryItemLocationsLevel.createKey)
    required List<Map<String, dynamic>> create,

    /// update
    @JsonKey(name: AdminBatchInventoryItemLocationsLevel.updateKey)
    required List<Map<String, dynamic>> update,

    /// delete
    @JsonKey(name: AdminBatchInventoryItemLocationsLevel.deleteKey)
    required List<String> delete,

    /// force
    @JsonKey(name: AdminBatchInventoryItemLocationsLevel.forceKey)
    required bool force,
  }) = _AdminBatchInventoryItemLocationsLevel;

  factory AdminBatchInventoryItemLocationsLevel.fromJson(
    Map<String, dynamic> json,
  ) => _$AdminBatchInventoryItemLocationsLevelFromJson(json);

  static const String createKey = r'create';

  static const String updateKey = r'update';

  static const String deleteKey = r'delete';

  static const String forceKey = r'force';
}
