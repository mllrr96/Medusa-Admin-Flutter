/// UpdateCartData
/// {
///     "properties": {
///         "region_id": {
///             "type": "string",
///             "description": "The ID of the associated region. This can affect the prices and currency code of the cart.",
///             "title": "region_id"
///         },
///         "customer_id": {
///             "type": "string",
///             "description": "The ID of the customer that the cart belongs to.",
///             "title": "customer_id"
///         },
///         "sales_channel_id": {
///             "type": "string",
///             "description": "The ID of the associated sales channel. Only products available in this channel can be added to the cart.",
///             "title": "sales_channel_id"
///         },
///         "email": {
///             "type": "string",
///             "format": "email",
///             "description": "The email of the customer that the cart belongs to.",
///             "title": "email"
///         },
///         "currency_code": {
///             "type": "string",
///             "description": "The cart's currency code.",
///             "title": "currency_code"
///         },
///         "shipping_address_id": {
///             "type": "string",
///             "description": "The ID of the cart's shipping address.",
///             "title": "shipping_address_id"
///         },
///         "billing_address_id": {
///             "type": "string",
///             "description": "The ID of the cart's billing address.",
///             "title": "billing_address_id"
///         },
///         "billing_address": {
///             "oneOf": [
///                 {
///                     "$ref": "#/components/schemas/CreateAddress"
///                 },
///                 {
///                     "$ref": "#/components/schemas/UpdateAddress"
///                 }
///             ]
///         },
///         "shipping_address": {
///             "oneOf": [
///                 {
///                     "$ref": "#/components/schemas/CreateAddress"
///                 },
///                 {
///                     "$ref": "#/components/schemas/UpdateAddress"
///                 }
///             ]
///         },
///         "metadata": {
///             "type": "object",
///             "description": "The cart's metadata, ca hold custom key-value pairs."
///         }
///     },
///     "type": "object",
///     "description": "The details to update in a cart."
/// }
library update_cart_data;

import 'exports.dart';
part 'update_cart_data.freezed.dart';
part 'update_cart_data.g.dart'; // UpdateCartData

@freezed
abstract class UpdateCartData with _$UpdateCartData {
  const UpdateCartData._();

  @jsonSerializable
  const factory UpdateCartData({
    /// regionId
    @JsonKey(name: UpdateCartData.regionIdKey) required String regionId,

    /// customerId
    @JsonKey(name: UpdateCartData.customerIdKey) required String customerId,

    /// salesChannelId
    @JsonKey(name: UpdateCartData.salesChannelIdKey)
    required String salesChannelId,

    /// email
    @JsonKey(name: UpdateCartData.emailKey) required String email,

    /// currencyCode
    @JsonKey(name: UpdateCartData.currencyCodeKey) required String currencyCode,

    /// shippingAddressId
    @JsonKey(name: UpdateCartData.shippingAddressIdKey)
    required String shippingAddressId,

    /// billingAddressId
    @JsonKey(name: UpdateCartData.billingAddressIdKey)
    required String billingAddressId,

    /// billingAddress
    @JsonKey(name: UpdateCartData.billingAddressKey)
    required CreateAddressOrUpdateAddressUnion billingAddress,

    /// shippingAddress
    @JsonKey(name: UpdateCartData.shippingAddressKey)
    required CreateAddressOrUpdateAddressUnion shippingAddress,

    /// metadata
    @JsonKey(name: UpdateCartData.metadataKey)
    required Map<String, dynamic> metadata,
  }) = _UpdateCartData;

  factory UpdateCartData.fromJson(Map<String, dynamic> json) =>
      _$UpdateCartDataFromJson(json);

  static const String regionIdKey = r'region_id';

  static const String customerIdKey = r'customer_id';

  static const String salesChannelIdKey = r'sales_channel_id';

  static const String emailKey = r'email';

  static const String currencyCodeKey = r'currency_code';

  static const String shippingAddressIdKey = r'shipping_address_id';

  static const String billingAddressIdKey = r'billing_address_id';

  static const String billingAddressKey = r'billing_address';

  static const String shippingAddressKey = r'shipping_address';

  static const String metadataKey = r'metadata';
}
