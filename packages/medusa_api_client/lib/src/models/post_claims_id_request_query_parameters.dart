/// PostClaimsIdRequestQueryParameters
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
part 'post_claims_id_request_query_parameters.freezed.dart';
part 'post_claims_id_request_query_parameters.g.dart'; // PostClaimsIdRequestQueryParameters

@freezed
abstract class PostClaimsIdRequestQueryParameters
    with _$PostClaimsIdRequestQueryParameters {
  const PostClaimsIdRequestQueryParameters._();

  @jsonSerializable
  const factory PostClaimsIdRequestQueryParameters({
    /// fields
    @JsonKey(name: PostClaimsIdRequestQueryParameters.fieldsKey)
    required String fields,
  }) = _PostClaimsIdRequestQueryParameters;

  factory PostClaimsIdRequestQueryParameters.fromJson(
    Map<String, dynamic> json,
  ) => _$PostClaimsIdRequestQueryParametersFromJson(json);

  static const String fieldsKey = r'fields';
}
