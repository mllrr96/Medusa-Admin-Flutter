/// AdminCreateTaxRegion
/// {
///     "properties": {
///         "country_code": {
///             "type": "string",
///             "description": "The tax region's country code.",
///             "title": "country_code"
///         },
///         "province_code": {
///             "type": "string",
///             "description": "The tax region's ISO 3166-2 province code. Must be lower-case.",
///             "title": "province_code"
///         },
///         "parent_id": {
///             "type": "string",
///             "description": "The ID of the parent tax region.",
///             "title": "parent_id"
///         },
///         "default_tax_rate": {
///             "type": "object",
///             "description": "The tax region's default tax rate."
///         },
///         "metadata": {
///             "type": "object",
///             "description": "The tax region's metadata, used to store custom key-value pairs."
///         },
///         "provider_id": {
///             "type": "string",
///             "description": "The ID of the tax provider used to calculate the tax rate in this tax region.",
///             "title": "provider_id"
///         }
///     },
///     "type": "object",
///     "required": [
///         "country_code"
///     ],
///     "description": "The tax region's details."
/// }
library admin_create_tax_region;

import 'exports.dart';
part 'admin_create_tax_region.freezed.dart';
part 'admin_create_tax_region.g.dart'; // AdminCreateTaxRegion

@freezed
abstract class AdminCreateTaxRegion with _$AdminCreateTaxRegion {
  const AdminCreateTaxRegion._();

  @jsonSerializable
  const factory AdminCreateTaxRegion({
    /// countryCode
    @JsonKey(name: AdminCreateTaxRegion.countryCodeKey)
    required String countryCode,

    /// provinceCode
    @JsonKey(name: AdminCreateTaxRegion.provinceCodeKey)
    required String provinceCode,

    /// parentId
    @JsonKey(name: AdminCreateTaxRegion.parentIdKey) required String parentId,

    /// defaultTaxRate
    @JsonKey(name: AdminCreateTaxRegion.defaultTaxRateKey)
    required Map<String, dynamic> defaultTaxRate,

    /// metadata
    @JsonKey(name: AdminCreateTaxRegion.metadataKey)
    required Map<String, dynamic> metadata,

    /// providerId
    @JsonKey(name: AdminCreateTaxRegion.providerIdKey)
    required String providerId,
  }) = _AdminCreateTaxRegion;

  factory AdminCreateTaxRegion.fromJson(Map<String, dynamic> json) =>
      _$AdminCreateTaxRegionFromJson(json);

  static const String countryCodeKey = r'country_code';

  static const String provinceCodeKey = r'province_code';

  static const String parentIdKey = r'parent_id';

  static const String defaultTaxRateKey = r'default_tax_rate';

  static const String metadataKey = r'metadata';

  static const String providerIdKey = r'provider_id';
}
