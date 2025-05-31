/// PostReturnsIdRequestQueryParameters
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
part 'post_returns_id_request_query_parameters.freezed.dart';
part 'post_returns_id_request_query_parameters.g.dart'; // PostReturnsIdRequestQueryParameters

@freezed
abstract class PostReturnsIdRequestQueryParameters
    with _$PostReturnsIdRequestQueryParameters {
  const PostReturnsIdRequestQueryParameters._();

  @jsonSerializable
  const factory PostReturnsIdRequestQueryParameters({
    /// fields
    @JsonKey(name: PostReturnsIdRequestQueryParameters.fieldsKey)
    required String fields,
  }) = _PostReturnsIdRequestQueryParameters;

  factory PostReturnsIdRequestQueryParameters.fromJson(
    Map<String, dynamic> json,
  ) => _$PostReturnsIdRequestQueryParametersFromJson(json);

  static const String fieldsKey = r'fields';
}
