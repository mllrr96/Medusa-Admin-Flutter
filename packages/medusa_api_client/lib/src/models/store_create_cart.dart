/// StoreCreateCart
/// {
///     "properties": {
///         "region_id": {
///             "type": "string",
///             "description": "The ID of the cart's region. This affects the prices and currency of the cart.",
///             "title": "region_id"
///         },
///         "shipping_address": {
///             "$ref": "#/components/schemas/StoreCartAddress"
///         },
///         "billing_address": {
///             "$ref": "#/components/schemas/StoreCartAddress"
///         },
///         "email": {
///             "type": "string",
///             "format": "email",
///             "description": "The email of the cart's customer.",
///             "title": "email"
///         },
///         "currency_code": {
///             "type": "string",
///             "description": "The cart's currency code. If not provided, the region's currency is used. This affects prices in the cart, as well.",
///             "title": "currency_code"
///         },
///         "items": {
///             "type": "array",
///             "items": {
///                 "$ref": "#/components/schemas/StoreCartLineItem"
///             },
///             "description": "The cart's items."
///         },
///         "sales_channel_id": {
///             "type": "string",
///             "description": "The ID of the sales channel that cart is created in. Only products available in that sales channel can be added to the cart. If not provided, the store's default sales channel is associated with the cart instead.",
///             "title": "sales_channel_id"
///         },
///         "metadata": {
///             "type": "object",
///             "description": "The cart's metadata, can hold custom key-value pairs."
///         }
///     },
///     "type": "object",
///     "description": "The details of the cart to be created."
/// }
library store_create_cart;

import 'exports.dart';
part 'store_create_cart.freezed.dart';
part 'store_create_cart.g.dart'; // StoreCreateCart

@freezed
abstract class StoreCreateCart with _$StoreCreateCart {
  const StoreCreateCart._();

  @jsonSerializable
  const factory StoreCreateCart({
    /// regionId
    @JsonKey(name: StoreCreateCart.regionIdKey) required String regionId,

    /// shippingAddress
    @JsonKey(name: StoreCreateCart.shippingAddressKey)
    required StoreCartAddress shippingAddress,

    /// billingAddress
    @JsonKey(name: StoreCreateCart.billingAddressKey)
    required StoreCartAddress billingAddress,

    /// email
    @JsonKey(name: StoreCreateCart.emailKey) required String email,

    /// currencyCode
    @JsonKey(name: StoreCreateCart.currencyCodeKey)
    required String currencyCode,

    /// items
    @JsonKey(name: StoreCreateCart.itemsKey)
    required List<StoreCartLineItem> items,

    /// salesChannelId
    @JsonKey(name: StoreCreateCart.salesChannelIdKey)
    required String salesChannelId,

    /// metadata
    @JsonKey(name: StoreCreateCart.metadataKey)
    required Map<String, dynamic> metadata,
  }) = _StoreCreateCart;

  factory StoreCreateCart.fromJson(Map<String, dynamic> json) =>
      _$StoreCreateCartFromJson(json);

  static const String regionIdKey = r'region_id';

  static const String shippingAddressKey = r'shipping_address';

  static const String billingAddressKey = r'billing_address';

  static const String emailKey = r'email';

  static const String currencyCodeKey = r'currency_code';

  static const String itemsKey = r'items';

  static const String salesChannelIdKey = r'sales_channel_id';

  static const String metadataKey = r'metadata';
}
