/// OrderLineItem
/// {
///     "properties": {
///         "id": {
///             "type": "string",
///             "description": "The item's ID.",
///             "title": "id"
///         },
///         "title": {
///             "type": "string",
///             "description": "The item's title.",
///             "title": "title"
///         },
///         "subtitle": {
///             "type": "string",
///             "description": "The item's subtitle.",
///             "title": "subtitle"
///         },
///         "thumbnail": {
///             "type": "string",
///             "description": "The item's thumbnail URL.",
///             "title": "thumbnail"
///         },
///         "variant_id": {
///             "type": "string",
///             "description": "The ID of the associated variant.",
///             "title": "variant_id"
///         },
///         "product_id": {
///             "type": "string",
///             "description": "The ID of the associated product.",
///             "title": "product_id"
///         },
///         "product_title": {
///             "type": "string",
///             "description": "The item's product title.",
///             "title": "product_title"
///         },
///         "product_description": {
///             "type": "string",
///             "description": "The item's product description.",
///             "title": "product_description"
///         },
///         "product_subtitle": {
///             "type": "string",
///             "description": "The item's product subtitle.",
///             "title": "product_subtitle"
///         },
///         "product_type": {
///             "type": "string",
///             "description": "The ID of the associated product's type.",
///             "title": "product_type"
///         },
///         "product_collection": {
///             "type": "string",
///             "description": "The ID of the associated product's collection.",
///             "title": "product_collection"
///         },
///         "product_handle": {
///             "type": "string",
///             "description": "The item's product handle.",
///             "title": "product_handle"
///         },
///         "variant_sku": {
///             "type": "string",
///             "description": "The item's variant SKU.",
///             "title": "variant_sku"
///         },
///         "variant_barcode": {
///             "type": "string",
///             "description": "The item's variant barcode.",
///             "title": "variant_barcode"
///         },
///         "variant_title": {
///             "type": "string",
///             "description": "The item's variant title.",
///             "title": "variant_title"
///         },
///         "variant_option_values": {
///             "type": "object",
///             "description": "The associated variant's values for the associated product's options."
///         },
///         "requires_shipping": {
///             "type": "boolean",
///             "description": "Whether the item requires shipping.",
///             "title": "requires_shipping"
///         },
///         "is_discountable": {
///             "type": "boolean",
///             "description": "Whether the item is discountable.",
///             "title": "is_discountable"
///         },
///         "is_tax_inclusive": {
///             "type": "boolean",
///             "description": "Whether the item's price includes taxes.",
///             "title": "is_tax_inclusive"
///         },
///         "compare_at_unit_price": {
///             "type": "number",
///             "description": "The original price of the item before a promotion or sale.",
///             "title": "compare_at_unit_price"
///         },
///         "unit_price": {
///             "type": "number",
///             "description": "The item's price for a single quantity.",
///             "title": "unit_price"
///         },
///         "quantity": {
///             "type": "number",
///             "description": "The item's quantity.",
///             "title": "quantity"
///         },
///         "tax_lines": {
///             "type": "array",
///             "items": {
///                 "$ref": "#/components/schemas/OrderLineItemTaxLine"
///             },
///             "description": "The item's tax lines."
///         },
///         "adjustments": {
///             "type": "array",
///             "items": {
///                 "$ref": "#/components/schemas/OrderLineItemAdjustment"
///             },
///             "description": "The item's adjustments."
///         },
///         "detail": {
///             "$ref": "#/components/schemas/OrderItem"
///         },
///         "created_at": {
///             "type": "string",
///             "format": "date-time",
///             "description": "The date the item was created.",
///             "title": "created_at"
///         },
///         "updated_at": {
///             "type": "string",
///             "format": "date-time",
///             "description": "The date the item was updated.",
///             "title": "updated_at"
///         },
///         "metadata": {
///             "type": "object",
///             "description": "The item's metadata, can hold custom key-value pairs."
///         },
///         "original_total": {
///             "type": "number",
///             "description": "The item's total including taxes and promotions.",
///             "title": "original_total"
///         },
///         "original_subtotal": {
///             "type": "number",
///             "description": "The item's total excluding taxes, including promotions.",
///             "title": "original_subtotal"
///         },
///         "original_tax_total": {
///             "type": "number",
///             "description": "The total taxes of the item excluding promotions.",
///             "title": "original_tax_total"
///         },
///         "item_total": {
///             "type": "number",
///             "description": "The item's total for a single quantity, including taxes and promotions.",
///             "title": "item_total"
///         },
///         "item_subtotal": {
///             "type": "number",
///             "description": "The item's total for a single quantity, excluding taxes and including promotions.",
///             "title": "item_subtotal"
///         },
///         "item_tax_total": {
///             "type": "number",
///             "description": "The total taxes of a single quantity of the item, including promotions.",
///             "title": "item_tax_total"
///         },
///         "total": {
///             "type": "number",
///             "description": "The item's total including taxes and promotions.",
///             "title": "total"
///         },
///         "subtotal": {
///             "type": "number",
///             "description": "The item's total excluding taxes, including promotions.",
///             "title": "subtotal"
///         },
///         "tax_total": {
///             "type": "number",
///             "description": "The total taxes of the item, including promotions.",
///             "title": "tax_total"
///         },
///         "discount_total": {
///             "type": "number",
///             "description": "The item's discount total.",
///             "title": "discount_total"
///         },
///         "discount_tax_total": {
///             "type": "number",
///             "description": "The total taxes on the discounted amount.",
///             "title": "discount_tax_total"
///         },
///         "refundable_total": {
///             "type": "number",
///             "description": "The total amount of the item that can be refunded.",
///             "title": "refundable_total"
///         },
///         "refundable_total_per_unit": {
///             "type": "number",
///             "description": "The total amount that can be refunded of a single quantity of the item.",
///             "title": "refundable_total_per_unit"
///         },
///         "product_type_id": {
///             "type": "string",
///             "description": "The ID of the associated product's type.",
///             "title": "product_type_id"
///         },
///         "is_giftcard": {
///             "type": "boolean",
///             "description": "Whether the item is a gift card.",
///             "title": "is_giftcard"
///         }
///     },
///     "type": "object",
///     "required": [
///         "id",
///         "title",
///         "requires_shipping",
///         "is_discountable",
///         "is_giftcard",
///         "is_tax_inclusive",
///         "unit_price",
///         "quantity",
///         "detail",
///         "created_at",
///         "updated_at",
///         "original_total",
///         "original_subtotal",
///         "original_tax_total",
///         "item_total",
///         "item_subtotal",
///         "item_tax_total",
///         "total",
///         "subtotal",
///         "tax_total",
///         "discount_total",
///         "discount_tax_total",
///         "refundable_total",
///         "refundable_total_per_unit"
///     ],
///     "description": "The order line item's details."
/// }
library order_line_item;

import 'exports.dart';
part 'order_line_item.freezed.dart';
part 'order_line_item.g.dart'; // OrderLineItem

@freezed
abstract class OrderLineItem with _$OrderLineItem {
  const OrderLineItem._();

  @jsonSerializable
  const factory OrderLineItem({
    /// id
    @JsonKey(name: OrderLineItem.idKey) required String id,

    /// title
    @JsonKey(name: OrderLineItem.titleKey) required String title,

    /// subtitle
    @JsonKey(name: OrderLineItem.subtitleKey) required String subtitle,

    /// thumbnail
    @JsonKey(name: OrderLineItem.thumbnailKey) required String thumbnail,

    /// variantId
    @JsonKey(name: OrderLineItem.variantIdKey) required String variantId,

    /// productId
    @JsonKey(name: OrderLineItem.productIdKey) required String productId,

    /// productTitle
    @JsonKey(name: OrderLineItem.productTitleKey) required String productTitle,

    /// productDescription
    @JsonKey(name: OrderLineItem.productDescriptionKey)
    required String productDescription,

    /// productSubtitle
    @JsonKey(name: OrderLineItem.productSubtitleKey)
    required String productSubtitle,

    /// productType
    @JsonKey(name: OrderLineItem.productTypeKey) required String productType,

    /// productCollection
    @JsonKey(name: OrderLineItem.productCollectionKey)
    required String productCollection,

    /// productHandle
    @JsonKey(name: OrderLineItem.productHandleKey)
    required String productHandle,

    /// variantSku
    @JsonKey(name: OrderLineItem.variantSkuKey) required String variantSku,

    /// variantBarcode
    @JsonKey(name: OrderLineItem.variantBarcodeKey)
    required String variantBarcode,

    /// variantTitle
    @JsonKey(name: OrderLineItem.variantTitleKey) required String variantTitle,

    /// variantOptionValues
    @JsonKey(name: OrderLineItem.variantOptionValuesKey)
    required Map<String, dynamic> variantOptionValues,

    /// requiresShipping
    @JsonKey(name: OrderLineItem.requiresShippingKey)
    required bool requiresShipping,

    /// isDiscountable
    @JsonKey(name: OrderLineItem.isDiscountableKey)
    required bool isDiscountable,

    /// isTaxInclusive
    @JsonKey(name: OrderLineItem.isTaxInclusiveKey)
    required bool isTaxInclusive,

    /// compareAtUnitPrice
    @JsonKey(name: OrderLineItem.compareAtUnitPriceKey)
    required double compareAtUnitPrice,

    /// unitPrice
    @JsonKey(name: OrderLineItem.unitPriceKey) required double unitPrice,

    /// quantity
    @JsonKey(name: OrderLineItem.quantityKey) required double quantity,

    /// taxLines
    @JsonKey(name: OrderLineItem.taxLinesKey)
    required List<OrderLineItemTaxLine> taxLines,

    /// adjustments
    @JsonKey(name: OrderLineItem.adjustmentsKey)
    required List<OrderLineItemAdjustment> adjustments,

    /// detail
    @JsonKey(name: OrderLineItem.detailKey) required OrderItem detail,

    /// createdAt
    @JsonKey(name: OrderLineItem.createdAtKey) required DateTime createdAt,

    /// updatedAt
    @JsonKey(name: OrderLineItem.updatedAtKey) required DateTime updatedAt,

    /// metadata
    @JsonKey(name: OrderLineItem.metadataKey)
    required Map<String, dynamic> metadata,

    /// originalTotal
    @JsonKey(name: OrderLineItem.originalTotalKey)
    required double originalTotal,

    /// originalSubtotal
    @JsonKey(name: OrderLineItem.originalSubtotalKey)
    required double originalSubtotal,

    /// originalTaxTotal
    @JsonKey(name: OrderLineItem.originalTaxTotalKey)
    required double originalTaxTotal,

    /// itemTotal
    @JsonKey(name: OrderLineItem.itemTotalKey) required double itemTotal,

    /// itemSubtotal
    @JsonKey(name: OrderLineItem.itemSubtotalKey) required double itemSubtotal,

    /// itemTaxTotal
    @JsonKey(name: OrderLineItem.itemTaxTotalKey) required double itemTaxTotal,

    /// total
    @JsonKey(name: OrderLineItem.totalKey) required double total,

    /// subtotal
    @JsonKey(name: OrderLineItem.subtotalKey) required double subtotal,

    /// taxTotal
    @JsonKey(name: OrderLineItem.taxTotalKey) required double taxTotal,

    /// discountTotal
    @JsonKey(name: OrderLineItem.discountTotalKey)
    required double discountTotal,

    /// discountTaxTotal
    @JsonKey(name: OrderLineItem.discountTaxTotalKey)
    required double discountTaxTotal,

    /// refundableTotal
    @JsonKey(name: OrderLineItem.refundableTotalKey)
    required double refundableTotal,

    /// refundableTotalPerUnit
    @JsonKey(name: OrderLineItem.refundableTotalPerUnitKey)
    required double refundableTotalPerUnit,

    /// productTypeId
    @JsonKey(name: OrderLineItem.productTypeIdKey)
    required String productTypeId,

    /// isGiftcard
    @JsonKey(name: OrderLineItem.isGiftcardKey) required bool isGiftcard,
  }) = _OrderLineItem;

  factory OrderLineItem.fromJson(Map<String, dynamic> json) =>
      _$OrderLineItemFromJson(json);

  static const String idKey = r'id';

  static const String titleKey = r'title';

  static const String subtitleKey = r'subtitle';

  static const String thumbnailKey = r'thumbnail';

  static const String variantIdKey = r'variant_id';

  static const String productIdKey = r'product_id';

  static const String productTitleKey = r'product_title';

  static const String productDescriptionKey = r'product_description';

  static const String productSubtitleKey = r'product_subtitle';

  static const String productTypeKey = r'product_type';

  static const String productCollectionKey = r'product_collection';

  static const String productHandleKey = r'product_handle';

  static const String variantSkuKey = r'variant_sku';

  static const String variantBarcodeKey = r'variant_barcode';

  static const String variantTitleKey = r'variant_title';

  static const String variantOptionValuesKey = r'variant_option_values';

  static const String requiresShippingKey = r'requires_shipping';

  static const String isDiscountableKey = r'is_discountable';

  static const String isTaxInclusiveKey = r'is_tax_inclusive';

  static const String compareAtUnitPriceKey = r'compare_at_unit_price';

  static const String unitPriceKey = r'unit_price';

  static const String quantityKey = r'quantity';

  static const String taxLinesKey = r'tax_lines';

  static const String adjustmentsKey = r'adjustments';

  static const String detailKey = r'detail';

  static const String createdAtKey = r'created_at';

  static const String updatedAtKey = r'updated_at';

  static const String metadataKey = r'metadata';

  static const String originalTotalKey = r'original_total';

  static const String originalSubtotalKey = r'original_subtotal';

  static const String originalTaxTotalKey = r'original_tax_total';

  static const String itemTotalKey = r'item_total';

  static const String itemSubtotalKey = r'item_subtotal';

  static const String itemTaxTotalKey = r'item_tax_total';

  static const String totalKey = r'total';

  static const String subtotalKey = r'subtotal';

  static const String taxTotalKey = r'tax_total';

  static const String discountTotalKey = r'discount_total';

  static const String discountTaxTotalKey = r'discount_tax_total';

  static const String refundableTotalKey = r'refundable_total';

  static const String refundableTotalPerUnitKey = r'refundable_total_per_unit';

  static const String productTypeIdKey = r'product_type_id';

  static const String isGiftcardKey = r'is_giftcard';
}
