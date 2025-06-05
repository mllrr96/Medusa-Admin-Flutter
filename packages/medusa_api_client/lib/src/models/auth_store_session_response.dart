/// AuthStoreSessionResponse
/// {
///     "properties": {
///         "user": {
///             "$ref": "#/components/schemas/StoreCustomer",
///             "description": "The logged-in customer.",
///             "title": "user"
///         }
///     },
///     "type": "object",
///     "required": [
///         "user"
///     ],
///     "description": "The authenticated customer's details."
/// }
library;

import 'exports.dart';
part 'auth_store_session_response.freezed.dart';
part 'auth_store_session_response.g.dart'; // AuthStoreSessionResponse

@freezed
abstract class AuthStoreSessionResponse with _$AuthStoreSessionResponse {
  const AuthStoreSessionResponse._();

  @jsonSerializable
  const factory AuthStoreSessionResponse({
    /// user
    @JsonKey(name: AuthStoreSessionResponse.userKey)
    required StoreCustomer user,
  }) = _AuthStoreSessionResponse;

  factory AuthStoreSessionResponse.fromJson(Map<String, dynamic> json) =>
      _$AuthStoreSessionResponseFromJson(json);

  static const String userKey = r'user';
}
