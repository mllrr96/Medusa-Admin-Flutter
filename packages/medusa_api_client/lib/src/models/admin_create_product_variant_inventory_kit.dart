/// AdminCreateProductVariantInventoryKit
/// {
///     "properties": {
///         "inventory_item_id": {
///             "type": "string",
///             "description": "The inventory item's ID.",
///             "title": "inventory_item_id"
///         },
///         "required_quantity": {
///             "type": "number",
///             "description": "The number of units a single quantity is equivalent to. For example, if a customer orders one quantity of the variant, Medusa checks the availability of the quantity multiplied by the value set for `required_quantity`. When the customer orders the quantity, Medusa reserves the ordered quantity multiplied by the value set for `required_quantity`.",
///             "title": "required_quantity"
///         }
///     },
///     "type": "object",
///     "required": [
///         "inventory_item_id"
///     ],
///     "description": "The details of a variant's inventory item."
/// }
library;

import 'exports.dart';
part 'admin_create_product_variant_inventory_kit.freezed.dart';
part 'admin_create_product_variant_inventory_kit.g.dart'; // AdminCreateProductVariantInventoryKit

@freezed
abstract class AdminCreateProductVariantInventoryKit
    with _$AdminCreateProductVariantInventoryKit {
  const AdminCreateProductVariantInventoryKit._();

  @jsonSerializable
  const factory AdminCreateProductVariantInventoryKit({
    /// inventoryItemId
    @JsonKey(name: AdminCreateProductVariantInventoryKit.inventoryItemIdKey)
    required String inventoryItemId,

    /// requiredQuantity
    @JsonKey(name: AdminCreateProductVariantInventoryKit.requiredQuantityKey)
    required double requiredQuantity,
  }) = _AdminCreateProductVariantInventoryKit;

  factory AdminCreateProductVariantInventoryKit.fromJson(
    Map<String, dynamic> json,
  ) => _$AdminCreateProductVariantInventoryKitFromJson(json);

  static const String inventoryItemIdKey = r'inventory_item_id';

  static const String requiredQuantityKey = r'required_quantity';
}
