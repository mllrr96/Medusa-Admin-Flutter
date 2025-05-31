/// AuthResponseOrAuthCallbackResponseUnion
/// {
///     "oneOf": [
///         {
///             "$ref": "#/components/schemas/AuthResponse"
///         },
///         {
///             "$ref": "#/components/schemas/AuthCallbackResponse"
///         }
///     ],
///     "runtimeType": "oneOf"
/// }
library;

import 'exports.dart';
part 'auth_response_or_auth_callback_response_union.freezed.dart';
part 'auth_response_or_auth_callback_response_union.g.dart'; // AuthResponseOrAuthCallbackResponseUnion

@freezed
sealed class AuthResponseOrAuthCallbackResponseUnion
    with _$AuthResponseOrAuthCallbackResponseUnion {
  const AuthResponseOrAuthCallbackResponseUnion._();

  @jsonSerializable
  @FreezedUnionValue("AuthResponse")
  const factory AuthResponseOrAuthCallbackResponseUnion.authResponse(
    AuthResponse value,
  ) = AuthResponseOrAuthCallbackResponseUnionAuthResponse;

  @jsonSerializable
  @FreezedUnionValue("AuthCallbackResponse")
  const factory AuthResponseOrAuthCallbackResponseUnion.authCallbackResponse(
    AuthCallbackResponse value,
  ) = AuthResponseOrAuthCallbackResponseUnionAuthCallbackResponse;

  factory AuthResponseOrAuthCallbackResponseUnion.fromJson(
    Map<String, dynamic> json,
  ) => _$AuthResponseOrAuthCallbackResponseUnionFromJson(json);
}
