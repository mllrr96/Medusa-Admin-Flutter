/// AdminCustomerResponse
/// {
///     "properties": {
///         "customer": {
///             "$ref": "#/components/schemas/AdminCustomer"
///         }
///     },
///     "type": "object",
///     "required": [
///         "customer"
///     ],
///     "description": "The customer's details."
/// }
library;

import 'exports.dart';
part 'admin_customer_response.freezed.dart';
part 'admin_customer_response.g.dart'; // AdminCustomerResponse

@freezed
abstract class AdminCustomerResponse with _$AdminCustomerResponse {
  const AdminCustomerResponse._();

  @jsonSerializable
  const factory AdminCustomerResponse({
    /// customer
    @JsonKey(name: AdminCustomerResponse.customerKey)
    required AdminCustomer customer,
  }) = _AdminCustomerResponse;

  factory AdminCustomerResponse.fromJson(Map<String, dynamic> json) =>
      _$AdminCustomerResponseFromJson(json);

  static const String customerKey = r'customer';
}
