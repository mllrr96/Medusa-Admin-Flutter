/// GetShippingOptionsQueryParameters
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
///         "id": {
///             "oneOf": [
///                 {
///                     "type": "string",
///                     "description": "Filter by a shipping option ID.",
///                     "title": "id"
///                 },
///                 {
///                     "type": "array",
///                     "items": {
///                         "type": "string",
///                         "description": "A shipping option's ID.",
///                         "title": "id"
///                     },
///                     "description": "Filter by shipping option IDs."
///                 }
///             ]
///         },
///         "q": {
///             "type": "string",
///             "description": "Search term to filter the shipping option's searchable properties.",
///             "title": "q"
///         },
///         "service_zone_id": {
///             "oneOf": [
///                 {
///                     "type": "string",
///                     "description": "Filter by a service zone's ID to retrieve its associated shipping options.",
///                     "title": "service_zone_id"
///                 },
///                 {
///                     "type": "array",
///                     "items": {
///                         "type": "string",
///                         "description": "A service zone ID.",
///                         "title": "service_zone_id"
///                     },
///                     "description": "Filter by service zone IDs to retrieve their associated shipping options."
///                 }
///             ]
///         },
///         "shipping_profile_id": {
///             "oneOf": [
///                 {
///                     "type": "string",
///                     "description": "Filter by a shipping profile's ID to retrieve its associated shipping options.",
///                     "title": "shipping_profile_id"
///                 },
///                 {
///                     "type": "array",
///                     "items": {
///                         "type": "string",
///                         "description": "A shipping profile ID.",
///                         "title": "shipping_profile_id"
///                     },
///                     "description": "Filter by shipping profile IDs to retrieve their associated shipping options."
///                 }
///             ]
///         },
///         "provider_id": {
///             "oneOf": [
///                 {
///                     "type": "string",
///                     "description": "Filter by a fulfillment provider's ID to retrieve its associated shipping options.",
///                     "title": "provider_id"
///                 },
///                 {
///                     "type": "array",
///                     "items": {
///                         "type": "string",
///                         "description": "A fulfillment provider ID.",
///                         "title": "provider_id"
///                     },
///                     "description": "Filter by fulfillment provider IDs to retrieve their associated shipping options."
///                 }
///             ]
///         },
///         "shipping_option_type_id": {
///             "oneOf": [
///                 {
///                     "type": "string",
///                     "description": "Filter by a shipping option type's ID to retrieve its associated shipping options.",
///                     "title": "shipping_option_type_id"
///                 },
///                 {
///                     "type": "array",
///                     "items": {
///                         "type": "string",
///                         "description": "A shipping option type ID.",
///                         "title": "shipping_option_type_id"
///                     },
///                     "description": "Filter by shipping option type IDs to retrieve its associated shipping options."
///                 }
///             ]
///         },
///         "created_at": {
///             "type": "object",
///             "description": "Filter by a shipping option's creation date."
///         },
///         "updated_at": {
///             "type": "object",
///             "description": "Filter by a shipping option's update date."
///         },
///         "deleted_at": {
///             "type": "object",
///             "description": "Filter by a shipping option's deletion date."
///         },
///         "stock_location_id": {
///             "oneOf": [
///                 {
///                     "type": "string",
///                     "description": "Filter by a location ID to retrieve its associated shipping option.",
///                     "title": "stock_location_id"
///                 },
///                 {
///                     "type": "array",
///                     "items": {
///                         "type": "string",
///                         "description": "A stock location's ID.",
///                         "title": "stock_location_id"
///                     },
///                     "description": "Filter by location IDs to retrieve their associated shipping option."
///                 }
///             ]
///         },
///         "is_return": {
///             "type": "boolean",
///             "description": "Filter by whether the shipping option is used for returns.",
///             "title": "is_return"
///         },
///         "admin_only": {
///             "type": "boolean",
///             "description": "Filter by whether the shipping option is used by admin users only.",
///             "title": "admin_only"
///         }
///     },
///     "type": "object"
/// }
library;

import 'exports.dart';
part 'get_shipping_options_query_parameters.freezed.dart';
part 'get_shipping_options_query_parameters.g.dart'; // GetShippingOptionsQueryParameters

@freezed
abstract class GetShippingOptionsQueryParameters
    with _$GetShippingOptionsQueryParameters {
  const GetShippingOptionsQueryParameters._();

  @jsonSerializable
  const factory GetShippingOptionsQueryParameters({
    /// fields
    @JsonKey(name: GetShippingOptionsQueryParameters.fieldsKey)
    required String fields,

    /// offset
    @JsonKey(name: GetShippingOptionsQueryParameters.offsetKey)
    required double offset,

    /// limit
    @JsonKey(name: GetShippingOptionsQueryParameters.limitKey)
    required double limit,

    /// order
    @JsonKey(name: GetShippingOptionsQueryParameters.orderKey)
    required String order,

    /// id
    @JsonKey(name: GetShippingOptionsQueryParameters.idKey) required dynamic id,

    /// q
    @JsonKey(name: GetShippingOptionsQueryParameters.qKey) required String q,

    /// serviceZoneId
    @JsonKey(name: GetShippingOptionsQueryParameters.serviceZoneIdKey)
    required dynamic serviceZoneId,

    /// shippingProfileId
    @JsonKey(name: GetShippingOptionsQueryParameters.shippingProfileIdKey)
    required dynamic shippingProfileId,

    /// providerId
    @JsonKey(name: GetShippingOptionsQueryParameters.providerIdKey)
    required dynamic providerId,

    /// shippingOptionTypeId
    @JsonKey(name: GetShippingOptionsQueryParameters.shippingOptionTypeIdKey)
    required dynamic shippingOptionTypeId,

    /// createdAt
    @JsonKey(name: GetShippingOptionsQueryParameters.createdAtKey)
    required Map<String, dynamic> createdAt,

    /// updatedAt
    @JsonKey(name: GetShippingOptionsQueryParameters.updatedAtKey)
    required Map<String, dynamic> updatedAt,

    /// deletedAt
    @JsonKey(name: GetShippingOptionsQueryParameters.deletedAtKey)
    required Map<String, dynamic> deletedAt,

    /// stockLocationId
    @JsonKey(name: GetShippingOptionsQueryParameters.stockLocationIdKey)
    required dynamic stockLocationId,

    /// isReturn
    @JsonKey(name: GetShippingOptionsQueryParameters.isReturnKey)
    required bool isReturn,

    /// adminOnly
    @JsonKey(name: GetShippingOptionsQueryParameters.adminOnlyKey)
    required bool adminOnly,
  }) = _GetShippingOptionsQueryParameters;

  factory GetShippingOptionsQueryParameters.fromJson(
    Map<String, dynamic> json,
  ) => _$GetShippingOptionsQueryParametersFromJson(json);

  static const String fieldsKey = r'fields';

  static const String offsetKey = r'offset';

  static const String limitKey = r'limit';

  static const String orderKey = r'order';

  static const String idKey = r'id';

  static const String qKey = r'q';

  static const String serviceZoneIdKey = r'service_zone_id';

  static const String shippingProfileIdKey = r'shipping_profile_id';

  static const String providerIdKey = r'provider_id';

  static const String shippingOptionTypeIdKey = r'shipping_option_type_id';

  static const String createdAtKey = r'created_at';

  static const String updatedAtKey = r'updated_at';

  static const String deletedAtKey = r'deleted_at';

  static const String stockLocationIdKey = r'stock_location_id';

  static const String isReturnKey = r'is_return';

  static const String adminOnlyKey = r'admin_only';
}
