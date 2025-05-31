/// PostFulfillmentsQueryParameters
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
part 'post_fulfillments_query_parameters.freezed.dart';
part 'post_fulfillments_query_parameters.g.dart'; // PostFulfillmentsQueryParameters

@freezed
abstract class PostFulfillmentsQueryParameters
    with _$PostFulfillmentsQueryParameters {
  const PostFulfillmentsQueryParameters._();

  @jsonSerializable
  const factory PostFulfillmentsQueryParameters({
    /// fields
    @JsonKey(name: PostFulfillmentsQueryParameters.fieldsKey)
    required String fields,
  }) = _PostFulfillmentsQueryParameters;

  factory PostFulfillmentsQueryParameters.fromJson(Map<String, dynamic> json) =>
      _$PostFulfillmentsQueryParametersFromJson(json);

  static const String fieldsKey = r'fields';
}
