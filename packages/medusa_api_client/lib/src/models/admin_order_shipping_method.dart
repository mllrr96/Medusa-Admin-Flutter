/// AdminOrderShippingMethod
/// {
///     "properties": {
///         "id": {
///             "type": "string",
///             "description": "The shipping method's ID.",
///             "title": "id"
///         },
///         "order_id": {
///             "type": "string",
///             "description": "The ID of the order the shipping method belongs to.",
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
///             "description": "Whether the shipping method's amount includes applied taxes.",
///             "title": "is_tax_inclusive"
///         },
///         "shipping_option_id": {
///             "type": "string",
///             "description": "The ID of the shipping option this method was created from.",
///             "title": "shipping_option_id"
///         },
///         "data": {
///             "type": "object",
///             "description": "The shipping method's data, useful for fulfillment provider handling its fulfillment."
///         },
///         "metadata": {
///             "type": "object",
///             "description": "The shipping method's metadata, can hold custom key-value pairs."
///         },
///         "tax_lines": {
///             "type": "array",
///             "items": {
///                 "$ref": "#/components/schemas/BaseOrderShippingMethodTaxLine"
///             },
///             "description": "The shipping method's tax lines."
///         },
///         "adjustments": {
///             "type": "array",
///             "items": {
///                 "$ref": "#/components/schemas/BaseOrderShippingMethodAdjustment"
///             },
///             "description": "The shipping method's adjustments."
///         },
///         "original_total": {
///             "type": "number",
///             "description": "The shipping method's total including taxes, excluding promotions.",
///             "title": "original_total"
///         },
///         "original_subtotal": {
///             "type": "number",
///             "description": "The shipping method's total excluding taxes, including promotions.",
///             "title": "original_subtotal"
///         },
///         "original_tax_total": {
///             "type": "number",
///             "description": "The shipping method's total taxes excluding promotions.",
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
///             "description": "The shipping method's tax total including promotions.",
///             "title": "tax_total"
///         },
///         "discount_total": {
///             "type": "number",
///             "description": "The total discounts applied on the shipping method.",
///             "title": "discount_total"
///         },
///         "discount_tax_total": {
///             "type": "number",
///             "description": "The taxes applied on the discount amount.",
///             "title": "discount_tax_total"
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
///         "detail": {
///             "$ref": "#/components/schemas/BaseOrderShippingDetail"
///         }
///     },
///     "type": "object",
///     "required": [
///         "id",
///         "order_id",
///         "name",
///         "amount",
///         "is_tax_inclusive",
///         "shipping_option_id",
///         "data",
///         "metadata",
///         "original_total",
///         "original_subtotal",
///         "original_tax_total",
///         "total",
///         "subtotal",
///         "tax_total",
///         "discount_total",
///         "discount_tax_total",
///         "created_at",
///         "updated_at"
///     ],
///     "description": "The shipping method's details."
/// }
library;

import 'exports.dart';
part 'admin_order_shipping_method.freezed.dart';
part 'admin_order_shipping_method.g.dart'; // AdminOrderShippingMethod

@freezed
abstract class AdminOrderShippingMethod with _$AdminOrderShippingMethod {
  const AdminOrderShippingMethod._();

  @jsonSerializable
  const factory AdminOrderShippingMethod({
    /// id
    @JsonKey(name: AdminOrderShippingMethod.idKey) required String id,

    /// orderId
    @JsonKey(name: AdminOrderShippingMethod.orderIdKey) required String orderId,

    /// name
    @JsonKey(name: AdminOrderShippingMethod.nameKey) required String name,

    /// description
    @JsonKey(name: AdminOrderShippingMethod.descriptionKey)
    required String description,

    /// amount
    @JsonKey(name: AdminOrderShippingMethod.amountKey) required double amount,

    /// isTaxInclusive
    @JsonKey(name: AdminOrderShippingMethod.isTaxInclusiveKey)
    required bool isTaxInclusive,

    /// shippingOptionId
    @JsonKey(name: AdminOrderShippingMethod.shippingOptionIdKey)
    required String shippingOptionId,

    /// data
    @JsonKey(name: AdminOrderShippingMethod.dataKey)
    required Map<String, dynamic> data,

    /// metadata
    @JsonKey(name: AdminOrderShippingMethod.metadataKey)
    required Map<String, dynamic> metadata,

    /// taxLines
    @JsonKey(name: AdminOrderShippingMethod.taxLinesKey)
    required List<BaseOrderShippingMethodTaxLine> taxLines,

    /// adjustments
    @JsonKey(name: AdminOrderShippingMethod.adjustmentsKey)
    required List<BaseOrderShippingMethodAdjustment> adjustments,

    /// originalTotal
    @JsonKey(name: AdminOrderShippingMethod.originalTotalKey)
    required double originalTotal,

    /// originalSubtotal
    @JsonKey(name: AdminOrderShippingMethod.originalSubtotalKey)
    required double originalSubtotal,

    /// originalTaxTotal
    @JsonKey(name: AdminOrderShippingMethod.originalTaxTotalKey)
    required double originalTaxTotal,

    /// total
    @JsonKey(name: AdminOrderShippingMethod.totalKey) required double total,

    /// subtotal
    @JsonKey(name: AdminOrderShippingMethod.subtotalKey)
    required double subtotal,

    /// taxTotal
    @JsonKey(name: AdminOrderShippingMethod.taxTotalKey)
    required double taxTotal,

    /// discountTotal
    @JsonKey(name: AdminOrderShippingMethod.discountTotalKey)
    required double discountTotal,

    /// discountTaxTotal
    @JsonKey(name: AdminOrderShippingMethod.discountTaxTotalKey)
    required double discountTaxTotal,

    /// createdAt
    @JsonKey(name: AdminOrderShippingMethod.createdAtKey)
    required DateTime createdAt,

    /// updatedAt
    @JsonKey(name: AdminOrderShippingMethod.updatedAtKey)
    required DateTime updatedAt,

    /// detail
    @JsonKey(name: AdminOrderShippingMethod.detailKey)
    required BaseOrderShippingDetail detail,
  }) = _AdminOrderShippingMethod;

  factory AdminOrderShippingMethod.fromJson(Map<String, dynamic> json) =>
      _$AdminOrderShippingMethodFromJson(json);

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

  static const String originalTotalKey = r'original_total';

  static const String originalSubtotalKey = r'original_subtotal';

  static const String originalTaxTotalKey = r'original_tax_total';

  static const String totalKey = r'total';

  static const String subtotalKey = r'subtotal';

  static const String taxTotalKey = r'tax_total';

  static const String discountTotalKey = r'discount_total';

  static const String discountTaxTotalKey = r'discount_tax_total';

  static const String createdAtKey = r'created_at';

  static const String updatedAtKey = r'updated_at';

  static const String detailKey = r'detail';
}
