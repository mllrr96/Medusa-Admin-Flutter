/// AdminClaimDeleteResponse
/// {
///     "properties": {
///         "id": {
///             "type": "string",
///             "description": "The claim's ID.",
///             "title": "id"
///         },
///         "object": {
///             "type": "string",
///             "description": "The name of the deleted object.",
///             "default": "claim",
///             "title": "object"
///         },
///         "deleted": {
///             "type": "boolean",
///             "description": "Whether the claim was deleted.",
///             "title": "deleted"
///         }
///     },
///     "type": "object",
///     "required": [
///         "id",
///         "object",
///         "deleted"
///     ],
///     "description": "The details of the deleted claim."
/// }
library admin_claim_delete_response;

import 'exports.dart';
part 'admin_claim_delete_response.freezed.dart';
part 'admin_claim_delete_response.g.dart'; // AdminClaimDeleteResponse

@freezed
abstract class AdminClaimDeleteResponse with _$AdminClaimDeleteResponse {
  const AdminClaimDeleteResponse._();

  @jsonSerializable
  const factory AdminClaimDeleteResponse({
    /// id
    @JsonKey(name: AdminClaimDeleteResponse.idKey) required String id,

    /// object
    @Default('claim')
    @JsonKey(name: AdminClaimDeleteResponse.objectKey)
    String object,

    /// deleted
    @JsonKey(name: AdminClaimDeleteResponse.deletedKey) required bool deleted,
  }) = _AdminClaimDeleteResponse;

  factory AdminClaimDeleteResponse.fromJson(Map<String, dynamic> json) =>
      _$AdminClaimDeleteResponseFromJson(json);

  static const String idKey = r'id';

  static const String objectKey = r'object';

  static const String deletedKey = r'deleted';
}
