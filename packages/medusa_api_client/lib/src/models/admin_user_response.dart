/// AdminUserResponse
/// {
///     "properties": {
///         "user": {
///             "$ref": "#/components/schemas/AdminUser"
///         }
///     },
///     "type": "object",
///     "required": [
///         "user"
///     ],
///     "description": "The user's details."
/// }
library;

import 'exports.dart';
part 'admin_user_response.freezed.dart';
part 'admin_user_response.g.dart'; // AdminUserResponse

@freezed
abstract class AdminUserResponse with _$AdminUserResponse {
  const AdminUserResponse._();

  @jsonSerializable
  const factory AdminUserResponse({
    /// user
    @JsonKey(name: AdminUserResponse.userKey) required AdminUser user,
  }) = _AdminUserResponse;

  factory AdminUserResponse.fromJson(Map<String, dynamic> json) =>
      _$AdminUserResponseFromJson(json);

  static const String userKey = r'user';
}
