/// AdminShippingProfile
/// {
///     "properties": {
///         "id": {
///             "type": "string",
///             "description": "The shipping profile's ID.",
///             "title": "id"
///         },
///         "name": {
///             "type": "string",
///             "description": "The shipping profile's name.",
///             "title": "name"
///         },
///         "type": {
///             "type": "string",
///             "description": "The shipping profile's type.",
///             "title": "type"
///         },
///         "metadata": {
///             "type": "object",
///             "description": "The shipping profile's metadata, holds custom key-value pairs."
///         },
///         "created_at": {
///             "type": "string",
///             "format": "date-time",
///             "description": "The date the shipping profile was created.",
///             "title": "created_at"
///         },
///         "updated_at": {
///             "type": "string",
///             "format": "date-time",
///             "description": "The date the shipping profile was updated.",
///             "title": "updated_at"
///         },
///         "deleted_at": {
///             "type": "string",
///             "format": "date-time",
///             "description": "The date the shipping profile was deleted.",
///             "title": "deleted_at"
///         }
///     },
///     "type": "object",
///     "required": [
///         "id",
///         "name",
///         "type",
///         "metadata",
///         "created_at",
///         "updated_at",
///         "deleted_at"
///     ],
///     "description": "The shipping profile's details.."
/// }
library;

import 'exports.dart';
part 'admin_shipping_profile.freezed.dart';
part 'admin_shipping_profile.g.dart'; // AdminShippingProfile

@freezed
abstract class AdminShippingProfile with _$AdminShippingProfile {
  const AdminShippingProfile._();

  @jsonSerializable
  const factory AdminShippingProfile({
    /// id
    @JsonKey(name: AdminShippingProfile.idKey) required String id,

    /// name
    @JsonKey(name: AdminShippingProfile.nameKey) required String name,

    /// type
    @JsonKey(name: AdminShippingProfile.typeKey) required String type,

    /// metadata
    @JsonKey(name: AdminShippingProfile.metadataKey)
    required Map<String, dynamic> metadata,

    /// createdAt
    @JsonKey(name: AdminShippingProfile.createdAtKey)
    required DateTime createdAt,

    /// updatedAt
    @JsonKey(name: AdminShippingProfile.updatedAtKey)
    required DateTime updatedAt,

    /// deletedAt
    @JsonKey(name: AdminShippingProfile.deletedAtKey)
    required DateTime deletedAt,
  }) = _AdminShippingProfile;

  factory AdminShippingProfile.fromJson(Map<String, dynamic> json) =>
      _$AdminShippingProfileFromJson(json);

  static const String idKey = r'id';

  static const String nameKey = r'name';

  static const String typeKey = r'type';

  static const String metadataKey = r'metadata';

  static const String createdAtKey = r'created_at';

  static const String updatedAtKey = r'updated_at';

  static const String deletedAtKey = r'deleted_at';
}
