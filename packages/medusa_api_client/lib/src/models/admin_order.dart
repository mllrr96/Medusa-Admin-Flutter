/// AdminOrder
/// {
///     "properties": {
///         "payment_collections": {
///             "type": "array",
///             "items": {
///                 "$ref": "#/components/schemas/AdminPaymentCollection"
///             },
///             "description": "The order's payment collections."
///         },
///         "fulfillments": {
///             "type": "array",
///             "items": {
///                 "$ref": "#/components/schemas/AdminOrderFulfillment"
///             },
///             "description": "The order's fulfillments."
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
///                 "$ref": "#/components/schemas/AdminOrderLineItem"
///             },
///             "description": "The order's items."
///         },
///         "shipping_methods": {
///             "type": "array",
///             "items": {
///                 "$ref": "#/components/schemas/AdminOrderShippingMethod"
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
///         },
///         "region": {
///             "$ref": "#/components/schemas/AdminRegion"
///         },
///         "credit_lines": {
///             "type": "array",
///             "items": {
///                 "$ref": "#/components/schemas/OrderCreditLine"
///             },
///             "description": "The order's credit lines."
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
///     "description": "The order's details."
/// }
library;

import 'exports.dart';
part 'admin_order.freezed.dart';
part 'admin_order.g.dart'; // AdminOrder

@freezed
abstract class AdminOrder with _$AdminOrder {
  const AdminOrder._();

  @jsonSerializable
  const factory AdminOrder({
    /// paymentCollections
    @JsonKey(name: AdminOrder.paymentCollectionsKey)
     List<AdminPaymentCollection>? paymentCollections,

    /// fulfillments
    @JsonKey(name: AdminOrder.fulfillmentsKey)
     List<AdminOrderFulfillment>? fulfillments,

    /// salesChannel
    @JsonKey(name: AdminOrder.salesChannelKey)
     AdminSalesChannel? salesChannel,

    /// customer
    @JsonKey(name: AdminOrder.customerKey)  AdminCustomer? customer,

    /// shippingAddress
    @JsonKey(name: AdminOrder.shippingAddressKey)
     AdminOrderAddress? shippingAddress,

    /// billingAddress
    @JsonKey(name: AdminOrder.billingAddressKey)
     AdminOrderAddress? billingAddress,

    /// id
    @JsonKey(name: AdminOrder.idKey) String? id,

    /// version
    @JsonKey(name: AdminOrder.versionKey) double? version,

    /// regionId
    @JsonKey(name: AdminOrder.regionIdKey)  String? regionId,

    /// customerId
    @JsonKey(name: AdminOrder.customerIdKey)  String? customerId,

    /// salesChannelId
    @JsonKey(name: AdminOrder.salesChannelIdKey)  String? salesChannelId,

    /// email
    @JsonKey(name: AdminOrder.emailKey) String? email,

    /// currencyCode
    @JsonKey(name: AdminOrder.currencyCodeKey)  String? currencyCode,

    /// displayId
    @JsonKey(name: AdminOrder.displayIdKey) double? displayId,

    /// items
    @JsonKey(name: AdminOrder.itemsKey) List<AdminOrderLineItem>? items,

    /// shippingMethods
    @JsonKey(name: AdminOrder.shippingMethodsKey)
     List<AdminOrderShippingMethod>? shippingMethods,

    /// paymentStatus
    @JsonKey(name: AdminOrder.paymentStatusKey)  NullEnum? paymentStatus,

    /// fulfillmentStatus
    @JsonKey(name: AdminOrder.fulfillmentStatusKey)
    NullEnum? fulfillmentStatus,

    /// transactions
    @JsonKey(name: AdminOrder.transactionsKey)
     List<BaseOrderTransaction>? transactions,

    /// summary
    @JsonKey(name: AdminOrder.summaryKey)  BaseOrderSummary? summary,

    /// metadata
    @JsonKey(name: AdminOrder.metadataKey)
     Map<String, dynamic>? metadata,

    /// createdAt
    @JsonKey(name: AdminOrder.createdAtKey)  DateTime? createdAt,

    /// updatedAt
    @JsonKey(name: AdminOrder.updatedAtKey)  DateTime? updatedAt,

    /// originalItemTotal
    @JsonKey(name: AdminOrder.originalItemTotalKey)
     double? originalItemTotal,

    /// originalItemSubtotal
    @JsonKey(name: AdminOrder.originalItemSubtotalKey)
     double? originalItemSubtotal,

    /// originalItemTaxTotal
    @JsonKey(name: AdminOrder.originalItemTaxTotalKey)
     double? originalItemTaxTotal,

    /// itemTotal
    @JsonKey(name: AdminOrder.itemTotalKey)  double? itemTotal,

    /// itemSubtotal
    @JsonKey(name: AdminOrder.itemSubtotalKey)  double? itemSubtotal,

    /// itemTaxTotal
    @JsonKey(name: AdminOrder.itemTaxTotalKey)  double? itemTaxTotal,

    /// originalTotal
    @JsonKey(name: AdminOrder.originalTotalKey)  double? originalTotal,

    /// originalSubtotal
    @JsonKey(name: AdminOrder.originalSubtotalKey)
     double? originalSubtotal,

    /// originalTaxTotal
    @JsonKey(name: AdminOrder.originalTaxTotalKey)
     double? originalTaxTotal,

    /// total
    @JsonKey(name: AdminOrder.totalKey) double? total,

    /// subtotal
    @JsonKey(name: AdminOrder.subtotalKey) double? subtotal,

    /// taxTotal
    @JsonKey(name: AdminOrder.taxTotalKey) double? taxTotal,

    /// discountTotal
    @JsonKey(name: AdminOrder.discountTotalKey) double? discountTotal,

    /// discountTaxTotal
    @JsonKey(name: AdminOrder.discountTaxTotalKey)
    double? discountTaxTotal,

    /// giftCardTotal
    @JsonKey(name: AdminOrder.giftCardTotalKey) double? giftCardTotal,

    /// giftCardTaxTotal
    @JsonKey(name: AdminOrder.giftCardTaxTotalKey)
    double? giftCardTaxTotal,

    /// shippingTotal
    @JsonKey(name: AdminOrder.shippingTotalKey) double? shippingTotal,

    /// shippingSubtotal
    @JsonKey(name: AdminOrder.shippingSubtotalKey)
    double? shippingSubtotal,

    /// shippingTaxTotal
    @JsonKey(name: AdminOrder.shippingTaxTotalKey)
    double? shippingTaxTotal,

    /// originalShippingTotal
    @JsonKey(name: AdminOrder.originalShippingTotalKey)
    double? originalShippingTotal,

    /// originalShippingSubtotal
    @JsonKey(name: AdminOrder.originalShippingSubtotalKey)
    double? originalShippingSubtotal,

    /// originalShippingTaxTotal
    @JsonKey(name: AdminOrder.originalShippingTaxTotalKey)
    double? originalShippingTaxTotal,

    /// status
    @JsonKey(name: AdminOrder.statusKey) String? status,

    /// region
    @JsonKey(name: AdminOrder.regionKey) AdminRegion? region,

    /// creditLines
    @JsonKey(name: AdminOrder.creditLinesKey)
    List<OrderCreditLine>? creditLines,
  }) = _AdminOrder;

  factory AdminOrder.fromJson(Map<String, dynamic> json) =>
      _$AdminOrderFromJson(json);

  static const String paymentCollectionsKey = r'payment_collections';

  static const String fulfillmentsKey = r'fulfillments';

  static const String salesChannelKey = r'sales_channel';

  static const String customerKey = r'customer';

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

  static const String regionKey = r'region';

  static const String creditLinesKey = r'credit_lines';
}
