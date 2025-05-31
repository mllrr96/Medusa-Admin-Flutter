/// AdminBatchInventoryItemsLocationLevelsResponse
/// {
///     "properties": {
///         "created": {
///             "type": "array",
///             "items": {
///                 "$ref": "#/components/schemas/InventoryLevel"
///             },
///             "description": "The created inventory levels."
///         },
///         "updated": {
///             "type": "array",
///             "items": {
///                 "$ref": "#/components/schemas/InventoryLevel"
///             },
///             "description": "The updated inventory levels."
///         },
///         "deleted": {
///             "type": "array",
///             "items": {
///                 "type": "string",
///                 "description": "The ID of a deleted inventory level.",
///                 "title": "deleted"
///             },
///             "description": "The IDs of deleted inventory levels."
///         }
///     },
///     "type": "object",
///     "description": "The result of managing inventory levels."
/// }
library;

import 'exports.dart';
part 'admin_batch_inventory_items_location_levels_response.freezed.dart';
part 'admin_batch_inventory_items_location_levels_response.g.dart'; // AdminBatchInventoryItemsLocationLevelsResponse

@freezed
abstract class AdminBatchInventoryItemsLocationLevelsResponse
    with _$AdminBatchInventoryItemsLocationLevelsResponse {
  const AdminBatchInventoryItemsLocationLevelsResponse._();

  @jsonSerializable
  const factory AdminBatchInventoryItemsLocationLevelsResponse({
    /// created
    @JsonKey(name: AdminBatchInventoryItemsLocationLevelsResponse.createdKey)
    required List<InventoryLevel> created,

    /// updated
    @JsonKey(name: AdminBatchInventoryItemsLocationLevelsResponse.updatedKey)
    required List<InventoryLevel> updated,

    /// deleted
    @JsonKey(name: AdminBatchInventoryItemsLocationLevelsResponse.deletedKey)
    required List<String> deleted,
  }) = _AdminBatchInventoryItemsLocationLevelsResponse;

  factory AdminBatchInventoryItemsLocationLevelsResponse.fromJson(
    Map<String, dynamic> json,
  ) => _$AdminBatchInventoryItemsLocationLevelsResponseFromJson(json);

  static const String createdKey = r'created';

  static const String updatedKey = r'updated';

  static const String deletedKey = r'deleted';
}
