/// PostClaimsQueryParameters
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
part 'post_claims_query_parameters.freezed.dart';
part 'post_claims_query_parameters.g.dart'; // PostClaimsQueryParameters

@freezed
abstract class PostClaimsQueryParameters with _$PostClaimsQueryParameters {
  const PostClaimsQueryParameters._();

  @jsonSerializable
  const factory PostClaimsQueryParameters({
    /// fields
    @JsonKey(name: PostClaimsQueryParameters.fieldsKey) required String fields,
  }) = _PostClaimsQueryParameters;

  factory PostClaimsQueryParameters.fromJson(Map<String, dynamic> json) =>
      _$PostClaimsQueryParametersFromJson(json);

  static const String fieldsKey = r'fields';
}
