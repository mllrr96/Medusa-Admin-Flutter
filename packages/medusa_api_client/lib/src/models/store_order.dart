/// StoreOrder
/// {
///     "properties": {
///         "id": {
///             "type": "string",
///             "description": "The order's ID.",
///             "title": "id"
///         },
///         "region_id": {
///             "type": "string",
///             "description": "The ID of the associated region.",
///             "title": "region_id"
///         },
///         "customer_id": {
///             "type": "string",
///             "description": "The ID of the customer that placed the order.",
///             "title": "customer_id"
///         },
///         "sales_channel_id": {
///             "type": "string",
///             "description": "The ID of the sales channel the order was placed in.",
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
///         "shipping_address": {
///             "$ref": "#/components/schemas/StoreOrderAddress"
///         },
///         "billing_address": {
///             "$ref": "#/components/schemas/StoreOrderAddress"
///         },
///         "items": {
///             "type": "array",
///             "items": {
///                 "$ref": "#/components/schemas/StoreOrderLineItem"
///             },
///             "description": "The order's items."
///         },
///         "shipping_methods": {
///             "type": "array",
///             "items": {
///                 "$ref": "#/components/schemas/StoreOrderShippingMethod"
///             },
///             "description": "The order's shipping methods."
///         },
///         "payment_collections": {
///             "type": "array",
///             "items": {
///                 "$ref": "#/components/schemas/StorePaymentCollection"
///             },
///             "description": "The order's payment collections."
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
///         "fulfillments": {
///             "type": "array",
///             "items": {
///                 "$ref": "#/components/schemas/StoreOrderFulfillment"
///             },
///             "description": "The order's fulfillments."
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
///             "description": "The order items' total including taxes, excluding promotions.",
///             "title": "original_item_total"
///         },
///         "original_item_subtotal": {
///             "type": "number",
///             "description": "The order items' total excluding taxes, including promotions.",
///             "title": "original_item_subtotal"
///         },
///         "original_item_tax_total": {
///             "type": "number",
///             "description": "The total taxes applied on the order items, excluding promotions.",
///             "title": "original_item_tax_total"
///         },
///         "item_total": {
///             "type": "number",
///             "description": "The order items' total including taxes and promotions.",
///             "title": "item_total"
///         },
///         "item_subtotal": {
///             "type": "number",
///             "description": "The order items' total excluding taxes, including promotions.",
///             "title": "item_subtotal"
///         },
///         "item_tax_total": {
///             "type": "number",
///             "description": "The total taxes applied on the order's items, including promotions.",
///             "title": "item_tax_total"
///         },
///         "original_total": {
///             "type": "number",
///             "description": "The order's total including taxes, excluding promotions.",
///             "title": "original_total"
///         },
///         "original_subtotal": {
///             "type": "number",
///             "description": "The order's total excluding taxes, including promotions.",
///             "title": "original_subtotal"
///         },
///         "original_tax_total": {
///             "type": "number",
///             "description": "The total taxes of the order excluding promotions.",
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
///             "description": "The tax totals of the order including promotions.",
///             "title": "tax_total"
///         },
///         "discount_total": {
///             "type": "number",
///             "description": "The order's discount total.",
///             "title": "discount_total"
///         },
///         "discount_tax_total": {
///             "type": "number",
///             "description": "The total taxes applied on the discounted amount.",
///             "title": "discount_tax_total"
///         },
///         "gift_card_total": {
///             "type": "number",
///             "description": "The order's gift card total.",
///             "title": "gift_card_total"
///         },
///         "gift_card_tax_total": {
///             "type": "number",
///             "description": "The total taxes applied on the gift card's amount.",
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
///             "description": "The total taxes of the order's shipping including promotions.",
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
///             "description": "The total taxes of the order's shipping excluding promotions.",
///             "title": "original_shipping_tax_total"
///         },
///         "customer": {
///             "$ref": "#/components/schemas/StoreCustomer"
///         },
///         "transactions": {
///             "type": "array",
///             "items": {
///                 "$ref": "#/components/schemas/BaseOrderTransaction"
///             },
///             "description": "The order's transactions."
///         },
///         "status": {
///             "type": "string",
///             "description": "The order's status.",
///             "title": "status"
///         }
///     },
///     "type": "object",
///     "required": [
///         "items",
///         "shipping_methods",
///         "status",
///         "currency_code",
///         "id",
///         "region_id",
///         "customer_id",
///         "sales_channel_id",
///         "email",
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
part 'store_order.freezed.dart';
part 'store_order.g.dart'; // StoreOrder

@freezed
abstract class StoreOrder with _$StoreOrder {
  const StoreOrder._();

  @jsonSerializable
  const factory StoreOrder({
    /// id
    @JsonKey(name: StoreOrder.idKey) required String id,

    /// regionId
    @JsonKey(name: StoreOrder.regionIdKey) required String regionId,

    /// customerId
    @JsonKey(name: StoreOrder.customerIdKey) required String customerId,

    /// salesChannelId
    @JsonKey(name: StoreOrder.salesChannelIdKey) required String salesChannelId,

    /// email
    @JsonKey(name: StoreOrder.emailKey) required String email,

    /// currencyCode
    @JsonKey(name: StoreOrder.currencyCodeKey) required String currencyCode,

    /// displayId
    @JsonKey(name: StoreOrder.displayIdKey) required double displayId,

    /// shippingAddress
    @JsonKey(name: StoreOrder.shippingAddressKey)
    required StoreOrderAddress shippingAddress,

    /// billingAddress
    @JsonKey(name: StoreOrder.billingAddressKey)
    required StoreOrderAddress billingAddress,

    /// items
    @JsonKey(name: StoreOrder.itemsKey) required List<StoreOrderLineItem> items,

    /// shippingMethods
    @JsonKey(name: StoreOrder.shippingMethodsKey)
    required List<StoreOrderShippingMethod> shippingMethods,

    /// paymentCollections
    @JsonKey(name: StoreOrder.paymentCollectionsKey)
    required List<StorePaymentCollection> paymentCollections,

    /// paymentStatus
    @JsonKey(name: StoreOrder.paymentStatusKey) required NullEnum paymentStatus,

    /// fulfillments
    @JsonKey(name: StoreOrder.fulfillmentsKey)
    required List<StoreOrderFulfillment> fulfillments,

    /// fulfillmentStatus
    @JsonKey(name: StoreOrder.fulfillmentStatusKey)
    required NullEnum fulfillmentStatus,

    /// summary
    @JsonKey(name: StoreOrder.summaryKey) required BaseOrderSummary summary,

    /// metadata
    @JsonKey(name: StoreOrder.metadataKey)
    required Map<String, dynamic> metadata,

    /// createdAt
    @JsonKey(name: StoreOrder.createdAtKey) required DateTime createdAt,

    /// updatedAt
    @JsonKey(name: StoreOrder.updatedAtKey) required DateTime updatedAt,

    /// originalItemTotal
    @JsonKey(name: StoreOrder.originalItemTotalKey)
    required double originalItemTotal,

    /// originalItemSubtotal
    @JsonKey(name: StoreOrder.originalItemSubtotalKey)
    required double originalItemSubtotal,

    /// originalItemTaxTotal
    @JsonKey(name: StoreOrder.originalItemTaxTotalKey)
    required double originalItemTaxTotal,

    /// itemTotal
    @JsonKey(name: StoreOrder.itemTotalKey) required double itemTotal,

    /// itemSubtotal
    @JsonKey(name: StoreOrder.itemSubtotalKey) required double itemSubtotal,

    /// itemTaxTotal
    @JsonKey(name: StoreOrder.itemTaxTotalKey) required double itemTaxTotal,

    /// originalTotal
    @JsonKey(name: StoreOrder.originalTotalKey) required double originalTotal,

    /// originalSubtotal
    @JsonKey(name: StoreOrder.originalSubtotalKey)
    required double originalSubtotal,

    /// originalTaxTotal
    @JsonKey(name: StoreOrder.originalTaxTotalKey)
    required double originalTaxTotal,

    /// total
    @JsonKey(name: StoreOrder.totalKey) required double total,

    /// subtotal
    @JsonKey(name: StoreOrder.subtotalKey) required double subtotal,

    /// taxTotal
    @JsonKey(name: StoreOrder.taxTotalKey) required double taxTotal,

    /// discountTotal
    @JsonKey(name: StoreOrder.discountTotalKey) required double discountTotal,

    /// discountTaxTotal
    @JsonKey(name: StoreOrder.discountTaxTotalKey)
    required double discountTaxTotal,

    /// giftCardTotal
    @JsonKey(name: StoreOrder.giftCardTotalKey) required double giftCardTotal,

    /// giftCardTaxTotal
    @JsonKey(name: StoreOrder.giftCardTaxTotalKey)
    required double giftCardTaxTotal,

    /// shippingTotal
    @JsonKey(name: StoreOrder.shippingTotalKey) required double shippingTotal,

    /// shippingSubtotal
    @JsonKey(name: StoreOrder.shippingSubtotalKey)
    required double shippingSubtotal,

    /// shippingTaxTotal
    @JsonKey(name: StoreOrder.shippingTaxTotalKey)
    required double shippingTaxTotal,

    /// originalShippingTotal
    @JsonKey(name: StoreOrder.originalShippingTotalKey)
    required double originalShippingTotal,

    /// originalShippingSubtotal
    @JsonKey(name: StoreOrder.originalShippingSubtotalKey)
    required double originalShippingSubtotal,

    /// originalShippingTaxTotal
    @JsonKey(name: StoreOrder.originalShippingTaxTotalKey)
    required double originalShippingTaxTotal,

    /// customer
    @JsonKey(name: StoreOrder.customerKey) required StoreCustomer customer,

    /// transactions
    @JsonKey(name: StoreOrder.transactionsKey)
    required List<BaseOrderTransaction> transactions,

    /// status
    @JsonKey(name: StoreOrder.statusKey) required String status,
  }) = _StoreOrder;

  factory StoreOrder.fromJson(Map<String, dynamic> json) =>
      _$StoreOrderFromJson(json);

  static const String idKey = r'id';

  static const String regionIdKey = r'region_id';

  static const String customerIdKey = r'customer_id';

  static const String salesChannelIdKey = r'sales_channel_id';

  static const String emailKey = r'email';

  static const String currencyCodeKey = r'currency_code';

  static const String displayIdKey = r'display_id';

  static const String shippingAddressKey = r'shipping_address';

  static const String billingAddressKey = r'billing_address';

  static const String itemsKey = r'items';

  static const String shippingMethodsKey = r'shipping_methods';

  static const String paymentCollectionsKey = r'payment_collections';

  static const String paymentStatusKey = r'payment_status';

  static const String fulfillmentsKey = r'fulfillments';

  static const String fulfillmentStatusKey = r'fulfillment_status';

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

  static const String customerKey = r'customer';

  static const String transactionsKey = r'transactions';

  static const String statusKey = r'status';
}
