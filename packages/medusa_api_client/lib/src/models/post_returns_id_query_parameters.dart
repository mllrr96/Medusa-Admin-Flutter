/// PostReturnsIdQueryParameters
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
part 'post_returns_id_query_parameters.freezed.dart';
part 'post_returns_id_query_parameters.g.dart'; // PostReturnsIdQueryParameters

@freezed
abstract class PostReturnsIdQueryParameters
    with _$PostReturnsIdQueryParameters {
  const PostReturnsIdQueryParameters._();

  @jsonSerializable
  const factory PostReturnsIdQueryParameters({
    /// fields
    @JsonKey(name: PostReturnsIdQueryParameters.fieldsKey)
    required String fields,
  }) = _PostReturnsIdQueryParameters;

  factory PostReturnsIdQueryParameters.fromJson(Map<String, dynamic> json) =>
      _$PostReturnsIdQueryParametersFromJson(json);

  static const String fieldsKey = r'fields';
}
