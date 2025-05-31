/// StoreCustomerAddressResponse
/// {
///     "properties": {
///         "address": {
///             "$ref": "#/components/schemas/StoreCustomerAddress"
///         }
///     },
///     "type": "object",
///     "required": [
///         "address"
///     ],
///     "description": "The address's details."
/// }
library;

import 'exports.dart';
part 'store_customer_address_response.freezed.dart';
part 'store_customer_address_response.g.dart'; // StoreCustomerAddressResponse

@freezed
abstract class StoreCustomerAddressResponse
    with _$StoreCustomerAddressResponse {
  const StoreCustomerAddressResponse._();

  @jsonSerializable
  const factory StoreCustomerAddressResponse({
    /// address
    @JsonKey(name: StoreCustomerAddressResponse.addressKey)
    required StoreCustomerAddress address,
  }) = _StoreCustomerAddressResponse;

  factory StoreCustomerAddressResponse.fromJson(Map<String, dynamic> json) =>
      _$StoreCustomerAddressResponseFromJson(json);

  static const String addressKey = r'address';
}
