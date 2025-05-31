/// GetOrdersIdLineItemsQueryParameters
/// {
///     "properties": {
///         "fields": {
///             "type": "string",
///             "description": "Comma-separated fields that should be included in the returned data. If a field is prefixed with `+` it will be added to the default fields, using `-` will remove it from the default fields. Without prefix it will replace the entire default fields.",
///             "title": "fields"
///         },
///         "id": {
///             "oneOf": [
///                 {
///                     "type": "string",
///                     "description": "The order's ID.",
///                     "title": "id"
///                 },
///                 {
///                     "type": "array",
///                     "items": {
///                         "type": "string",
///                         "description": "The id's ID.",
///                         "title": "id"
///                     },
///                     "description": "The order's ID."
///                 }
///             ]
///         },
///         "item_id": {
///             "oneOf": [
///                 {
///                     "type": "string",
///                     "description": "The order's item id.",
///                     "title": "item_id"
///                 },
///                 {
///                     "type": "array",
///                     "items": {
///                         "type": "string",
///                         "description": "The item id's details.",
///                         "title": "item_id"
///                     },
///                     "description": "The order's item id."
///                 }
///             ]
///         },
///         "order_id": {
///             "oneOf": [
///                 {
///                     "type": "string",
///                     "description": "The order's order id.",
///                     "title": "order_id"
///                 },
///                 {
///                     "type": "array",
///                     "items": {
///                         "type": "string",
///                         "description": "The order id's details.",
///                         "title": "order_id"
///                     },
///                     "description": "The order's order id."
///                 }
///             ]
///         },
///         "version": {
///             "oneOf": [
///                 {
///                     "type": "number",
///                     "description": "The order's version.",
///                     "title": "version"
///                 },
///                 {
///                     "type": "array",
///                     "items": {
///                         "type": "number",
///                         "description": "The version's details.",
///                         "title": "version"
///                     },
///                     "description": "The order's version."
///                 }
///             ]
///         },
///         "limit": {
///             "type": "number",
///             "description": "Limit the number of items returned in the list.",
///             "title": "limit"
///         },
///         "offset": {
///             "type": "number",
///             "description": "The number of items to skip when retrieving a list.",
///             "title": "offset"
///         },
///         "order": {
///             "type": "string",
///             "description": "The field to sort the data by. By default, the sort order is ascending. To change the order to descending, prefix the field name with `-`.",
///             "title": "order"
///         }
///     },
///     "type": "object"
/// }
library;

import 'exports.dart';
part 'get_orders_id_line_items_query_parameters.freezed.dart';
part 'get_orders_id_line_items_query_parameters.g.dart'; // GetOrdersIdLineItemsQueryParameters

@freezed
abstract class GetOrdersIdLineItemsQueryParameters
    with _$GetOrdersIdLineItemsQueryParameters {
  const GetOrdersIdLineItemsQueryParameters._();

  @jsonSerializable
  const factory GetOrdersIdLineItemsQueryParameters({
    /// fields
    @JsonKey(name: GetOrdersIdLineItemsQueryParameters.fieldsKey)
    required String fields,

    /// id
    @JsonKey(name: GetOrdersIdLineItemsQueryParameters.idKey)
    required dynamic id,

    /// itemId
    @JsonKey(name: GetOrdersIdLineItemsQueryParameters.itemIdKey)
    required dynamic itemId,

    /// orderId
    @JsonKey(name: GetOrdersIdLineItemsQueryParameters.orderIdKey)
    required dynamic orderId,

    /// version
    @JsonKey(name: GetOrdersIdLineItemsQueryParameters.versionKey)
    required dynamic version,

    /// limit
    @JsonKey(name: GetOrdersIdLineItemsQueryParameters.limitKey)
    required double limit,

    /// offset
    @JsonKey(name: GetOrdersIdLineItemsQueryParameters.offsetKey)
    required double offset,

    /// order
    @JsonKey(name: GetOrdersIdLineItemsQueryParameters.orderKey)
    required String order,
  }) = _GetOrdersIdLineItemsQueryParameters;

  factory GetOrdersIdLineItemsQueryParameters.fromJson(
    Map<String, dynamic> json,
  ) => _$GetOrdersIdLineItemsQueryParametersFromJson(json);

  static const String fieldsKey = r'fields';

  static const String idKey = r'id';

  static const String itemIdKey = r'item_id';

  static const String orderIdKey = r'order_id';

  static const String versionKey = r'version';

  static const String limitKey = r'limit';

  static const String offsetKey = r'offset';

  static const String orderKey = r'order';
}
