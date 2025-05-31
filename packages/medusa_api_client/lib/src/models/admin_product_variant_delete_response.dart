/// AdminProductVariantDeleteResponse
/// {
///     "properties": {
///         "id": {
///             "type": "string",
///             "description": "The product variant's ID.",
///             "title": "id"
///         },
///         "object": {
///             "type": "string",
///             "description": "The name of the deleted object.",
///             "title": "object"
///         },
///         "deleted": {
///             "type": "boolean",
///             "description": "Whether the product variant was deleted.",
///             "default": "variant",
///             "title": "deleted"
///         },
///         "parent": {
///             "$ref": "#/components/schemas/AdminProduct"
///         }
///     },
///     "type": "object",
///     "required": [
///         "id",
///         "object",
///         "deleted"
///     ],
///     "description": "The details of the product variant's deletion."
/// }
library;

import 'exports.dart';
part 'admin_product_variant_delete_response.freezed.dart';
part 'admin_product_variant_delete_response.g.dart'; // AdminProductVariantDeleteResponse

@freezed
abstract class AdminProductVariantDeleteResponse
    with _$AdminProductVariantDeleteResponse {
  const AdminProductVariantDeleteResponse._();

  @jsonSerializable
  const factory AdminProductVariantDeleteResponse({
    /// id
    @JsonKey(name: AdminProductVariantDeleteResponse.idKey) required String id,

    /// object
    @JsonKey(name: AdminProductVariantDeleteResponse.objectKey)
    required String object,

    /// deleted
    @Default('variant')
    @JsonKey(name: AdminProductVariantDeleteResponse.deletedKey)
    bool deleted,

    /// parent
    @JsonKey(name: AdminProductVariantDeleteResponse.parentKey)
    required AdminProduct parent,
  }) = _AdminProductVariantDeleteResponse;

  factory AdminProductVariantDeleteResponse.fromJson(
    Map<String, dynamic> json,
  ) => _$AdminProductVariantDeleteResponseFromJson(json);

  static const String idKey = r'id';

  static const String objectKey = r'object';

  static const String deletedKey = r'deleted';

  static const String parentKey = r'parent';
}
