/// AdminProductOptionDeleteResponse
/// {
///     "properties": {
///         "id": {
///             "type": "string",
///             "description": "The product option's ID.",
///             "title": "id"
///         },
///         "object": {
///             "type": "string",
///             "description": "The name of the deleted object.",
///             "default": "product_option",
///             "title": "object"
///         },
///         "deleted": {
///             "type": "boolean",
///             "description": "Whether the product option was deleted.",
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
///     "description": "The details of the product option deletion."
/// }
library;

import 'exports.dart';
part 'admin_product_option_delete_response.freezed.dart';
part 'admin_product_option_delete_response.g.dart'; // AdminProductOptionDeleteResponse

@freezed
abstract class AdminProductOptionDeleteResponse
    with _$AdminProductOptionDeleteResponse {
  const AdminProductOptionDeleteResponse._();

  @jsonSerializable
  const factory AdminProductOptionDeleteResponse({
    /// id
    @JsonKey(name: AdminProductOptionDeleteResponse.idKey) required String id,

    /// object
    @Default('product_option')
    @JsonKey(name: AdminProductOptionDeleteResponse.objectKey)
    String object,

    /// deleted
    @JsonKey(name: AdminProductOptionDeleteResponse.deletedKey)
    required bool deleted,

    /// parent
    @JsonKey(name: AdminProductOptionDeleteResponse.parentKey)
    required AdminProduct parent,
  }) = _AdminProductOptionDeleteResponse;

  factory AdminProductOptionDeleteResponse.fromJson(
    Map<String, dynamic> json,
  ) => _$AdminProductOptionDeleteResponseFromJson(json);

  static const String idKey = r'id';

  static const String objectKey = r'object';

  static const String deletedKey = r'deleted';

  static const String parentKey = r'parent';
}
