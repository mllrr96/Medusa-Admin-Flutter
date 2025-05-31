/// AdminInventoryItemResponse
/// {
///     "properties": {
///         "inventory_item": {
///             "$ref": "#/components/schemas/AdminInventoryItem"
///         }
///     },
///     "type": "object",
///     "required": [
///         "inventory_item"
///     ],
///     "description": "The inventory item's details."
/// }
library;

import 'exports.dart';
part 'admin_inventory_item_response.freezed.dart';
part 'admin_inventory_item_response.g.dart'; // AdminInventoryItemResponse

@freezed
abstract class AdminInventoryItemResponse with _$AdminInventoryItemResponse {
  const AdminInventoryItemResponse._();

  @jsonSerializable
  const factory AdminInventoryItemResponse({
    /// inventoryItem
    @JsonKey(name: AdminInventoryItemResponse.inventoryItemKey)
    required AdminInventoryItem inventoryItem,
  }) = _AdminInventoryItemResponse;

  factory AdminInventoryItemResponse.fromJson(Map<String, dynamic> json) =>
      _$AdminInventoryItemResponseFromJson(json);

  static const String inventoryItemKey = r'inventory_item';
}
