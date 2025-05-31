/// PostReturnsIdReceiveQueryParameters
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
part 'post_returns_id_receive_query_parameters.freezed.dart';
part 'post_returns_id_receive_query_parameters.g.dart'; // PostReturnsIdReceiveQueryParameters

@freezed
abstract class PostReturnsIdReceiveQueryParameters
    with _$PostReturnsIdReceiveQueryParameters {
  const PostReturnsIdReceiveQueryParameters._();

  @jsonSerializable
  const factory PostReturnsIdReceiveQueryParameters({
    /// fields
    @JsonKey(name: PostReturnsIdReceiveQueryParameters.fieldsKey)
    required String fields,
  }) = _PostReturnsIdReceiveQueryParameters;

  factory PostReturnsIdReceiveQueryParameters.fromJson(
    Map<String, dynamic> json,
  ) => _$PostReturnsIdReceiveQueryParametersFromJson(json);

  static const String fieldsKey = r'fields';
}
