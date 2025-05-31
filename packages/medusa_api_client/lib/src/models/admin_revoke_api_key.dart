/// AdminRevokeApiKey
/// {
///     "properties": {
///         "revoke_in": {
///             "type": "number",
///             "description": "The time in seconds to revoke the API key after. If not set, the API key is revoked immediately.",
///             "title": "revoke_in"
///         }
///     },
///     "type": "object",
///     "description": "The details of revoking the API key."
/// }
library admin_revoke_api_key;

import 'exports.dart';
part 'admin_revoke_api_key.freezed.dart';
part 'admin_revoke_api_key.g.dart'; // AdminRevokeApiKey

@freezed
abstract class AdminRevokeApiKey with _$AdminRevokeApiKey {
  const AdminRevokeApiKey._();

  @jsonSerializable
  const factory AdminRevokeApiKey({
    /// revokeIn
    @JsonKey(name: AdminRevokeApiKey.revokeInKey) required double revokeIn,
  }) = _AdminRevokeApiKey;

  factory AdminRevokeApiKey.fromJson(Map<String, dynamic> json) =>
      _$AdminRevokeApiKeyFromJson(json);

  static const String revokeInKey = r'revoke_in';
}
