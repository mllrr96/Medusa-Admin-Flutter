/// AdminUserDeleteResponse
/// {
///     "properties": {
///         "id": {
///             "type": "string",
///             "description": "The user's ID.",
///             "title": "id"
///         },
///         "object": {
///             "type": "string",
///             "description": "The name of the deleted object.",
///             "default": "user",
///             "title": "object"
///         },
///         "deleted": {
///             "type": "boolean",
///             "description": "Whether the user was deleted.",
///             "title": "deleted"
///         }
///     },
///     "type": "object",
///     "required": [
///         "id",
///         "object",
///         "deleted"
///     ],
///     "description": "The details of the deleted user."
/// }
library;

import 'exports.dart';
part 'admin_user_delete_response.freezed.dart';
part 'admin_user_delete_response.g.dart'; // AdminUserDeleteResponse

@freezed
abstract class AdminUserDeleteResponse with _$AdminUserDeleteResponse {
  const AdminUserDeleteResponse._();

  @jsonSerializable
  const factory AdminUserDeleteResponse({
    /// id
    @JsonKey(name: AdminUserDeleteResponse.idKey) required String id,

    /// object
    @Default('user')
    @JsonKey(name: AdminUserDeleteResponse.objectKey)
    String object,

    /// deleted
    @JsonKey(name: AdminUserDeleteResponse.deletedKey) required bool deleted,
  }) = _AdminUserDeleteResponse;

  factory AdminUserDeleteResponse.fromJson(Map<String, dynamic> json) =>
      _$AdminUserDeleteResponseFromJson(json);

  static const String idKey = r'id';

  static const String objectKey = r'object';

  static const String deletedKey = r'deleted';
}
