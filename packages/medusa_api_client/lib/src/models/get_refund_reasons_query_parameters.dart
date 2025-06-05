/// GetRefundReasonsQueryParameters
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
///                     "description": "Filter by a refund reason's ID.",
///                     "title": "id"
///                 },
///                 {
///                     "type": "array",
///                     "items": {
///                         "type": "string",
///                         "description": "A refund reason ID.",
///                         "title": "id"
///                     },
///                     "description": "Filter by refund reason IDs."
///                 }
///             ]
///         },
///         "q": {
///             "type": "string",
///             "description": "Search term to filter the refund reason's searchable properties.",
///             "title": "q"
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
part 'get_refund_reasons_query_parameters.freezed.dart';
part 'get_refund_reasons_query_parameters.g.dart'; // GetRefundReasonsQueryParameters

@freezed
abstract class GetRefundReasonsQueryParameters
    with _$GetRefundReasonsQueryParameters {
  const GetRefundReasonsQueryParameters._();

  @jsonSerializable
  const factory GetRefundReasonsQueryParameters({
    /// fields
    @JsonKey(name: GetRefundReasonsQueryParameters.fieldsKey)
    required String fields,

    /// offset
    @JsonKey(name: GetRefundReasonsQueryParameters.offsetKey)
    required int offset,

    /// limit
    @JsonKey(name: GetRefundReasonsQueryParameters.limitKey)
    required int limit,

    /// order
    @JsonKey(name: GetRefundReasonsQueryParameters.orderKey)
    required String order,

    /// id
    @JsonKey(name: GetRefundReasonsQueryParameters.idKey) required dynamic id,

    /// q
    @JsonKey(name: GetRefundReasonsQueryParameters.qKey) required String q,

    /// and
    @JsonKey(name: GetRefundReasonsQueryParameters.andKey)
    required List<Map<String, dynamic>> and,

    /// or
    @JsonKey(name: GetRefundReasonsQueryParameters.orKey)
    required List<Map<String, dynamic>> or,
  }) = _GetRefundReasonsQueryParameters;

  factory GetRefundReasonsQueryParameters.fromJson(Map<String, dynamic> json) =>
      _$GetRefundReasonsQueryParametersFromJson(json);

  static const String fieldsKey = r'fields';

  static const String offsetKey = r'offset';

  static const String limitKey = r'limit';

  static const String orderKey = r'order';

  static const String idKey = r'id';

  static const String qKey = r'q';

  static const String andKey = r'$and';

  static const String orKey = r'$or';
}
