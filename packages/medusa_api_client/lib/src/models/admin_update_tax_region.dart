/// AdminUpdateTaxRegion
/// {
///     "properties": {
///         "province_code": {
///             "type": "string",
///             "description": "The tax region's ISO 3166-2 province code. Must be lower-case.",
///             "title": "province_code"
///         },
///         "metadata": {
///             "type": "object",
///             "description": "The tax region's metadata, can hold custom key-value pairs."
///         },
///         "provider_id": {
///             "type": "string",
///             "description": "The ID of the tax provider to use when calculating taxes for this tax region.",
///             "title": "provider_id"
///         }
///     },
///     "type": "object",
///     "description": "The details to update in a tax region."
/// }
library;

import 'exports.dart';
part 'admin_update_tax_region.freezed.dart';
part 'admin_update_tax_region.g.dart'; // AdminUpdateTaxRegion

@freezed
abstract class AdminUpdateTaxRegion with _$AdminUpdateTaxRegion {
  const AdminUpdateTaxRegion._();

  @jsonSerializable
  const factory AdminUpdateTaxRegion({
    /// provinceCode
    @JsonKey(name: AdminUpdateTaxRegion.provinceCodeKey)
    required String provinceCode,

    /// metadata
    @JsonKey(name: AdminUpdateTaxRegion.metadataKey)
    required Map<String, dynamic> metadata,

    /// providerId
    @JsonKey(name: AdminUpdateTaxRegion.providerIdKey)
    required String providerId,
  }) = _AdminUpdateTaxRegion;

  factory AdminUpdateTaxRegion.fromJson(Map<String, dynamic> json) =>
      _$AdminUpdateTaxRegionFromJson(json);

  static const String provinceCodeKey = r'province_code';

  static const String metadataKey = r'metadata';

  static const String providerIdKey = r'provider_id';
}
