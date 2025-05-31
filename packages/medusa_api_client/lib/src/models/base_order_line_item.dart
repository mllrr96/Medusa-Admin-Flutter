/// BaseOrderLineItem
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
///             "description": "The URL of the item's thumbnail.",
///             "title": "thumbnail"
///         },
///         "variant": {
///             "$ref": "#/components/schemas/BaseProductVariant"
///         },
///         "variant_id": {
///             "type": "string",
///             "description": "The ID of the associated variant.",
///             "title": "variant_id"
///         },
///         "product": {
///             "$ref": "#/components/schemas/BaseProduct"
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
///             "description": "The item's product type.",
///             "title": "product_type"
///         },
///         "product_collection": {
///             "type": "string",
///             "description": "The ID of the collection the item's product belongs to.",
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
///             "description": "The values of the item variant's options."
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
///             "description": "Whether the item is tax inclusive.",
///             "title": "is_tax_inclusive"
///         },
///         "compare_at_unit_price": {
///             "type": "number",
///             "description": "The original price of the item before a promotion or sale.",
///             "title": "compare_at_unit_price"
///         },
///         "unit_price": {
///             "type": "number",
///             "description": "The item's unit price.",
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
///                 "$ref": "#/components/schemas/BaseOrderLineItemTaxLine"
///             },
///             "description": "The item's tax lines."
///         },
///         "adjustments": {
///             "type": "array",
///             "items": {
///                 "$ref": "#/components/schemas/BaseOrderLineItemAdjustment"
///             },
///             "description": "The item's adjustments."
///         },
///         "detail": {
///             "$ref": "#/components/schemas/BaseOrderItemDetail"
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
///             "description": "The item's total including taxes, excluding promotions.",
///             "title": "original_total"
///         },
///         "original_subtotal": {
///             "type": "number",
///             "description": "The item's total excluding taxes, including promotions.",
///             "title": "original_subtotal"
///         },
///         "original_tax_total": {
///             "type": "number",
///             "description": "The total taxes of the item, excluding promotions.",
///             "title": "original_tax_total"
///         },
///         "item_total": {
///             "type": "number",
///             "description": "The total taxes of the item, including promotions.",
///             "title": "item_total"
///         },
///         "item_subtotal": {
///             "type": "number",
///             "description": "The item's total excluding taxes, including promotions.",
///             "title": "item_subtotal"
///         },
///         "item_tax_total": {
///             "type": "number",
///             "description": "The total taxes of the item, including promotions.",
///             "title": "item_tax_total"
///         },
///         "total": {
///             "type": "number",
///             "description": "The item's total, including taxes and promotions.",
///             "title": "total"
///         },
///         "subtotal": {
///             "type": "number",
///             "description": "The item's subtotal excluding taxes, including promotions.",
///             "title": "subtotal"
///         },
///         "tax_total": {
///             "type": "number",
///             "description": "The tax total of the item including promotions.",
///             "title": "tax_total"
///         },
///         "discount_total": {
///             "type": "number",
///             "description": "The total discount amount of the item.",
///             "title": "discount_total"
///         },
///         "discount_tax_total": {
///             "type": "number",
///             "description": "The total taxes applied on the discounted amount.",
///             "title": "discount_tax_total"
///         },
///         "refundable_total": {
///             "type": "number",
///             "description": "The total refundable amount of the item's total.",
///             "title": "refundable_total"
///         },
///         "refundable_total_per_unit": {
///             "type": "number",
///             "description": "The total refundable amount of the item's total for a single quantity.",
///             "title": "refundable_total_per_unit"
///         },
///         "product_type_id": {
///             "type": "string",
///             "description": "The ID of the associated product's type.",
///             "title": "product_type_id"
///         }
///     },
///     "type": "object",
///     "required": [
///         "id",
///         "title",
///         "subtitle",
///         "thumbnail",
///         "variant_id",
///         "product_id",
///         "product_title",
///         "product_description",
///         "product_subtitle",
///         "product_type_id",
///         "product_type",
///         "product_collection",
///         "product_handle",
///         "variant_sku",
///         "variant_barcode",
///         "variant_title",
///         "variant_option_values",
///         "requires_shipping",
///         "is_discountable",
///         "is_tax_inclusive",
///         "unit_price",
///         "quantity",
///         "detail",
///         "created_at",
///         "updated_at",
///         "metadata",
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
///     "description": "The item's items."
/// }
library base_order_line_item;

import 'exports.dart';
part 'base_order_line_item.freezed.dart';
part 'base_order_line_item.g.dart'; // BaseOrderLineItem

@freezed
abstract class BaseOrderLineItem with _$BaseOrderLineItem {
  const BaseOrderLineItem._();

  @jsonSerializable
  const factory BaseOrderLineItem({
    /// id
    @JsonKey(name: BaseOrderLineItem.idKey) required String id,

    /// title
    @JsonKey(name: BaseOrderLineItem.titleKey) required String title,

    /// subtitle
    @JsonKey(name: BaseOrderLineItem.subtitleKey) required String subtitle,

    /// thumbnail
    @JsonKey(name: BaseOrderLineItem.thumbnailKey) required String thumbnail,

    /// variant
    @JsonKey(name: BaseOrderLineItem.variantKey)
    required BaseProductVariant variant,

    /// variantId
    @JsonKey(name: BaseOrderLineItem.variantIdKey) required String variantId,

    /// product
    @JsonKey(name: BaseOrderLineItem.productKey) required BaseProduct product,

    /// productId
    @JsonKey(name: BaseOrderLineItem.productIdKey) required String productId,

    /// productTitle
    @JsonKey(name: BaseOrderLineItem.productTitleKey)
    required String productTitle,

    /// productDescription
    @JsonKey(name: BaseOrderLineItem.productDescriptionKey)
    required String productDescription,

    /// productSubtitle
    @JsonKey(name: BaseOrderLineItem.productSubtitleKey)
    required String productSubtitle,

    /// productType
    @JsonKey(name: BaseOrderLineItem.productTypeKey)
    required String productType,

    /// productCollection
    @JsonKey(name: BaseOrderLineItem.productCollectionKey)
    required String productCollection,

    /// productHandle
    @JsonKey(name: BaseOrderLineItem.productHandleKey)
    required String productHandle,

    /// variantSku
    @JsonKey(name: BaseOrderLineItem.variantSkuKey) required String variantSku,

    /// variantBarcode
    @JsonKey(name: BaseOrderLineItem.variantBarcodeKey)
    required String variantBarcode,

    /// variantTitle
    @JsonKey(name: BaseOrderLineItem.variantTitleKey)
    required String variantTitle,

    /// variantOptionValues
    @JsonKey(name: BaseOrderLineItem.variantOptionValuesKey)
    required Map<String, dynamic> variantOptionValues,

    /// requiresShipping
    @JsonKey(name: BaseOrderLineItem.requiresShippingKey)
    required bool requiresShipping,

    /// isDiscountable
    @JsonKey(name: BaseOrderLineItem.isDiscountableKey)
    required bool isDiscountable,

    /// isTaxInclusive
    @JsonKey(name: BaseOrderLineItem.isTaxInclusiveKey)
    required bool isTaxInclusive,

    /// compareAtUnitPrice
    @JsonKey(name: BaseOrderLineItem.compareAtUnitPriceKey)
    required double compareAtUnitPrice,

    /// unitPrice
    @JsonKey(name: BaseOrderLineItem.unitPriceKey) required double unitPrice,

    /// quantity
    @JsonKey(name: BaseOrderLineItem.quantityKey) required double quantity,

    /// taxLines
    @JsonKey(name: BaseOrderLineItem.taxLinesKey)
    required List<BaseOrderLineItemTaxLine> taxLines,

    /// adjustments
    @JsonKey(name: BaseOrderLineItem.adjustmentsKey)
    required List<BaseOrderLineItemAdjustment> adjustments,

    /// detail
    @JsonKey(name: BaseOrderLineItem.detailKey)
    required BaseOrderItemDetail detail,

    /// createdAt
    @JsonKey(name: BaseOrderLineItem.createdAtKey) required DateTime createdAt,

    /// updatedAt
    @JsonKey(name: BaseOrderLineItem.updatedAtKey) required DateTime updatedAt,

    /// metadata
    @JsonKey(name: BaseOrderLineItem.metadataKey)
    required Map<String, dynamic> metadata,

    /// originalTotal
    @JsonKey(name: BaseOrderLineItem.originalTotalKey)
    required double originalTotal,

    /// originalSubtotal
    @JsonKey(name: BaseOrderLineItem.originalSubtotalKey)
    required double originalSubtotal,

    /// originalTaxTotal
    @JsonKey(name: BaseOrderLineItem.originalTaxTotalKey)
    required double originalTaxTotal,

    /// itemTotal
    @JsonKey(name: BaseOrderLineItem.itemTotalKey) required double itemTotal,

    /// itemSubtotal
    @JsonKey(name: BaseOrderLineItem.itemSubtotalKey)
    required double itemSubtotal,

    /// itemTaxTotal
    @JsonKey(name: BaseOrderLineItem.itemTaxTotalKey)
    required double itemTaxTotal,

    /// total
    @JsonKey(name: BaseOrderLineItem.totalKey) required double total,

    /// subtotal
    @JsonKey(name: BaseOrderLineItem.subtotalKey) required double subtotal,

    /// taxTotal
    @JsonKey(name: BaseOrderLineItem.taxTotalKey) required double taxTotal,

    /// discountTotal
    @JsonKey(name: BaseOrderLineItem.discountTotalKey)
    required double discountTotal,

    /// discountTaxTotal
    @JsonKey(name: BaseOrderLineItem.discountTaxTotalKey)
    required double discountTaxTotal,

    /// refundableTotal
    @JsonKey(name: BaseOrderLineItem.refundableTotalKey)
    required double refundableTotal,

    /// refundableTotalPerUnit
    @JsonKey(name: BaseOrderLineItem.refundableTotalPerUnitKey)
    required double refundableTotalPerUnit,

    /// productTypeId
    @JsonKey(name: BaseOrderLineItem.productTypeIdKey)
    required String productTypeId,
  }) = _BaseOrderLineItem;

  factory BaseOrderLineItem.fromJson(Map<String, dynamic> json) =>
      _$BaseOrderLineItemFromJson(json);

  static const String idKey = r'id';

  static const String titleKey = r'title';

  static const String subtitleKey = r'subtitle';

  static const String thumbnailKey = r'thumbnail';

  static const String variantKey = r'variant';

  static const String variantIdKey = r'variant_id';

  static const String productKey = r'product';

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
}
