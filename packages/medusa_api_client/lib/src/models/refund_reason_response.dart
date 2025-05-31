/// RefundReasonResponse
/// {
///     "properties": {
///         "refund_reason": {
///             "$ref": "#/components/schemas/AdminRefundReason"
///         }
///     },
///     "type": "object",
///     "required": [
///         "refund_reason"
///     ],
///     "description": "The refund reason's details."
/// }
library refund_reason_response;

import 'exports.dart';
part 'refund_reason_response.freezed.dart';
part 'refund_reason_response.g.dart'; // RefundReasonResponse

@freezed
abstract class RefundReasonResponse with _$RefundReasonResponse {
  const RefundReasonResponse._();

  @jsonSerializable
  const factory RefundReasonResponse({
    /// refundReason
    @JsonKey(name: RefundReasonResponse.refundReasonKey)
    required AdminRefundReason refundReason,
  }) = _RefundReasonResponse;

  factory RefundReasonResponse.fromJson(Map<String, dynamic> json) =>
      _$RefundReasonResponseFromJson(json);

  static const String refundReasonKey = r'refund_reason';
}
