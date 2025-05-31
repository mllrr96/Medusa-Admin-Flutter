/// AdminUpdateOrder
/// {
///     "properties": {
///         "email": {
///             "type": "string",
///             "format": "email",
///             "description": "The order's email.",
///             "title": "email"
///         },
///         "shipping_address": {
///             "type": "object",
///             "description": "The order's shipping address."
///         },
///         "billing_address": {
///             "type": "object",
///             "description": "The order's billing address."
///         },
///         "metadata": {
///             "type": "object",
///             "description": "The order's metadata, can hold custom key-value pairs."
///         }
///     },
///     "type": "object",
///     "description": "The details to update in the order."
/// }
library admin_update_order;

import 'exports.dart';
part 'admin_update_order.freezed.dart';
part 'admin_update_order.g.dart'; // AdminUpdateOrder

@freezed
abstract class AdminUpdateOrder with _$AdminUpdateOrder {
  const AdminUpdateOrder._();

  @jsonSerializable
  const factory AdminUpdateOrder({
    /// email
    @JsonKey(name: AdminUpdateOrder.emailKey) required String email,

    /// shippingAddress
    @JsonKey(name: AdminUpdateOrder.shippingAddressKey)
    required Map<String, dynamic> shippingAddress,

    /// billingAddress
    @JsonKey(name: AdminUpdateOrder.billingAddressKey)
    required Map<String, dynamic> billingAddress,

    /// metadata
    @JsonKey(name: AdminUpdateOrder.metadataKey)
    required Map<String, dynamic> metadata,
  }) = _AdminUpdateOrder;

  factory AdminUpdateOrder.fromJson(Map<String, dynamic> json) =>
      _$AdminUpdateOrderFromJson(json);

  static const String emailKey = r'email';

  static const String shippingAddressKey = r'shipping_address';

  static const String billingAddressKey = r'billing_address';

  static const String metadataKey = r'metadata';
}
