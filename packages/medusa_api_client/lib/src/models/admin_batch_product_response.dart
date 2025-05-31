/// AdminBatchProductResponse
/// {
///     "properties": {
///         "created": {
///             "type": "array",
///             "items": {
///                 "$ref": "#/components/schemas/AdminProduct"
///             },
///             "description": "The created products"
///         },
///         "updated": {
///             "type": "array",
///             "items": {
///                 "$ref": "#/components/schemas/AdminProduct"
///             },
///             "description": "The updated products."
///         },
///         "deleted": {
///             "type": "object",
///             "description": "The deleted products' details."
///         }
///     },
///     "type": "object",
///     "required": [
///         "created",
///         "updated",
///         "deleted"
///     ],
///     "description": "The details of the products created, updated, or deleted."
/// }
library admin_batch_product_response;

import 'exports.dart';
part 'admin_batch_product_response.freezed.dart';
part 'admin_batch_product_response.g.dart'; // AdminBatchProductResponse

@freezed
abstract class AdminBatchProductResponse with _$AdminBatchProductResponse {
  const AdminBatchProductResponse._();

  @jsonSerializable
  const factory AdminBatchProductResponse({
    /// created
    @JsonKey(name: AdminBatchProductResponse.createdKey)
    required List<AdminProduct> created,

    /// updated
    @JsonKey(name: AdminBatchProductResponse.updatedKey)
    required List<AdminProduct> updated,

    /// deleted
    @JsonKey(name: AdminBatchProductResponse.deletedKey)
    required Map<String, dynamic> deleted,
  }) = _AdminBatchProductResponse;

  factory AdminBatchProductResponse.fromJson(Map<String, dynamic> json) =>
      _$AdminBatchProductResponseFromJson(json);

  static const String createdKey = r'created';

  static const String updatedKey = r'updated';

  static const String deletedKey = r'deleted';
}
