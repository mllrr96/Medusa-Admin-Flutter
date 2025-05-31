/// PostReturnsIdReceiveItemsActionIdQueryParameters
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
part 'post_returns_id_receive_items_action_id_query_parameters.freezed.dart';
part 'post_returns_id_receive_items_action_id_query_parameters.g.dart'; // PostReturnsIdReceiveItemsActionIdQueryParameters

@freezed
abstract class PostReturnsIdReceiveItemsActionIdQueryParameters
    with _$PostReturnsIdReceiveItemsActionIdQueryParameters {
  const PostReturnsIdReceiveItemsActionIdQueryParameters._();

  @jsonSerializable
  const factory PostReturnsIdReceiveItemsActionIdQueryParameters({
    /// fields
    @JsonKey(name: PostReturnsIdReceiveItemsActionIdQueryParameters.fieldsKey)
    required String fields,
  }) = _PostReturnsIdReceiveItemsActionIdQueryParameters;

  factory PostReturnsIdReceiveItemsActionIdQueryParameters.fromJson(
    Map<String, dynamic> json,
  ) => _$PostReturnsIdReceiveItemsActionIdQueryParametersFromJson(json);

  static const String fieldsKey = r'fields';
}
