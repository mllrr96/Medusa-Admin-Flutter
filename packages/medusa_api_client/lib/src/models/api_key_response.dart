/// ApiKeyResponse
/// {
///     "properties": {
///         "id": {
///             "type": "string",
///             "description": "The API key's ID.",
///             "title": "id"
///         },
///         "token": {
///             "type": "string",
///             "description": "The API key's token.",
///             "title": "token"
///         },
///         "redacted": {
///             "type": "string",
///             "description": "The redacted form of the API key's token. This is useful when showing portion of the token. For example `sk_...123`.",
///             "title": "redacted"
///         },
///         "title": {
///             "type": "string",
///             "description": "The API key's title.",
///             "title": "title"
///         },
///         "type": {
///             "enum": [
///                 "secret",
///                 "publishable"
///             ],
///             "type": "string",
///             "description": "The API key's type. `secret` API keys are used for authenticating admin users, and `publishable` API key are used for storefronts and similar clients to scope requests to sales channels."
///         },
///         "last_used_at": {
///             "type": "string",
///             "format": "date-time",
///             "description": "The date the API key was last used.",
///             "title": "last_used_at"
///         },
///         "created_by": {
///             "type": "string",
///             "description": "The ID of the user that created the API key.",
///             "title": "created_by"
///         },
///         "created_at": {
///             "type": "string",
///             "format": "date-time",
///             "description": "The date the API key was created.",
///             "title": "created_at"
///         },
///         "revoked_by": {
///             "type": "string",
///             "description": "The ID of the user that revoked the API key.",
///             "title": "revoked_by"
///         },
///         "revoked_at": {
///             "type": "string",
///             "format": "date-time",
///             "description": "The date the API key was revoked.",
///             "title": "revoked_at"
///         }
///     },
///     "type": "object",
///     "required": [
///         "id",
///         "token",
///         "redacted",
///         "title",
///         "type",
///         "last_used_at",
///         "created_by",
///         "created_at",
///         "revoked_by",
///         "revoked_at"
///     ],
///     "description": "The API key's details."
/// }
library api_key_response;

import 'exports.dart';
part 'api_key_response.freezed.dart';
part 'api_key_response.g.dart'; // ApiKeyResponse

@freezed
abstract class ApiKeyResponse with _$ApiKeyResponse {
  const ApiKeyResponse._();

  @jsonSerializable
  const factory ApiKeyResponse({
    /// id
    @JsonKey(name: ApiKeyResponse.idKey) required String id,

    /// token
    @JsonKey(name: ApiKeyResponse.tokenKey) required String token,

    /// redacted
    @JsonKey(name: ApiKeyResponse.redactedKey) required String redacted,

    /// title
    @JsonKey(name: ApiKeyResponse.titleKey) required String title,

    /// type
    @JsonKey(name: ApiKeyResponse.typeKey) required NullEnum type,

    /// lastUsedAt
    @JsonKey(name: ApiKeyResponse.lastUsedAtKey) required DateTime lastUsedAt,

    /// createdBy
    @JsonKey(name: ApiKeyResponse.createdByKey) required String createdBy,

    /// createdAt
    @JsonKey(name: ApiKeyResponse.createdAtKey) required DateTime createdAt,

    /// revokedBy
    @JsonKey(name: ApiKeyResponse.revokedByKey) required String revokedBy,

    /// revokedAt
    @JsonKey(name: ApiKeyResponse.revokedAtKey) required DateTime revokedAt,
  }) = _ApiKeyResponse;

  factory ApiKeyResponse.fromJson(Map<String, dynamic> json) =>
      _$ApiKeyResponseFromJson(json);

  static const String idKey = r'id';

  static const String tokenKey = r'token';

  static const String redactedKey = r'redacted';

  static const String titleKey = r'title';

  static const String typeKey = r'type';

  static const String lastUsedAtKey = r'last_used_at';

  static const String createdByKey = r'created_by';

  static const String createdAtKey = r'created_at';

  static const String revokedByKey = r'revoked_by';

  static const String revokedAtKey = r'revoked_at';
}
