/// AdminBatchProductRequest
/// {
///     "properties": {
///         "create": {
///             "type": "array",
///             "items": {
///                 "$ref": "#/components/schemas/AdminCreateProduct"
///             },
///             "description": "The products to create."
///         },
///         "update": {
///             "type": "array",
///             "items": {
///                 "$ref": "#/components/schemas/AdminBatchUpdateProduct"
///             },
///             "description": "The products to update."
///         },
///         "delete": {
///             "type": "array",
///             "items": {
///                 "type": "string",
///                 "description": "A product's ID.",
///                 "title": "delete"
///             },
///             "description": "The products to delete."
///         }
///     },
///     "type": "object",
///     "description": "The products to create, update, or delete."
/// }
library admin_batch_product_request;

import 'exports.dart';
part 'admin_batch_product_request.freezed.dart';
part 'admin_batch_product_request.g.dart'; // AdminBatchProductRequest

@freezed
abstract class AdminBatchProductRequest with _$AdminBatchProductRequest {
  const AdminBatchProductRequest._();

  @jsonSerializable
  const factory AdminBatchProductRequest({
    /// create
    @JsonKey(name: AdminBatchProductRequest.createKey)
    required List<AdminCreateProduct> create,

    /// update
    @JsonKey(name: AdminBatchProductRequest.updateKey)
    required List<AdminBatchUpdateProduct> update,

    /// delete
    @JsonKey(name: AdminBatchProductRequest.deleteKey)
    required List<String> delete,
  }) = _AdminBatchProductRequest;

  factory AdminBatchProductRequest.fromJson(Map<String, dynamic> json) =>
      _$AdminBatchProductRequestFromJson(json);

  static const String createKey = r'create';

  static const String updateKey = r'update';

  static const String deleteKey = r'delete';
}
