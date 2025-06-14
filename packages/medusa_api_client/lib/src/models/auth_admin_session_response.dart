/// AuthAdminSessionResponse
/// {
///     "properties": {
///         "user": {
///             "$ref": "#/components/schemas/AdminUser",
///             "description": "The logged-in user.",
///             "title": "user"
///         }
///     },
///     "type": "object",
///     "required": [
///         "user"
///     ],
///     "description": "The authenticated user's details."
/// }
library;

import 'admin_auth_user.dart';
import 'exports.dart';
part 'auth_admin_session_response.freezed.dart';
part 'auth_admin_session_response.g.dart'; // AuthAdminSessionResponse

@freezed
abstract class AuthAdminSessionResponse with _$AuthAdminSessionResponse {
  const AuthAdminSessionResponse._();

  @jsonSerializable
  const factory AuthAdminSessionResponse({
    /// user
    @JsonKey(name: AuthAdminSessionResponse.userKey) required AdminAuthUser user,
  }) = _AuthAdminSessionResponse;

  factory AuthAdminSessionResponse.fromJson(Map<String, dynamic> json) =>
      _$AuthAdminSessionResponseFromJson(json);

  static const String userKey = r'user';
}
