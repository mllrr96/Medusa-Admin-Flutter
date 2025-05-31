/// AdminRegion
/// {
///     "properties": {
///         "id": {
///             "type": "string",
///             "description": "The region's ID.",
///             "title": "id"
///         },
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
///         "automatic_taxes": {
///             "type": "boolean",
///             "description": "Whether taxes are applied automatically during checkout.",
///             "title": "automatic_taxes"
///         },
///         "countries": {
///             "type": "array",
///             "items": {
///                 "$ref": "#/components/schemas/AdminRegionCountry"
///             },
///             "description": "The region's countries."
///         },
///         "payment_providers": {
///             "type": "array",
///             "items": {
///                 "$ref": "#/components/schemas/AdminPaymentProvider"
///             },
///             "description": "The region's payment providers."
///         },
///         "metadata": {
///             "type": "object",
///             "description": "The region's metadata, can hold custom key-value pairs."
///         },
///         "created_at": {
///             "type": "string",
///             "format": "date-time",
///             "description": "The date the region was created.",
///             "title": "created_at"
///         },
///         "updated_at": {
///             "type": "string",
///             "format": "date-time",
///             "description": "The date the region was updated.",
///             "title": "updated_at"
///         }
///     },
///     "type": "object",
///     "required": [
///         "name",
///         "currency_code",
///         "id"
///     ],
///     "description": "The region's details."
/// }
library admin_region;

import 'exports.dart';
part 'admin_region.freezed.dart';
part 'admin_region.g.dart'; // AdminRegion

@freezed
abstract class AdminRegion with _$AdminRegion {
  const AdminRegion._();

  @jsonSerializable
  const factory AdminRegion({
    /// id
    @JsonKey(name: AdminRegion.idKey) required String id,

    /// name
    @JsonKey(name: AdminRegion.nameKey) required String name,

    /// currencyCode
    @JsonKey(name: AdminRegion.currencyCodeKey) required String currencyCode,

    /// automaticTaxes
    @JsonKey(name: AdminRegion.automaticTaxesKey) required bool automaticTaxes,

    /// countries
    @JsonKey(name: AdminRegion.countriesKey)
    required List<AdminRegionCountry> countries,

    /// paymentProviders
    @JsonKey(name: AdminRegion.paymentProvidersKey)
    required List<AdminPaymentProvider> paymentProviders,

    /// metadata
    @JsonKey(name: AdminRegion.metadataKey)
    required Map<String, dynamic> metadata,

    /// createdAt
    @JsonKey(name: AdminRegion.createdAtKey) required DateTime createdAt,

    /// updatedAt
    @JsonKey(name: AdminRegion.updatedAtKey) required DateTime updatedAt,
  }) = _AdminRegion;

  factory AdminRegion.fromJson(Map<String, dynamic> json) =>
      _$AdminRegionFromJson(json);

  static const String idKey = r'id';

  static const String nameKey = r'name';

  static const String currencyCodeKey = r'currency_code';

  static const String automaticTaxesKey = r'automatic_taxes';

  static const String countriesKey = r'countries';

  static const String paymentProvidersKey = r'payment_providers';

  static const String metadataKey = r'metadata';

  static const String createdAtKey = r'created_at';

  static const String updatedAtKey = r'updated_at';
}
