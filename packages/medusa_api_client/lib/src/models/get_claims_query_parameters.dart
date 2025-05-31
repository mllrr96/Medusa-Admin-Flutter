/// GetClaimsQueryParameters
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
///         "deleted_at": {
///             "type": "object",
///             "description": "The claim's deleted at."
///         },
///         "q": {
///             "type": "string",
///             "description": "The claim's q.",
///             "title": "q"
///         },
///         "id": {
///             "oneOf": [
///                 {
///                     "type": "string",
///                     "description": "The claim's ID.",
///                     "title": "id"
///                 },
///                 {
///                     "type": "array",
///                     "items": {
///                         "type": "string",
///                         "description": "The id's ID.",
///                         "title": "id"
///                     },
///                     "description": "The claim's ID."
///                 }
///             ]
///         },
///         "order_id": {
///             "oneOf": [
///                 {
///                     "type": "string",
///                     "description": "The claim's order id.",
///                     "title": "order_id"
///                 },
///                 {
///                     "type": "array",
///                     "items": {
///                         "type": "string",
///                         "description": "The order id's details.",
///                         "title": "order_id"
///                     },
///                     "description": "The claim's order id."
///                 }
///             ]
///         },
///         "status": {
///             "oneOf": [
///                 {
///                     "type": "string",
///                     "description": "The claim's status.",
///                     "title": "status"
///                 },
///                 {
///                     "type": "array",
///                     "items": {
///                         "type": "string",
///                         "description": "The status's details.",
///                         "title": "status"
///                     },
///                     "description": "The claim's status."
///                 }
///             ]
///         },
///         "created_at": {
///             "type": "object",
///             "description": "The claim's created at."
///         },
///         "updated_at": {
///             "type": "object",
///             "description": "The claim's updated at."
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
library get_claims_query_parameters;

import 'exports.dart';
part 'get_claims_query_parameters.freezed.dart';
part 'get_claims_query_parameters.g.dart'; // GetClaimsQueryParameters

@freezed
abstract class GetClaimsQueryParameters with _$GetClaimsQueryParameters {
  const GetClaimsQueryParameters._();

  @jsonSerializable
  const factory GetClaimsQueryParameters({
    /// fields
    @JsonKey(name: GetClaimsQueryParameters.fieldsKey) required String fields,

    /// offset
    @JsonKey(name: GetClaimsQueryParameters.offsetKey) required double offset,

    /// limit
    @JsonKey(name: GetClaimsQueryParameters.limitKey) required double limit,

    /// order
    @JsonKey(name: GetClaimsQueryParameters.orderKey) required String order,

    /// deletedAt
    @JsonKey(name: GetClaimsQueryParameters.deletedAtKey)
    required Map<String, dynamic> deletedAt,

    /// q
    @JsonKey(name: GetClaimsQueryParameters.qKey) required String q,

    /// id
    @JsonKey(name: GetClaimsQueryParameters.idKey) required dynamic id,

    /// orderId
    @JsonKey(name: GetClaimsQueryParameters.orderIdKey)
    required dynamic orderId,

    /// status
    @JsonKey(name: GetClaimsQueryParameters.statusKey) required dynamic status,

    /// createdAt
    @JsonKey(name: GetClaimsQueryParameters.createdAtKey)
    required Map<String, dynamic> createdAt,

    /// updatedAt
    @JsonKey(name: GetClaimsQueryParameters.updatedAtKey)
    required Map<String, dynamic> updatedAt,

    /// and
    @JsonKey(name: GetClaimsQueryParameters.andKey)
    required List<Map<String, dynamic>> and,

    /// or
    @JsonKey(name: GetClaimsQueryParameters.orKey)
    required List<Map<String, dynamic>> or,
  }) = _GetClaimsQueryParameters;

  factory GetClaimsQueryParameters.fromJson(Map<String, dynamic> json) =>
      _$GetClaimsQueryParametersFromJson(json);

  static const String fieldsKey = r'fields';

  static const String offsetKey = r'offset';

  static const String limitKey = r'limit';

  static const String orderKey = r'order';

  static const String deletedAtKey = r'deleted_at';

  static const String qKey = r'q';

  static const String idKey = r'id';

  static const String orderIdKey = r'order_id';

  static const String statusKey = r'status';

  static const String createdAtKey = r'created_at';

  static const String updatedAtKey = r'updated_at';

  static const String andKey = r'$and';

  static const String orKey = r'$or';
}
