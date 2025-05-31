/// PostApiKeysIdQueryParameters
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
part 'post_api_keys_id_query_parameters.freezed.dart';
part 'post_api_keys_id_query_parameters.g.dart'; // PostApiKeysIdQueryParameters

@freezed
abstract class PostApiKeysIdQueryParameters
    with _$PostApiKeysIdQueryParameters {
  const PostApiKeysIdQueryParameters._();

  @jsonSerializable
  const factory PostApiKeysIdQueryParameters({
    /// fields
    @JsonKey(name: PostApiKeysIdQueryParameters.fieldsKey)
    required String fields,
  }) = _PostApiKeysIdQueryParameters;

  factory PostApiKeysIdQueryParameters.fromJson(Map<String, dynamic> json) =>
      _$PostApiKeysIdQueryParametersFromJson(json);

  static const String fieldsKey = r'fields';
}
