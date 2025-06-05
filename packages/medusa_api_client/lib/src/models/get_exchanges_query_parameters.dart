/// GetExchangesQueryParameters
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
///             "description": "Filter by an exchange's deletion date."
///         },
///         "id": {
///             "oneOf": [
///                 {
///                     "type": "string",
///                     "description": "Filter by an exchange ID.",
///                     "title": "id"
///                 },
///                 {
///                     "type": "array",
///                     "items": {
///                         "type": "string",
///                         "description": "An exchange ID.",
///                         "title": "id"
///                     },
///                     "description": "Filter by exchange IDs."
///                 }
///             ]
///         },
///         "order_id": {
///             "oneOf": [
///                 {
///                     "type": "string",
///                     "description": "Filter by an exchange's order ID.",
///                     "title": "order_id"
///                 },
///                 {
///                     "type": "array",
///                     "items": {
///                         "type": "string",
///                         "description": "An order's ID.",
///                         "title": "order_id"
///                     },
///                     "description": "Filter by order IDs that the exchanges belong to."
///                 }
///             ]
///         },
///         "status": {
///             "oneOf": [
///                 {
///                     "type": "string",
///                     "description": "Filter by an exchange's status.",
///                     "title": "status"
///                 },
///                 {
///                     "type": "array",
///                     "items": {
///                         "type": "string",
///                         "description": "An exchange status.",
///                         "title": "status"
///                     },
///                     "description": "Filter by exchange statuses."
///                 }
///             ]
///         },
///         "created_at": {
///             "type": "object",
///             "description": "Filter by the exchange's creation date."
///         },
///         "updated_at": {
///             "type": "object",
///             "description": "Filter by the exchange's update date."
///         }
///     },
///     "type": "object"
/// }
library;

import 'exports.dart';
part 'get_exchanges_query_parameters.freezed.dart';
part 'get_exchanges_query_parameters.g.dart'; // GetExchangesQueryParameters

@freezed
abstract class GetExchangesQueryParameters with _$GetExchangesQueryParameters {
  const GetExchangesQueryParameters._();

  @jsonSerializable
  const factory GetExchangesQueryParameters({
    /// fields
    @JsonKey(name: GetExchangesQueryParameters.fieldsKey)
    required String fields,

    /// offset
    @JsonKey(name: GetExchangesQueryParameters.offsetKey)
    required int offset,

    /// limit
    @JsonKey(name: GetExchangesQueryParameters.limitKey) required int limit,

    /// order
    @JsonKey(name: GetExchangesQueryParameters.orderKey) required String order,

    /// deletedAt
    @JsonKey(name: GetExchangesQueryParameters.deletedAtKey)
    required Map<String, dynamic> deletedAt,

    /// id
    @JsonKey(name: GetExchangesQueryParameters.idKey) required dynamic id,

    /// orderId
    @JsonKey(name: GetExchangesQueryParameters.orderIdKey)
    required dynamic orderId,

    /// status
    @JsonKey(name: GetExchangesQueryParameters.statusKey)
    required dynamic status,

    /// createdAt
    @JsonKey(name: GetExchangesQueryParameters.createdAtKey)
    required Map<String, dynamic> createdAt,

    /// updatedAt
    @JsonKey(name: GetExchangesQueryParameters.updatedAtKey)
    required Map<String, dynamic> updatedAt,
  }) = _GetExchangesQueryParameters;

  factory GetExchangesQueryParameters.fromJson(Map<String, dynamic> json) =>
      _$GetExchangesQueryParametersFromJson(json);

  static const String fieldsKey = r'fields';

  static const String offsetKey = r'offset';

  static const String limitKey = r'limit';

  static const String orderKey = r'order';

  static const String deletedAtKey = r'deleted_at';

  static const String idKey = r'id';

  static const String orderIdKey = r'order_id';

  static const String statusKey = r'status';

  static const String createdAtKey = r'created_at';

  static const String updatedAtKey = r'updated_at';
}
