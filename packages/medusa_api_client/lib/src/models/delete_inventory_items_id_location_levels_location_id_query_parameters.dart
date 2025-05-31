/// DeleteInventoryItemsIdLocationLevelsLocationIdQueryParameters
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
part 'delete_inventory_items_id_location_levels_location_id_query_parameters.freezed.dart';
part 'delete_inventory_items_id_location_levels_location_id_query_parameters.g.dart'; // DeleteInventoryItemsIdLocationLevelsLocationIdQueryParameters

@freezed
abstract class DeleteInventoryItemsIdLocationLevelsLocationIdQueryParameters
    with _$DeleteInventoryItemsIdLocationLevelsLocationIdQueryParameters {
  const DeleteInventoryItemsIdLocationLevelsLocationIdQueryParameters._();

  @jsonSerializable
  const factory DeleteInventoryItemsIdLocationLevelsLocationIdQueryParameters({
    /// fields
    @JsonKey(
      name: DeleteInventoryItemsIdLocationLevelsLocationIdQueryParameters
          .fieldsKey,
    )
    required String fields,
  }) = _DeleteInventoryItemsIdLocationLevelsLocationIdQueryParameters;

  factory DeleteInventoryItemsIdLocationLevelsLocationIdQueryParameters.fromJson(
    Map<String, dynamic> json,
  ) => _$DeleteInventoryItemsIdLocationLevelsLocationIdQueryParametersFromJson(
    json,
  );

  static const String fieldsKey = r'fields';
}
