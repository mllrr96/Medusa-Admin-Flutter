/// PostApiKeysIdRevokeQueryParameters
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
part 'post_api_keys_id_revoke_query_parameters.freezed.dart';
part 'post_api_keys_id_revoke_query_parameters.g.dart'; // PostApiKeysIdRevokeQueryParameters

@freezed
abstract class PostApiKeysIdRevokeQueryParameters
    with _$PostApiKeysIdRevokeQueryParameters {
  const PostApiKeysIdRevokeQueryParameters._();

  @jsonSerializable
  const factory PostApiKeysIdRevokeQueryParameters({
    /// fields
    @JsonKey(name: PostApiKeysIdRevokeQueryParameters.fieldsKey)
    required String fields,
  }) = _PostApiKeysIdRevokeQueryParameters;

  factory PostApiKeysIdRevokeQueryParameters.fromJson(
    Map<String, dynamic> json,
  ) => _$PostApiKeysIdRevokeQueryParametersFromJson(json);

  static const String fieldsKey = r'fields';
}
