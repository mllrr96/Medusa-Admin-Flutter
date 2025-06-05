/// AdminUser
/// {
///     "properties": {
///         "id": {
///             "type": "string",
///             "description": "The user's ID.",
///             "title": "id"
///         },
///         "email": {
///             "type": "string",
///             "format": "email",
///             "description": "The user's email.",
///             "title": "email"
///         },
///         "first_name": {
///             "type": "string",
///             "description": "The user's first name.",
///             "title": "first_name"
///         },
///         "last_name": {
///             "type": "string",
///             "description": "The user's last name.",
///             "title": "last_name"
///         },
///         "avatar_url": {
///             "type": "string",
///             "description": "The URL of the user's avatar.",
///             "title": "avatar_url"
///         },
///         "metadata": {
///             "type": "object",
///             "description": "The user's metadata, can hold custom key-value pairs."
///         },
///         "created_at": {
///             "type": "string",
///             "format": "date-time",
///             "description": "The date the user was created.",
///             "title": "created_at"
///         },
///         "updated_at": {
///             "type": "string",
///             "format": "date-time",
///             "description": "The date the user was updated.",
///             "title": "updated_at"
///         },
///         "deleted_at": {
///             "type": "string",
///             "format": "date-time",
///             "description": "The date the user was deleted.",
///             "title": "deleted_at"
///         }
///     },
///     "type": "object",
///     "required": [
///         "id",
///         "email",
///         "first_name",
///         "last_name",
///         "avatar_url",
///         "metadata",
///         "created_at",
///         "updated_at",
///         "deleted_at"
///     ],
///     "description": "The user's details."
/// }
library;

import 'exports.dart';
part 'admin_user.freezed.dart';
part 'admin_user.g.dart'; // AdminUser

@freezed
abstract class AdminUser with _$AdminUser {
  const AdminUser._();

  @jsonSerializable
  const factory AdminUser({
    /// id
    @JsonKey(name: AdminUser.idKey) required String id,

    /// email
    @JsonKey(name: AdminUser.emailKey) required String email,

    /// firstName
    @JsonKey(name: AdminUser.firstNameKey) required String firstName,

    /// lastName
    @JsonKey(name: AdminUser.lastNameKey) required String lastName,

    /// avatarUrl
    @JsonKey(name: AdminUser.avatarUrlKey) required String avatarUrl,

    /// metadata
    @JsonKey(name: AdminUser.metadataKey)
    required Map<String, dynamic> metadata,

    /// createdAt
    @JsonKey(name: AdminUser.createdAtKey) required DateTime createdAt,

    /// updatedAt
    @JsonKey(name: AdminUser.updatedAtKey) required DateTime updatedAt,

    /// deletedAt
    @JsonKey(name: AdminUser.deletedAtKey) required DateTime deletedAt,
  }) = _AdminUser;

  factory AdminUser.fromJson(Map<String, dynamic> json) =>
      _$AdminUserFromJson(json);

  static const String idKey = r'id';

  static const String emailKey = r'email';

  static const String firstNameKey = r'first_name';

  static const String lastNameKey = r'last_name';

  static const String avatarUrlKey = r'avatar_url';

  static const String metadataKey = r'metadata';

  static const String createdAtKey = r'created_at';

  static const String updatedAtKey = r'updated_at';

  static const String deletedAtKey = r'deleted_at';
}
