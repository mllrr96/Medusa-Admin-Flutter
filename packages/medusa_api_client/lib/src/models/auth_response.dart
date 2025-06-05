/// AuthResponse
/// {
///     "properties": {
///         "token": {
///             "type": "string",
///             "description": "The JWT token used for registration or authentication.",
///             "title": "token"
///         }
///     },
///     "type": "object",
///     "required": [
///         "token"
///     ],
///     "description": "The authentication's details."
/// }
library;

import 'exports.dart';
part 'auth_response.freezed.dart';
part 'auth_response.g.dart'; // AuthResponse

@freezed
abstract class AuthResponse with _$AuthResponse {
  const AuthResponse._();

  @jsonSerializable
  const factory AuthResponse({
    /// token
    @JsonKey(name: AuthResponse.tokenKey) required String token,
  }) = _AuthResponse;

  factory AuthResponse.fromJson(Map<String, dynamic> json) =>
      _$AuthResponseFromJson(json);

  static const String tokenKey = r'token';
}
