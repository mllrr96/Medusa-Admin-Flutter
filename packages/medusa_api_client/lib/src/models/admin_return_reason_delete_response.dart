/// AdminReturnReasonDeleteResponse
/// {
///     "properties": {
///         "id": {
///             "type": "string",
///             "description": "The return reason's ID.",
///             "title": "id"
///         },
///         "object": {
///             "type": "string",
///             "description": "The name of the deleted object.",
///             "default": "return_reason",
///             "title": "object"
///         },
///         "deleted": {
///             "type": "boolean",
///             "description": "Whether the return reason was deleted.",
///             "title": "deleted"
///         }
///     },
///     "type": "object",
///     "required": [
///         "id",
///         "object",
///         "deleted"
///     ],
///     "description": "The details of the return reason deletion."
/// }
library;

import 'exports.dart';
part 'admin_return_reason_delete_response.freezed.dart';
part 'admin_return_reason_delete_response.g.dart'; // AdminReturnReasonDeleteResponse

@freezed
abstract class AdminReturnReasonDeleteResponse
    with _$AdminReturnReasonDeleteResponse {
  const AdminReturnReasonDeleteResponse._();

  @jsonSerializable
  const factory AdminReturnReasonDeleteResponse({
    /// id
    @JsonKey(name: AdminReturnReasonDeleteResponse.idKey) required String id,

    /// object
    @Default('return_reason')
    @JsonKey(name: AdminReturnReasonDeleteResponse.objectKey)
    String object,

    /// deleted
    @JsonKey(name: AdminReturnReasonDeleteResponse.deletedKey)
    required bool deleted,
  }) = _AdminReturnReasonDeleteResponse;

  factory AdminReturnReasonDeleteResponse.fromJson(Map<String, dynamic> json) =>
      _$AdminReturnReasonDeleteResponseFromJson(json);

  static const String idKey = r'id';

  static const String objectKey = r'object';

  static const String deletedKey = r'deleted';
}
