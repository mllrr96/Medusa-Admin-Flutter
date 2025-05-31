/// AdminCustomerAddressResponse
/// {
///     "properties": {
///         "address": {
///             "$ref": "#/components/schemas/AdminCustomerAddress"
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
part 'admin_customer_address_response.freezed.dart';
part 'admin_customer_address_response.g.dart'; // AdminCustomerAddressResponse

@freezed
abstract class AdminCustomerAddressResponse
    with _$AdminCustomerAddressResponse {
  const AdminCustomerAddressResponse._();

  @jsonSerializable
  const factory AdminCustomerAddressResponse({
    /// address
    @JsonKey(name: AdminCustomerAddressResponse.addressKey)
    required AdminCustomerAddress address,
  }) = _AdminCustomerAddressResponse;

  factory AdminCustomerAddressResponse.fromJson(Map<String, dynamic> json) =>
      _$AdminCustomerAddressResponseFromJson(json);

  static const String addressKey = r'address';
}
