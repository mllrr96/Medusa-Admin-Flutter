/// AdminProductTypeDeleteResponse
/// {
///     "properties": {
///         "id": {
///             "type": "string",
///             "description": "The product type's ID.",
///             "title": "id"
///         },
///         "object": {
///             "type": "string",
///             "description": "The name of the deleted object.",
///             "default": "product_type",
///             "title": "object"
///         },
///         "deleted": {
///             "type": "boolean",
///             "description": "Whether the product type was deleted.",
///             "title": "deleted"
///         }
///     },
///     "type": "object",
///     "required": [
///         "id",
///         "object",
///         "deleted"
///     ],
///     "description": "The details of the product type deletion."
/// }
library;

import 'exports.dart';
part 'admin_product_type_delete_response.freezed.dart';
part 'admin_product_type_delete_response.g.dart'; // AdminProductTypeDeleteResponse

@freezed
abstract class AdminProductTypeDeleteResponse
    with _$AdminProductTypeDeleteResponse {
  const AdminProductTypeDeleteResponse._();

  @jsonSerializable
  const factory AdminProductTypeDeleteResponse({
    /// id
    @JsonKey(name: AdminProductTypeDeleteResponse.idKey) required String id,

    /// object
    @Default('product_type')
    @JsonKey(name: AdminProductTypeDeleteResponse.objectKey)
    String object,

    /// deleted
    @JsonKey(name: AdminProductTypeDeleteResponse.deletedKey)
    required bool deleted,
  }) = _AdminProductTypeDeleteResponse;

  factory AdminProductTypeDeleteResponse.fromJson(Map<String, dynamic> json) =>
      _$AdminProductTypeDeleteResponseFromJson(json);

  static const String idKey = r'id';

  static const String objectKey = r'object';

  static const String deletedKey = r'deleted';
}
