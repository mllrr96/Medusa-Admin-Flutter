/// PostReturnsIdDismissItemsActionIdQueryParameters
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
part 'post_returns_id_dismiss_items_action_id_query_parameters.freezed.dart';
part 'post_returns_id_dismiss_items_action_id_query_parameters.g.dart'; // PostReturnsIdDismissItemsActionIdQueryParameters

@freezed
abstract class PostReturnsIdDismissItemsActionIdQueryParameters
    with _$PostReturnsIdDismissItemsActionIdQueryParameters {
  const PostReturnsIdDismissItemsActionIdQueryParameters._();

  @jsonSerializable
  const factory PostReturnsIdDismissItemsActionIdQueryParameters({
    /// fields
    @JsonKey(name: PostReturnsIdDismissItemsActionIdQueryParameters.fieldsKey)
    required String fields,
  }) = _PostReturnsIdDismissItemsActionIdQueryParameters;

  factory PostReturnsIdDismissItemsActionIdQueryParameters.fromJson(
    Map<String, dynamic> json,
  ) => _$PostReturnsIdDismissItemsActionIdQueryParametersFromJson(json);

  static const String fieldsKey = r'fields';
}
