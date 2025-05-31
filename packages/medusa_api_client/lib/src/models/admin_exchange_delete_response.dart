/// AdminExchangeDeleteResponse
/// {
///     "properties": {
///         "id": {
///             "type": "string",
///             "description": "The exchange's ID.",
///             "title": "id"
///         },
///         "object": {
///             "type": "string",
///             "description": "The name of the deleted object.",
///             "default": "exchange",
///             "title": "object"
///         },
///         "deleted": {
///             "type": "boolean",
///             "description": "Whether the exchange was deleted.",
///             "title": "deleted"
///         }
///     },
///     "type": "object",
///     "required": [
///         "id",
///         "object",
///         "deleted"
///     ],
///     "description": "The details of deleting an exchange."
/// }
library;

import 'exports.dart';
part 'admin_exchange_delete_response.freezed.dart';
part 'admin_exchange_delete_response.g.dart'; // AdminExchangeDeleteResponse

@freezed
abstract class AdminExchangeDeleteResponse with _$AdminExchangeDeleteResponse {
  const AdminExchangeDeleteResponse._();

  @jsonSerializable
  const factory AdminExchangeDeleteResponse({
    /// id
    @JsonKey(name: AdminExchangeDeleteResponse.idKey) required String id,

    /// object
    @Default('exchange')
    @JsonKey(name: AdminExchangeDeleteResponse.objectKey)
    String object,

    /// deleted
    @JsonKey(name: AdminExchangeDeleteResponse.deletedKey)
    required bool deleted,
  }) = _AdminExchangeDeleteResponse;

  factory AdminExchangeDeleteResponse.fromJson(Map<String, dynamic> json) =>
      _$AdminExchangeDeleteResponseFromJson(json);

  static const String idKey = r'id';

  static const String objectKey = r'object';

  static const String deletedKey = r'deleted';
}
