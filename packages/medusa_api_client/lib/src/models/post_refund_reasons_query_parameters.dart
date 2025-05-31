/// PostRefundReasonsQueryParameters
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
part 'post_refund_reasons_query_parameters.freezed.dart';
part 'post_refund_reasons_query_parameters.g.dart'; // PostRefundReasonsQueryParameters

@freezed
abstract class PostRefundReasonsQueryParameters
    with _$PostRefundReasonsQueryParameters {
  const PostRefundReasonsQueryParameters._();

  @jsonSerializable
  const factory PostRefundReasonsQueryParameters({
    /// fields
    @JsonKey(name: PostRefundReasonsQueryParameters.fieldsKey)
    required String fields,
  }) = _PostRefundReasonsQueryParameters;

  factory PostRefundReasonsQueryParameters.fromJson(
    Map<String, dynamic> json,
  ) => _$PostRefundReasonsQueryParametersFromJson(json);

  static const String fieldsKey = r'fields';
}
