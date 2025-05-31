/// BaseRegion
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
///             "description": "The region's automatic taxes.",
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
///             "description": "The region's metadata."
///         },
///         "created_at": {
///             "type": "string",
///             "format": "date-time",
///             "description": "The region's created at.",
///             "title": "created_at"
///         },
///         "updated_at": {
///             "type": "string",
///             "format": "date-time",
///             "description": "The region's updated at.",
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
library base_region;

import 'exports.dart';
part 'base_region.freezed.dart';
part 'base_region.g.dart'; // BaseRegion

@freezed
abstract class BaseRegion with _$BaseRegion {
  const BaseRegion._();

  @jsonSerializable
  const factory BaseRegion({
    /// id
    @JsonKey(name: BaseRegion.idKey) required String id,

    /// name
    @JsonKey(name: BaseRegion.nameKey) required String name,

    /// currencyCode
    @JsonKey(name: BaseRegion.currencyCodeKey) required String currencyCode,

    /// automaticTaxes
    @JsonKey(name: BaseRegion.automaticTaxesKey) required bool automaticTaxes,

    /// countries
    @JsonKey(name: BaseRegion.countriesKey)
    required List<BaseRegionCountry> countries,

    /// paymentProviders
    @JsonKey(name: BaseRegion.paymentProvidersKey)
    required List<AdminPaymentProvider> paymentProviders,

    /// metadata
    @JsonKey(name: BaseRegion.metadataKey)
    required Map<String, dynamic> metadata,

    /// createdAt
    @JsonKey(name: BaseRegion.createdAtKey) required DateTime createdAt,

    /// updatedAt
    @JsonKey(name: BaseRegion.updatedAtKey) required DateTime updatedAt,
  }) = _BaseRegion;

  factory BaseRegion.fromJson(Map<String, dynamic> json) =>
      _$BaseRegionFromJson(json);

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
