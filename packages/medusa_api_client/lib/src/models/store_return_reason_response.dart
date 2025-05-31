/// StoreReturnReasonResponse
/// {
///     "properties": {
///         "return_reason": {
///             "$ref": "#/components/schemas/StoreReturnReason"
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
part 'store_return_reason_response.freezed.dart';
part 'store_return_reason_response.g.dart'; // StoreReturnReasonResponse

@freezed
abstract class StoreReturnReasonResponse with _$StoreReturnReasonResponse {
  const StoreReturnReasonResponse._();

  @jsonSerializable
  const factory StoreReturnReasonResponse({
    /// returnReason
    @JsonKey(name: StoreReturnReasonResponse.returnReasonKey)
    required StoreReturnReason returnReason,
  }) = _StoreReturnReasonResponse;

  factory StoreReturnReasonResponse.fromJson(Map<String, dynamic> json) =>
      _$StoreReturnReasonResponseFromJson(json);

  static const String returnReasonKey = r'return_reason';
}
