/// PostReturnsIdRequestItemsQueryParameters
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
part 'post_returns_id_request_items_query_parameters.freezed.dart';
part 'post_returns_id_request_items_query_parameters.g.dart'; // PostReturnsIdRequestItemsQueryParameters

@freezed
abstract class PostReturnsIdRequestItemsQueryParameters
    with _$PostReturnsIdRequestItemsQueryParameters {
  const PostReturnsIdRequestItemsQueryParameters._();

  @jsonSerializable
  const factory PostReturnsIdRequestItemsQueryParameters({
    /// fields
    @JsonKey(name: PostReturnsIdRequestItemsQueryParameters.fieldsKey)
    required String fields,
  }) = _PostReturnsIdRequestItemsQueryParameters;

  factory PostReturnsIdRequestItemsQueryParameters.fromJson(
    Map<String, dynamic> json,
  ) => _$PostReturnsIdRequestItemsQueryParametersFromJson(json);

  static const String fieldsKey = r'fields';
}
