/// AdminStockLocationDeleteResponse
/// {
///     "properties": {
///         "id": {
///             "type": "string",
///             "description": "The stock location's ID.",
///             "title": "id"
///         },
///         "object": {
///             "type": "string",
///             "description": "The name of the deleted object.",
///             "default": "stock_location",
///             "title": "object"
///         },
///         "deleted": {
///             "type": "boolean",
///             "description": "Whether the stock location was deleted.",
///             "title": "deleted"
///         }
///     },
///     "type": "object",
///     "required": [
///         "id",
///         "object",
///         "deleted"
///     ],
///     "description": "The details of the stock location's deletion."
/// }
library;

import 'exports.dart';
part 'admin_stock_location_delete_response.freezed.dart';
part 'admin_stock_location_delete_response.g.dart'; // AdminStockLocationDeleteResponse

@freezed
abstract class AdminStockLocationDeleteResponse
    with _$AdminStockLocationDeleteResponse {
  const AdminStockLocationDeleteResponse._();

  @jsonSerializable
  const factory AdminStockLocationDeleteResponse({
    /// id
    @JsonKey(name: AdminStockLocationDeleteResponse.idKey) required String id,

    /// object
    @Default('stock_location')
    @JsonKey(name: AdminStockLocationDeleteResponse.objectKey)
    String object,

    /// deleted
    @JsonKey(name: AdminStockLocationDeleteResponse.deletedKey)
    required bool deleted,
  }) = _AdminStockLocationDeleteResponse;

  factory AdminStockLocationDeleteResponse.fromJson(
    Map<String, dynamic> json,
  ) => _$AdminStockLocationDeleteResponseFromJson(json);

  static const String idKey = r'id';

  static const String objectKey = r'object';

  static const String deletedKey = r'deleted';
}
