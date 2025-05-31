/// AdminPaymentResponse
/// {
///     "properties": {
///         "payment": {
///             "$ref": "#/components/schemas/AdminPayment"
///         }
///     },
///     "type": "object",
///     "required": [
///         "payment"
///     ],
///     "description": "The payment's details."
/// }
library admin_payment_response;

import 'exports.dart';
part 'admin_payment_response.freezed.dart';
part 'admin_payment_response.g.dart'; // AdminPaymentResponse

@freezed
abstract class AdminPaymentResponse with _$AdminPaymentResponse {
  const AdminPaymentResponse._();

  @jsonSerializable
  const factory AdminPaymentResponse({
    /// payment
    @JsonKey(name: AdminPaymentResponse.paymentKey)
    required AdminPayment payment,
  }) = _AdminPaymentResponse;

  factory AdminPaymentResponse.fromJson(Map<String, dynamic> json) =>
      _$AdminPaymentResponseFromJson(json);

  static const String paymentKey = r'payment';
}
