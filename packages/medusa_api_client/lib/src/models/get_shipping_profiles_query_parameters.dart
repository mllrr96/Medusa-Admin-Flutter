/// GetShippingProfilesQueryParameters
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
///                     "description": "Filter by a shipping profile's ID.",
///                     "title": "id"
///                 },
///                 {
///                     "type": "array",
///                     "items": {
///                         "type": "string",
///                         "description": "A shipping profile ID.",
///                         "title": "id"
///                     },
///                     "description": "Filter by shipping profile IDs."
///                 }
///             ]
///         },
///         "q": {
///             "type": "string",
///             "description": "Search term to filter the shipping profile's searchable properties.",
///             "title": "q"
///         },
///         "type": {
///             "type": "string",
///             "description": "Filter by a shipping profile's type.",
///             "title": "type"
///         },
///         "name": {
///             "type": "string",
///             "description": "Filter by a shipping profile's name.",
///             "title": "name"
///         },
///         "created_at": {
///             "type": "object",
///             "description": "Filter by a shipping profile's creation date."
///         },
///         "updated_at": {
///             "type": "object",
///             "description": "Filter by a shipping profile's update date."
///         },
///         "deleted_at": {
///             "type": "object",
///             "description": "Filter by a shipping profile's deletion date."
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
part 'get_shipping_profiles_query_parameters.freezed.dart';
part 'get_shipping_profiles_query_parameters.g.dart'; // GetShippingProfilesQueryParameters

@freezed
abstract class GetShippingProfilesQueryParameters
    with _$GetShippingProfilesQueryParameters {
  const GetShippingProfilesQueryParameters._();

  @jsonSerializable
  const factory GetShippingProfilesQueryParameters({
    /// fields
    @JsonKey(name: GetShippingProfilesQueryParameters.fieldsKey)
    required String fields,

    /// offset
    @JsonKey(name: GetShippingProfilesQueryParameters.offsetKey)
    required int offset,

    /// limit
    @JsonKey(name: GetShippingProfilesQueryParameters.limitKey)
    required int limit,

    /// order
    @JsonKey(name: GetShippingProfilesQueryParameters.orderKey)
    required String order,

    /// id
    @JsonKey(name: GetShippingProfilesQueryParameters.idKey)
    required dynamic id,

    /// q
    @JsonKey(name: GetShippingProfilesQueryParameters.qKey) required String q,

    /// type
    @JsonKey(name: GetShippingProfilesQueryParameters.typeKey)
    required String type,

    /// name
    @JsonKey(name: GetShippingProfilesQueryParameters.nameKey)
    required String name,

    /// createdAt
    @JsonKey(name: GetShippingProfilesQueryParameters.createdAtKey)
    required Map<String, dynamic> createdAt,

    /// updatedAt
    @JsonKey(name: GetShippingProfilesQueryParameters.updatedAtKey)
    required Map<String, dynamic> updatedAt,

    /// deletedAt
    @JsonKey(name: GetShippingProfilesQueryParameters.deletedAtKey)
    required Map<String, dynamic> deletedAt,

    /// and
    @JsonKey(name: GetShippingProfilesQueryParameters.andKey)
    required List<Map<String, dynamic>> and,

    /// or
    @JsonKey(name: GetShippingProfilesQueryParameters.orKey)
    required List<Map<String, dynamic>> or,
  }) = _GetShippingProfilesQueryParameters;

  factory GetShippingProfilesQueryParameters.fromJson(
    Map<String, dynamic> json,
  ) => _$GetShippingProfilesQueryParametersFromJson(json);

  static const String fieldsKey = r'fields';

  static const String offsetKey = r'offset';

  static const String limitKey = r'limit';

  static const String orderKey = r'order';

  static const String idKey = r'id';

  static const String qKey = r'q';

  static const String typeKey = r'type';

  static const String nameKey = r'name';

  static const String createdAtKey = r'created_at';

  static const String updatedAtKey = r'updated_at';

  static const String deletedAtKey = r'deleted_at';

  static const String andKey = r'$and';

  static const String orKey = r'$or';
}
