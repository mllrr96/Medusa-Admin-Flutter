/// GetReservationsQueryParameters
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
///         "location_id": {
///             "oneOf": [
///                 {
///                     "type": "string",
///                     "description": "Filter by a location's ID to retrieve its associated reservations.",
///                     "title": "location_id"
///                 },
///                 {
///                     "type": "array",
///                     "items": {
///                         "type": "string",
///                         "description": "A location ID.",
///                         "title": "location_id"
///                     },
///                     "description": "Filter by location IDs to retrieve its associated reservations."
///                 }
///             ]
///         },
///         "inventory_item_id": {
///             "oneOf": [
///                 {
///                     "type": "string",
///                     "description": "Filter by an inventory item's ID to retrieve its associated reservations.",
///                     "title": "inventory_item_id"
///                 },
///                 {
///                     "type": "array",
///                     "items": {
///                         "type": "string",
///                         "description": "An inventory item ID",
///                         "title": "inventory_item_id"
///                     },
///                     "description": "Filter by inventory item IDs to retrieve its associated reservations."
///                 }
///             ]
///         },
///         "line_item_id": {
///             "oneOf": [
///                 {
///                     "type": "string",
///                     "description": "Filter by a line item's ID to retrieve its associated reservations.",
///                     "title": "line_item_id"
///                 },
///                 {
///                     "type": "array",
///                     "items": {
///                         "type": "string",
///                         "description": "A line item ID",
///                         "title": "line_item_id"
///                     },
///                     "description": "Filter by line item IDs to retrieve its associated reservations."
///                 }
///             ]
///         },
///         "created_by": {
///             "oneOf": [
///                 {
///                     "type": "string",
///                     "description": "Filter by the ID of a user to retrieve the reservations they created.",
///                     "title": "created_by"
///                 },
///                 {
///                     "type": "array",
///                     "items": {
///                         "type": "string",
///                         "description": "A user's ID.",
///                         "title": "created_by"
///                     },
///                     "description": "Filter by user IDs to retrieve the reservations they created."
///                 }
///             ]
///         },
///         "description": {
///             "oneOf": [
///                 {
///                     "type": "string",
///                     "description": "Filter by a reservation's description. This filter applies a full-text match. To search by keywords, use the `q` query parameter instead.",
///                     "title": "description"
///                 },
///                 {
///                     "type": "object",
///                     "description": "Apply filters on the reservation's description."
///                 }
///             ]
///         },
///         "created_at": {
///             "type": "object",
///             "description": "Filter by a reservation's creation date."
///         },
///         "updated_at": {
///             "type": "object",
///             "description": "Filter by a reservation's update date."
///         },
///         "deleted_at": {
///             "type": "object",
///             "description": "Filter by a reservation's deletion date."
///         }
///     },
///     "type": "object"
/// }
library;

import 'exports.dart';
part 'get_reservations_query_parameters.freezed.dart';
part 'get_reservations_query_parameters.g.dart'; // GetReservationsQueryParameters

@freezed
abstract class GetReservationsQueryParameters
    with _$GetReservationsQueryParameters {
  const GetReservationsQueryParameters._();

  @jsonSerializable
  const factory GetReservationsQueryParameters({
    /// fields
    @JsonKey(name: GetReservationsQueryParameters.fieldsKey)
    required String fields,

    /// offset
    @JsonKey(name: GetReservationsQueryParameters.offsetKey)
    required int offset,

    /// limit
    @JsonKey(name: GetReservationsQueryParameters.limitKey)
    required int limit,

    /// order
    @JsonKey(name: GetReservationsQueryParameters.orderKey)
    required String order,

    /// locationId
    @JsonKey(name: GetReservationsQueryParameters.locationIdKey)
    required dynamic locationId,

    /// inventoryItemId
    @JsonKey(name: GetReservationsQueryParameters.inventoryItemIdKey)
    required dynamic inventoryItemId,

    /// lineItemId
    @JsonKey(name: GetReservationsQueryParameters.lineItemIdKey)
    required dynamic lineItemId,

    /// createdBy
    @JsonKey(name: GetReservationsQueryParameters.createdByKey)
    required dynamic createdBy,

    /// description
    @JsonKey(name: GetReservationsQueryParameters.descriptionKey)
    required dynamic description,

    /// createdAt
    @JsonKey(name: GetReservationsQueryParameters.createdAtKey)
    required Map<String, dynamic> createdAt,

    /// updatedAt
    @JsonKey(name: GetReservationsQueryParameters.updatedAtKey)
    required Map<String, dynamic> updatedAt,

    /// deletedAt
    @JsonKey(name: GetReservationsQueryParameters.deletedAtKey)
    required Map<String, dynamic> deletedAt,
  }) = _GetReservationsQueryParameters;

  factory GetReservationsQueryParameters.fromJson(Map<String, dynamic> json) =>
      _$GetReservationsQueryParametersFromJson(json);

  static const String fieldsKey = r'fields';

  static const String offsetKey = r'offset';

  static const String limitKey = r'limit';

  static const String orderKey = r'order';

  static const String locationIdKey = r'location_id';

  static const String inventoryItemIdKey = r'inventory_item_id';

  static const String lineItemIdKey = r'line_item_id';

  static const String createdByKey = r'created_by';

  static const String descriptionKey = r'description';

  static const String createdAtKey = r'created_at';

  static const String updatedAtKey = r'updated_at';

  static const String deletedAtKey = r'deleted_at';
}
