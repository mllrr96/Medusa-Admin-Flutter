/// AdminProductDeleteResponse
/// {
///     "properties": {
///         "id": {
///             "type": "string",
///             "description": "The product's ID.",
///             "title": "id"
///         },
///         "object": {
///             "type": "string",
///             "description": "The name of the deleted object.",
///             "default": "product",
///             "title": "object"
///         },
///         "deleted": {
///             "type": "boolean",
///             "description": "Whether the product was deleted.",
///             "title": "deleted"
///         }
///     },
///     "type": "object",
///     "required": [
///         "id",
///         "object",
///         "deleted"
///     ],
///     "description": "The details of the product deletion."
/// }
library;

import 'exports.dart';
part 'admin_product_delete_response.freezed.dart';
part 'admin_product_delete_response.g.dart'; // AdminProductDeleteResponse

@freezed
abstract class AdminProductDeleteResponse with _$AdminProductDeleteResponse {
  const AdminProductDeleteResponse._();

  @jsonSerializable
  const factory AdminProductDeleteResponse({
    /// id
    @JsonKey(name: AdminProductDeleteResponse.idKey) required String id,

    /// object
    @Default('product')
    @JsonKey(name: AdminProductDeleteResponse.objectKey)
    String object,

    /// deleted
    @JsonKey(name: AdminProductDeleteResponse.deletedKey) required bool deleted,
  }) = _AdminProductDeleteResponse;

  factory AdminProductDeleteResponse.fromJson(Map<String, dynamic> json) =>
      _$AdminProductDeleteResponseFromJson(json);

  static const String idKey = r'id';

  static const String objectKey = r'object';

  static const String deletedKey = r'deleted';
}
