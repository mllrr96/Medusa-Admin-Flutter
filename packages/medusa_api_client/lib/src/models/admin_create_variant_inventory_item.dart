/// AdminCreateVariantInventoryItem
/// {
///     "properties": {
///         "required_quantity": {
///             "type": "number",
///             "description": "The quantity of the variant in the inventory item.",
///             "title": "required_quantity"
///         },
///         "inventory_item_id": {
///             "type": "string",
///             "description": "The inventory item's ID.",
///             "title": "inventory_item_id"
///         }
///     },
///     "type": "object",
///     "required": [
///         "inventory_item_id",
///         "required_quantity"
///     ],
///     "description": "The details of the variant-inventory item association."
/// }
library;

import 'exports.dart';
part 'admin_create_variant_inventory_item.freezed.dart';
part 'admin_create_variant_inventory_item.g.dart'; // AdminCreateVariantInventoryItem

@freezed
abstract class AdminCreateVariantInventoryItem
    with _$AdminCreateVariantInventoryItem {
  const AdminCreateVariantInventoryItem._();

  @jsonSerializable
  const factory AdminCreateVariantInventoryItem({
    /// requiredQuantity
    @JsonKey(name: AdminCreateVariantInventoryItem.requiredQuantityKey)
    required double requiredQuantity,

    /// inventoryItemId
    @JsonKey(name: AdminCreateVariantInventoryItem.inventoryItemIdKey)
    required String inventoryItemId,
  }) = _AdminCreateVariantInventoryItem;

  factory AdminCreateVariantInventoryItem.fromJson(Map<String, dynamic> json) =>
      _$AdminCreateVariantInventoryItemFromJson(json);

  static const String requiredQuantityKey = r'required_quantity';

  static const String inventoryItemIdKey = r'inventory_item_id';
}
