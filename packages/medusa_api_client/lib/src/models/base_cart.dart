/// BaseCart
/// {
///     "properties": {
///         "id": {
///             "type": "string",
///             "description": "The cart's ID.",
///             "title": "id"
///         },
///         "region": {
///             "$ref": "#/components/schemas/BaseRegion"
///         },
///         "region_id": {
///             "type": "string",
///             "description": "The cart's region id.",
///             "title": "region_id"
///         },
///         "customer_id": {
///             "type": "string",
///             "description": "The cart's customer id.",
///             "title": "customer_id"
///         },
///         "sales_channel_id": {
///             "type": "string",
///             "description": "The cart's sales channel id.",
///             "title": "sales_channel_id"
///         },
///         "email": {
///             "type": "string",
///             "format": "email",
///             "description": "The cart's email.",
///             "title": "email"
///         },
///         "currency_code": {
///             "type": "string",
///             "description": "The cart's currency code.",
///             "title": "currency_code"
///         },
///         "shipping_address": {
///             "$ref": "#/components/schemas/BaseCartAddress"
///         },
///         "billing_address": {
///             "$ref": "#/components/schemas/BaseCartAddress"
///         },
///         "items": {
///             "type": "array",
///             "items": {
///                 "type": "object"
///             },
///             "description": "The cart's items."
///         },
///         "shipping_methods": {
///             "type": "array",
///             "items": {
///                 "$ref": "#/components/schemas/BaseCartShippingMethod"
///             },
///             "description": "The cart's shipping methods."
///         },
///         "payment_collection": {
///             "$ref": "#/components/schemas/BasePaymentCollection"
///         },
///         "metadata": {
///             "type": "object",
///             "description": "The cart's metadata."
///         },
///         "created_at": {
///             "type": "string",
///             "format": "date-time",
///             "description": "The cart's created at.",
///             "title": "created_at"
///         },
///         "updated_at": {
///             "type": "string",
///             "format": "date-time",
///             "description": "The cart's updated at.",
///             "title": "updated_at"
///         },
///         "original_item_total": {
///             "type": "number",
///             "description": "The cart's original item total.",
///             "title": "original_item_total"
///         },
///         "original_item_subtotal": {
///             "type": "number",
///             "description": "The cart's original item subtotal.",
///             "title": "original_item_subtotal"
///         },
///         "original_item_tax_total": {
///             "type": "number",
///             "description": "The cart's original item tax total.",
///             "title": "original_item_tax_total"
///         },
///         "item_total": {
///             "type": "number",
///             "description": "The cart's item total.",
///             "title": "item_total"
///         },
///         "item_subtotal": {
///             "type": "number",
///             "description": "The cart's item subtotal.",
///             "title": "item_subtotal"
///         },
///         "item_tax_total": {
///             "type": "number",
///             "description": "The cart's item tax total.",
///             "title": "item_tax_total"
///         },
///         "original_total": {
///             "type": "number",
///             "description": "The cart's original total.",
///             "title": "original_total"
///         },
///         "original_subtotal": {
///             "type": "number",
///             "description": "The cart's original subtotal.",
///             "title": "original_subtotal"
///         },
///         "original_tax_total": {
///             "type": "number",
///             "description": "The cart's original tax total.",
///             "title": "original_tax_total"
///         },
///         "total": {
///             "type": "number",
///             "description": "The cart's total.",
///             "title": "total"
///         },
///         "subtotal": {
///             "type": "number",
///             "description": "The cart's subtotal.",
///             "title": "subtotal"
///         },
///         "tax_total": {
///             "type": "number",
///             "description": "The cart's tax total.",
///             "title": "tax_total"
///         },
///         "discount_total": {
///             "type": "number",
///             "description": "The cart's discount total.",
///             "title": "discount_total"
///         },
///         "discount_tax_total": {
///             "type": "number",
///             "description": "The cart's discount tax total.",
///             "title": "discount_tax_total"
///         },
///         "gift_card_total": {
///             "type": "number",
///             "description": "The cart's gift card total.",
///             "title": "gift_card_total"
///         },
///         "gift_card_tax_total": {
///             "type": "number",
///             "description": "The cart's gift card tax total.",
///             "title": "gift_card_tax_total"
///         },
///         "shipping_total": {
///             "type": "number",
///             "description": "The cart's shipping total.",
///             "title": "shipping_total"
///         },
///         "shipping_subtotal": {
///             "type": "number",
///             "description": "The cart's shipping subtotal.",
///             "title": "shipping_subtotal"
///         },
///         "shipping_tax_total": {
///             "type": "number",
///             "description": "The cart's shipping tax total.",
///             "title": "shipping_tax_total"
///         },
///         "original_shipping_total": {
///             "type": "number",
///             "description": "The cart's original shipping total.",
///             "title": "original_shipping_total"
///         },
///         "original_shipping_subtotal": {
///             "type": "number",
///             "description": "The cart's original shipping subtotal.",
///             "title": "original_shipping_subtotal"
///         },
///         "original_shipping_tax_total": {
///             "type": "number",
///             "description": "The cart's original shipping tax total.",
///             "title": "original_shipping_tax_total"
///         }
///     },
///     "type": "object",
///     "required": [
///         "id",
///         "currency_code",
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
///     "description": "The item's cart."
/// }
library base_cart;

import 'exports.dart';
part 'base_cart.freezed.dart';
part 'base_cart.g.dart'; // BaseCart

@freezed
abstract class BaseCart with _$BaseCart {
  const BaseCart._();

  @jsonSerializable
  const factory BaseCart({
    /// id
    @JsonKey(name: BaseCart.idKey) required String id,

    /// region
    @JsonKey(name: BaseCart.regionKey) required BaseRegion region,

    /// regionId
    @JsonKey(name: BaseCart.regionIdKey) required String regionId,

    /// customerId
    @JsonKey(name: BaseCart.customerIdKey) required String customerId,

    /// salesChannelId
    @JsonKey(name: BaseCart.salesChannelIdKey) required String salesChannelId,

    /// email
    @JsonKey(name: BaseCart.emailKey) required String email,

    /// currencyCode
    @JsonKey(name: BaseCart.currencyCodeKey) required String currencyCode,

    /// shippingAddress
    @JsonKey(name: BaseCart.shippingAddressKey)
    required BaseCartAddress shippingAddress,

    /// billingAddress
    @JsonKey(name: BaseCart.billingAddressKey)
    required BaseCartAddress billingAddress,

    /// items
    @JsonKey(name: BaseCart.itemsKey) required List<Map<String, dynamic>> items,

    /// shippingMethods
    @JsonKey(name: BaseCart.shippingMethodsKey)
    required List<BaseCartShippingMethod> shippingMethods,

    /// paymentCollection
    @JsonKey(name: BaseCart.paymentCollectionKey)
    required BasePaymentCollection paymentCollection,

    /// metadata
    @JsonKey(name: BaseCart.metadataKey) required Map<String, dynamic> metadata,

    /// createdAt
    @JsonKey(name: BaseCart.createdAtKey) required DateTime createdAt,

    /// updatedAt
    @JsonKey(name: BaseCart.updatedAtKey) required DateTime updatedAt,

    /// originalItemTotal
    @JsonKey(name: BaseCart.originalItemTotalKey)
    required double originalItemTotal,

    /// originalItemSubtotal
    @JsonKey(name: BaseCart.originalItemSubtotalKey)
    required double originalItemSubtotal,

    /// originalItemTaxTotal
    @JsonKey(name: BaseCart.originalItemTaxTotalKey)
    required double originalItemTaxTotal,

    /// itemTotal
    @JsonKey(name: BaseCart.itemTotalKey) required double itemTotal,

    /// itemSubtotal
    @JsonKey(name: BaseCart.itemSubtotalKey) required double itemSubtotal,

    /// itemTaxTotal
    @JsonKey(name: BaseCart.itemTaxTotalKey) required double itemTaxTotal,

    /// originalTotal
    @JsonKey(name: BaseCart.originalTotalKey) required double originalTotal,

    /// originalSubtotal
    @JsonKey(name: BaseCart.originalSubtotalKey)
    required double originalSubtotal,

    /// originalTaxTotal
    @JsonKey(name: BaseCart.originalTaxTotalKey)
    required double originalTaxTotal,

    /// total
    @JsonKey(name: BaseCart.totalKey) required double total,

    /// subtotal
    @JsonKey(name: BaseCart.subtotalKey) required double subtotal,

    /// taxTotal
    @JsonKey(name: BaseCart.taxTotalKey) required double taxTotal,

    /// discountTotal
    @JsonKey(name: BaseCart.discountTotalKey) required double discountTotal,

    /// discountTaxTotal
    @JsonKey(name: BaseCart.discountTaxTotalKey)
    required double discountTaxTotal,

    /// giftCardTotal
    @JsonKey(name: BaseCart.giftCardTotalKey) required double giftCardTotal,

    /// giftCardTaxTotal
    @JsonKey(name: BaseCart.giftCardTaxTotalKey)
    required double giftCardTaxTotal,

    /// shippingTotal
    @JsonKey(name: BaseCart.shippingTotalKey) required double shippingTotal,

    /// shippingSubtotal
    @JsonKey(name: BaseCart.shippingSubtotalKey)
    required double shippingSubtotal,

    /// shippingTaxTotal
    @JsonKey(name: BaseCart.shippingTaxTotalKey)
    required double shippingTaxTotal,

    /// originalShippingTotal
    @JsonKey(name: BaseCart.originalShippingTotalKey)
    required double originalShippingTotal,

    /// originalShippingSubtotal
    @JsonKey(name: BaseCart.originalShippingSubtotalKey)
    required double originalShippingSubtotal,

    /// originalShippingTaxTotal
    @JsonKey(name: BaseCart.originalShippingTaxTotalKey)
    required double originalShippingTaxTotal,
  }) = _BaseCart;

  factory BaseCart.fromJson(Map<String, dynamic> json) =>
      _$BaseCartFromJson(json);

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
}
