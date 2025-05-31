/// AdminProductCategoryDeleteResponse
/// {
///     "properties": {
///         "id": {
///             "type": "string",
///             "description": "The product category's ID.",
///             "title": "id"
///         },
///         "object": {
///             "type": "string",
///             "description": "The name of the deleted object.",
///             "default": "product_category",
///             "title": "object"
///         },
///         "deleted": {
///             "type": "boolean",
///             "description": "Whether the product category was deleted.",
///             "title": "deleted"
///         }
///     },
///     "type": "object",
///     "required": [
///         "id",
///         "object",
///         "deleted"
///     ],
///     "description": "The details of deleting the category."
/// }
library;

import 'exports.dart';
part 'admin_product_category_delete_response.freezed.dart';
part 'admin_product_category_delete_response.g.dart'; // AdminProductCategoryDeleteResponse

@freezed
abstract class AdminProductCategoryDeleteResponse
    with _$AdminProductCategoryDeleteResponse {
  const AdminProductCategoryDeleteResponse._();

  @jsonSerializable
  const factory AdminProductCategoryDeleteResponse({
    /// id
    @JsonKey(name: AdminProductCategoryDeleteResponse.idKey) required String id,

    /// object
    @Default('product_category')
    @JsonKey(name: AdminProductCategoryDeleteResponse.objectKey)
    String object,

    /// deleted
    @JsonKey(name: AdminProductCategoryDeleteResponse.deletedKey)
    required bool deleted,
  }) = _AdminProductCategoryDeleteResponse;

  factory AdminProductCategoryDeleteResponse.fromJson(
    Map<String, dynamic> json,
  ) => _$AdminProductCategoryDeleteResponseFromJson(json);

  static const String idKey = r'id';

  static const String objectKey = r'object';

  static const String deletedKey = r'deleted';
}
