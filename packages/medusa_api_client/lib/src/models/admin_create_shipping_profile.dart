/// AdminCreateShippingProfile
/// {
///     "properties": {
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
///             "description": "The shipping profile's metadata, used to store custom key-value pairs."
///         }
///     },
///     "type": "object",
///     "required": [
///         "name",
///         "type"
///     ],
///     "description": "The shipping profile's details."
/// }
library;

import 'exports.dart';
part 'admin_create_shipping_profile.freezed.dart';
part 'admin_create_shipping_profile.g.dart'; // AdminCreateShippingProfile

@freezed
abstract class AdminCreateShippingProfile with _$AdminCreateShippingProfile {
  const AdminCreateShippingProfile._();

  @jsonSerializable
  const factory AdminCreateShippingProfile({
    /// name
    @JsonKey(name: AdminCreateShippingProfile.nameKey) required String name,

    /// type
    @JsonKey(name: AdminCreateShippingProfile.typeKey) required String type,

    /// metadata
    @JsonKey(name: AdminCreateShippingProfile.metadataKey)
    required Map<String, dynamic> metadata,
  }) = _AdminCreateShippingProfile;

  factory AdminCreateShippingProfile.fromJson(Map<String, dynamic> json) =>
      _$AdminCreateShippingProfileFromJson(json);

  static const String nameKey = r'name';

  static const String typeKey = r'type';

  static const String metadataKey = r'metadata';
}
