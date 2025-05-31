/// PostPaymentsIdRefundQueryParameters
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
part 'post_payments_id_refund_query_parameters.freezed.dart';
part 'post_payments_id_refund_query_parameters.g.dart'; // PostPaymentsIdRefundQueryParameters

@freezed
abstract class PostPaymentsIdRefundQueryParameters
    with _$PostPaymentsIdRefundQueryParameters {
  const PostPaymentsIdRefundQueryParameters._();

  @jsonSerializable
  const factory PostPaymentsIdRefundQueryParameters({
    /// fields
    @JsonKey(name: PostPaymentsIdRefundQueryParameters.fieldsKey)
    required String fields,
  }) = _PostPaymentsIdRefundQueryParameters;

  factory PostPaymentsIdRefundQueryParameters.fromJson(
    Map<String, dynamic> json,
  ) => _$PostPaymentsIdRefundQueryParametersFromJson(json);

  static const String fieldsKey = r'fields';
}
