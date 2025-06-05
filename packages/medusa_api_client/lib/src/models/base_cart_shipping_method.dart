/// BaseCartShippingMethod
/// {
///     "properties": {
///         "id": {
///             "type": "string",
///             "description": "The shipping method's ID.",
///             "title": "id"
///         },
///         "cart_id": {
///             "type": "string",
///             "description": "The ID of the cart this shipping method belongs to.",
///             "title": "cart_id"
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
///             "description": "Whether the shipping method's amount is tax inclusive.",
///             "title": "is_tax_inclusive"
///         },
///         "shipping_option_id": {
///             "type": "string",
///             "description": "The ID of the shipping option this method was created from.",
///             "title": "shipping_option_id"
///         },
///         "data": {
///             "type": "object",
///             "description": "The shipping method's data, useful for fulfillment handling by third-party services."
///         },
///         "metadata": {
///             "type": "object",
///             "description": "The shipping method's metadata, can hold custom key-value pairs."
///         },
///         "tax_lines": {
///             "type": "array",
///             "items": {
///                 "$ref": "#/components/schemas/BaseShippingMethodTaxLine"
///             },
///             "description": "The shipping method's tax lines."
///         },
///         "adjustments": {
///             "type": "array",
///             "items": {
///                 "$ref": "#/components/schemas/BaseShippingMethodAdjustment"
///             },
///             "description": "The shipping method's adjustments, such as applied promotions."
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
///             "description": "The shipping method's total excluding taxes, including promotions.",
///             "title": "original_subtotal"
///         },
///         "original_tax_total": {
///             "type": "number",
///             "description": "The total taxes applied on the shipping method's amount including promotions.",
///             "title": "original_tax_total"
///         },
///         "total": {
///             "type": "number",
///             "description": "The shipping method's total amount including taxes and promotions.",
///             "title": "total"
///         },
///         "subtotal": {
///             "type": "number",
///             "description": "The shipping method's total amount excluding taxes, including promotions.",
///             "title": "subtotal"
///         },
///         "tax_total": {
///             "type": "number",
///             "description": "The total taxes applied on the shipping method's amount including promotions.",
///             "title": "tax_total"
///         },
///         "discount_total": {
///             "type": "number",
///             "description": "The total amount discounted.",
///             "title": "discount_total"
///         },
///         "discount_tax_total": {
///             "type": "number",
///             "description": "The taxes applied on the discounted amount.",
///             "title": "discount_tax_total"
///         }
///     },
///     "type": "object",
///     "required": [
///         "id",
///         "cart_id",
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
///     "description": "A cart's shipping method."
/// }
library;

import 'exports.dart';
part 'base_cart_shipping_method.freezed.dart';
part 'base_cart_shipping_method.g.dart'; // BaseCartShippingMethod

@freezed
abstract class BaseCartShippingMethod with _$BaseCartShippingMethod {
  const BaseCartShippingMethod._();

  @jsonSerializable
  const factory BaseCartShippingMethod({
    /// id
    @JsonKey(name: BaseCartShippingMethod.idKey) required String id,

    /// cartId
    @JsonKey(name: BaseCartShippingMethod.cartIdKey) required String cartId,

    /// name
    @JsonKey(name: BaseCartShippingMethod.nameKey) required String name,

    /// description
    @JsonKey(name: BaseCartShippingMethod.descriptionKey)
    required String description,

    /// amount
    @JsonKey(name: BaseCartShippingMethod.amountKey) required double amount,

    /// isTaxInclusive
    @JsonKey(name: BaseCartShippingMethod.isTaxInclusiveKey)
    required bool isTaxInclusive,

    /// shippingOptionId
    @JsonKey(name: BaseCartShippingMethod.shippingOptionIdKey)
    required String shippingOptionId,

    /// data
    @JsonKey(name: BaseCartShippingMethod.dataKey)
    required Map<String, dynamic> data,

    /// metadata
    @JsonKey(name: BaseCartShippingMethod.metadataKey)
    required Map<String, dynamic> metadata,

    /// taxLines
    @JsonKey(name: BaseCartShippingMethod.taxLinesKey)
    required List<BaseShippingMethodTaxLine> taxLines,

    /// adjustments
    @JsonKey(name: BaseCartShippingMethod.adjustmentsKey)
    required List<BaseShippingMethodAdjustment> adjustments,

    /// createdAt
    @JsonKey(name: BaseCartShippingMethod.createdAtKey)
    required DateTime createdAt,

    /// updatedAt
    @JsonKey(name: BaseCartShippingMethod.updatedAtKey)
    required DateTime updatedAt,

    /// originalTotal
    @JsonKey(name: BaseCartShippingMethod.originalTotalKey)
    required double originalTotal,

    /// originalSubtotal
    @JsonKey(name: BaseCartShippingMethod.originalSubtotalKey)
    required double originalSubtotal,

    /// originalTaxTotal
    @JsonKey(name: BaseCartShippingMethod.originalTaxTotalKey)
    required double originalTaxTotal,

    /// total
    @JsonKey(name: BaseCartShippingMethod.totalKey) required double total,

    /// subtotal
    @JsonKey(name: BaseCartShippingMethod.subtotalKey) required double subtotal,

    /// taxTotal
    @JsonKey(name: BaseCartShippingMethod.taxTotalKey) required double taxTotal,

    /// discountTotal
    @JsonKey(name: BaseCartShippingMethod.discountTotalKey)
    required double discountTotal,

    /// discountTaxTotal
    @JsonKey(name: BaseCartShippingMethod.discountTaxTotalKey)
    required double discountTaxTotal,
  }) = _BaseCartShippingMethod;

  factory BaseCartShippingMethod.fromJson(Map<String, dynamic> json) =>
      _$BaseCartShippingMethodFromJson(json);

  static const String idKey = r'id';

  static const String cartIdKey = r'cart_id';

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
