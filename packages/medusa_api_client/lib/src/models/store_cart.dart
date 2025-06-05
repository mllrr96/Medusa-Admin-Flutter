/// StoreCart
/// {
///     "properties": {
///         "id": {
///             "type": "string",
///             "description": "The cart's ID.",
///             "title": "id"
///         },
///         "region": {
///             "$ref": "#/components/schemas/StoreRegion"
///         },
///         "region_id": {
///             "type": "string",
///             "description": "The ID of the region the cart belongs to.",
///             "title": "region_id"
///         },
///         "customer_id": {
///             "type": "string",
///             "description": "The ID of the customer the cart belongs to.",
///             "title": "customer_id"
///         },
///         "sales_channel_id": {
///             "type": "string",
///             "description": "The ID of the cart's sales channel. Only products that belong to the same sales channel can be added to the cart. The created order will be associated with the same sales channel.",
///             "title": "sales_channel_id"
///         },
///         "email": {
///             "type": "string",
///             "format": "email",
///             "description": "The email of the customer the cart belongs to.",
///             "title": "email"
///         },
///         "currency_code": {
///             "type": "string",
///             "description": "The cart's currency code.",
///             "title": "currency_code"
///         },
///         "shipping_address": {
///             "$ref": "#/components/schemas/StoreCartAddress"
///         },
///         "billing_address": {
///             "$ref": "#/components/schemas/StoreCartAddress"
///         },
///         "items": {
///             "type": "array",
///             "items": {
///                 "$ref": "#/components/schemas/StoreCartLineItem"
///             },
///             "description": "The cart's items."
///         },
///         "shipping_methods": {
///             "type": "array",
///             "items": {
///                 "$ref": "#/components/schemas/StoreCartShippingMethod"
///             },
///             "description": "The cart's shipping methods."
///         },
///         "payment_collection": {
///             "$ref": "#/components/schemas/StorePaymentCollection"
///         },
///         "metadata": {
///             "type": "object",
///             "description": "The cart's metadata, can hold custom key-value pairs."
///         },
///         "created_at": {
///             "type": "string",
///             "format": "date-time",
///             "description": "The date the cart was created.",
///             "title": "created_at"
///         },
///         "updated_at": {
///             "type": "string",
///             "format": "date-time",
///             "description": "The date the cart was updated.",
///             "title": "updated_at"
///         },
///         "original_item_total": {
///             "type": "number",
///             "description": "The cart items' total including taxes, excluding promotions.",
///             "title": "original_item_total"
///         },
///         "original_item_subtotal": {
///             "type": "number",
///             "description": "The cart items' total excluding taxes, including promotions.",
///             "title": "original_item_subtotal"
///         },
///         "original_item_tax_total": {
///             "type": "number",
///             "description": "The cart items' tax total excluding promotions.",
///             "title": "original_item_tax_total"
///         },
///         "item_total": {
///             "type": "number",
///             "description": "The cart items' total including taxes and promotions.",
///             "title": "item_total"
///         },
///         "item_subtotal": {
///             "type": "number",
///             "description": "The cart items' total excluding taxes, including promotions.",
///             "title": "item_subtotal"
///         },
///         "item_tax_total": {
///             "type": "number",
///             "description": "The cart items' tax total including promotions.",
///             "title": "item_tax_total"
///         },
///         "original_total": {
///             "type": "number",
///             "description": "The cart's total including taxes, excluding promotions.",
///             "title": "original_total"
///         },
///         "original_subtotal": {
///             "type": "number",
///             "description": "The cart's total excluding taxes, including promotions.",
///             "title": "original_subtotal"
///         },
///         "original_tax_total": {
///             "type": "number",
///             "description": "The cart's tax total excluding promotions.",
///             "title": "original_tax_total"
///         },
///         "total": {
///             "type": "number",
///             "description": "The cart's total including taxes and promotions.",
///             "title": "total"
///         },
///         "subtotal": {
///             "type": "number",
///             "description": "The cart's total excluding taxes, including promotions.",
///             "title": "subtotal"
///         },
///         "tax_total": {
///             "type": "number",
///             "description": "The cart's tax total including promotions.",
///             "title": "tax_total"
///         },
///         "discount_total": {
///             "type": "number",
///             "description": "The cart's discount total.",
///             "title": "discount_total"
///         },
///         "discount_tax_total": {
///             "type": "number",
///             "description": "The tax total applied on the discounted amount.",
///             "title": "discount_tax_total"
///         },
///         "gift_card_total": {
///             "type": "number",
///             "description": "The total gift card amount applied on the cart.",
///             "title": "gift_card_total"
///         },
///         "gift_card_tax_total": {
///             "type": "number",
///             "description": "The total taxes applied on the gift card amount.",
///             "title": "gift_card_tax_total"
///         },
///         "shipping_total": {
///             "type": "number",
///             "description": "The cart's shipping total including taxes and promotions.",
///             "title": "shipping_total"
///         },
///         "shipping_subtotal": {
///             "type": "number",
///             "description": "The cart's shipping total excluding taxes, including promotions.",
///             "title": "shipping_subtotal"
///         },
///         "shipping_tax_total": {
///             "type": "number",
///             "description": "The total taxes applied on the cart's shipping amount.",
///             "title": "shipping_tax_total"
///         },
///         "original_shipping_total": {
///             "type": "number",
///             "description": "The cart's shipping total including taxes, excluding promotions.",
///             "title": "original_shipping_total"
///         },
///         "original_shipping_subtotal": {
///             "type": "number",
///             "description": "The cart's shipping total excluding taxes, including promotions.",
///             "title": "original_shipping_subtotal"
///         },
///         "original_shipping_tax_total": {
///             "type": "number",
///             "description": "The total taxes applied on the cart's shipping amount.",
///             "title": "original_shipping_tax_total"
///         },
///         "promotions": {
///             "type": "array",
///             "items": {
///                 "$ref": "#/components/schemas/StoreCartPromotion"
///             },
///             "description": "The cart's promotions."
///         }
///     },
///     "type": "object",
///     "required": [
///         "promotions",
///         "currency_code",
///         "id",
///         "original_item_total",
///         "original_item_subtotal",
///         "original_item_tax_total",
///         "item_total",
///         "item_subtotal",
///         "item_tax_total",
///         "original_total",
///         "original_subtotal",
///         "original_tax_total",
///         "total",
///         "subtotal",
///         "tax_total",
///         "discount_total",
///         "discount_tax_total",
///         "gift_card_total",
///         "gift_card_tax_total",
///         "shipping_total",
///         "shipping_subtotal",
///         "shipping_tax_total",
///         "original_shipping_total",
///         "original_shipping_subtotal",
///         "original_shipping_tax_total"
///     ],
///     "description": "The cart's details."
/// }
library;

import 'exports.dart';
part 'store_cart.freezed.dart';
part 'store_cart.g.dart'; // StoreCart

@freezed
abstract class StoreCart with _$StoreCart {
  const StoreCart._();

  @jsonSerializable
  const factory StoreCart({
    /// id
    @JsonKey(name: StoreCart.idKey) required String id,

    /// region
    @JsonKey(name: StoreCart.regionKey) required StoreRegion region,

    /// regionId
    @JsonKey(name: StoreCart.regionIdKey) required String regionId,

    /// customerId
    @JsonKey(name: StoreCart.customerIdKey) required String customerId,

    /// salesChannelId
    @JsonKey(name: StoreCart.salesChannelIdKey) required String salesChannelId,

    /// email
    @JsonKey(name: StoreCart.emailKey) required String email,

    /// currencyCode
    @JsonKey(name: StoreCart.currencyCodeKey) required String currencyCode,

    /// shippingAddress
    @JsonKey(name: StoreCart.shippingAddressKey)
    required StoreCartAddress shippingAddress,

    /// billingAddress
    @JsonKey(name: StoreCart.billingAddressKey)
    required StoreCartAddress billingAddress,

    /// items
    @JsonKey(name: StoreCart.itemsKey) required List<StoreCartLineItem> items,

    /// shippingMethods
    @JsonKey(name: StoreCart.shippingMethodsKey)
    required List<StoreCartShippingMethod> shippingMethods,

    /// paymentCollection
    @JsonKey(name: StoreCart.paymentCollectionKey)
    required StorePaymentCollection paymentCollection,

    /// metadata
    @JsonKey(name: StoreCart.metadataKey)
    required Map<String, dynamic> metadata,

    /// createdAt
    @JsonKey(name: StoreCart.createdAtKey) required DateTime createdAt,

    /// updatedAt
    @JsonKey(name: StoreCart.updatedAtKey) required DateTime updatedAt,

    /// originalItemTotal
    @JsonKey(name: StoreCart.originalItemTotalKey)
    required double originalItemTotal,

    /// originalItemSubtotal
    @JsonKey(name: StoreCart.originalItemSubtotalKey)
    required double originalItemSubtotal,

    /// originalItemTaxTotal
    @JsonKey(name: StoreCart.originalItemTaxTotalKey)
    required double originalItemTaxTotal,

    /// itemTotal
    @JsonKey(name: StoreCart.itemTotalKey) required double itemTotal,

    /// itemSubtotal
    @JsonKey(name: StoreCart.itemSubtotalKey) required double itemSubtotal,

    /// itemTaxTotal
    @JsonKey(name: StoreCart.itemTaxTotalKey) required double itemTaxTotal,

    /// originalTotal
    @JsonKey(name: StoreCart.originalTotalKey) required double originalTotal,

    /// originalSubtotal
    @JsonKey(name: StoreCart.originalSubtotalKey)
    required double originalSubtotal,

    /// originalTaxTotal
    @JsonKey(name: StoreCart.originalTaxTotalKey)
    required double originalTaxTotal,

    /// total
    @JsonKey(name: StoreCart.totalKey) required double total,

    /// subtotal
    @JsonKey(name: StoreCart.subtotalKey) required double subtotal,

    /// taxTotal
    @JsonKey(name: StoreCart.taxTotalKey) required double taxTotal,

    /// discountTotal
    @JsonKey(name: StoreCart.discountTotalKey) required double discountTotal,

    /// discountTaxTotal
    @JsonKey(name: StoreCart.discountTaxTotalKey)
    required double discountTaxTotal,

    /// giftCardTotal
    @JsonKey(name: StoreCart.giftCardTotalKey) required double giftCardTotal,

    /// giftCardTaxTotal
    @JsonKey(name: StoreCart.giftCardTaxTotalKey)
    required double giftCardTaxTotal,

    /// shippingTotal
    @JsonKey(name: StoreCart.shippingTotalKey) required double shippingTotal,

    /// shippingSubtotal
    @JsonKey(name: StoreCart.shippingSubtotalKey)
    required double shippingSubtotal,

    /// shippingTaxTotal
    @JsonKey(name: StoreCart.shippingTaxTotalKey)
    required double shippingTaxTotal,

    /// originalShippingTotal
    @JsonKey(name: StoreCart.originalShippingTotalKey)
    required double originalShippingTotal,

    /// originalShippingSubtotal
    @JsonKey(name: StoreCart.originalShippingSubtotalKey)
    required double originalShippingSubtotal,

    /// originalShippingTaxTotal
    @JsonKey(name: StoreCart.originalShippingTaxTotalKey)
    required double originalShippingTaxTotal,

    /// promotions
    @JsonKey(name: StoreCart.promotionsKey)
    required List<StoreCartPromotion> promotions,
  }) = _StoreCart;

  factory StoreCart.fromJson(Map<String, dynamic> json) =>
      _$StoreCartFromJson(json);

  static const String idKey = r'id';

  static const String regionKey = r'region';

  static const String regionIdKey = r'region_id';

  static const String customerIdKey = r'customer_id';

  static const String salesChannelIdKey = r'sales_channel_id';

  static const String emailKey = r'email';

  static const String currencyCodeKey = r'currency_code';

  static const String shippingAddressKey = r'shipping_address';

  static const String billingAddressKey = r'billing_address';

  static const String itemsKey = r'items';

  static const String shippingMethodsKey = r'shipping_methods';

  static const String paymentCollectionKey = r'payment_collection';

  static const String metadataKey = r'metadata';

  static const String createdAtKey = r'created_at';

  static const String updatedAtKey = r'updated_at';

  static const String originalItemTotalKey = r'original_item_total';

  static const String originalItemSubtotalKey = r'original_item_subtotal';

  static const String originalItemTaxTotalKey = r'original_item_tax_total';

  static const String itemTotalKey = r'item_total';

  static const String itemSubtotalKey = r'item_subtotal';

  static const String itemTaxTotalKey = r'item_tax_total';

  static const String originalTotalKey = r'original_total';

  static const String originalSubtotalKey = r'original_subtotal';

  static const String originalTaxTotalKey = r'original_tax_total';

  static const String totalKey = r'total';

  static const String subtotalKey = r'subtotal';

  static const String taxTotalKey = r'tax_total';

  static const String discountTotalKey = r'discount_total';

  static const String discountTaxTotalKey = r'discount_tax_total';

  static const String giftCardTotalKey = r'gift_card_total';

  static const String giftCardTaxTotalKey = r'gift_card_tax_total';

  static const String shippingTotalKey = r'shipping_total';

  static const String shippingSubtotalKey = r'shipping_subtotal';

  static const String shippingTaxTotalKey = r'shipping_tax_total';

  static const String originalShippingTotalKey = r'original_shipping_total';

  static const String originalShippingSubtotalKey =
      r'original_shipping_subtotal';

  static const String originalShippingTaxTotalKey =
      r'original_shipping_tax_total';

  static const String promotionsKey = r'promotions';
}
