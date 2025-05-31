/// StoreRegionCountry
/// {
///     "properties": {
///         "id": {
///             "type": "string",
///             "description": "The country's ID.",
///             "title": "id"
///         },
///         "iso_2": {
///             "type": "string",
///             "description": "The country's ISO 2.",
///             "title": "iso_2"
///         },
///         "iso_3": {
///             "type": "string",
///             "description": "The country's ISO 3.",
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
library store_region_country;

import 'exports.dart';
part 'store_region_country.freezed.dart';
part 'store_region_country.g.dart'; // StoreRegionCountry

@freezed
abstract class StoreRegionCountry with _$StoreRegionCountry {
  const StoreRegionCountry._();

  @jsonSerializable
  const factory StoreRegionCountry({
    /// id
    @JsonKey(name: StoreRegionCountry.idKey) required String id,

    /// iso2
    @JsonKey(name: StoreRegionCountry.iso2Key) required String iso2,

    /// iso3
    @JsonKey(name: StoreRegionCountry.iso3Key) required String iso3,

    /// numCode
    @JsonKey(name: StoreRegionCountry.numCodeKey) required String numCode,

    /// name
    @JsonKey(name: StoreRegionCountry.nameKey) required String name,

    /// displayName
    @JsonKey(name: StoreRegionCountry.displayNameKey)
    required String displayName,
  }) = _StoreRegionCountry;

  factory StoreRegionCountry.fromJson(Map<String, dynamic> json) =>
      _$StoreRegionCountryFromJson(json);

  static const String idKey = r'id';

  static const String iso2Key = r'iso_2';

  static const String iso3Key = r'iso_3';

  static const String numCodeKey = r'num_code';

  static const String nameKey = r'name';

  static const String displayNameKey = r'display_name';
}
