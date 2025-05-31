/// Order
/// {
///     "properties": {
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
///         "order_change": {
///             "type": "object"
///         },
///         "status": {
///             "enum": [
///                 "canceled",
///                 "requires_action",
///                 "pending",
///                 "completed",
///                 "draft",
///                 "archived"
///             ],
///             "type": "string",
///             "description": "The order's status."
///         },
///         "region_id": {
///             "type": "string",
///             "description": "The ID of the region the order belongs to.",
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
///         "shipping_address": {
///             "$ref": "#/components/schemas/OrderAddress"
///         },
///         "billing_address": {
///             "$ref": "#/components/schemas/OrderAddress"
///         },
///         "items": {
///             "type": "array",
///             "items": {
///                 "$ref": "#/components/schemas/OrderLineItem"
///             },
///             "description": "The order's items."
///         },
///         "shipping_methods": {
///             "type": "array",
///             "items": {
///                 "$ref": "#/components/schemas/OrderShippingMethod"
///             },
///             "description": "The order's shipping methods."
///         },
///         "transactions": {
///             "type": "array",
///             "items": {
///                 "$ref": "#/components/schemas/OrderTransaction"
///             },
///             "description": "The order's transactions."
///         },
///         "summary": {
///             "type": "object",
///             "description": "The order's summary."
///         },
///         "metadata": {
///             "type": "object",
///             "description": "The order's metadata, can hold custom key-value pairs."
///         },
///         "canceled_at": {
///             "type": "string",
///             "format": "date-time",
///             "description": "The date the order was canceled.",
///             "title": "canceled_at"
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
///             "description": "The taxes total for order items, excluding promotions.",
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
///             "description": "The tax total of the order items including promotions.",
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
///             "description": "The tax total of the order excluding promotions.",
///             "title": "original_tax_total"
///         },
///         "total": {
///             "type": "number",
///             "description": "The order's total including taxes and promotions.",
///             "title": "total"
///         },
///         "subtotal": {
///             "type": "number",
///             "description": "The order's subtotal excluding taxes, including promotions.",
///             "title": "subtotal"
///         },
///         "tax_total": {
///             "type": "number",
///             "description": "The tax total of the order including promotions.",
///             "title": "tax_total"
///         },
///         "discount_subtotal": {
///             "type": "number",
///             "description": "The total discount excluding taxes.",
///             "title": "discount_subtotal"
///         },
///         "discount_total": {
///             "type": "number",
///             "description": "The total discount including taxes.",
///             "title": "discount_total"
///         },
///         "discount_tax_total": {
///             "type": "number",
///             "description": "The tax total applied on the discount.",
///             "title": "discount_tax_total"
///         },
///         "gift_card_total": {
///             "type": "number",
///             "description": "The order's gift card total.",
///             "title": "gift_card_total"
///         },
///         "gift_card_tax_total": {
///             "type": "number",
///             "description": "The order's gift card tax total.",
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
///             "description": "The total taxes of the order's shipping including taxes.",
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
///         "display_id": {
///             "type": "number",
///             "description": "The order's display ID.",
///             "title": "display_id"
///         },
///         "credit_lines": {
///             "type": "array",
///             "items": {
///                 "$ref": "#/components/schemas/OrderCreditLine"
///             },
///             "description": "The order's credit lines, useful to add additional payment amounts for an order."
///         },
///         "is_draft_order": {
///             "type": "boolean",
///             "description": "Whether the order is a draft order.",
///             "title": "is_draft_order"
///         }
///     },
///     "type": "object",
///     "required": [
///         "id",
///         "version",
///         "display_id",
///         "status",
///         "currency_code",
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
///         "discount_subtotal",
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
///     "description": "The order change's order."
/// }
library order;

import 'exports.dart';
part 'order.freezed.dart';
part 'order.g.dart'; // Order

@freezed
abstract class Order with _$Order {
  const Order._();

  @jsonSerializable
  const factory Order({
    /// id
    @JsonKey(name: Order.idKey) required String id,

    /// version
    @JsonKey(name: Order.versionKey) required double version,

    /// orderChange
    @JsonKey(name: Order.orderChangeKey)
    required Map<String, dynamic> orderChange,

    /// status
    @JsonKey(name: Order.statusKey) required NullEnum status,

    /// regionId
    @JsonKey(name: Order.regionIdKey) required String regionId,

    /// customerId
    @JsonKey(name: Order.customerIdKey) required String customerId,

    /// salesChannelId
    @JsonKey(name: Order.salesChannelIdKey) required String salesChannelId,

    /// email
    @JsonKey(name: Order.emailKey) required String email,

    /// currencyCode
    @JsonKey(name: Order.currencyCodeKey) required String currencyCode,

    /// shippingAddress
    @JsonKey(name: Order.shippingAddressKey)
    required OrderAddress shippingAddress,

    /// billingAddress
    @JsonKey(name: Order.billingAddressKey)
    required OrderAddress billingAddress,

    /// items
    @JsonKey(name: Order.itemsKey) required List<OrderLineItem> items,

    /// shippingMethods
    @JsonKey(name: Order.shippingMethodsKey)
    required List<OrderShippingMethod> shippingMethods,

    /// transactions
    @JsonKey(name: Order.transactionsKey)
    required List<OrderTransaction> transactions,

    /// summary
    @JsonKey(name: Order.summaryKey) required Map<String, dynamic> summary,

    /// metadata
    @JsonKey(name: Order.metadataKey) required Map<String, dynamic> metadata,

    /// canceledAt
    @JsonKey(name: Order.canceledAtKey) required DateTime canceledAt,

    /// createdAt
    @JsonKey(name: Order.createdAtKey) required DateTime createdAt,

    /// updatedAt
    @JsonKey(name: Order.updatedAtKey) required DateTime updatedAt,

    /// originalItemTotal
    @JsonKey(name: Order.originalItemTotalKey)
    required double originalItemTotal,

    /// originalItemSubtotal
    @JsonKey(name: Order.originalItemSubtotalKey)
    required double originalItemSubtotal,

    /// originalItemTaxTotal
    @JsonKey(name: Order.originalItemTaxTotalKey)
    required double originalItemTaxTotal,

    /// itemTotal
    @JsonKey(name: Order.itemTotalKey) required double itemTotal,

    /// itemSubtotal
    @JsonKey(name: Order.itemSubtotalKey) required double itemSubtotal,

    /// itemTaxTotal
    @JsonKey(name: Order.itemTaxTotalKey) required double itemTaxTotal,

    /// originalTotal
    @JsonKey(name: Order.originalTotalKey) required double originalTotal,

    /// originalSubtotal
    @JsonKey(name: Order.originalSubtotalKey) required double originalSubtotal,

    /// originalTaxTotal
    @JsonKey(name: Order.originalTaxTotalKey) required double originalTaxTotal,

    /// total
    @JsonKey(name: Order.totalKey) required double total,

    /// subtotal
    @JsonKey(name: Order.subtotalKey) required double subtotal,

    /// taxTotal
    @JsonKey(name: Order.taxTotalKey) required double taxTotal,

    /// discountSubtotal
    @JsonKey(name: Order.discountSubtotalKey) required double discountSubtotal,

    /// discountTotal
    @JsonKey(name: Order.discountTotalKey) required double discountTotal,

    /// discountTaxTotal
    @JsonKey(name: Order.discountTaxTotalKey) required double discountTaxTotal,

    /// giftCardTotal
    @JsonKey(name: Order.giftCardTotalKey) required double giftCardTotal,

    /// giftCardTaxTotal
    @JsonKey(name: Order.giftCardTaxTotalKey) required double giftCardTaxTotal,

    /// shippingTotal
    @JsonKey(name: Order.shippingTotalKey) required double shippingTotal,

    /// shippingSubtotal
    @JsonKey(name: Order.shippingSubtotalKey) required double shippingSubtotal,

    /// shippingTaxTotal
    @JsonKey(name: Order.shippingTaxTotalKey) required double shippingTaxTotal,

    /// originalShippingTotal
    @JsonKey(name: Order.originalShippingTotalKey)
    required double originalShippingTotal,

    /// originalShippingSubtotal
    @JsonKey(name: Order.originalShippingSubtotalKey)
    required double originalShippingSubtotal,

    /// originalShippingTaxTotal
    @JsonKey(name: Order.originalShippingTaxTotalKey)
    required double originalShippingTaxTotal,

    /// displayId
    @JsonKey(name: Order.displayIdKey) required double displayId,

    /// creditLines
    @JsonKey(name: Order.creditLinesKey)
    required List<OrderCreditLine> creditLines,

    /// isDraftOrder
    @JsonKey(name: Order.isDraftOrderKey) required bool isDraftOrder,
  }) = _Order;

  factory Order.fromJson(Map<String, dynamic> json) => _$OrderFromJson(json);

  static const String idKey = r'id';

  static const String versionKey = r'version';

  static const String orderChangeKey = r'order_change';

  static const String statusKey = r'status';

  static const String regionIdKey = r'region_id';

  static const String customerIdKey = r'customer_id';

  static const String salesChannelIdKey = r'sales_channel_id';

  static const String emailKey = r'email';

  static const String currencyCodeKey = r'currency_code';

  static const String shippingAddressKey = r'shipping_address';

  static const String billingAddressKey = r'billing_address';

  static const String itemsKey = r'items';

  static const String shippingMethodsKey = r'shipping_methods';

  static const String transactionsKey = r'transactions';

  static const String summaryKey = r'summary';

  static const String metadataKey = r'metadata';

  static const String canceledAtKey = r'canceled_at';

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

  static const String discountSubtotalKey = r'discount_subtotal';

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

  static const String displayIdKey = r'display_id';

  static const String creditLinesKey = r'credit_lines';

  static const String isDraftOrderKey = r'is_draft_order';
}
