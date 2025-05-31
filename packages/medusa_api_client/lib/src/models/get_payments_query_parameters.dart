/// GetPaymentsQueryParameters
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
///             "description": "Search term to filter the payment's searchable properties.",
///             "title": "q"
///         },
///         "id": {
///             "oneOf": [
///                 {
///                     "type": "string",
///                     "description": "Filter by a payment ID.",
///                     "title": "id"
///                 },
///                 {
///                     "type": "array",
///                     "items": {
///                         "type": "string",
///                         "description": "A payment ID.",
///                         "title": "id"
///                     },
///                     "description": "Filter by payment IDs."
///                 }
///             ]
///         },
///         "payment_session_id": {
///             "oneOf": [
///                 {
///                     "type": "string",
///                     "description": "Filter by a payment session ID to retrieve its associated payments.",
///                     "title": "payment_session_id"
///                 },
///                 {
///                     "type": "array",
///                     "items": {
///                         "type": "string",
///                         "description": "A payment session's ID.",
///                         "title": "payment_session_id"
///                     },
///                     "description": "Filter by payment session IDs to retrieve their associated payments."
///                 }
///             ]
///         },
///         "created_at": {
///             "type": "object",
///             "description": "Filter by the payment's creation date."
///         },
///         "updated_at": {
///             "type": "object",
///             "description": "Filter by the payment's update date."
///         },
///         "deleted_at": {
///             "type": "object",
///             "description": "Filter by the payment's deletion date."
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
part 'get_payments_query_parameters.freezed.dart';
part 'get_payments_query_parameters.g.dart'; // GetPaymentsQueryParameters

@freezed
abstract class GetPaymentsQueryParameters with _$GetPaymentsQueryParameters {
  const GetPaymentsQueryParameters._();

  @jsonSerializable
  const factory GetPaymentsQueryParameters({
    /// fields
    @JsonKey(name: GetPaymentsQueryParameters.fieldsKey) required String fields,

    /// offset
    @JsonKey(name: GetPaymentsQueryParameters.offsetKey) required double offset,

    /// limit
    @JsonKey(name: GetPaymentsQueryParameters.limitKey) required double limit,

    /// order
    @JsonKey(name: GetPaymentsQueryParameters.orderKey) required String order,

    /// q
    @JsonKey(name: GetPaymentsQueryParameters.qKey) required String q,

    /// id
    @JsonKey(name: GetPaymentsQueryParameters.idKey) required dynamic id,

    /// paymentSessionId
    @JsonKey(name: GetPaymentsQueryParameters.paymentSessionIdKey)
    required dynamic paymentSessionId,

    /// createdAt
    @JsonKey(name: GetPaymentsQueryParameters.createdAtKey)
    required Map<String, dynamic> createdAt,

    /// updatedAt
    @JsonKey(name: GetPaymentsQueryParameters.updatedAtKey)
    required Map<String, dynamic> updatedAt,

    /// deletedAt
    @JsonKey(name: GetPaymentsQueryParameters.deletedAtKey)
    required Map<String, dynamic> deletedAt,

    /// and
    @JsonKey(name: GetPaymentsQueryParameters.andKey)
    required List<Map<String, dynamic>> and,

    /// or
    @JsonKey(name: GetPaymentsQueryParameters.orKey)
    required List<Map<String, dynamic>> or,
  }) = _GetPaymentsQueryParameters;

  factory GetPaymentsQueryParameters.fromJson(Map<String, dynamic> json) =>
      _$GetPaymentsQueryParametersFromJson(json);

  static const String fieldsKey = r'fields';

  static const String offsetKey = r'offset';

  static const String limitKey = r'limit';

  static const String orderKey = r'order';

  static const String qKey = r'q';

  static const String idKey = r'id';

  static const String paymentSessionIdKey = r'payment_session_id';

  static const String createdAtKey = r'created_at';

  static const String updatedAtKey = r'updated_at';

  static const String deletedAtKey = r'deleted_at';

  static const String andKey = r'$and';

  static const String orKey = r'$or';
}
