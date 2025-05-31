/// AdminReturnReasonResponse
/// {
///     "properties": {
///         "return_reason": {
///             "$ref": "#/components/schemas/AdminReturnReason"
///         }
///     },
///     "type": "object",
///     "required": [
///         "return_reason"
///     ],
///     "description": "The return reason's details."
/// }
library;

import 'exports.dart';
part 'admin_return_reason_response.freezed.dart';
part 'admin_return_reason_response.g.dart'; // AdminReturnReasonResponse

@freezed
abstract class AdminReturnReasonResponse with _$AdminReturnReasonResponse {
  const AdminReturnReasonResponse._();

  @jsonSerializable
  const factory AdminReturnReasonResponse({
    /// returnReason
    @JsonKey(name: AdminReturnReasonResponse.returnReasonKey)
    required AdminReturnReason returnReason,
  }) = _AdminReturnReasonResponse;

  factory AdminReturnReasonResponse.fromJson(Map<String, dynamic> json) =>
      _$AdminReturnReasonResponseFromJson(json);

  static const String returnReasonKey = r'return_reason';
}
