/// GetSalesChannelsQueryParameters
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
///             "description": "Search term to filter the sales channel's searchable properties.",
///             "title": "q"
///         },
///         "id": {
///             "oneOf": [
///                 {
///                     "type": "string",
///                     "description": "Filter by a sales channel ID.",
///                     "title": "id"
///                 },
///                 {
///                     "type": "array",
///                     "items": {
///                         "type": "string",
///                         "description": "A sales channel ID.",
///                         "title": "id"
///                     },
///                     "description": "Filter by sales channel IDs."
///                 }
///             ]
///         },
///         "name": {
///             "oneOf": [
///                 {
///                     "type": "string",
///                     "description": "Filter by a sales channel name.",
///                     "title": "name"
///                 },
///                 {
///                     "type": "array",
///                     "items": {
///                         "type": "string",
///                         "description": "A sales channel name.",
///                         "title": "name"
///                     },
///                     "description": "Filter by sales channel names."
///                 }
///             ]
///         },
///         "description": {
///             "type": "string",
///             "description": "Filter by a description. This filter matches an entire description. To search by terms or keywords, use the `q` query parameter instead.",
///             "title": "description"
///         },
///         "is_disabled": {
///             "type": "boolean",
///             "description": "Filter by whether the sales channel is disabled.",
///             "title": "is_disabled"
///         },
///         "created_at": {
///             "type": "object",
///             "description": "Filter by a sales channel's creation date."
///         },
///         "updated_at": {
///             "type": "object",
///             "description": "Filter by a sales channel's update date."
///         },
///         "deleted_at": {
///             "type": "object",
///             "description": "Filter by a sales channel's deletion date."
///         },
///         "location_id": {
///             "oneOf": [
///                 {
///                     "type": "string",
///                     "description": "Filter by a location ID to retrieve its associated sales channels.",
///                     "title": "location_id"
///                 },
///                 {
///                     "type": "array",
///                     "items": {
///                         "type": "string",
///                         "description": "A location ID.",
///                         "title": "location_id"
///                     },
///                     "description": "Filter by location IDs to retrieve their associated sales channels."
///                 }
///             ]
///         },
///         "publishable_key_id": {
///             "oneOf": [
///                 {
///                     "type": "string",
///                     "description": "Filter by a publishable API key's ID to retrieve its associated sales channels.",
///                     "title": "publishable_key_id"
///                 },
///                 {
///                     "type": "array",
///                     "items": {
///                         "type": "string",
///                         "description": "A publishable API key ID.",
///                         "title": "publishable_key_id"
///                     },
///                     "description": "Filter by publishable API key IDs to retrieve their associated sales channels."
///                 }
///             ]
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
part 'get_sales_channels_query_parameters.freezed.dart';
part 'get_sales_channels_query_parameters.g.dart'; // GetSalesChannelsQueryParameters

@freezed
abstract class GetSalesChannelsQueryParameters
    with _$GetSalesChannelsQueryParameters {
  const GetSalesChannelsQueryParameters._();

  @jsonSerializable
  const factory GetSalesChannelsQueryParameters({
    /// fields
    @JsonKey(name: GetSalesChannelsQueryParameters.fieldsKey)
    required String fields,

    /// offset
    @JsonKey(name: GetSalesChannelsQueryParameters.offsetKey)
    required double offset,

    /// limit
    @JsonKey(name: GetSalesChannelsQueryParameters.limitKey)
    required double limit,

    /// order
    @JsonKey(name: GetSalesChannelsQueryParameters.orderKey)
    required String order,

    /// q
    @JsonKey(name: GetSalesChannelsQueryParameters.qKey) required String q,

    /// id
    @JsonKey(name: GetSalesChannelsQueryParameters.idKey) required dynamic id,

    /// name
    @JsonKey(name: GetSalesChannelsQueryParameters.nameKey)
    required dynamic name,

    /// description
    @JsonKey(name: GetSalesChannelsQueryParameters.descriptionKey)
    required String description,

    /// isDisabled
    @JsonKey(name: GetSalesChannelsQueryParameters.isDisabledKey)
    required bool isDisabled,

    /// createdAt
    @JsonKey(name: GetSalesChannelsQueryParameters.createdAtKey)
    required Map<String, dynamic> createdAt,

    /// updatedAt
    @JsonKey(name: GetSalesChannelsQueryParameters.updatedAtKey)
    required Map<String, dynamic> updatedAt,

    /// deletedAt
    @JsonKey(name: GetSalesChannelsQueryParameters.deletedAtKey)
    required Map<String, dynamic> deletedAt,

    /// locationId
    @JsonKey(name: GetSalesChannelsQueryParameters.locationIdKey)
    required dynamic locationId,

    /// publishableKeyId
    @JsonKey(name: GetSalesChannelsQueryParameters.publishableKeyIdKey)
    required dynamic publishableKeyId,

    /// and
    @JsonKey(name: GetSalesChannelsQueryParameters.andKey)
    required List<Map<String, dynamic>> and,

    /// or
    @JsonKey(name: GetSalesChannelsQueryParameters.orKey)
    required List<Map<String, dynamic>> or,
  }) = _GetSalesChannelsQueryParameters;

  factory GetSalesChannelsQueryParameters.fromJson(Map<String, dynamic> json) =>
      _$GetSalesChannelsQueryParametersFromJson(json);

  static const String fieldsKey = r'fields';

  static const String offsetKey = r'offset';

  static const String limitKey = r'limit';

  static const String orderKey = r'order';

  static const String qKey = r'q';

  static const String idKey = r'id';

  static const String nameKey = r'name';

  static const String descriptionKey = r'description';

  static const String isDisabledKey = r'is_disabled';

  static const String createdAtKey = r'created_at';

  static const String updatedAtKey = r'updated_at';

  static const String deletedAtKey = r'deleted_at';

  static const String locationIdKey = r'location_id';

  static const String publishableKeyIdKey = r'publishable_key_id';

  static const String andKey = r'$and';

  static const String orKey = r'$or';
}
