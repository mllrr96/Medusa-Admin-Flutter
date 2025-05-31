/// GetPaymentsIdQueryParameters
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
part 'get_payments_id_query_parameters.freezed.dart';
part 'get_payments_id_query_parameters.g.dart'; // GetPaymentsIdQueryParameters

@freezed
abstract class GetPaymentsIdQueryParameters
    with _$GetPaymentsIdQueryParameters {
  const GetPaymentsIdQueryParameters._();

  @jsonSerializable
  const factory GetPaymentsIdQueryParameters({
    /// fields
    @JsonKey(name: GetPaymentsIdQueryParameters.fieldsKey)
    required String fields,
  }) = _GetPaymentsIdQueryParameters;

  factory GetPaymentsIdQueryParameters.fromJson(Map<String, dynamic> json) =>
      _$GetPaymentsIdQueryParametersFromJson(json);

  static const String fieldsKey = r'fields';
}
