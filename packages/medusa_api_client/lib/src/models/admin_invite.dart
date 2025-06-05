/// AdminInvite
/// {
///     "properties": {
///         "id": {
///             "type": "string",
///             "description": "The invite's ID.",
///             "title": "id"
///         },
///         "email": {
///             "type": "string",
///             "format": "email",
///             "description": "The invite's email.",
///             "title": "email"
///         },
///         "accepted": {
///             "type": "boolean",
///             "description": "Whether the invite has been accepted.",
///             "title": "accepted"
///         },
///         "token": {
///             "type": "string",
///             "description": "The invite's token.",
///             "title": "token"
///         },
///         "expires_at": {
///             "type": "string",
///             "format": "date-time",
///             "description": "The invite's expiry date.",
///             "title": "expires_at"
///         },
///         "metadata": {
///             "type": "object",
///             "description": "The invite's metadata, can hold custom key-value pairs."
///         },
///         "created_at": {
///             "type": "string",
///             "format": "date-time",
///             "description": "The date the invite was created.",
///             "title": "created_at"
///         },
///         "updated_at": {
///             "type": "string",
///             "format": "date-time",
///             "description": "The date the invite was updated.",
///             "title": "updated_at"
///         }
///     },
///     "type": "object",
///     "required": [
///         "id",
///         "email",
///         "accepted",
///         "token",
///         "expires_at",
///         "created_at",
///         "updated_at"
///     ],
///     "description": "The invite's details."
/// }
library;

import 'exports.dart';
part 'admin_invite.freezed.dart';
part 'admin_invite.g.dart'; // AdminInvite

@freezed
abstract class AdminInvite with _$AdminInvite {
  const AdminInvite._();

  @jsonSerializable
  const factory AdminInvite({
    /// id
    @JsonKey(name: AdminInvite.idKey) required String id,

    /// email
    @JsonKey(name: AdminInvite.emailKey) required String email,

    /// accepted
    @JsonKey(name: AdminInvite.acceptedKey) required bool accepted,

    /// token
    @JsonKey(name: AdminInvite.tokenKey) required String token,

    /// expiresAt
    @JsonKey(name: AdminInvite.expiresAtKey) required DateTime expiresAt,

    /// metadata
    @JsonKey(name: AdminInvite.metadataKey)
    required Map<String, dynamic> metadata,

    /// createdAt
    @JsonKey(name: AdminInvite.createdAtKey) required DateTime createdAt,

    /// updatedAt
    @JsonKey(name: AdminInvite.updatedAtKey) required DateTime updatedAt,
  }) = _AdminInvite;

  factory AdminInvite.fromJson(Map<String, dynamic> json) =>
      _$AdminInviteFromJson(json);

  static const String idKey = r'id';

  static const String emailKey = r'email';

  static const String acceptedKey = r'accepted';

  static const String tokenKey = r'token';

  static const String expiresAtKey = r'expires_at';

  static const String metadataKey = r'metadata';

  static const String createdAtKey = r'created_at';

  static const String updatedAtKey = r'updated_at';
}
