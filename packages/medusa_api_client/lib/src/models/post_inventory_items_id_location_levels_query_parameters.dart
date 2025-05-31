/// PostInventoryItemsIdLocationLevelsQueryParameters
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
part 'post_inventory_items_id_location_levels_query_parameters.freezed.dart';
part 'post_inventory_items_id_location_levels_query_parameters.g.dart'; // PostInventoryItemsIdLocationLevelsQueryParameters

@freezed
abstract class PostInventoryItemsIdLocationLevelsQueryParameters
    with _$PostInventoryItemsIdLocationLevelsQueryParameters {
  const PostInventoryItemsIdLocationLevelsQueryParameters._();

  @jsonSerializable
  const factory PostInventoryItemsIdLocationLevelsQueryParameters({
    /// fields
    @JsonKey(name: PostInventoryItemsIdLocationLevelsQueryParameters.fieldsKey)
    required String fields,
  }) = _PostInventoryItemsIdLocationLevelsQueryParameters;

  factory PostInventoryItemsIdLocationLevelsQueryParameters.fromJson(
    Map<String, dynamic> json,
  ) => _$PostInventoryItemsIdLocationLevelsQueryParametersFromJson(json);

  static const String fieldsKey = r'fields';
}
