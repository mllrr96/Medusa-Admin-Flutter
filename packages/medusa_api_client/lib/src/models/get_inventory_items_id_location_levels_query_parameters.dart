/// GetInventoryItemsIdLocationLevelsQueryParameters
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
part 'get_inventory_items_id_location_levels_query_parameters.freezed.dart';
part 'get_inventory_items_id_location_levels_query_parameters.g.dart'; // GetInventoryItemsIdLocationLevelsQueryParameters

@freezed
abstract class GetInventoryItemsIdLocationLevelsQueryParameters
    with _$GetInventoryItemsIdLocationLevelsQueryParameters {
  const GetInventoryItemsIdLocationLevelsQueryParameters._();

  @jsonSerializable
  const factory GetInventoryItemsIdLocationLevelsQueryParameters({
    /// fields
    @JsonKey(name: GetInventoryItemsIdLocationLevelsQueryParameters.fieldsKey)
    required String fields,

    /// offset
    @JsonKey(name: GetInventoryItemsIdLocationLevelsQueryParameters.offsetKey)
    required double offset,

    /// limit
    @JsonKey(name: GetInventoryItemsIdLocationLevelsQueryParameters.limitKey)
    required double limit,

    /// order
    @JsonKey(name: GetInventoryItemsIdLocationLevelsQueryParameters.orderKey)
    required String order,

    /// and
    @JsonKey(name: GetInventoryItemsIdLocationLevelsQueryParameters.andKey)
    required List<Map<String, dynamic>> and,

    /// or
    @JsonKey(name: GetInventoryItemsIdLocationLevelsQueryParameters.orKey)
    required List<Map<String, dynamic>> or,
  }) = _GetInventoryItemsIdLocationLevelsQueryParameters;

  factory GetInventoryItemsIdLocationLevelsQueryParameters.fromJson(
    Map<String, dynamic> json,
  ) => _$GetInventoryItemsIdLocationLevelsQueryParametersFromJson(json);

  static const String fieldsKey = r'fields';

  static const String offsetKey = r'offset';

  static const String limitKey = r'limit';

  static const String orderKey = r'order';

  static const String andKey = r'$and';

  static const String orKey = r'$or';
}
