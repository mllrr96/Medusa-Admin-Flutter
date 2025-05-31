/// StoreCustomerResponse
/// {
///     "properties": {
///         "customer": {
///             "$ref": "#/components/schemas/StoreCustomer"
///         }
///     },
///     "type": "object",
///     "required": [
///         "customer"
///     ],
///     "description": "The customer's details."
/// }
library store_customer_response;

import 'exports.dart';
part 'store_customer_response.freezed.dart';
part 'store_customer_response.g.dart'; // StoreCustomerResponse

@freezed
abstract class StoreCustomerResponse with _$StoreCustomerResponse {
  const StoreCustomerResponse._();

  @jsonSerializable
  const factory StoreCustomerResponse({
    /// customer
    @JsonKey(name: StoreCustomerResponse.customerKey)
    required StoreCustomer customer,
  }) = _StoreCustomerResponse;

  factory StoreCustomerResponse.fromJson(Map<String, dynamic> json) =>
      _$StoreCustomerResponseFromJson(json);

  static const String customerKey = r'customer';
}
