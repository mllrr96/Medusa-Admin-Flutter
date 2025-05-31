/// AdminDraftOrder
/// {
///     "properties": {
///         "payment_collections": {
///             "type": "array",
///             "items": {
///                 "$ref": "#/components/schemas/AdminPaymentCollection"
///             },
///             "description": "The draft order's payment collections."
///         },
///         "fulfillments": {
///             "type": "array",
///             "items": {
///                 "$ref": "#/components/schemas/AdminOrderFulfillment"
///             },
///             "description": "The draft order's fulfillments."
///         },
///         "sales_channel": {
///             "$ref": "#/components/schemas/AdminSalesChannel"
///         },
///         "customer": {
///             "$ref": "#/components/schemas/AdminCustomer"
///         },
///         "shipping_address": {
///             "$ref": "#/components/schemas/AdminOrderAddress"
///         },
///         "billing_address": {
///             "$ref": "#/components/schemas/AdminOrderAddress"
///         },
///         "items": {
///             "type": "array",
///             "items": {
///                 "$ref": "#/components/schemas/AdminOrderLineItem"
///             },
///             "description": "The draft order's items."
///         },
///         "shipping_methods": {
///             "type": "array",
///             "items": {
///                 "$ref": "#/components/schemas/AdminOrderShippingMethod"
///             },
///             "description": "The draft order's shipping methods."
///         },
///         "status": {
///             "type": "string",
///             "description": "The draft order's status.",
///             "title": "status"
///         },
///         "currency_code": {
///             "type": "string",
///             "description": "The draft order's currency code.",
///             "title": "currency_code"
///         },
///         "id": {
///             "type": "string",
///             "description": "The draft order's ID.",
///             "title": "id"
///         },
///         "version": {
///             "type": "number",
///             "description": "The draft order's version.",
///             "title": "version"
///         },
///         "region_id": {
///             "type": "string",
///             "description": "The ID of the region associated with the draft order.",
///             "title": "region_id"
///         },
///         "customer_id": {
///             "type": "string",
///             "description": "The ID of the customer that the draft order belongs to.",
///             "title": "customer_id"
///         },
///         "sales_channel_id": {
///             "type": "string",
///             "description": "The ID of the sales channel that the draft order is placed in.",
///             "title": "sales_channel_id"
///         },
///         "email": {
///             "type": "string",
///             "format": "email",
///             "description": "The customer email associated with the draft order.",
///             "title": "email"
///         },
///         "display_id": {
///             "type": "number",
///             "description": "The draft order's display ID.",
///             "title": "display_id"
///         },
///         "payment_status": {
///             "enum": [
///                 "not_paid",
///                 "awaiting",
///                 "authorized",
///                 "partially_authorized",
///                 "canceled",
///                 "captured",
///                 "partially_captured",
///                 "partially_refunded",
///                 "refunded",
///                 "requires_action"
///             ],
///             "type": "string",
///             "description": "The draft order's payment status."
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
///             "description": "The draft order's fulfillment status."
///         },
///         "transactions": {
///             "type": "array",
///             "items": {
///                 "$ref": "#/components/schemas/BaseOrderTransaction"
///             },
///             "description": "The draft order's transactions."
///         },
///         "summary": {
///             "$ref": "#/components/schemas/BaseOrderSummary"
///         },
///         "metadata": {
///             "type": "object",
///             "description": "The draft order's metadata, can hold custom key-value pairs."
///         },
///         "created_at": {
///             "type": "string",
///             "format": "date-time",
///             "description": "The date the draft order was created.",
///             "title": "created_at"
///         },
///         "updated_at": {
///             "type": "string",
///             "format": "date-time",
///             "description": "The date the draft order was updated.",
///             "title": "updated_at"
///         },
///         "original_item_total": {
///             "type": "number",
///             "description": "The total of the draft order's items including taxes, excluding promotions.",
///             "title": "original_item_total"
///         },
///         "original_item_subtotal": {
///             "type": "number",
///             "description": "The total of the draft order's items excluding taxes, including promotions.",
///             "title": "original_item_subtotal"
///         },
///         "original_item_tax_total": {
///             "type": "number",
///             "description": "The tax total of the draft order's items excluding promotions.",
///             "title": "original_item_tax_total"
///         },
///         "item_total": {
///             "type": "number",
///             "description": "The total of the draft order's items including taxes and promotions.",
///             "title": "item_total"
///         },
///         "item_subtotal": {
///             "type": "number",
///             "description": "The total of the draft order's items excluding taxes, including promotions.",
///             "title": "item_subtotal"
///         },
///         "item_tax_total": {
///             "type": "number",
///             "description": "The tax total of the draft order's items including promotions.",
///             "title": "item_tax_total"
///         },
///         "original_total": {
///             "type": "number",
///             "description": "The draft order's total excluding promotions, including taxes.",
///             "title": "original_total"
///         },
///         "original_subtotal": {
///             "type": "number",
///             "description": "The draft order's total excluding taxes, including promotions.",
///             "title": "original_subtotal"
///         },
///         "original_tax_total": {
///             "type": "number",
///             "description": "The draft order's tax total, excluding promotions.",
///             "title": "original_tax_total"
///         },
///         "total": {
///             "type": "number",
///             "description": "The draft order's total including taxes and promotions.",
///             "title": "total"
///         },
///         "subtotal": {
///             "type": "number",
///             "description": "The draft order's total excluding taxes, including promotions.",
///             "title": "subtotal"
///         },
///         "tax_total": {
///             "type": "number",
///             "description": "The draft order's tax total including promotions.",
///             "title": "tax_total"
///         },
///         "discount_total": {
///             "type": "number",
///             "description": "The draft order's discount or promotions total.",
///             "title": "discount_total"
///         },
///         "discount_tax_total": {
///             "type": "number",
///             "description": "The tax total of draft order's discount or promotion.",
///             "title": "discount_tax_total"
///         },
///         "gift_card_total": {
///             "type": "number",
///             "description": "The draft order's gift card total.",
///             "title": "gift_card_total"
///         },
///         "gift_card_tax_total": {
///             "type": "number",
///             "description": "The tax total of the draft order's gift card.",
///             "title": "gift_card_tax_total"
///         },
///         "shipping_total": {
///             "type": "number",
///             "description": "The draft order's shipping total including taxes and promotions.",
///             "title": "shipping_total"
///         },
///         "shipping_subtotal": {
///             "type": "number",
///             "description": "The draft order's shipping total excluding taxes, including promotions.",
///             "title": "shipping_subtotal"
///         },
///         "shipping_tax_total": {
///             "type": "number",
///             "description": "The tax total of the draft order's shipping.",
///             "title": "shipping_tax_total"
///         },
///         "original_shipping_total": {
///             "type": "number",
///             "description": "The draft order's shipping total including taxes, excluding promotions.",
///             "title": "original_shipping_total"
///         },
///         "original_shipping_subtotal": {
///             "type": "number",
///             "description": "The draft order's shipping total excluding taxes, including promotions.",
///             "title": "original_shipping_subtotal"
///         },
///         "original_shipping_tax_total": {
///             "type": "number",
///             "description": "The tax total of the draft order's shipping excluding promotions.",
///             "title": "original_shipping_tax_total"
///         },
///         "region": {
///             "$ref": "#/components/schemas/AdminRegion"
///         },
///         "credit_lines": {
///             "type": "array",
///             "items": {
///                 "$ref": "#/components/schemas/OrderCreditLine"
///             },
///             "description": "The draft order's credit lines."
///         }
///     },
///     "type": "object",
///     "required": [
///         "payment_collections",
///         "items",
///         "shipping_methods",
///         "status",
///         "currency_code",
///         "id",
///         "version",
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
///     "description": "The draft order's details."
/// }
library admin_draft_order;

import 'exports.dart';
part 'admin_draft_order.freezed.dart';
part 'admin_draft_order.g.dart'; // AdminDraftOrder

@freezed
abstract class AdminDraftOrder with _$AdminDraftOrder {
  const AdminDraftOrder._();

  @jsonSerializable
  const factory AdminDraftOrder({
    /// paymentCollections
    @JsonKey(name: AdminDraftOrder.paymentCollectionsKey)
    required List<AdminPaymentCollection> paymentCollections,

    /// fulfillments
    @JsonKey(name: AdminDraftOrder.fulfillmentsKey)
    required List<AdminOrderFulfillment> fulfillments,

    /// salesChannel
    @JsonKey(name: AdminDraftOrder.salesChannelKey)
    required AdminSalesChannel salesChannel,

    /// customer
    @JsonKey(name: AdminDraftOrder.customerKey) required AdminCustomer customer,

    /// shippingAddress
    @JsonKey(name: AdminDraftOrder.shippingAddressKey)
    required AdminOrderAddress shippingAddress,

    /// billingAddress
    @JsonKey(name: AdminDraftOrder.billingAddressKey)
    required AdminOrderAddress billingAddress,

    /// items
    @JsonKey(name: AdminDraftOrder.itemsKey)
    required List<AdminOrderLineItem> items,

    /// shippingMethods
    @JsonKey(name: AdminDraftOrder.shippingMethodsKey)
    required List<AdminOrderShippingMethod> shippingMethods,

    /// status
    @JsonKey(name: AdminDraftOrder.statusKey) required String status,

    /// currencyCode
    @JsonKey(name: AdminDraftOrder.currencyCodeKey)
    required String currencyCode,

    /// id
    @JsonKey(name: AdminDraftOrder.idKey) required String id,

    /// version
    @JsonKey(name: AdminDraftOrder.versionKey) required double version,

    /// regionId
    @JsonKey(name: AdminDraftOrder.regionIdKey) required String regionId,

    /// customerId
    @JsonKey(name: AdminDraftOrder.customerIdKey) required String customerId,

    /// salesChannelId
    @JsonKey(name: AdminDraftOrder.salesChannelIdKey)
    required String salesChannelId,

    /// email
    @JsonKey(name: AdminDraftOrder.emailKey) required String email,

    /// displayId
    @JsonKey(name: AdminDraftOrder.displayIdKey) required double displayId,

    /// paymentStatus
    @JsonKey(name: AdminDraftOrder.paymentStatusKey)
    required NullEnum paymentStatus,

    /// fulfillmentStatus
    @JsonKey(name: AdminDraftOrder.fulfillmentStatusKey)
    required NullEnum fulfillmentStatus,

    /// transactions
    @JsonKey(name: AdminDraftOrder.transactionsKey)
    required List<BaseOrderTransaction> transactions,

    /// summary
    @JsonKey(name: AdminDraftOrder.summaryKey)
    required BaseOrderSummary summary,

    /// metadata
    @JsonKey(name: AdminDraftOrder.metadataKey)
    required Map<String, dynamic> metadata,

    /// createdAt
    @JsonKey(name: AdminDraftOrder.createdAtKey) required DateTime createdAt,

    /// updatedAt
    @JsonKey(name: AdminDraftOrder.updatedAtKey) required DateTime updatedAt,

    /// originalItemTotal
    @JsonKey(name: AdminDraftOrder.originalItemTotalKey)
    required double originalItemTotal,

    /// originalItemSubtotal
    @JsonKey(name: AdminDraftOrder.originalItemSubtotalKey)
    required double originalItemSubtotal,

    /// originalItemTaxTotal
    @JsonKey(name: AdminDraftOrder.originalItemTaxTotalKey)
    required double originalItemTaxTotal,

    /// itemTotal
    @JsonKey(name: AdminDraftOrder.itemTotalKey) required double itemTotal,

    /// itemSubtotal
    @JsonKey(name: AdminDraftOrder.itemSubtotalKey)
    required double itemSubtotal,

    /// itemTaxTotal
    @JsonKey(name: AdminDraftOrder.itemTaxTotalKey)
    required double itemTaxTotal,

    /// originalTotal
    @JsonKey(name: AdminDraftOrder.originalTotalKey)
    required double originalTotal,

    /// originalSubtotal
    @JsonKey(name: AdminDraftOrder.originalSubtotalKey)
    required double originalSubtotal,

    /// originalTaxTotal
    @JsonKey(name: AdminDraftOrder.originalTaxTotalKey)
    required double originalTaxTotal,

    /// total
    @JsonKey(name: AdminDraftOrder.totalKey) required double total,

    /// subtotal
    @JsonKey(name: AdminDraftOrder.subtotalKey) required double subtotal,

    /// taxTotal
    @JsonKey(name: AdminDraftOrder.taxTotalKey) required double taxTotal,

    /// discountTotal
    @JsonKey(name: AdminDraftOrder.discountTotalKey)
    required double discountTotal,

    /// discountTaxTotal
    @JsonKey(name: AdminDraftOrder.discountTaxTotalKey)
    required double discountTaxTotal,

    /// giftCardTotal
    @JsonKey(name: AdminDraftOrder.giftCardTotalKey)
    required double giftCardTotal,

    /// giftCardTaxTotal
    @JsonKey(name: AdminDraftOrder.giftCardTaxTotalKey)
    required double giftCardTaxTotal,

    /// shippingTotal
    @JsonKey(name: AdminDraftOrder.shippingTotalKey)
    required double shippingTotal,

    /// shippingSubtotal
    @JsonKey(name: AdminDraftOrder.shippingSubtotalKey)
    required double shippingSubtotal,

    /// shippingTaxTotal
    @JsonKey(name: AdminDraftOrder.shippingTaxTotalKey)
    required double shippingTaxTotal,

    /// originalShippingTotal
    @JsonKey(name: AdminDraftOrder.originalShippingTotalKey)
    required double originalShippingTotal,

    /// originalShippingSubtotal
    @JsonKey(name: AdminDraftOrder.originalShippingSubtotalKey)
    required double originalShippingSubtotal,

    /// originalShippingTaxTotal
    @JsonKey(name: AdminDraftOrder.originalShippingTaxTotalKey)
    required double originalShippingTaxTotal,

    /// region
    @JsonKey(name: AdminDraftOrder.regionKey) required AdminRegion region,

    /// creditLines
    @JsonKey(name: AdminDraftOrder.creditLinesKey)
    required List<OrderCreditLine> creditLines,
  }) = _AdminDraftOrder;

  factory AdminDraftOrder.fromJson(Map<String, dynamic> json) =>
      _$AdminDraftOrderFromJson(json);

  static const String paymentCollectionsKey = r'payment_collections';

  static const String fulfillmentsKey = r'fulfillments';

  static const String salesChannelKey = r'sales_channel';

  static const String customerKey = r'customer';

  static const String shippingAddressKey = r'shipping_address';

  static const String billingAddressKey = r'billing_address';

  static const String itemsKey = r'items';

  static const String shippingMethodsKey = r'shipping_methods';

  static const String statusKey = r'status';

  static const String currencyCodeKey = r'currency_code';

  static const String idKey = r'id';

  static const String versionKey = r'version';

  static const String regionIdKey = r'region_id';

  static const String customerIdKey = r'customer_id';

  static const String salesChannelIdKey = r'sales_channel_id';

  static const String emailKey = r'email';

  static const String displayIdKey = r'display_id';

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

  static const String regionKey = r'region';

  static const String creditLinesKey = r'credit_lines';
}
