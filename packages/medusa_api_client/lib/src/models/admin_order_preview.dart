/// AdminOrderPreview
/// {
///     "properties": {
///         "return_requested_total": {
///             "type": "number",
///             "description": "The total of the requested return.",
///             "title": "return_requested_total"
///         },
///         "order_change": {
///             "$ref": "#/components/schemas/AdminOrderChange"
///         },
///         "items": {
///             "type": "array",
///             "items": {},
///             "description": "The order's items."
///         },
///         "shipping_methods": {
///             "type": "array",
///             "items": {},
///             "description": "The order's shipping methods."
///         },
///         "currency_code": {
///             "type": "string",
///             "description": "The order's currency code.",
///             "title": "currency_code"
///         },
///         "version": {
///             "type": "number",
///             "description": "The order's version when this preview is applied.",
///             "title": "version"
///         },
///         "id": {
///             "type": "string",
///             "description": "The order's ID.",
///             "title": "id"
///         },
///         "region_id": {
///             "type": "string",
///             "description": "The ID of the order's associated region.",
///             "title": "region_id"
///         },
///         "customer_id": {
///             "type": "string",
///             "description": "The ID of the customer that placed the order.",
///             "title": "customer_id"
///         },
///         "sales_channel_id": {
///             "type": "string",
///             "description": "The ID of the sales channel that the order was placed in.",
///             "title": "sales_channel_id"
///         },
///         "email": {
///             "type": "string",
///             "format": "email",
///             "description": "The email of the customer that placed the order.",
///             "title": "email"
///         },
///         "display_id": {
///             "type": "number",
///             "description": "The order's display ID.",
///             "title": "display_id"
///         },
///         "shipping_address": {
///             "$ref": "#/components/schemas/AdminOrderAddress"
///         },
///         "billing_address": {
///             "$ref": "#/components/schemas/AdminOrderAddress"
///         },
///         "payment_collections": {
///             "type": "array",
///             "items": {
///                 "$ref": "#/components/schemas/AdminPaymentCollection"
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
///                 "$ref": "#/components/schemas/AdminOrderFulfillment"
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
///         "customer": {
///             "$ref": "#/components/schemas/AdminCustomer"
///         },
///         "sales_channel": {
///             "$ref": "#/components/schemas/AdminSalesChannel"
///         },
///         "status": {
///             "type": "string",
///             "description": "The order's status.",
///             "title": "status"
///         },
///         "region": {
///             "$ref": "#/components/schemas/AdminRegion"
///         },
///         "credit_lines": {
///             "type": "array",
///             "items": {
///                 "$ref": "#/components/schemas/OrderCreditLine"
///             },
///             "description": "The order preview's credit lines."
///         }
///     },
///     "type": "object",
///     "required": [
///         "return_requested_total",
///         "order_change",
///         "status",
///         "currency_code",
///         "id",
///         "version",
///         "region_id",
///         "customer_id",
///         "sales_channel_id",
///         "email",
///         "payment_collections",
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
///     "description": "A preview of an order if a change, such as exchange, return, edit, or claim is applied on it."
/// }
library admin_order_preview;

import 'exports.dart';
part 'admin_order_preview.freezed.dart';
part 'admin_order_preview.g.dart'; // AdminOrderPreview

@freezed
abstract class AdminOrderPreview with _$AdminOrderPreview {
  const AdminOrderPreview._();

  @jsonSerializable
  const factory AdminOrderPreview({
    /// returnRequestedTotal
    @JsonKey(name: AdminOrderPreview.returnRequestedTotalKey)
    required double returnRequestedTotal,

    /// orderChange
    @JsonKey(name: AdminOrderPreview.orderChangeKey)
    required AdminOrderChange orderChange,

    /// items
    @JsonKey(name: AdminOrderPreview.itemsKey) required List<dynamic> items,

    /// shippingMethods
    @JsonKey(name: AdminOrderPreview.shippingMethodsKey)
    required List<dynamic> shippingMethods,

    /// currencyCode
    @JsonKey(name: AdminOrderPreview.currencyCodeKey)
    required String currencyCode,

    /// version
    @JsonKey(name: AdminOrderPreview.versionKey) required double version,

    /// id
    @JsonKey(name: AdminOrderPreview.idKey) required String id,

    /// regionId
    @JsonKey(name: AdminOrderPreview.regionIdKey) required String regionId,

    /// customerId
    @JsonKey(name: AdminOrderPreview.customerIdKey) required String customerId,

    /// salesChannelId
    @JsonKey(name: AdminOrderPreview.salesChannelIdKey)
    required String salesChannelId,

    /// email
    @JsonKey(name: AdminOrderPreview.emailKey) required String email,

    /// displayId
    @JsonKey(name: AdminOrderPreview.displayIdKey) required double displayId,

    /// shippingAddress
    @JsonKey(name: AdminOrderPreview.shippingAddressKey)
    required AdminOrderAddress shippingAddress,

    /// billingAddress
    @JsonKey(name: AdminOrderPreview.billingAddressKey)
    required AdminOrderAddress billingAddress,

    /// paymentCollections
    @JsonKey(name: AdminOrderPreview.paymentCollectionsKey)
    required List<AdminPaymentCollection> paymentCollections,

    /// paymentStatus
    @JsonKey(name: AdminOrderPreview.paymentStatusKey)
    required NullEnum paymentStatus,

    /// fulfillments
    @JsonKey(name: AdminOrderPreview.fulfillmentsKey)
    required List<AdminOrderFulfillment> fulfillments,

    /// fulfillmentStatus
    @JsonKey(name: AdminOrderPreview.fulfillmentStatusKey)
    required NullEnum fulfillmentStatus,

    /// transactions
    @JsonKey(name: AdminOrderPreview.transactionsKey)
    required List<BaseOrderTransaction> transactions,

    /// summary
    @JsonKey(name: AdminOrderPreview.summaryKey)
    required BaseOrderSummary summary,

    /// metadata
    @JsonKey(name: AdminOrderPreview.metadataKey)
    required Map<String, dynamic> metadata,

    /// createdAt
    @JsonKey(name: AdminOrderPreview.createdAtKey) required DateTime createdAt,

    /// updatedAt
    @JsonKey(name: AdminOrderPreview.updatedAtKey) required DateTime updatedAt,

    /// originalItemTotal
    @JsonKey(name: AdminOrderPreview.originalItemTotalKey)
    required double originalItemTotal,

    /// originalItemSubtotal
    @JsonKey(name: AdminOrderPreview.originalItemSubtotalKey)
    required double originalItemSubtotal,

    /// originalItemTaxTotal
    @JsonKey(name: AdminOrderPreview.originalItemTaxTotalKey)
    required double originalItemTaxTotal,

    /// itemTotal
    @JsonKey(name: AdminOrderPreview.itemTotalKey) required double itemTotal,

    /// itemSubtotal
    @JsonKey(name: AdminOrderPreview.itemSubtotalKey)
    required double itemSubtotal,

    /// itemTaxTotal
    @JsonKey(name: AdminOrderPreview.itemTaxTotalKey)
    required double itemTaxTotal,

    /// originalTotal
    @JsonKey(name: AdminOrderPreview.originalTotalKey)
    required double originalTotal,

    /// originalSubtotal
    @JsonKey(name: AdminOrderPreview.originalSubtotalKey)
    required double originalSubtotal,

    /// originalTaxTotal
    @JsonKey(name: AdminOrderPreview.originalTaxTotalKey)
    required double originalTaxTotal,

    /// total
    @JsonKey(name: AdminOrderPreview.totalKey) required double total,

    /// subtotal
    @JsonKey(name: AdminOrderPreview.subtotalKey) required double subtotal,

    /// taxTotal
    @JsonKey(name: AdminOrderPreview.taxTotalKey) required double taxTotal,

    /// discountTotal
    @JsonKey(name: AdminOrderPreview.discountTotalKey)
    required double discountTotal,

    /// discountTaxTotal
    @JsonKey(name: AdminOrderPreview.discountTaxTotalKey)
    required double discountTaxTotal,

    /// giftCardTotal
    @JsonKey(name: AdminOrderPreview.giftCardTotalKey)
    required double giftCardTotal,

    /// giftCardTaxTotal
    @JsonKey(name: AdminOrderPreview.giftCardTaxTotalKey)
    required double giftCardTaxTotal,

    /// shippingTotal
    @JsonKey(name: AdminOrderPreview.shippingTotalKey)
    required double shippingTotal,

    /// shippingSubtotal
    @JsonKey(name: AdminOrderPreview.shippingSubtotalKey)
    required double shippingSubtotal,

    /// shippingTaxTotal
    @JsonKey(name: AdminOrderPreview.shippingTaxTotalKey)
    required double shippingTaxTotal,

    /// originalShippingTotal
    @JsonKey(name: AdminOrderPreview.originalShippingTotalKey)
    required double originalShippingTotal,

    /// originalShippingSubtotal
    @JsonKey(name: AdminOrderPreview.originalShippingSubtotalKey)
    required double originalShippingSubtotal,

    /// originalShippingTaxTotal
    @JsonKey(name: AdminOrderPreview.originalShippingTaxTotalKey)
    required double originalShippingTaxTotal,

    /// customer
    @JsonKey(name: AdminOrderPreview.customerKey)
    required AdminCustomer customer,

    /// salesChannel
    @JsonKey(name: AdminOrderPreview.salesChannelKey)
    required AdminSalesChannel salesChannel,

    /// status
    @JsonKey(name: AdminOrderPreview.statusKey) required String status,

    /// region
    @JsonKey(name: AdminOrderPreview.regionKey) required AdminRegion region,

    /// creditLines
    @JsonKey(name: AdminOrderPreview.creditLinesKey)
    required List<OrderCreditLine> creditLines,
  }) = _AdminOrderPreview;

  factory AdminOrderPreview.fromJson(Map<String, dynamic> json) =>
      _$AdminOrderPreviewFromJson(json);

  static const String returnRequestedTotalKey = r'return_requested_total';

  static const String orderChangeKey = r'order_change';

  static const String itemsKey = r'items';

  static const String shippingMethodsKey = r'shipping_methods';

  static const String currencyCodeKey = r'currency_code';

  static const String versionKey = r'version';

  static const String idKey = r'id';

  static const String regionIdKey = r'region_id';

  static const String customerIdKey = r'customer_id';

  static const String salesChannelIdKey = r'sales_channel_id';

  static const String emailKey = r'email';

  static const String displayIdKey = r'display_id';

  static const String shippingAddressKey = r'shipping_address';

  static const String billingAddressKey = r'billing_address';

  static const String paymentCollectionsKey = r'payment_collections';

  static const String paymentStatusKey = r'payment_status';

  static const String fulfillmentsKey = r'fulfillments';

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

  static const String customerKey = r'customer';

  static const String salesChannelKey = r'sales_channel';

  static const String statusKey = r'status';

  static const String regionKey = r'region';

  static const String creditLinesKey = r'credit_lines';
}
