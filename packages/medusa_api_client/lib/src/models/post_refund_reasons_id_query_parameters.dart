/// PostRefundReasonsIdQueryParameters
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
part 'post_refund_reasons_id_query_parameters.freezed.dart';
part 'post_refund_reasons_id_query_parameters.g.dart'; // PostRefundReasonsIdQueryParameters

@freezed
abstract class PostRefundReasonsIdQueryParameters
    with _$PostRefundReasonsIdQueryParameters {
  const PostRefundReasonsIdQueryParameters._();

  @jsonSerializable
  const factory PostRefundReasonsIdQueryParameters({
    /// fields
    @JsonKey(name: PostRefundReasonsIdQueryParameters.fieldsKey)
    required String fields,
  }) = _PostRefundReasonsIdQueryParameters;

  factory PostRefundReasonsIdQueryParameters.fromJson(
    Map<String, dynamic> json,
  ) => _$PostRefundReasonsIdQueryParametersFromJson(json);

  static const String fieldsKey = r'fields';
}
