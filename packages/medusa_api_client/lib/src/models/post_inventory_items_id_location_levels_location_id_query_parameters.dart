/// PostInventoryItemsIdLocationLevelsLocationIdQueryParameters
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
part 'post_inventory_items_id_location_levels_location_id_query_parameters.freezed.dart';
part 'post_inventory_items_id_location_levels_location_id_query_parameters.g.dart'; // PostInventoryItemsIdLocationLevelsLocationIdQueryParameters

@freezed
abstract class PostInventoryItemsIdLocationLevelsLocationIdQueryParameters
    with _$PostInventoryItemsIdLocationLevelsLocationIdQueryParameters {
  const PostInventoryItemsIdLocationLevelsLocationIdQueryParameters._();

  @jsonSerializable
  const factory PostInventoryItemsIdLocationLevelsLocationIdQueryParameters({
    /// fields
    @JsonKey(
      name:
          PostInventoryItemsIdLocationLevelsLocationIdQueryParameters.fieldsKey,
    )
    required String fields,
  }) = _PostInventoryItemsIdLocationLevelsLocationIdQueryParameters;

  factory PostInventoryItemsIdLocationLevelsLocationIdQueryParameters.fromJson(
    Map<String, dynamic> json,
  ) => _$PostInventoryItemsIdLocationLevelsLocationIdQueryParametersFromJson(
    json,
  );

  static const String fieldsKey = r'fields';
}
