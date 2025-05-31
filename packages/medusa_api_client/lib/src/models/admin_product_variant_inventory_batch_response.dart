/// AdminProductVariantInventoryBatchResponse
/// {
///     "properties": {
///         "created": {
///             "oneOf": [
///                 {
///                     "$ref": "#/components/schemas/AdminProductVariantInventoryLink"
///                 },
///                 {
///                     "type": "array",
///                     "items": {
///                         "type": "object",
///                         "description": "A created association between a product variant and an inventory item."
///                     },
///                     "description": "The created associations between product variants and inventory items."
///                 }
///             ]
///         },
///         "updated": {
///             "oneOf": [
///                 {
///                     "$ref": "#/components/schemas/AdminProductVariantInventoryLink"
///                 },
///                 {
///                     "type": "array",
///                     "items": {
///                         "type": "object",
///                         "description": "An updated association between a product variant and an inventory item."
///                     },
///                     "description": "The updated associations between product variants and inventory items."
///                 }
///             ]
///         },
///         "deleted": {
///             "oneOf": [
///                 {
///                     "$ref": "#/components/schemas/AdminProductVariantInventoryLink"
///                 },
///                 {
///                     "type": "array",
///                     "items": {
///                         "type": "object",
///                         "description": "An deleted association between a product variant and an inventory item."
///                     },
///                     "description": "The deleted associations between product variants and inventory items."
///                 }
///             ]
///         }
///     },
///     "type": "object",
///     "required": [
///         "created",
///         "updated",
///         "deleted"
///     ],
///     "description": "The created, updated, and deleted associations between variants and inventory items."
/// }
library;

import 'exports.dart';
part 'admin_product_variant_inventory_batch_response.freezed.dart';
part 'admin_product_variant_inventory_batch_response.g.dart'; // AdminProductVariantInventoryBatchResponse

@freezed
abstract class AdminProductVariantInventoryBatchResponse
    with _$AdminProductVariantInventoryBatchResponse {
  const AdminProductVariantInventoryBatchResponse._();

  @jsonSerializable
  const factory AdminProductVariantInventoryBatchResponse({
    /// created
    @JsonKey(name: AdminProductVariantInventoryBatchResponse.createdKey)
    required dynamic created,

    /// updated
    @JsonKey(name: AdminProductVariantInventoryBatchResponse.updatedKey)
    required dynamic updated,

    /// deleted
    @JsonKey(name: AdminProductVariantInventoryBatchResponse.deletedKey)
    required dynamic deleted,
  }) = _AdminProductVariantInventoryBatchResponse;

  factory AdminProductVariantInventoryBatchResponse.fromJson(
    Map<String, dynamic> json,
  ) => _$AdminProductVariantInventoryBatchResponseFromJson(json);

  static const String createdKey = r'created';

  static const String updatedKey = r'updated';

  static const String deletedKey = r'deleted';
}
