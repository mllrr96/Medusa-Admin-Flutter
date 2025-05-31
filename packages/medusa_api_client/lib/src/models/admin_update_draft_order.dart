/// AdminUpdateDraftOrder
/// {
///     "properties": {
///         "email": {
///             "type": "string",
///             "format": "email",
///             "description": "The customer email associated with the draft order.",
///             "title": "email"
///         },
///         "shipping_address": {
///             "type": "object",
///             "description": "The draft order's shipping address."
///         },
///         "billing_address": {
///             "type": "object",
///             "description": "The draft order's billing address."
///         },
///         "metadata": {
///             "type": "object",
///             "description": "The draft order's metadata, can hold custom key-value pairs."
///         },
///         "customer_id": {
///             "type": "string",
///             "description": "The ID of the customer associated with the draft order.",
///             "title": "customer_id"
///         },
///         "sales_channel_id": {
///             "type": "string",
///             "description": "The ID of the sales channel associated with the draft order.",
///             "title": "sales_channel_id"
///         }
///     },
///     "type": "object",
///     "description": "The data to update in the draft order."
/// }
library admin_update_draft_order;

import 'exports.dart';
part 'admin_update_draft_order.freezed.dart';
part 'admin_update_draft_order.g.dart'; // AdminUpdateDraftOrder

@freezed
abstract class AdminUpdateDraftOrder with _$AdminUpdateDraftOrder {
  const AdminUpdateDraftOrder._();

  @jsonSerializable
  const factory AdminUpdateDraftOrder({
    /// email
    @JsonKey(name: AdminUpdateDraftOrder.emailKey) required String email,

    /// shippingAddress
    @JsonKey(name: AdminUpdateDraftOrder.shippingAddressKey)
    required Map<String, dynamic> shippingAddress,

    /// billingAddress
    @JsonKey(name: AdminUpdateDraftOrder.billingAddressKey)
    required Map<String, dynamic> billingAddress,

    /// metadata
    @JsonKey(name: AdminUpdateDraftOrder.metadataKey)
    required Map<String, dynamic> metadata,

    /// customerId
    @JsonKey(name: AdminUpdateDraftOrder.customerIdKey)
    required String customerId,

    /// salesChannelId
    @JsonKey(name: AdminUpdateDraftOrder.salesChannelIdKey)
    required String salesChannelId,
  }) = _AdminUpdateDraftOrder;

  factory AdminUpdateDraftOrder.fromJson(Map<String, dynamic> json) =>
      _$AdminUpdateDraftOrderFromJson(json);

  static const String emailKey = r'email';

  static const String shippingAddressKey = r'shipping_address';

  static const String billingAddressKey = r'billing_address';

  static const String metadataKey = r'metadata';

  static const String customerIdKey = r'customer_id';

  static const String salesChannelIdKey = r'sales_channel_id';
}
