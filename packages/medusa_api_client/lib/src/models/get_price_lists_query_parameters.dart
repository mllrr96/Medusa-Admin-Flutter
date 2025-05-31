/// GetPriceListsQueryParameters
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
///             "description": "Search term to filter the price list's searchable properties.",
///             "title": "q"
///         },
///         "id": {
///             "oneOf": [
///                 {
///                     "type": "string",
///                     "description": "Filter by a price list ID.",
///                     "title": "id"
///                 },
///                 {
///                     "type": "array",
///                     "items": {
///                         "type": "string",
///                         "description": "A price list ID.",
///                         "title": "id"
///                     },
///                     "description": "Filter by price list IDs."
///                 }
///             ]
///         },
///         "starts_at": {
///             "type": "object",
///             "description": "Filter by a price list's start date."
///         },
///         "ends_at": {
///             "type": "object",
///             "description": "Filter by the price list's end date."
///         },
///         "status": {
///             "type": "array",
///             "items": {
///                 "enum": [
///                     "active",
///                     "draft"
///                 ],
///                 "type": "string",
///                 "description": "A price list's status."
///             },
///             "description": "Filter by the price list's status."
///         },
///         "rules_count": {
///             "type": "array",
///             "items": {
///                 "type": "number",
///                 "description": "The price list's rule count.",
///                 "title": "rules_count"
///             },
///             "description": "Filter by the price list's rules count."
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
part 'get_price_lists_query_parameters.freezed.dart';
part 'get_price_lists_query_parameters.g.dart'; // GetPriceListsQueryParameters

@freezed
abstract class GetPriceListsQueryParameters
    with _$GetPriceListsQueryParameters {
  const GetPriceListsQueryParameters._();

  @jsonSerializable
  const factory GetPriceListsQueryParameters({
    /// fields
    @JsonKey(name: GetPriceListsQueryParameters.fieldsKey)
    required String fields,

    /// offset
    @JsonKey(name: GetPriceListsQueryParameters.offsetKey)
    required double offset,

    /// limit
    @JsonKey(name: GetPriceListsQueryParameters.limitKey) required double limit,

    /// order
    @JsonKey(name: GetPriceListsQueryParameters.orderKey) required String order,

    /// q
    @JsonKey(name: GetPriceListsQueryParameters.qKey) required String q,

    /// id
    @JsonKey(name: GetPriceListsQueryParameters.idKey) required dynamic id,

    /// startsAt
    @JsonKey(name: GetPriceListsQueryParameters.startsAtKey)
    required Map<String, dynamic> startsAt,

    /// endsAt
    @JsonKey(name: GetPriceListsQueryParameters.endsAtKey)
    required Map<String, dynamic> endsAt,

    /// status
    @JsonKey(name: GetPriceListsQueryParameters.statusKey)
    required List<NullEnum> status,

    /// rulesCount
    @JsonKey(name: GetPriceListsQueryParameters.rulesCountKey)
    required List<double> rulesCount,

    /// and
    @JsonKey(name: GetPriceListsQueryParameters.andKey)
    required List<Map<String, dynamic>> and,

    /// or
    @JsonKey(name: GetPriceListsQueryParameters.orKey)
    required List<Map<String, dynamic>> or,
  }) = _GetPriceListsQueryParameters;

  factory GetPriceListsQueryParameters.fromJson(Map<String, dynamic> json) =>
      _$GetPriceListsQueryParametersFromJson(json);

  static const String fieldsKey = r'fields';

  static const String offsetKey = r'offset';

  static const String limitKey = r'limit';

  static const String orderKey = r'order';

  static const String qKey = r'q';

  static const String idKey = r'id';

  static const String startsAtKey = r'starts_at';

  static const String endsAtKey = r'ends_at';

  static const String statusKey = r'status';

  static const String rulesCountKey = r'rules_count';

  static const String andKey = r'$and';

  static const String orKey = r'$or';
}
