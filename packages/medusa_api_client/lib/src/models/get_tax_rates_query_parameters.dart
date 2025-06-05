/// GetTaxRatesQueryParameters
/// {
///     "properties": {
///         "fields": {
///             "type": "string",
///             "description": "Comma-separated fields that should be included in the returned data. if a field is prefixed with `+` it will be added to the default fields, using `-` will remove it from the default fields. without prefix it will replace the entire default fields.",
///             "title": "fields"
///         },
///         "offset": {
///             "type": "number",
///             "description": "The number of items to skip when retrieving a list.",
///             "title": "offset"
///         },
///         "limit": {
///             "type": "number",
///             "description": "Limit the number of items returned in the list.",
///             "title": "limit"
///         },
///         "order": {
///             "type": "string",
///             "description": "The field to sort the data by. By default, the sort order is ascending. To change the order to descending, prefix the field name with `-`.",
///             "title": "order"
///         },
///         "q": {
///             "type": "string",
///             "description": "Search terms to filter the tax rate's searchable properties.",
///             "title": "q"
///         },
///         "tax_region_id": {
///             "oneOf": [
///                 {
///                     "type": "string",
///                     "description": "Filter by a tax region ID to retrieve its associated rates.",
///                     "title": "tax_region_id"
///                 },
///                 {
///                     "type": "array",
///                     "items": {
///                         "type": "string",
///                         "description": "A tax region ID.",
///                         "title": "tax_region_id"
///                     },
///                     "description": "Filter by tax region IDs to retrieve their associated rates."
///                 },
///                 {
///                     "type": "object",
///                     "description": "Apply filters on the tax region ID to retrieve the rates associated with the matching tax regions."
///                 }
///             ]
///         },
///         "is_default": {
///             "enum": [
///                 "true",
///                 "false"
///             ],
///             "type": "string"
///         },
///         "created_at": {
///             "type": "object",
///             "description": "Filter by a tax rate's creation date."
///         },
///         "updated_at": {
///             "type": "object",
///             "description": "Filter by a tax rate's update date."
///         },
///         "deleted_at": {
///             "type": "object",
///             "description": "Filter by a tax rate's deletion date."
///         },
///         "$and": {
///             "type": "array",
///             "items": {
///                 "type": "object"
///             },
///             "description": "Join query parameters with an AND condition. Each object's content is the same type as the expected query parameters.",
///             "title": "$and"
///         },
///         "$or": {
///             "type": "array",
///             "items": {
///                 "type": "object"
///             },
///             "description": "Join query parameters with an OR condition. Each object's content is the same type as the expected query parameters.",
///             "title": "$or"
///         },
///         "service_zone_id": {
///             "type": "string",
///             "description": "Filter by a service zone's ID to retrieve its associated tax rates.",
///             "title": "service_zone_id"
///         },
///         "shipping_profile_id": {
///             "type": "string",
///             "description": "Filter by a shipping profile's ID to retrieve its associated tax rates.",
///             "title": "shipping_profile_id"
///         },
///         "provider_id": {
///             "type": "string",
///             "description": "Filter by a fulfillment provider's ID to retrieve its associated tax rates.",
///             "title": "provider_id"
///         },
///         "shipping_option_type_id": {
///             "type": "string",
///             "description": "Filter by a shipping option type's ID to retrieve its associated tax rates.",
///             "title": "shipping_option_type_id"
///         }
///     },
///     "type": "object"
/// }
library;

import 'exports.dart';
part 'get_tax_rates_query_parameters.freezed.dart';
part 'get_tax_rates_query_parameters.g.dart'; // GetTaxRatesQueryParameters

@freezed
abstract class GetTaxRatesQueryParameters with _$GetTaxRatesQueryParameters {
  const GetTaxRatesQueryParameters._();

  @jsonSerializable
  const factory GetTaxRatesQueryParameters({
    /// fields
    @JsonKey(name: GetTaxRatesQueryParameters.fieldsKey) required String fields,

    /// offset
    @JsonKey(name: GetTaxRatesQueryParameters.offsetKey) required int offset,

    /// limit
    @JsonKey(name: GetTaxRatesQueryParameters.limitKey) required int limit,

    /// order
    @JsonKey(name: GetTaxRatesQueryParameters.orderKey) required String order,

    /// q
    @JsonKey(name: GetTaxRatesQueryParameters.qKey) required String q,

    /// taxRegionId
    @JsonKey(name: GetTaxRatesQueryParameters.taxRegionIdKey)
    required dynamic taxRegionId,

    /// isDefault
    @JsonKey(name: GetTaxRatesQueryParameters.isDefaultKey)
    required NullEnum isDefault,

    /// createdAt
    @JsonKey(name: GetTaxRatesQueryParameters.createdAtKey)
    required Map<String, dynamic> createdAt,

    /// updatedAt
    @JsonKey(name: GetTaxRatesQueryParameters.updatedAtKey)
    required Map<String, dynamic> updatedAt,

    /// deletedAt
    @JsonKey(name: GetTaxRatesQueryParameters.deletedAtKey)
    required Map<String, dynamic> deletedAt,

    /// and
    @JsonKey(name: GetTaxRatesQueryParameters.andKey)
    required List<Map<String, dynamic>> and,

    /// or
    @JsonKey(name: GetTaxRatesQueryParameters.orKey)
    required List<Map<String, dynamic>> or,

    /// serviceZoneId
    @JsonKey(name: GetTaxRatesQueryParameters.serviceZoneIdKey)
    required String serviceZoneId,

    /// shippingProfileId
    @JsonKey(name: GetTaxRatesQueryParameters.shippingProfileIdKey)
    required String shippingProfileId,

    /// providerId
    @JsonKey(name: GetTaxRatesQueryParameters.providerIdKey)
    required String providerId,

    /// shippingOptionTypeId
    @JsonKey(name: GetTaxRatesQueryParameters.shippingOptionTypeIdKey)
    required String shippingOptionTypeId,
  }) = _GetTaxRatesQueryParameters;

  factory GetTaxRatesQueryParameters.fromJson(Map<String, dynamic> json) =>
      _$GetTaxRatesQueryParametersFromJson(json);

  static const String fieldsKey = r'fields';

  static const String offsetKey = r'offset';

  static const String limitKey = r'limit';

  static const String orderKey = r'order';

  static const String qKey = r'q';

  static const String taxRegionIdKey = r'tax_region_id';

  static const String isDefaultKey = r'is_default';

  static const String createdAtKey = r'created_at';

  static const String updatedAtKey = r'updated_at';

  static const String deletedAtKey = r'deleted_at';

  static const String andKey = r'$and';

  static const String orKey = r'$or';

  static const String serviceZoneIdKey = r'service_zone_id';

  static const String shippingProfileIdKey = r'shipping_profile_id';

  static const String providerIdKey = r'provider_id';

  static const String shippingOptionTypeIdKey = r'shipping_option_type_id';
}
