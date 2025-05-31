/// PostReturnReasonsQueryParameters
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
part 'post_return_reasons_query_parameters.freezed.dart';
part 'post_return_reasons_query_parameters.g.dart'; // PostReturnReasonsQueryParameters

@freezed
abstract class PostReturnReasonsQueryParameters
    with _$PostReturnReasonsQueryParameters {
  const PostReturnReasonsQueryParameters._();

  @jsonSerializable
  const factory PostReturnReasonsQueryParameters({
    /// fields
    @JsonKey(name: PostReturnReasonsQueryParameters.fieldsKey)
    required String fields,
  }) = _PostReturnReasonsQueryParameters;

  factory PostReturnReasonsQueryParameters.fromJson(
    Map<String, dynamic> json,
  ) => _$PostReturnReasonsQueryParametersFromJson(json);

  static const String fieldsKey = r'fields';
}
