/// AdminUpdateUser
/// {
///     "properties": {
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
///         }
///     },
///     "type": "object",
///     "description": "The properties to update in a user."
/// }
library admin_update_user;

import 'exports.dart';
part 'admin_update_user.freezed.dart';
part 'admin_update_user.g.dart'; // AdminUpdateUser

@freezed
abstract class AdminUpdateUser with _$AdminUpdateUser {
  const AdminUpdateUser._();

  @jsonSerializable
  const factory AdminUpdateUser({
    /// firstName
    @JsonKey(name: AdminUpdateUser.firstNameKey) required String firstName,

    /// lastName
    @JsonKey(name: AdminUpdateUser.lastNameKey) required String lastName,

    /// avatarUrl
    @JsonKey(name: AdminUpdateUser.avatarUrlKey) required String avatarUrl,

    /// metadata
    @JsonKey(name: AdminUpdateUser.metadataKey)
    required Map<String, dynamic> metadata,
  }) = _AdminUpdateUser;

  factory AdminUpdateUser.fromJson(Map<String, dynamic> json) =>
      _$AdminUpdateUserFromJson(json);

  static const String firstNameKey = r'first_name';

  static const String lastNameKey = r'last_name';

  static const String avatarUrlKey = r'avatar_url';

  static const String metadataKey = r'metadata';
}
