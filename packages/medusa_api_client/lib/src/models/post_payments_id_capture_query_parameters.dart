/// PostPaymentsIdCaptureQueryParameters
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
part 'post_payments_id_capture_query_parameters.freezed.dart';
part 'post_payments_id_capture_query_parameters.g.dart'; // PostPaymentsIdCaptureQueryParameters

@freezed
abstract class PostPaymentsIdCaptureQueryParameters
    with _$PostPaymentsIdCaptureQueryParameters {
  const PostPaymentsIdCaptureQueryParameters._();

  @jsonSerializable
  const factory PostPaymentsIdCaptureQueryParameters({
    /// fields
    @JsonKey(name: PostPaymentsIdCaptureQueryParameters.fieldsKey)
    required String fields,
  }) = _PostPaymentsIdCaptureQueryParameters;

  factory PostPaymentsIdCaptureQueryParameters.fromJson(
    Map<String, dynamic> json,
  ) => _$PostPaymentsIdCaptureQueryParametersFromJson(json);

  static const String fieldsKey = r'fields';
}
