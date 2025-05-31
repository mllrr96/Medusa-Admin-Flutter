/// AdminPriceListBatchResponse
/// {
///     "properties": {
///         "created": {
///             "type": "array",
///             "items": {
///                 "$ref": "#/components/schemas/AdminPrice"
///             },
///             "description": "The created prices."
///         },
///         "updated": {
///             "type": "array",
///             "items": {
///                 "$ref": "#/components/schemas/AdminPrice"
///             },
///             "description": "The updated prices."
///         },
///         "deleted": {
///             "type": "object",
///             "description": "The details of the deleted prices."
///         }
///     },
///     "type": "object",
///     "required": [
///         "created",
///         "updated",
///         "deleted"
///     ],
///     "description": "The details of the created, updated, and deleted prices in a price list."
/// }
library;

import 'exports.dart';
part 'admin_price_list_batch_response.freezed.dart';
part 'admin_price_list_batch_response.g.dart'; // AdminPriceListBatchResponse

@freezed
abstract class AdminPriceListBatchResponse with _$AdminPriceListBatchResponse {
  const AdminPriceListBatchResponse._();

  @jsonSerializable
  const factory AdminPriceListBatchResponse({
    /// created
    @JsonKey(name: AdminPriceListBatchResponse.createdKey)
    required List<AdminPrice> created,

    /// updated
    @JsonKey(name: AdminPriceListBatchResponse.updatedKey)
    required List<AdminPrice> updated,

    /// deleted
    @JsonKey(name: AdminPriceListBatchResponse.deletedKey)
    required Map<String, dynamic> deleted,
  }) = _AdminPriceListBatchResponse;

  factory AdminPriceListBatchResponse.fromJson(Map<String, dynamic> json) =>
      _$AdminPriceListBatchResponseFromJson(json);

  static const String createdKey = r'created';

  static const String updatedKey = r'updated';

  static const String deletedKey = r'deleted';
}
