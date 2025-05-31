/// AdminFulfillmentSetDeleteResponse
/// {
///     "properties": {
///         "id": {
///             "type": "string",
///             "description": "The fulfillment set's ID.",
///             "title": "id"
///         },
///         "object": {
///             "type": "string",
///             "description": "The name of the deleted object.",
///             "default": "fulfillment_set",
///             "title": "object"
///         },
///         "deleted": {
///             "type": "boolean",
///             "description": "Whether the fulfillment set was deleted.",
///             "title": "deleted"
///         }
///     },
///     "type": "object",
///     "required": [
///         "id",
///         "object",
///         "deleted"
///     ],
///     "description": "The deletion details."
/// }
library;

import 'exports.dart';
part 'admin_fulfillment_set_delete_response.freezed.dart';
part 'admin_fulfillment_set_delete_response.g.dart'; // AdminFulfillmentSetDeleteResponse

@freezed
abstract class AdminFulfillmentSetDeleteResponse
    with _$AdminFulfillmentSetDeleteResponse {
  const AdminFulfillmentSetDeleteResponse._();

  @jsonSerializable
  const factory AdminFulfillmentSetDeleteResponse({
    /// id
    @JsonKey(name: AdminFulfillmentSetDeleteResponse.idKey) required String id,

    /// object
    @Default('fulfillment_set')
    @JsonKey(name: AdminFulfillmentSetDeleteResponse.objectKey)
    String object,

    /// deleted
    @JsonKey(name: AdminFulfillmentSetDeleteResponse.deletedKey)
    required bool deleted,
  }) = _AdminFulfillmentSetDeleteResponse;

  factory AdminFulfillmentSetDeleteResponse.fromJson(
    Map<String, dynamic> json,
  ) => _$AdminFulfillmentSetDeleteResponseFromJson(json);

  static const String idKey = r'id';

  static const String objectKey = r'object';

  static const String deletedKey = r'deleted';
}
