/// AuthCallbackResponse
/// {
///     "properties": {
///         "location": {
///             "type": "string",
///             "description": "The location to redirect the user to for further authentication with the third-party provider.",
///             "title": "location"
///         }
///     },
///     "type": "object",
///     "required": [
///         "location"
///     ],
///     "description": "The authentication's details."
/// }
library;

import 'exports.dart';
part 'auth_callback_response.freezed.dart';
part 'auth_callback_response.g.dart'; // AuthCallbackResponse

@freezed
abstract class AuthCallbackResponse with _$AuthCallbackResponse {
  const AuthCallbackResponse._();

  @jsonSerializable
  const factory AuthCallbackResponse({
    /// location
    @JsonKey(name: AuthCallbackResponse.locationKey) required String location,
  }) = _AuthCallbackResponse;

  factory AuthCallbackResponse.fromJson(Map<String, dynamic> json) =>
      _$AuthCallbackResponseFromJson(json);

  static const String locationKey = r'location';
}
