/// AdminBatchProductVariantRequest
/// {
///     "properties": {
///         "create": {
///             "type": "array",
///             "items": {
///                 "$ref": "#/components/schemas/AdminCreateProductVariant"
///             },
///             "description": "The product variants to create."
///         },
///         "update": {
///             "type": "array",
///             "items": {
///                 "$ref": "#/components/schemas/AdminBatchUpdateProductVariant"
///             },
///             "description": "The product variants to update."
///         },
///         "delete": {
///             "type": "array",
///             "items": {
///                 "type": "string",
///                 "description": "A product variant's ID.",
///                 "title": "delete"
///             },
///             "description": "The product variants to delete."
///         }
///     },
///     "type": "object",
///     "description": "The product variants to create, update, or delete."
/// }
library;

import 'exports.dart';
part 'admin_batch_product_variant_request.freezed.dart';
part 'admin_batch_product_variant_request.g.dart'; // AdminBatchProductVariantRequest

@freezed
abstract class AdminBatchProductVariantRequest
    with _$AdminBatchProductVariantRequest {
  const AdminBatchProductVariantRequest._();

  @jsonSerializable
  const factory AdminBatchProductVariantRequest({
    /// create
    @JsonKey(name: AdminBatchProductVariantRequest.createKey)
    required List<AdminCreateProductVariant> create,

    /// update
    @JsonKey(name: AdminBatchProductVariantRequest.updateKey)
    required List<AdminBatchUpdateProductVariant> update,

    /// delete
    @JsonKey(name: AdminBatchProductVariantRequest.deleteKey)
    required List<String> delete,
  }) = _AdminBatchProductVariantRequest;

  factory AdminBatchProductVariantRequest.fromJson(Map<String, dynamic> json) =>
      _$AdminBatchProductVariantRequestFromJson(json);

  static const String createKey = r'create';

  static const String updateKey = r'update';

  static const String deleteKey = r'delete';
}
