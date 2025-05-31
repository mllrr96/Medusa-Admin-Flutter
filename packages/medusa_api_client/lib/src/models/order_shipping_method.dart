/// OrderShippingMethod
/// {
///     "properties": {
///         "id": {
///             "type": "string",
///             "description": "The shipping method's ID.",
///             "title": "id"
///         },
///         "order_id": {
///             "type": "string",
///             "description": "The ID of the order that the shipping method belongs to.",
///             "title": "order_id"
///         },
///         "name": {
///             "type": "string",
///             "description": "The shipping method's name.",
///             "title": "name"
///         },
///         "description": {
///             "type": "string",
///             "description": "The shipping method's description.",
///             "title": "description"
///         },
///         "amount": {
///             "type": "number",
///             "description": "The shipping method's amount.",
///             "title": "amount"
///         },
///         "is_tax_inclusive": {
///             "type": "boolean",
///             "description": "Whether the shipping method's amount includes taxes.",
///             "title": "is_tax_inclusive"
///         },
///         "shipping_option_id": {
///             "type": "string",
///             "description": "The ID of the shipping option this method was created from.",
///             "title": "shipping_option_id"
///         },
///         "data": {
///             "type": "object",
///             "description": "The shipping method's data, useful for the fulfillment provider handling the fulfillment."
///         },
///         "metadata": {
///             "type": "object",
///             "description": "The shipping method's metadata, can hold custom key-value pairs."
///         },
///         "tax_lines": {
///             "type": "array",
///             "items": {
///                 "$ref": "#/components/schemas/OrderShippingMethodTaxLine"
///             },
///             "description": "The shipping method's tax lines."
///         },
///         "adjustments": {
///             "type": "array",
///             "items": {
///                 "$ref": "#/components/schemas/OrderShippingMethodAdjustment"
///             },
///             "description": "The shipping method's adjustments."
///         },
///         "created_at": {
///             "type": "string",
///             "format": "date-time",
///             "description": "The date the shipping method was created.",
///             "title": "created_at"
///         },
///         "updated_at": {
///             "type": "string",
///             "format": "date-time",
///             "description": "The date the shipping method was updated.",
///             "title": "updated_at"
///         },
///         "original_total": {
///             "type": "number",
///             "description": "The shipping method's total including taxes, excluding promotions.",
///             "title": "original_total"
///         },
///         "original_subtotal": {
///             "type": "number",
///             "description": "The shipping method's subtotal excluding taxes, including promotions.",
///             "title": "original_subtotal"
///         },
///         "original_tax_total": {
///             "type": "number",
///             "description": "The total taxes of the shipping method excluding promotions.",
///             "title": "original_tax_total"
///         },
///         "total": {
///             "type": "number",
///             "description": "The shipping method's total including taxes and promotions.",
///             "title": "total"
///         },
///         "subtotal": {
///             "type": "number",
///             "description": "The shipping method's total excluding taxes, including promotions.",
///             "title": "subtotal"
///         },
///         "tax_total": {
///             "type": "number",
///             "description": "The total taxes of the shipping method, including promotions.",
///             "title": "tax_total"
///         },
///         "discount_total": {
///             "type": "number",
///             "description": "The shipping method's discount total.",
///             "title": "discount_total"
///         },
///         "discount_tax_total": {
///             "type": "number",
///             "description": "The total taxes of the discount amount.",
///             "title": "discount_tax_total"
///         }
///     },
///     "type": "object",
///     "required": [
///         "id",
///         "order_id",
///         "name",
///         "amount",
///         "is_tax_inclusive",
///         "created_at",
///         "updated_at",
///         "original_total",
///         "original_subtotal",
///         "original_tax_total",
///         "total",
///         "subtotal",
///         "tax_total",
///         "discount_total",
///         "discount_tax_total"
///     ],
///     "description": "The shipping method's details."
/// }
library order_shipping_method;

import 'exports.dart';
part 'order_shipping_method.freezed.dart';
part 'order_shipping_method.g.dart'; // OrderShippingMethod

@freezed
abstract class OrderShippingMethod with _$OrderShippingMethod {
  const OrderShippingMethod._();

  @jsonSerializable
  const factory OrderShippingMethod({
    /// id
    @JsonKey(name: OrderShippingMethod.idKey) required String id,

    /// orderId
    @JsonKey(name: OrderShippingMethod.orderIdKey) required String orderId,

    /// name
    @JsonKey(name: OrderShippingMethod.nameKey) required String name,

    /// description
    @JsonKey(name: OrderShippingMethod.descriptionKey)
    required String description,

    /// amount
    @JsonKey(name: OrderShippingMethod.amountKey) required double amount,

    /// isTaxInclusive
    @JsonKey(name: OrderShippingMethod.isTaxInclusiveKey)
    required bool isTaxInclusive,

    /// shippingOptionId
    @JsonKey(name: OrderShippingMethod.shippingOptionIdKey)
    required String shippingOptionId,

    /// data
    @JsonKey(name: OrderShippingMethod.dataKey)
    required Map<String, dynamic> data,

    /// metadata
    @JsonKey(name: OrderShippingMethod.metadataKey)
    required Map<String, dynamic> metadata,

    /// taxLines
    @JsonKey(name: OrderShippingMethod.taxLinesKey)
    required List<OrderShippingMethodTaxLine> taxLines,

    /// adjustments
    @JsonKey(name: OrderShippingMethod.adjustmentsKey)
    required List<OrderShippingMethodAdjustment> adjustments,

    /// createdAt
    @JsonKey(name: OrderShippingMethod.createdAtKey)
    required DateTime createdAt,

    /// updatedAt
    @JsonKey(name: OrderShippingMethod.updatedAtKey)
    required DateTime updatedAt,

    /// originalTotal
    @JsonKey(name: OrderShippingMethod.originalTotalKey)
    required double originalTotal,

    /// originalSubtotal
    @JsonKey(name: OrderShippingMethod.originalSubtotalKey)
    required double originalSubtotal,

    /// originalTaxTotal
    @JsonKey(name: OrderShippingMethod.originalTaxTotalKey)
    required double originalTaxTotal,

    /// total
    @JsonKey(name: OrderShippingMethod.totalKey) required double total,

    /// subtotal
    @JsonKey(name: OrderShippingMethod.subtotalKey) required double subtotal,

    /// taxTotal
    @JsonKey(name: OrderShippingMethod.taxTotalKey) required double taxTotal,

    /// discountTotal
    @JsonKey(name: OrderShippingMethod.discountTotalKey)
    required double discountTotal,

    /// discountTaxTotal
    @JsonKey(name: OrderShippingMethod.discountTaxTotalKey)
    required double discountTaxTotal,
  }) = _OrderShippingMethod;

  factory OrderShippingMethod.fromJson(Map<String, dynamic> json) =>
      _$OrderShippingMethodFromJson(json);

  static const String idKey = r'id';

  static const String orderIdKey = r'order_id';

  static const String nameKey = r'name';

  static const String descriptionKey = r'description';

  static const String amountKey = r'amount';

  static const String isTaxInclusiveKey = r'is_tax_inclusive';

  static const String shippingOptionIdKey = r'shipping_option_id';

  static const String dataKey = r'data';

  static const String metadataKey = r'metadata';

  static const String taxLinesKey = r'tax_lines';

  static const String adjustmentsKey = r'adjustments';

  static const String createdAtKey = r'created_at';

  static const String updatedAtKey = r'updated_at';

  static const String originalTotalKey = r'original_total';

  static const String originalSubtotalKey = r'original_subtotal';

  static const String originalTaxTotalKey = r'original_tax_total';

  static const String totalKey = r'total';

  static const String subtotalKey = r'subtotal';

  static const String taxTotalKey = r'tax_total';

  static const String discountTotalKey = r'discount_total';

  static const String discountTaxTotalKey = r'discount_tax_total';
}
