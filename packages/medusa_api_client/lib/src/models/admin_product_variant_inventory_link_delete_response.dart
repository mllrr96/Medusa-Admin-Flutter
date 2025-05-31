/// AdminProductVariantInventoryLinkDeleteResponse
/// {
///     "properties": {
///         "id": {
///             "$ref": "#/components/schemas/AdminProductVariantInventoryLink"
///         },
///         "object": {
///             "type": "string",
///             "description": "The name of the deleted object.",
///             "default": "variant-inventory-item-link",
///             "title": "object"
///         },
///         "deleted": {
///             "type": "boolean",
///             "description": "Whether the association was deleted.",
///             "title": "deleted"
///         },
///         "parent": {
///             "$ref": "#/components/schemas/AdminProductVariant"
///         }
///     },
///     "type": "object",
///     "required": [
///         "id",
///         "object",
///         "deleted",
///         "parent"
///     ],
///     "description": "The details of the deleted associated between a product variant and an inventory item."
/// }
library;

import 'exports.dart';
part 'admin_product_variant_inventory_link_delete_response.freezed.dart';
part 'admin_product_variant_inventory_link_delete_response.g.dart'; // AdminProductVariantInventoryLinkDeleteResponse

@freezed
abstract class AdminProductVariantInventoryLinkDeleteResponse
    with _$AdminProductVariantInventoryLinkDeleteResponse {
  const AdminProductVariantInventoryLinkDeleteResponse._();

  @jsonSerializable
  const factory AdminProductVariantInventoryLinkDeleteResponse({
    /// id
    @JsonKey(name: AdminProductVariantInventoryLinkDeleteResponse.idKey)
    required AdminProductVariantInventoryLink id,

    /// object
    @Default('variant-inventory-item-link')
    @JsonKey(name: AdminProductVariantInventoryLinkDeleteResponse.objectKey)
    String object,

    /// deleted
    @JsonKey(name: AdminProductVariantInventoryLinkDeleteResponse.deletedKey)
    required bool deleted,

    /// parent
    @JsonKey(name: AdminProductVariantInventoryLinkDeleteResponse.parentKey)
    required AdminProductVariant parent,
  }) = _AdminProductVariantInventoryLinkDeleteResponse;

  factory AdminProductVariantInventoryLinkDeleteResponse.fromJson(
    Map<String, dynamic> json,
  ) => _$AdminProductVariantInventoryLinkDeleteResponseFromJson(json);

  static const String idKey = r'id';

  static const String objectKey = r'object';

  static const String deletedKey = r'deleted';

  static const String parentKey = r'parent';
}
