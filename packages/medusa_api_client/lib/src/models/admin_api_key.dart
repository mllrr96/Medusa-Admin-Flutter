/// AdminApiKey
/// {
///     "properties": {
///         "id": {
///             "type": "string",
///             "description": "The api key's ID.",
///             "title": "id"
///         },
///         "token": {
///             "type": "string",
///             "description": "The api key's token.",
///             "title": "token"
///         },
///         "redacted": {
///             "type": "string",
///             "description": "The redacted form of the API key's token. This is useful when showing portion of the token.",
///             "title": "redacted"
///         },
///         "title": {
///             "type": "string",
///             "description": "The api key's title.",
///             "title": "title"
///         },
///         "type": {
///             "enum": [
///                 "secret",
///                 "publishable"
///             ],
///             "type": "string",
///             "description": "The api key's type. `secret` is used for a user's API key, whereas `publishable` is used for Publishable API keys."
///         },
///         "last_used_at": {
///             "type": "string",
///             "format": "date-time",
///             "description": "The date and time the API key was last used.",
///             "title": "last_used_at"
///         },
///         "created_by": {
///             "type": "string",
///             "description": "The ID of the user that created the API key, if available.",
///             "title": "created_by"
///         },
///         "created_at": {
///             "type": "string",
///             "format": "date-time",
///             "description": "The date and time the API key was created.",
///             "title": "created_at"
///         },
///         "revoked_by": {
///             "type": "string",
///             "description": "The ID of the user that revoked the API key, if available.",
///             "title": "revoked_by"
///         },
///         "revoked_at": {
///             "type": "string",
///             "format": "date-time",
///             "description": "The date and time the API key was revoked. The API key is considered revoked when this property is set.",
///             "title": "revoked_at"
///         },
///         "updated_at": {
///             "type": "string",
///             "format": "date-time",
///             "description": "The date the API key was updated.",
///             "title": "updated_at"
///         },
///         "deleted_at": {
///             "type": "string",
///             "format": "date-time",
///             "description": "The date the API key was deleted.",
///             "title": "deleted_at"
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
///         "updated_at",
///         "revoked_by",
///         "revoked_at",
///         "deleted_at"
///     ],
///     "description": "The API key's details."
/// }
library;

import 'exports.dart';
part 'admin_api_key.freezed.dart';
part 'admin_api_key.g.dart'; // AdminApiKey

@freezed
abstract class AdminApiKey with _$AdminApiKey {
  const AdminApiKey._();

  @jsonSerializable
  const factory AdminApiKey({
    /// id
    @JsonKey(name: AdminApiKey.idKey) required String id,

    /// token
    @JsonKey(name: AdminApiKey.tokenKey) required String token,

    /// redacted
    @JsonKey(name: AdminApiKey.redactedKey) required String redacted,

    /// title
    @JsonKey(name: AdminApiKey.titleKey) required String title,

    /// type
    @JsonKey(name: AdminApiKey.typeKey) required NullEnum type,

    /// lastUsedAt
    @JsonKey(name: AdminApiKey.lastUsedAtKey) required DateTime lastUsedAt,

    /// createdBy
    @JsonKey(name: AdminApiKey.createdByKey) required String createdBy,

    /// createdAt
    @JsonKey(name: AdminApiKey.createdAtKey) required DateTime createdAt,

    /// revokedBy
    @JsonKey(name: AdminApiKey.revokedByKey) required String revokedBy,

    /// revokedAt
    @JsonKey(name: AdminApiKey.revokedAtKey) required DateTime revokedAt,

    /// updatedAt
    @JsonKey(name: AdminApiKey.updatedAtKey) required DateTime updatedAt,

    /// deletedAt
    @JsonKey(name: AdminApiKey.deletedAtKey) required DateTime deletedAt,
  }) = _AdminApiKey;

  factory AdminApiKey.fromJson(Map<String, dynamic> json) =>
      _$AdminApiKeyFromJson(json);

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

  static const String updatedAtKey = r'updated_at';

  static const String deletedAtKey = r'deleted_at';
}
