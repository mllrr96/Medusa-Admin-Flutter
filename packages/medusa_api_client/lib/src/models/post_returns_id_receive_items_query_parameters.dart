/// PostReturnsIdReceiveItemsQueryParameters
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
part 'post_returns_id_receive_items_query_parameters.freezed.dart';
part 'post_returns_id_receive_items_query_parameters.g.dart'; // PostReturnsIdReceiveItemsQueryParameters

@freezed
abstract class PostReturnsIdReceiveItemsQueryParameters
    with _$PostReturnsIdReceiveItemsQueryParameters {
  const PostReturnsIdReceiveItemsQueryParameters._();

  @jsonSerializable
  const factory PostReturnsIdReceiveItemsQueryParameters({
    /// fields
    @JsonKey(name: PostReturnsIdReceiveItemsQueryParameters.fieldsKey)
    required String fields,
  }) = _PostReturnsIdReceiveItemsQueryParameters;

  factory PostReturnsIdReceiveItemsQueryParameters.fromJson(
    Map<String, dynamic> json,
  ) => _$PostReturnsIdReceiveItemsQueryParametersFromJson(json);

  static const String fieldsKey = r'fields';
}
