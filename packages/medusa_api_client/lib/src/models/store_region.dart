/// StoreRegion
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
///             "description": "Whether taxes are calculated automatically during checkout for carts that belong to this region.",
///             "title": "automatic_taxes"
///         },
///         "countries": {
///             "type": "array",
///             "items": {
///                 "$ref": "#/components/schemas/BaseRegionCountry"
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
///         "id",
///         "name",
///         "currency_code"
///     ],
///     "description": "The region's details."
/// }
library;

import 'exports.dart';
part 'store_region.freezed.dart';
part 'store_region.g.dart'; // StoreRegion

@freezed
abstract class StoreRegion with _$StoreRegion {
  const StoreRegion._();

  @jsonSerializable
  const factory StoreRegion({
    /// id
    @JsonKey(name: StoreRegion.idKey) required String id,

    /// name
    @JsonKey(name: StoreRegion.nameKey) required String name,

    /// currencyCode
    @JsonKey(name: StoreRegion.currencyCodeKey) required String currencyCode,

    /// automaticTaxes
    @JsonKey(name: StoreRegion.automaticTaxesKey) required bool automaticTaxes,

    /// countries
    @JsonKey(name: StoreRegion.countriesKey)
    required List<BaseRegionCountry> countries,

    /// paymentProviders
    @JsonKey(name: StoreRegion.paymentProvidersKey)
    required List<AdminPaymentProvider> paymentProviders,

    /// metadata
    @JsonKey(name: StoreRegion.metadataKey)
    required Map<String, dynamic> metadata,

    /// createdAt
    @JsonKey(name: StoreRegion.createdAtKey) required DateTime createdAt,

    /// updatedAt
    @JsonKey(name: StoreRegion.updatedAtKey) required DateTime updatedAt,
  }) = _StoreRegion;

  factory StoreRegion.fromJson(Map<String, dynamic> json) =>
      _$StoreRegionFromJson(json);

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
