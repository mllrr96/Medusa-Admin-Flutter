/// AdminProductVariantInventoryItemLink
/// {
///     "properties": {
///         "id": {
///             "type": "string",
///             "description": "The ID of the association.",
///             "title": "id"
///         },
///         "variant_id": {
///             "type": "string",
///             "description": "The associated product variant's ID.",
///             "title": "variant_id"
///         },
///         "variant": {
///             "type": "object"
///         },
///         "inventory_item_id": {
///             "type": "string",
///             "description": "The associated inventory item's ID.",
///             "title": "inventory_item_id"
///         },
///         "inventory": {
///             "$ref": "#/components/schemas/AdminInventoryItem"
///         }
///     },
///     "type": "object",
///     "required": [
///         "id",
///         "variant_id",
///         "inventory_item_id"
///     ],
///     "description": "An association between a product variant and an inventory item."
/// }
library;

import 'exports.dart';
part 'admin_product_variant_inventory_item_link.freezed.dart';
part 'admin_product_variant_inventory_item_link.g.dart'; // AdminProductVariantInventoryItemLink

@freezed
abstract class AdminProductVariantInventoryItemLink
    with _$AdminProductVariantInventoryItemLink {
  const AdminProductVariantInventoryItemLink._();

  @jsonSerializable
  const factory AdminProductVariantInventoryItemLink({
    /// id
    @JsonKey(name: AdminProductVariantInventoryItemLink.idKey)
    required String id,

    /// variantId
    @JsonKey(name: AdminProductVariantInventoryItemLink.variantIdKey)
    required String variantId,

    /// variant
    @JsonKey(name: AdminProductVariantInventoryItemLink.variantKey)
    required Map<String, dynamic> variant,

    /// inventoryItemId
    @JsonKey(name: AdminProductVariantInventoryItemLink.inventoryItemIdKey)
    required String inventoryItemId,

    /// inventory
    @JsonKey(name: AdminProductVariantInventoryItemLink.inventoryKey)
    required AdminInventoryItem inventory,
  }) = _AdminProductVariantInventoryItemLink;

  factory AdminProductVariantInventoryItemLink.fromJson(
    Map<String, dynamic> json,
  ) => _$AdminProductVariantInventoryItemLinkFromJson(json);

  static const String idKey = r'id';

  static const String variantIdKey = r'variant_id';

  static const String variantKey = r'variant';

  static const String inventoryItemIdKey = r'inventory_item_id';

  static const String inventoryKey = r'inventory';
}
