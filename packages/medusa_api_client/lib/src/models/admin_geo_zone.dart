/// AdminGeoZone
/// {
///     "properties": {
///         "id": {
///             "type": "string",
///             "description": "The geo zone's ID.",
///             "title": "id"
///         },
///         "type": {
///             "enum": [
///                 "country",
///                 "province",
///                 "city",
///                 "zip"
///             ],
///             "type": "string",
///             "description": "The geo zone's type."
///         },
///         "country_code": {
///             "type": "string",
///             "description": "The geo zone's country code.",
///             "title": "country_code"
///         },
///         "province_code": {
///             "type": "string",
///             "description": "The geo zone's lower-case ISO 3166-2 province code.",
///             "title": "province_code"
///         },
///         "city": {
///             "type": "string",
///             "description": "The geo zone's city.",
///             "title": "city"
///         },
///         "postal_expression": {
///             "type": "object",
///             "description": "The geo zone's postal expression."
///         },
///         "created_at": {
///             "type": "string",
///             "format": "date-time",
///             "description": "The geo zone's created at.",
///             "title": "created_at"
///         },
///         "updated_at": {
///             "type": "string",
///             "format": "date-time",
///             "description": "The geo zone's updated at.",
///             "title": "updated_at"
///         },
///         "deleted_at": {
///             "type": "string",
///             "format": "date-time",
///             "description": "The geo zone's deleted at.",
///             "title": "deleted_at"
///         }
///     },
///     "type": "object",
///     "required": [
///         "id",
///         "type",
///         "country_code",
///         "province_code",
///         "city",
///         "postal_expression",
///         "created_at",
///         "updated_at",
///         "deleted_at"
///     ],
///     "description": "The geo zone's geo zones."
/// }
library;

import 'exports.dart';
part 'admin_geo_zone.freezed.dart';
part 'admin_geo_zone.g.dart'; // AdminGeoZone

@freezed
abstract class AdminGeoZone with _$AdminGeoZone {
  const AdminGeoZone._();

  @jsonSerializable
  const factory AdminGeoZone({
    /// id
    @JsonKey(name: AdminGeoZone.idKey) required String id,

    /// type
    @JsonKey(name: AdminGeoZone.typeKey) required NullEnum type,

    /// countryCode
    @JsonKey(name: AdminGeoZone.countryCodeKey) required String countryCode,

    /// provinceCode
    @JsonKey(name: AdminGeoZone.provinceCodeKey) required String provinceCode,

    /// city
    @JsonKey(name: AdminGeoZone.cityKey) required String city,

    /// postalExpression
    @JsonKey(name: AdminGeoZone.postalExpressionKey)
    required Map<String, dynamic> postalExpression,

    /// createdAt
    @JsonKey(name: AdminGeoZone.createdAtKey) required DateTime createdAt,

    /// updatedAt
    @JsonKey(name: AdminGeoZone.updatedAtKey) required DateTime updatedAt,

    /// deletedAt
    @JsonKey(name: AdminGeoZone.deletedAtKey) required DateTime deletedAt,
  }) = _AdminGeoZone;

  factory AdminGeoZone.fromJson(Map<String, dynamic> json) =>
      _$AdminGeoZoneFromJson(json);

  static const String idKey = r'id';

  static const String typeKey = r'type';

  static const String countryCodeKey = r'country_code';

  static const String provinceCodeKey = r'province_code';

  static const String cityKey = r'city';

  static const String postalExpressionKey = r'postal_expression';

  static const String createdAtKey = r'created_at';

  static const String updatedAtKey = r'updated_at';

  static const String deletedAtKey = r'deleted_at';
}
