/// GetRefundReasonsIdQueryParameters
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
part 'get_refund_reasons_id_query_parameters.freezed.dart';
part 'get_refund_reasons_id_query_parameters.g.dart'; // GetRefundReasonsIdQueryParameters

@freezed
abstract class GetRefundReasonsIdQueryParameters
    with _$GetRefundReasonsIdQueryParameters {
  const GetRefundReasonsIdQueryParameters._();

  @jsonSerializable
  const factory GetRefundReasonsIdQueryParameters({
    /// fields
    @JsonKey(name: GetRefundReasonsIdQueryParameters.fieldsKey)
    required String fields,
  }) = _GetRefundReasonsIdQueryParameters;

  factory GetRefundReasonsIdQueryParameters.fromJson(
    Map<String, dynamic> json,
  ) => _$GetRefundReasonsIdQueryParametersFromJson(json);

  static const String fieldsKey = r'fields';
}
