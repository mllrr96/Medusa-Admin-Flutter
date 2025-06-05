/// AdminApiKeyResponse
/// {
///     "properties": {
///         "api_key": {
///             "$ref": "#/components/schemas/AdminApiKey"
///         }
///     },
///     "type": "object",
///     "required": [
///         "api_key"
///     ],
///     "description": "The API key's details."
/// }
library;

import 'exports.dart';
part 'admin_api_key_response.freezed.dart';
part 'admin_api_key_response.g.dart'; // AdminApiKeyResponse

@freezed
abstract class AdminApiKeyResponse with _$AdminApiKeyResponse {
  const AdminApiKeyResponse._();

  @jsonSerializable
  const factory AdminApiKeyResponse({
    /// apiKey
    @JsonKey(name: AdminApiKeyResponse.apiKeyKey) required AdminApiKey apiKey,
  }) = _AdminApiKeyResponse;

  factory AdminApiKeyResponse.fromJson(Map<String, dynamic> json) =>
      _$AdminApiKeyResponseFromJson(json);

  static const String apiKeyKey = r'api_key';
}
