/// AdminProductVariantInventoryLink
/// {
///     "properties": {
///         "Product": {
///             "type": "object",
///             "description": "The product variant's details."
///         },
///         "Inventory": {
///             "type": "object",
///             "description": "The inventory item's details."
///         }
///     },
///     "type": "object",
///     "required": [
///         "Product",
///         "Inventory"
///     ],
///     "description": "The details of an association between a product variant and an inventory item."
/// }
library;

import 'exports.dart';
part 'admin_product_variant_inventory_link.freezed.dart';
part 'admin_product_variant_inventory_link.g.dart'; // AdminProductVariantInventoryLink

@freezed
abstract class AdminProductVariantInventoryLink
    with _$AdminProductVariantInventoryLink {
  const AdminProductVariantInventoryLink._();

  @jsonSerializable
  const factory AdminProductVariantInventoryLink({
    /// product
    @JsonKey(name: AdminProductVariantInventoryLink.productKey)
    required Map<String, dynamic> product,

    /// inventory
    @JsonKey(name: AdminProductVariantInventoryLink.inventoryKey)
    required Map<String, dynamic> inventory,
  }) = _AdminProductVariantInventoryLink;

  factory AdminProductVariantInventoryLink.fromJson(
    Map<String, dynamic> json,
  ) => _$AdminProductVariantInventoryLinkFromJson(json);

  static const String productKey = r'Product';

  static const String inventoryKey = r'Inventory';
}
