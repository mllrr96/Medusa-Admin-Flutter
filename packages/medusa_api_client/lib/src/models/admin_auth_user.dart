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

part 'admin_auth_user.freezed.dart';

part 'admin_auth_user.g.dart'; // AdminAuthUser

@freezed
abstract class AdminAuthUser with _$AdminAuthUser {
  const AdminAuthUser._();

  @jsonSerializable
  const factory AdminAuthUser({
    @JsonKey(name: AdminAuthUser.actorIdKey) required String actorId,
    @JsonKey(name: AdminAuthUser.actorTypeKey) required String actorType,
    @JsonKey(name: AdminAuthUser.authIdentityIdKey)
    required String authIdentityId,
    @JsonKey(name: AdminAuthUser.iatKey) required int iat,
    @JsonKey(name: AdminAuthUser.expKey) required int exp,
  }) = _AdminAuthUser;

  factory AdminAuthUser.fromJson(Map<String, dynamic> json) =>
      _$AdminAuthUserFromJson(json);

  static const String actorIdKey = r'actor_id';

  static const String actorTypeKey = r'actor_type';

  static const String authIdentityIdKey = r'auth_identity_id';

  static const String iatKey = r'iat';

  static const String expKey = r'exp';
}
