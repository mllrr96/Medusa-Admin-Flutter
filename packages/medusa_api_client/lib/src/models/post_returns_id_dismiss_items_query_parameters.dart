/// PostReturnsIdDismissItemsQueryParameters
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
part 'post_returns_id_dismiss_items_query_parameters.freezed.dart';
part 'post_returns_id_dismiss_items_query_parameters.g.dart'; // PostReturnsIdDismissItemsQueryParameters

@freezed
abstract class PostReturnsIdDismissItemsQueryParameters
    with _$PostReturnsIdDismissItemsQueryParameters {
  const PostReturnsIdDismissItemsQueryParameters._();

  @jsonSerializable
  const factory PostReturnsIdDismissItemsQueryParameters({
    /// fields
    @JsonKey(name: PostReturnsIdDismissItemsQueryParameters.fieldsKey)
    required String fields,
  }) = _PostReturnsIdDismissItemsQueryParameters;

  factory PostReturnsIdDismissItemsQueryParameters.fromJson(
    Map<String, dynamic> json,
  ) => _$PostReturnsIdDismissItemsQueryParametersFromJson(json);

  static const String fieldsKey = r'fields';
}
