/// PostReturnsIdRequestItemsActionIdQueryParameters
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
part 'post_returns_id_request_items_action_id_query_parameters.freezed.dart';
part 'post_returns_id_request_items_action_id_query_parameters.g.dart'; // PostReturnsIdRequestItemsActionIdQueryParameters

@freezed
abstract class PostReturnsIdRequestItemsActionIdQueryParameters
    with _$PostReturnsIdRequestItemsActionIdQueryParameters {
  const PostReturnsIdRequestItemsActionIdQueryParameters._();

  @jsonSerializable
  const factory PostReturnsIdRequestItemsActionIdQueryParameters({
    /// fields
    @JsonKey(name: PostReturnsIdRequestItemsActionIdQueryParameters.fieldsKey)
    required String fields,
  }) = _PostReturnsIdRequestItemsActionIdQueryParameters;

  factory PostReturnsIdRequestItemsActionIdQueryParameters.fromJson(
    Map<String, dynamic> json,
  ) => _$PostReturnsIdRequestItemsActionIdQueryParametersFromJson(json);

  static const String fieldsKey = r'fields';
}
