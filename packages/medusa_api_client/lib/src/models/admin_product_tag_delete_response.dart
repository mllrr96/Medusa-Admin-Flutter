/// AdminProductTagDeleteResponse
/// {
///     "properties": {
///         "id": {
///             "type": "string",
///             "description": "The product tag's ID.",
///             "title": "id"
///         },
///         "object": {
///             "type": "string",
///             "description": "The name of the deleted object.",
///             "default": "product_tag",
///             "title": "object"
///         },
///         "deleted": {
///             "type": "boolean",
///             "description": "Whether the product tag was deleted.",
///             "title": "deleted"
///         }
///     },
///     "type": "object",
///     "required": [
///         "id",
///         "object",
///         "deleted"
///     ],
///     "description": "The details of the product tag deletion."
/// }
library;

import 'exports.dart';
part 'admin_product_tag_delete_response.freezed.dart';
part 'admin_product_tag_delete_response.g.dart'; // AdminProductTagDeleteResponse

@freezed
abstract class AdminProductTagDeleteResponse
    with _$AdminProductTagDeleteResponse {
  const AdminProductTagDeleteResponse._();

  @jsonSerializable
  const factory AdminProductTagDeleteResponse({
    /// id
    @JsonKey(name: AdminProductTagDeleteResponse.idKey) required String id,

    /// object
    @Default('product_tag')
    @JsonKey(name: AdminProductTagDeleteResponse.objectKey)
    String object,

    /// deleted
    @JsonKey(name: AdminProductTagDeleteResponse.deletedKey)
    required bool deleted,
  }) = _AdminProductTagDeleteResponse;

  factory AdminProductTagDeleteResponse.fromJson(Map<String, dynamic> json) =>
      _$AdminProductTagDeleteResponseFromJson(json);

  static const String idKey = r'id';

  static const String objectKey = r'object';

  static const String deletedKey = r'deleted';
}
