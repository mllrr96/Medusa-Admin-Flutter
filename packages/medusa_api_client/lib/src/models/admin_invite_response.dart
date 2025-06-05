/// AdminInviteResponse
/// {
///     "properties": {
///         "invite": {
///             "$ref": "#/components/schemas/AdminInvite"
///         }
///     },
///     "type": "object",
///     "required": [
///         "invite"
///     ],
///     "description": "The invite's details."
/// }
library;

import 'exports.dart';
part 'admin_invite_response.freezed.dart';
part 'admin_invite_response.g.dart'; // AdminInviteResponse

@freezed
abstract class AdminInviteResponse with _$AdminInviteResponse {
  const AdminInviteResponse._();

  @jsonSerializable
  const factory AdminInviteResponse({
    /// invite
    @JsonKey(name: AdminInviteResponse.inviteKey) required AdminInvite invite,
  }) = _AdminInviteResponse;

  factory AdminInviteResponse.fromJson(Map<String, dynamic> json) =>
      _$AdminInviteResponseFromJson(json);

  static const String inviteKey = r'invite';
}
