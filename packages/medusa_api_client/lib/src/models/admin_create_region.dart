/// AdminCreateRegion
/// {
///     "properties": {
///         "name": {
///             "type": "string",
///             "description": "The region's name.",
///             "title": "name"
///         },
///         "currency_code": {
///             "type": "string",
///             "description": "The region's currency code.",
///             "title": "currency_code"
///         },
///         "countries": {
///             "type": "array",
///             "items": {
///                 "type": "string",
///                 "description": "A country code.",
///                 "title": "countries"
///             },
///             "description": "The region's countries."
///         },
///         "automatic_taxes": {
///             "type": "boolean",
///             "description": "Whether taxes are calculated automatically during checkout in this region.",
///             "title": "automatic_taxes"
///         },
///         "is_tax_inclusive": {
///             "type": "boolean",
///             "description": "Whether prices in this region are tax inclusive.",
///             "title": "is_tax_inclusive"
///         },
///         "payment_providers": {
///             "type": "array",
///             "items": {
///                 "type": "string",
///                 "description": "A payment provider's ID.",
///                 "title": "payment_providers"
///             },
///             "description": "The payment providers enabled in this region."
///         },
///         "metadata": {
///             "type": "object",
///             "description": "The region's metadata, used to store custom key-value pairs."
///         }
///     },
///     "type": "object",
///     "required": [
///         "name",
///         "currency_code"
///     ],
///     "description": "The region's details."
/// }
library admin_create_region;

import 'exports.dart';
part 'admin_create_region.freezed.dart';
part 'admin_create_region.g.dart'; // AdminCreateRegion

@freezed
abstract class AdminCreateRegion with _$AdminCreateRegion {
  const AdminCreateRegion._();

  @jsonSerializable
  const factory AdminCreateRegion({
    /// name
    @JsonKey(name: AdminCreateRegion.nameKey) required String name,

    /// currencyCode
    @JsonKey(name: AdminCreateRegion.currencyCodeKey)
    required String currencyCode,

    /// countries
    @JsonKey(name: AdminCreateRegion.countriesKey)
    required List<String> countries,

    /// automaticTaxes
    @JsonKey(name: AdminCreateRegion.automaticTaxesKey)
    required bool automaticTaxes,

    /// isTaxInclusive
    @JsonKey(name: AdminCreateRegion.isTaxInclusiveKey)
    required bool isTaxInclusive,

    /// paymentProviders
    @JsonKey(name: AdminCreateRegion.paymentProvidersKey)
    required List<String> paymentProviders,

    /// metadata
    @JsonKey(name: AdminCreateRegion.metadataKey)
    required Map<String, dynamic> metadata,
  }) = _AdminCreateRegion;

  factory AdminCreateRegion.fromJson(Map<String, dynamic> json) =>
      _$AdminCreateRegionFromJson(json);

  static const String nameKey = r'name';

  static const String currencyCodeKey = r'currency_code';

  static const String countriesKey = r'countries';

  static const String automaticTaxesKey = r'automatic_taxes';

  static const String isTaxInclusiveKey = r'is_tax_inclusive';

  static const String paymentProvidersKey = r'payment_providers';

  static const String metadataKey = r'metadata';
}
