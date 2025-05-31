/// PostReturnsIdReceiveConfirmQueryParameters
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
part 'post_returns_id_receive_confirm_query_parameters.freezed.dart';
part 'post_returns_id_receive_confirm_query_parameters.g.dart'; // PostReturnsIdReceiveConfirmQueryParameters

@freezed
abstract class PostReturnsIdReceiveConfirmQueryParameters
    with _$PostReturnsIdReceiveConfirmQueryParameters {
  const PostReturnsIdReceiveConfirmQueryParameters._();

  @jsonSerializable
  const factory PostReturnsIdReceiveConfirmQueryParameters({
    /// fields
    @JsonKey(name: PostReturnsIdReceiveConfirmQueryParameters.fieldsKey)
    required String fields,
  }) = _PostReturnsIdReceiveConfirmQueryParameters;

  factory PostReturnsIdReceiveConfirmQueryParameters.fromJson(
    Map<String, dynamic> json,
  ) => _$PostReturnsIdReceiveConfirmQueryParametersFromJson(json);

  static const String fieldsKey = r'fields';
}
