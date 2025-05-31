/// AdminCustomerGroupResponse
/// {
///     "properties": {
///         "customer_group": {
///             "$ref": "#/components/schemas/AdminCustomerGroup"
///         }
///     },
///     "type": "object",
///     "required": [
///         "customer_group"
///     ],
///     "description": "The customer group's details."
/// }
library;

import 'exports.dart';
part 'admin_customer_group_response.freezed.dart';
part 'admin_customer_group_response.g.dart'; // AdminCustomerGroupResponse

@freezed
abstract class AdminCustomerGroupResponse with _$AdminCustomerGroupResponse {
  const AdminCustomerGroupResponse._();

  @jsonSerializable
  const factory AdminCustomerGroupResponse({
    /// customerGroup
    @JsonKey(name: AdminCustomerGroupResponse.customerGroupKey)
    required AdminCustomerGroup customerGroup,
  }) = _AdminCustomerGroupResponse;

  factory AdminCustomerGroupResponse.fromJson(Map<String, dynamic> json) =>
      _$AdminCustomerGroupResponseFromJson(json);

  static const String customerGroupKey = r'customer_group';
}
