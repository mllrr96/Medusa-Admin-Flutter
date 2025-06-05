/// BaseRegionCountry
/// {
///     "properties": {
///         "id": {
///             "type": "string",
///             "description": "The country's ID.",
///             "title": "id"
///         },
///         "iso_2": {
///             "type": "string",
///             "description": "The country's iso 2.",
///             "title": "iso_2"
///         },
///         "iso_3": {
///             "type": "string",
///             "description": "The country's iso 3.",
///             "title": "iso_3"
///         },
///         "num_code": {
///             "type": "string",
///             "description": "The country's num code.",
///             "title": "num_code"
///         },
///         "name": {
///             "type": "string",
///             "description": "The country's name.",
///             "title": "name"
///         },
///         "display_name": {
///             "type": "string",
///             "description": "The country's display name.",
///             "title": "display_name"
///         }
///     },
///     "type": "object",
///     "required": [
///         "id"
///     ],
///     "description": "The country's details."
/// }
library;

import 'exports.dart';
part 'base_region_country.freezed.dart';
part 'base_region_country.g.dart'; // BaseRegionCountry

@freezed
abstract class BaseRegionCountry with _$BaseRegionCountry {
  const BaseRegionCountry._();

  @jsonSerializable
  const factory BaseRegionCountry({
    /// id
    @JsonKey(name: BaseRegionCountry.idKey) required String id,

    /// iso2
    @JsonKey(name: BaseRegionCountry.iso2Key) required String iso2,

    /// iso3
    @JsonKey(name: BaseRegionCountry.iso3Key) required String iso3,

    /// numCode
    @JsonKey(name: BaseRegionCountry.numCodeKey) required String numCode,

    /// name
    @JsonKey(name: BaseRegionCountry.nameKey) required String name,

    /// displayName
    @JsonKey(name: BaseRegionCountry.displayNameKey)
    required String displayName,
  }) = _BaseRegionCountry;

  factory BaseRegionCountry.fromJson(Map<String, dynamic> json) =>
      _$BaseRegionCountryFromJson(json);

  static const String idKey = r'id';

  static const String iso2Key = r'iso_2';

  static const String iso3Key = r'iso_3';

  static const String numCodeKey = r'num_code';

  static const String nameKey = r'name';

  static const String displayNameKey = r'display_name';
}
