/// PostReturnReasonsIdQueryParameters
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
part 'post_return_reasons_id_query_parameters.freezed.dart';
part 'post_return_reasons_id_query_parameters.g.dart'; // PostReturnReasonsIdQueryParameters

@freezed
abstract class PostReturnReasonsIdQueryParameters
    with _$PostReturnReasonsIdQueryParameters {
  const PostReturnReasonsIdQueryParameters._();

  @jsonSerializable
  const factory PostReturnReasonsIdQueryParameters({
    /// fields
    @JsonKey(name: PostReturnReasonsIdQueryParameters.fieldsKey)
    required String fields,
  }) = _PostReturnReasonsIdQueryParameters;

  factory PostReturnReasonsIdQueryParameters.fromJson(
    Map<String, dynamic> json,
  ) => _$PostReturnReasonsIdQueryParametersFromJson(json);

  static const String fieldsKey = r'fields';
}
