/// AdminBatchProductVariantResponse
/// {
///     "properties": {
///         "created": {
///             "type": "array",
///             "items": {
///                 "$ref": "#/components/schemas/AdminProductVariant"
///             },
///             "description": "The created product variants."
///         },
///         "updated": {
///             "type": "array",
///             "items": {
///                 "$ref": "#/components/schemas/AdminProductVariant"
///             },
///             "description": "The updated product variants."
///         },
///         "deleted": {
///             "type": "object",
///             "description": "The details of the deleted product variants."
///         }
///     },
///     "type": "object",
///     "required": [
///         "created",
///         "updated",
///         "deleted"
///     ],
///     "description": "The details of the product variants created, updated, or deleted."
/// }
library;

import 'exports.dart';
part 'admin_batch_product_variant_response.freezed.dart';
part 'admin_batch_product_variant_response.g.dart'; // AdminBatchProductVariantResponse

@freezed
abstract class AdminBatchProductVariantResponse
    with _$AdminBatchProductVariantResponse {
  const AdminBatchProductVariantResponse._();

  @jsonSerializable
  const factory AdminBatchProductVariantResponse({
    /// created
    @JsonKey(name: AdminBatchProductVariantResponse.createdKey)
    required List<AdminProductVariant> created,

    /// updated
    @JsonKey(name: AdminBatchProductVariantResponse.updatedKey)
    required List<AdminProductVariant> updated,

    /// deleted
    @JsonKey(name: AdminBatchProductVariantResponse.deletedKey)
    required Map<String, dynamic> deleted,
  }) = _AdminBatchProductVariantResponse;

  factory AdminBatchProductVariantResponse.fromJson(
    Map<String, dynamic> json,
  ) => _$AdminBatchProductVariantResponseFromJson(json);

  static const String createdKey = r'created';

  static const String updatedKey = r'updated';

  static const String deletedKey = r'deleted';
}
