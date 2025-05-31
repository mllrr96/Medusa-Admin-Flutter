/// AdminUpdateVariantInventoryItem
/// {
///     "properties": {
///         "required_quantity": {
///             "type": "number",
///             "description": "The number of units a single quantity is equivalent to. For example, if a customer orders one quantity of the variant, Medusa checks the availability of the quantity multiplied by the value set for `required_quantity`. When the customer orders the quantity, Medusa reserves the ordered quantity multiplied by the value set for `required_quantity`.",
///             "title": "required_quantity"
///         }
///     },
///     "type": "object",
///     "required": [
///         "required_quantity"
///     ],
///     "description": "The properties to update of the variant's inventory item association."
/// }
library;

import 'exports.dart';
part 'admin_update_variant_inventory_item.freezed.dart';
part 'admin_update_variant_inventory_item.g.dart'; // AdminUpdateVariantInventoryItem

@freezed
abstract class AdminUpdateVariantInventoryItem
    with _$AdminUpdateVariantInventoryItem {
  const AdminUpdateVariantInventoryItem._();

  @jsonSerializable
  const factory AdminUpdateVariantInventoryItem({
    /// requiredQuantity
    @JsonKey(name: AdminUpdateVariantInventoryItem.requiredQuantityKey)
    required double requiredQuantity,
  }) = _AdminUpdateVariantInventoryItem;

  factory AdminUpdateVariantInventoryItem.fromJson(Map<String, dynamic> json) =>
      _$AdminUpdateVariantInventoryItemFromJson(json);

  static const String requiredQuantityKey = r'required_quantity';
}
