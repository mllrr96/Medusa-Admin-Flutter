/// GetCurrenciesQueryParameters
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
///             "description": "The search term to filter the currency's searchable properties by.",
///             "title": "q"
///         },
///         "code": {
///             "oneOf": [
///                 {
///                     "type": "string",
///                     "description": "Filter by a currency code.",
///                     "title": "code"
///                 },
///                 {
///                     "type": "array",
///                     "items": {
///                         "type": "string",
///                         "description": "A currency code.",
///                         "title": "code"
///                     },
///                     "description": "Filter by currency codes."
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
part 'get_currencies_query_parameters.freezed.dart';
part 'get_currencies_query_parameters.g.dart'; // GetCurrenciesQueryParameters

@freezed
abstract class GetCurrenciesQueryParameters
    with _$GetCurrenciesQueryParameters {
  const GetCurrenciesQueryParameters._();

  @jsonSerializable
  const factory GetCurrenciesQueryParameters({
    /// fields
    @JsonKey(name: GetCurrenciesQueryParameters.fieldsKey)
    required String fields,

    /// offset
    @JsonKey(name: GetCurrenciesQueryParameters.offsetKey)
    required double offset,

    /// limit
    @JsonKey(name: GetCurrenciesQueryParameters.limitKey) required double limit,

    /// order
    @JsonKey(name: GetCurrenciesQueryParameters.orderKey) required String order,

    /// q
    @JsonKey(name: GetCurrenciesQueryParameters.qKey) required String q,

    /// code
    @JsonKey(name: GetCurrenciesQueryParameters.codeKey) required dynamic code,

    /// and
    @JsonKey(name: GetCurrenciesQueryParameters.andKey)
    required List<Map<String, dynamic>> and,

    /// or
    @JsonKey(name: GetCurrenciesQueryParameters.orKey)
    required List<Map<String, dynamic>> or,
  }) = _GetCurrenciesQueryParameters;

  factory GetCurrenciesQueryParameters.fromJson(Map<String, dynamic> json) =>
      _$GetCurrenciesQueryParametersFromJson(json);

  static const String fieldsKey = r'fields';

  static const String offsetKey = r'offset';

  static const String limitKey = r'limit';

  static const String orderKey = r'order';

  static const String qKey = r'q';

  static const String codeKey = r'code';

  static const String andKey = r'$and';

  static const String orKey = r'$or';
}
