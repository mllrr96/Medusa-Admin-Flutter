/// BaseOrder
/// {
///     "properties": {
///         "payment_collections": {
///             "type": "array",
///             "items": {
///                 "$ref": "#/components/schemas/BasePaymentCollection"
///             },
///             "description": "The order's payment collections."
///         },
///         "fulfillments": {
///             "type": "array",
///             "items": {
///                 "$ref": "#/components/schemas/BaseOrderFulfillment"
///             },
///             "description": "The order's fulfillments."
///         },
///         "shipping_address": {
///             "$ref": "#/components/schemas/BaseOrderAddress"
///         },
///         "billing_address": {
///             "$ref": "#/components/schemas/BaseOrderAddress"
///         },
///         "id": {
///             "type": "string",
///             "description": "The order's ID.",
///             "title": "id"
///         },
///         "version": {
///             "type": "number",
///             "description": "The order's version.",
///             "title": "version"
///         },
///         "region_id": {
///             "type": "string",
///             "description": "The ID of the region associated with the order.",
///             "title": "region_id"
///         },
///         "customer_id": {
///             "type": "string",
///             "description": "The ID of the customer that placed the order.",
///             "title": "customer_id"
///         },
///         "sales_channel_id": {
///             "type": "string",
///             "description": "The ID of the sales channel the order is placed in.",
///             "title": "sales_channel_id"
///         },
///         "email": {
///             "type": "string",
///             "format": "email",
///             "description": "The email of the customer that placed the order.",
///             "title": "email"
///         },
///         "currency_code": {
///             "type": "string",
///             "description": "The order's currency code.",
///             "title": "currency_code"
///         },
///         "display_id": {
///             "type": "number",
///             "description": "The order's display ID.",
///             "title": "display_id"
///         },
///         "items": {
///             "type": "array",
///             "items": {
///                 "$ref": "#/components/schemas/BaseOrderLineItem"
///             },
///             "description": "The order's items."
///         },
///         "shipping_methods": {
///             "type": "array",
///             "items": {
///                 "$ref": "#/components/schemas/BaseOrderShippingMethod"
///             },
///             "description": "The order's shipping methods."
///         },
///         "payment_status": {
///             "enum": [
///                 "canceled",
///                 "not_paid",
///                 "awaiting",
///                 "authorized",
///                 "partially_authorized",
///                 "captured",
///                 "partially_captured",
///                 "partially_refunded",
///                 "refunded",
///                 "requires_action"
///             ],
///             "type": "string",
///             "description": "The order's payment status."
///         },
///         "fulfillment_status": {
///             "enum": [
///                 "canceled",
///                 "not_fulfilled",
///                 "partially_fulfilled",
///                 "fulfilled",
///                 "partially_shipped",
///                 "shipped",
///                 "partially_delivered",
///                 "delivered"
///             ],
///             "type": "string",
///             "description": "The order's fulfillment status."
///         },
///         "transactions": {
///             "type": "array",
///             "items": {
///                 "$ref": "#/components/schemas/BaseOrderTransaction"
///             },
///             "description": "The order's transactions."
///         },
///         "summary": {
///             "$ref": "#/components/schemas/BaseOrderSummary"
///         },
///         "metadata": {
///             "type": "object",
///             "description": "The order's metadata, can hold custom key-value pairs."
///         },
///         "created_at": {
///             "type": "string",
///             "format": "date-time",
///             "description": "The date the order was created.",
///             "title": "created_at"
///         },
///         "updated_at": {
///             "type": "string",
///             "format": "date-time",
///             "description": "The date the order was updated.",
///             "title": "updated_at"
///         },
///         "original_item_total": {
///             "type": "number",
///             "description": "The total of the order's items including taxes, excluding promotions.",
///             "title": "original_item_total"
///         },
///         "original_item_subtotal": {
///             "type": "number",
///             "description": "The total of the order's items excluding taxes, including promotions.",
///             "title": "original_item_subtotal"
///         },
///         "original_item_tax_total": {
///             "type": "number",
///             "description": "The tax total of the order's items excluding promotions.",
///             "title": "original_item_tax_total"
///         },
///         "item_total": {
///             "type": "number",
///             "description": "The total of the order's items including taxes and promotions.",
///             "title": "item_total"
///         },
///         "item_subtotal": {
///             "type": "number",
///             "description": "The total of the order's items excluding taxes, including promotions.",
///             "title": "item_subtotal"
///         },
///         "item_tax_total": {
///             "type": "number",
///             "description": "The tax total of the order's items including promotions.",
///             "title": "item_tax_total"
///         },
///         "original_total": {
///             "type": "number",
///             "description": "The order's total excluding promotions, including taxes.",
///             "title": "original_total"
///         },
///         "original_subtotal": {
///             "type": "number",
///             "description": "The order's total excluding taxes, including promotions.",
///             "title": "original_subtotal"
///         },
///         "original_tax_total": {
///             "type": "number",
///             "description": "The order's tax total, excluding promotions.",
///             "title": "original_tax_total"
///         },
///         "total": {
///             "type": "number",
///             "description": "The order's total including taxes and promotions.",
///             "title": "total"
///         },
///         "subtotal": {
///             "type": "number",
///             "description": "The order's total excluding taxes, including promotions.",
///             "title": "subtotal"
///         },
///         "tax_total": {
///             "type": "number",
///             "description": "The order's tax total including promotions.",
///             "title": "tax_total"
///         },
///         "discount_total": {
///             "type": "number",
///             "description": "The order's discount or promotions total.",
///             "title": "discount_total"
///         },
///         "discount_tax_total": {
///             "type": "number",
///             "description": "The tax total of order's discount or promotion.",
///             "title": "discount_tax_total"
///         },
///         "gift_card_total": {
///             "type": "number",
///             "description": "The order's gift card total.",
///             "title": "gift_card_total"
///         },
///         "gift_card_tax_total": {
///             "type": "number",
///             "description": "The tax total of the order's gift card.",
///             "title": "gift_card_tax_total"
///         },
///         "shipping_total": {
///             "type": "number",
///             "description": "The order's shipping total including taxes and promotions.",
///             "title": "shipping_total"
///         },
///         "shipping_subtotal": {
///             "type": "number",
///             "description": "The order's shipping total excluding taxes, including promotions.",
///             "title": "shipping_subtotal"
///         },
///         "shipping_tax_total": {
///             "type": "number",
///             "description": "The tax total of the order's shipping.",
///             "title": "shipping_tax_total"
///         },
///         "original_shipping_total": {
///             "type": "number",
///             "description": "The order's shipping total including taxes, excluding promotions.",
///             "title": "original_shipping_total"
///         },
///         "original_shipping_subtotal": {
///             "type": "number",
///             "description": "The order's shipping total excluding taxes, including promotions.",
///             "title": "original_shipping_subtotal"
///         },
///         "original_shipping_tax_total": {
///             "type": "number",
///             "description": "The tax total of the order's shipping excluding promotions.",
///             "title": "original_shipping_tax_total"
///         },
///         "status": {
///             "type": "string",
///             "description": "The order's status.",
///             "title": "status"
///         }
///     },
///     "type": "object",
///     "required": [
///         "id",
///         "version",
///         "region_id",
///         "customer_id",
///         "sales_channel_id",
///         "email",
///         "currency_code",
///         "status",
///         "items",
///         "shipping_methods",
///         "payment_status",
///         "fulfillment_status",
///         "summary",
///         "created_at",
///         "updated_at",
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
///     "description": "The order's details."
/// }
library;

import 'exports.dart';
part 'base_order.freezed.dart';
part 'base_order.g.dart'; // BaseOrder

@freezed
abstract class BaseOrder with _$BaseOrder {
  const BaseOrder._();

  @jsonSerializable
  const factory BaseOrder({
    /// paymentCollections
    @JsonKey(name: BaseOrder.paymentCollectionsKey)
    required List<BasePaymentCollection> paymentCollections,

    /// fulfillments
    @JsonKey(name: BaseOrder.fulfillmentsKey)
    required List<BaseOrderFulfillment> fulfillments,

    /// shippingAddress
    @JsonKey(name: BaseOrder.shippingAddressKey)
    required BaseOrderAddress shippingAddress,

    /// billingAddress
    @JsonKey(name: BaseOrder.billingAddressKey)
    required BaseOrderAddress billingAddress,

    /// id
    @JsonKey(name: BaseOrder.idKey) required String id,

    /// version
    @JsonKey(name: BaseOrder.versionKey) required double version,

    /// regionId
    @JsonKey(name: BaseOrder.regionIdKey) required String regionId,

    /// customerId
    @JsonKey(name: BaseOrder.customerIdKey) required String customerId,

    /// salesChannelId
    @JsonKey(name: BaseOrder.salesChannelIdKey) required String salesChannelId,

    /// email
    @JsonKey(name: BaseOrder.emailKey) required String email,

    /// currencyCode
    @JsonKey(name: BaseOrder.currencyCodeKey) required String currencyCode,

    /// displayId
    @JsonKey(name: BaseOrder.displayIdKey) required double displayId,

    /// items
    @JsonKey(name: BaseOrder.itemsKey) required List<BaseOrderLineItem> items,

    /// shippingMethods
    @JsonKey(name: BaseOrder.shippingMethodsKey)
    required List<BaseOrderShippingMethod> shippingMethods,

    /// paymentStatus
    @JsonKey(name: BaseOrder.paymentStatusKey) required NullEnum paymentStatus,

    /// fulfillmentStatus
    @JsonKey(name: BaseOrder.fulfillmentStatusKey)
    required NullEnum fulfillmentStatus,

    /// transactions
    @JsonKey(name: BaseOrder.transactionsKey)
    required List<BaseOrderTransaction> transactions,

    /// summary
    @JsonKey(name: BaseOrder.summaryKey) required BaseOrderSummary summary,

    /// metadata
    @JsonKey(name: BaseOrder.metadataKey)
    required Map<String, dynamic> metadata,

    /// createdAt
    @JsonKey(name: BaseOrder.createdAtKey) required DateTime createdAt,

    /// updatedAt
    @JsonKey(name: BaseOrder.updatedAtKey) required DateTime updatedAt,

    /// originalItemTotal
    @JsonKey(name: BaseOrder.originalItemTotalKey)
    required double originalItemTotal,

    /// originalItemSubtotal
    @JsonKey(name: BaseOrder.originalItemSubtotalKey)
    required double originalItemSubtotal,

    /// originalItemTaxTotal
    @JsonKey(name: BaseOrder.originalItemTaxTotalKey)
    required double originalItemTaxTotal,

    /// itemTotal
    @JsonKey(name: BaseOrder.itemTotalKey) required double itemTotal,

    /// itemSubtotal
    @JsonKey(name: BaseOrder.itemSubtotalKey) required double itemSubtotal,

    /// itemTaxTotal
    @JsonKey(name: BaseOrder.itemTaxTotalKey) required double itemTaxTotal,

    /// originalTotal
    @JsonKey(name: BaseOrder.originalTotalKey) required double originalTotal,

    /// originalSubtotal
    @JsonKey(name: BaseOrder.originalSubtotalKey)
    required double originalSubtotal,

    /// originalTaxTotal
    @JsonKey(name: BaseOrder.originalTaxTotalKey)
    required double originalTaxTotal,

    /// total
    @JsonKey(name: BaseOrder.totalKey) required double total,

    /// subtotal
    @JsonKey(name: BaseOrder.subtotalKey) required double subtotal,

    /// taxTotal
    @JsonKey(name: BaseOrder.taxTotalKey) required double taxTotal,

    /// discountTotal
    @JsonKey(name: BaseOrder.discountTotalKey) required double discountTotal,

    /// discountTaxTotal
    @JsonKey(name: BaseOrder.discountTaxTotalKey)
    required double discountTaxTotal,

    /// giftCardTotal
    @JsonKey(name: BaseOrder.giftCardTotalKey) required double giftCardTotal,

    /// giftCardTaxTotal
    @JsonKey(name: BaseOrder.giftCardTaxTotalKey)
    required double giftCardTaxTotal,

    /// shippingTotal
    @JsonKey(name: BaseOrder.shippingTotalKey) required double shippingTotal,

    /// shippingSubtotal
    @JsonKey(name: BaseOrder.shippingSubtotalKey)
    required double shippingSubtotal,

    /// shippingTaxTotal
    @JsonKey(name: BaseOrder.shippingTaxTotalKey)
    required double shippingTaxTotal,

    /// originalShippingTotal
    @JsonKey(name: BaseOrder.originalShippingTotalKey)
    required double originalShippingTotal,

    /// originalShippingSubtotal
    @JsonKey(name: BaseOrder.originalShippingSubtotalKey)
    required double originalShippingSubtotal,

    /// originalShippingTaxTotal
    @JsonKey(name: BaseOrder.originalShippingTaxTotalKey)
    required double originalShippingTaxTotal,

    /// status
    @JsonKey(name: BaseOrder.statusKey) required String status,
  }) = _BaseOrder;

  factory BaseOrder.fromJson(Map<String, dynamic> json) =>
      _$BaseOrderFromJson(json);

  static const String paymentCollectionsKey = r'payment_collections';

  static const String fulfillmentsKey = r'fulfillments';

  static const String shippingAddressKey = r'shipping_address';

  static const String billingAddressKey = r'billing_address';

  static const String idKey = r'id';

  static const String versionKey = r'version';

  static const String regionIdKey = r'region_id';

  static const String customerIdKey = r'customer_id';

  static const String salesChannelIdKey = r'sales_channel_id';

  static const String emailKey = r'email';

  static const String currencyCodeKey = r'currency_code';

  static const String displayIdKey = r'display_id';

  static const String itemsKey = r'items';

  static const String shippingMethodsKey = r'shipping_methods';

  static const String paymentStatusKey = r'payment_status';

  static const String fulfillmentStatusKey = r'fulfillment_status';

  static const String transactionsKey = r'transactions';

  static const String summaryKey = r'summary';

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

  static const String statusKey = r'status';
}
