/// AdminPriceListDeleteResponse
/// {
///     "properties": {
///         "id": {
///             "type": "string",
///             "description": "The price list's ID.",
///             "title": "id"
///         },
///         "object": {
///             "type": "string",
///             "description": "The name of the deleted object.",
///             "default": "price_list",
///             "title": "object"
///         },
///         "deleted": {
///             "type": "boolean",
///             "description": "Whether the price list was deleted.",
///             "title": "deleted"
///         }
///     },
///     "type": "object",
///     "required": [
///         "id",
///         "object",
///         "deleted"
///     ],
///     "description": "The details of the deleted price list."
/// }
library;

import 'exports.dart';
part 'admin_price_list_delete_response.freezed.dart';
part 'admin_price_list_delete_response.g.dart'; // AdminPriceListDeleteResponse

@freezed
abstract class AdminPriceListDeleteResponse
    with _$AdminPriceListDeleteResponse {
  const AdminPriceListDeleteResponse._();

  @jsonSerializable
  const factory AdminPriceListDeleteResponse({
    /// id
    @JsonKey(name: AdminPriceListDeleteResponse.idKey) required String id,

    /// object
    @Default('price_list')
    @JsonKey(name: AdminPriceListDeleteResponse.objectKey)
    String object,

    /// deleted
    @JsonKey(name: AdminPriceListDeleteResponse.deletedKey)
    required bool deleted,
  }) = _AdminPriceListDeleteResponse;

  factory AdminPriceListDeleteResponse.fromJson(Map<String, dynamic> json) =>
      _$AdminPriceListDeleteResponseFromJson(json);

  static const String idKey = r'id';

  static const String objectKey = r'object';

  static const String deletedKey = r'deleted';
}
