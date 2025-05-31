/// GetInventoryItemsIdQueryParameters
/// {
///     "properties": {
///         "fields": {
///             "type": "string",
///             "description": "Comma-separated fields that should be included in the returned data. if a field is prefixed with `+` it will be added to the default fields, using `-` will remove it from the default fields. without prefix it will replace the entire default fields.",
///             "title": "fields"
///         }
///     },
///     "type": "object"
/// }
library;

import 'exports.dart';
part 'get_inventory_items_id_query_parameters.freezed.dart';
part 'get_inventory_items_id_query_parameters.g.dart'; // GetInventoryItemsIdQueryParameters

@freezed
abstract class GetInventoryItemsIdQueryParameters
    with _$GetInventoryItemsIdQueryParameters {
  const GetInventoryItemsIdQueryParameters._();

  @jsonSerializable
  const factory GetInventoryItemsIdQueryParameters({
    /// fields
    @JsonKey(name: GetInventoryItemsIdQueryParameters.fieldsKey)
    required String fields,
  }) = _GetInventoryItemsIdQueryParameters;

  factory GetInventoryItemsIdQueryParameters.fromJson(
    Map<String, dynamic> json,
  ) => _$GetInventoryItemsIdQueryParametersFromJson(json);

  static const String fieldsKey = r'fields';
}
