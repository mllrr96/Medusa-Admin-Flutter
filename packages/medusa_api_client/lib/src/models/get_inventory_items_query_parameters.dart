/// GetInventoryItemsQueryParameters
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
///             "description": "The inventory item's q.",
///             "title": "q"
///         },
///         "id": {
///             "oneOf": [
///                 {
///                     "type": "string",
///                     "description": "The inventory item's ID.",
///                     "title": "id"
///                 },
///                 {
///                     "type": "array",
///                     "items": {
///                         "type": "string",
///                         "description": "The id's ID.",
///                         "title": "id"
///                     },
///                     "description": "The inventory item's ID."
///                 }
///             ]
///         },
///         "sku": {
///             "oneOf": [
///                 {
///                     "type": "string",
///                     "description": "The inventory item's sku.",
///                     "title": "sku"
///                 },
///                 {
///                     "type": "array",
///                     "items": {
///                         "type": "string",
///                         "description": "The sku's details.",
///                         "title": "sku"
///                     },
///                     "description": "The inventory item's sku."
///                 }
///             ]
///         },
///         "origin_country": {
///             "oneOf": [
///                 {
///                     "type": "string",
///                     "description": "The inventory item's origin country.",
///                     "title": "origin_country"
///                 },
///                 {
///                     "type": "array",
///                     "items": {
///                         "type": "string",
///                         "description": "The origin country's details.",
///                         "title": "origin_country"
///                     },
///                     "description": "The inventory item's origin country."
///                 }
///             ]
///         },
///         "mid_code": {
///             "oneOf": [
///                 {
///                     "type": "string",
///                     "description": "The inventory item's mid code.",
///                     "title": "mid_code"
///                 },
///                 {
///                     "type": "array",
///                     "items": {
///                         "type": "string",
///                         "description": "The mid code's details.",
///                         "title": "mid_code"
///                     },
///                     "description": "The inventory item's mid code."
///                 }
///             ]
///         },
///         "hs_code": {
///             "oneOf": [
///                 {
///                     "type": "string",
///                     "description": "The inventory item's hs code.",
///                     "title": "hs_code"
///                 },
///                 {
///                     "type": "array",
///                     "items": {
///                         "type": "string",
///                         "description": "The hs code's details.",
///                         "title": "hs_code"
///                     },
///                     "description": "The inventory item's hs code."
///                 }
///             ]
///         },
///         "material": {
///             "oneOf": [
///                 {
///                     "type": "string",
///                     "description": "The inventory item's material.",
///                     "title": "material"
///                 },
///                 {
///                     "type": "array",
///                     "items": {
///                         "type": "string",
///                         "description": "The material's details.",
///                         "title": "material"
///                     },
///                     "description": "The inventory item's material."
///                 }
///             ]
///         },
///         "requires_shipping": {
///             "type": "boolean",
///             "description": "The inventory item's requires shipping.",
///             "title": "requires_shipping"
///         },
///         "weight": {
///             "description": "Filter the inventory item's weight."
///         },
///         "length": {
///             "description": "Filter the inventory item's length."
///         },
///         "height": {
///             "description": "Filter by the inventory item's height."
///         },
///         "width": {
///             "description": "Filter by the inventory item's width."
///         },
///         "location_levels": {
///             "type": "object",
///             "description": "Filter by the inventory item's associated location IDs."
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
///         }
///     },
///     "type": "object"
/// }
library;

import 'exports.dart';
part 'get_inventory_items_query_parameters.freezed.dart';
part 'get_inventory_items_query_parameters.g.dart'; // GetInventoryItemsQueryParameters

@freezed
abstract class GetInventoryItemsQueryParameters
    with _$GetInventoryItemsQueryParameters {
  const GetInventoryItemsQueryParameters._();

  @jsonSerializable
  const factory GetInventoryItemsQueryParameters({
    /// fields
    @JsonKey(name: GetInventoryItemsQueryParameters.fieldsKey)
    required String fields,

    /// offset
    @JsonKey(name: GetInventoryItemsQueryParameters.offsetKey)
    required int offset,

    /// limit
    @JsonKey(name: GetInventoryItemsQueryParameters.limitKey)
    required int limit,

    /// order
    @JsonKey(name: GetInventoryItemsQueryParameters.orderKey)
    required String order,

    /// q
    @JsonKey(name: GetInventoryItemsQueryParameters.qKey) required String q,

    /// id
    @JsonKey(name: GetInventoryItemsQueryParameters.idKey) required dynamic id,

    /// sku
    @JsonKey(name: GetInventoryItemsQueryParameters.skuKey)
    required dynamic sku,

    /// originCountry
    @JsonKey(name: GetInventoryItemsQueryParameters.originCountryKey)
    required dynamic originCountry,

    /// midCode
    @JsonKey(name: GetInventoryItemsQueryParameters.midCodeKey)
    required dynamic midCode,

    /// hsCode
    @JsonKey(name: GetInventoryItemsQueryParameters.hsCodeKey)
    required dynamic hsCode,

    /// material
    @JsonKey(name: GetInventoryItemsQueryParameters.materialKey)
    required dynamic material,

    /// requiresShipping
    @JsonKey(name: GetInventoryItemsQueryParameters.requiresShippingKey)
    required bool requiresShipping,

    /// weight
    @JsonKey(name: GetInventoryItemsQueryParameters.weightKey)
    required dynamic weight,

    /// length
    @JsonKey(name: GetInventoryItemsQueryParameters.lengthKey)
    required dynamic length,

    /// height
    @JsonKey(name: GetInventoryItemsQueryParameters.heightKey)
    required dynamic height,

    /// width
    @JsonKey(name: GetInventoryItemsQueryParameters.widthKey)
    required dynamic width,

    /// locationLevels
    @JsonKey(name: GetInventoryItemsQueryParameters.locationLevelsKey)
    required Map<String, dynamic> locationLevels,

    /// and
    @JsonKey(name: GetInventoryItemsQueryParameters.andKey)
    required List<Map<String, dynamic>> and,

    /// or
    @JsonKey(name: GetInventoryItemsQueryParameters.orKey)
    required List<Map<String, dynamic>> or,
  }) = _GetInventoryItemsQueryParameters;

  factory GetInventoryItemsQueryParameters.fromJson(
    Map<String, dynamic> json,
  ) => _$GetInventoryItemsQueryParametersFromJson(json);

  static const String fieldsKey = r'fields';

  static const String offsetKey = r'offset';

  static const String limitKey = r'limit';

  static const String orderKey = r'order';

  static const String qKey = r'q';

  static const String idKey = r'id';

  static const String skuKey = r'sku';

  static const String originCountryKey = r'origin_country';

  static const String midCodeKey = r'mid_code';

  static const String hsCodeKey = r'hs_code';

  static const String materialKey = r'material';

  static const String requiresShippingKey = r'requires_shipping';

  static const String weightKey = r'weight';

  static const String lengthKey = r'length';

  static const String heightKey = r'height';

  static const String widthKey = r'width';

  static const String locationLevelsKey = r'location_levels';

  static const String andKey = r'$and';

  static const String orKey = r'$or';
}
