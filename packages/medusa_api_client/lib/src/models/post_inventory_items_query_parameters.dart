/// PostInventoryItemsQueryParameters
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
part 'post_inventory_items_query_parameters.freezed.dart';
part 'post_inventory_items_query_parameters.g.dart'; // PostInventoryItemsQueryParameters

@freezed
abstract class PostInventoryItemsQueryParameters
    with _$PostInventoryItemsQueryParameters {
  const PostInventoryItemsQueryParameters._();

  @jsonSerializable
  const factory PostInventoryItemsQueryParameters({
    /// fields
    @JsonKey(name: PostInventoryItemsQueryParameters.fieldsKey)
    required String fields,
  }) = _PostInventoryItemsQueryParameters;

  factory PostInventoryItemsQueryParameters.fromJson(
    Map<String, dynamic> json,
  ) => _$PostInventoryItemsQueryParametersFromJson(json);

  static const String fieldsKey = r'fields';
}
