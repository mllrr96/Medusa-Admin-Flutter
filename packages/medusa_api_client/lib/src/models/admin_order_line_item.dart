/// AdminOrderLineItem
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
///             "$ref": "#/components/schemas/AdminProductVariant"
///         },
///         "variant_id": {
///             "type": "string",
///             "description": "The ID of the associated variant.",
///             "title": "variant_id"
///         },
///         "product": {
///             "$ref": "#/components/schemas/AdminProduct"
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
///             "type": "object"
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
///         "title",
///         "id",
///         "metadata",
///         "created_at",
///         "updated_at",
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
///         "refundable_total",
///         "refundable_total_per_unit"
///     ],
///     "description": "The item's details."
/// }
library;

import 'exports.dart';
part 'admin_order_line_item.freezed.dart';
part 'admin_order_line_item.g.dart'; // AdminOrderLineItem

@freezed
abstract class AdminOrderLineItem with _$AdminOrderLineItem {
  const AdminOrderLineItem._();

  @jsonSerializable
  const factory AdminOrderLineItem({
    /// id
    @JsonKey(name: AdminOrderLineItem.idKey) required String id,

    /// title
    @JsonKey(name: AdminOrderLineItem.titleKey) required String title,

    /// subtitle
    @JsonKey(name: AdminOrderLineItem.subtitleKey) required String subtitle,

    /// thumbnail
    @JsonKey(name: AdminOrderLineItem.thumbnailKey) required String thumbnail,

    /// variant
    @JsonKey(name: AdminOrderLineItem.variantKey)
    required AdminProductVariant variant,

    /// variantId
    @JsonKey(name: AdminOrderLineItem.variantIdKey) required String variantId,

    /// product
    @JsonKey(name: AdminOrderLineItem.productKey) required AdminProduct product,

    /// productId
    @JsonKey(name: AdminOrderLineItem.productIdKey) required String productId,

    /// productTitle
    @JsonKey(name: AdminOrderLineItem.productTitleKey)
    required String productTitle,

    /// productDescription
    @JsonKey(name: AdminOrderLineItem.productDescriptionKey)
    required String productDescription,

    /// productSubtitle
    @JsonKey(name: AdminOrderLineItem.productSubtitleKey)
    required String productSubtitle,

    /// productType
    @JsonKey(name: AdminOrderLineItem.productTypeKey)
    required String productType,

    /// productCollection
    @JsonKey(name: AdminOrderLineItem.productCollectionKey)
    required String productCollection,

    /// productHandle
    @JsonKey(name: AdminOrderLineItem.productHandleKey)
    required String productHandle,

    /// variantSku
    @JsonKey(name: AdminOrderLineItem.variantSkuKey) required String variantSku,

    /// variantBarcode
    @JsonKey(name: AdminOrderLineItem.variantBarcodeKey)
    required String variantBarcode,

    /// variantTitle
    @JsonKey(name: AdminOrderLineItem.variantTitleKey)
    required String variantTitle,

    /// variantOptionValues
    @JsonKey(name: AdminOrderLineItem.variantOptionValuesKey)
    required Map<String, dynamic> variantOptionValues,

    /// requiresShipping
    @JsonKey(name: AdminOrderLineItem.requiresShippingKey)
    required bool requiresShipping,

    /// isDiscountable
    @JsonKey(name: AdminOrderLineItem.isDiscountableKey)
    required bool isDiscountable,

    /// isTaxInclusive
    @JsonKey(name: AdminOrderLineItem.isTaxInclusiveKey)
    required bool isTaxInclusive,

    /// compareAtUnitPrice
    @JsonKey(name: AdminOrderLineItem.compareAtUnitPriceKey)
    required double compareAtUnitPrice,

    /// unitPrice
    @JsonKey(name: AdminOrderLineItem.unitPriceKey) required double unitPrice,

    /// quantity
    @JsonKey(name: AdminOrderLineItem.quantityKey) required double quantity,

    /// taxLines
    @JsonKey(name: AdminOrderLineItem.taxLinesKey)
    required List<BaseOrderLineItemTaxLine> taxLines,

    /// adjustments
    @JsonKey(name: AdminOrderLineItem.adjustmentsKey)
    required List<BaseOrderLineItemAdjustment> adjustments,

    /// detail
    @JsonKey(name: AdminOrderLineItem.detailKey)
    required Map<String, dynamic> detail,

    /// createdAt
    @JsonKey(name: AdminOrderLineItem.createdAtKey) required DateTime createdAt,

    /// updatedAt
    @JsonKey(name: AdminOrderLineItem.updatedAtKey) required DateTime updatedAt,

    /// metadata
    @JsonKey(name: AdminOrderLineItem.metadataKey)
    required Map<String, dynamic> metadata,

    /// originalTotal
    @JsonKey(name: AdminOrderLineItem.originalTotalKey)
    required double originalTotal,

    /// originalSubtotal
    @JsonKey(name: AdminOrderLineItem.originalSubtotalKey)
    required double originalSubtotal,

    /// originalTaxTotal
    @JsonKey(name: AdminOrderLineItem.originalTaxTotalKey)
    required double originalTaxTotal,

    /// itemTotal
    @JsonKey(name: AdminOrderLineItem.itemTotalKey) required double itemTotal,

    /// itemSubtotal
    @JsonKey(name: AdminOrderLineItem.itemSubtotalKey)
    required double itemSubtotal,

    /// itemTaxTotal
    @JsonKey(name: AdminOrderLineItem.itemTaxTotalKey)
    required double itemTaxTotal,

    /// total
    @JsonKey(name: AdminOrderLineItem.totalKey) required double total,

    /// subtotal
    @JsonKey(name: AdminOrderLineItem.subtotalKey) required double subtotal,

    /// taxTotal
    @JsonKey(name: AdminOrderLineItem.taxTotalKey) required double taxTotal,

    /// discountTotal
    @JsonKey(name: AdminOrderLineItem.discountTotalKey)
    required double discountTotal,

    /// discountTaxTotal
    @JsonKey(name: AdminOrderLineItem.discountTaxTotalKey)
    required double discountTaxTotal,

    /// refundableTotal
    @JsonKey(name: AdminOrderLineItem.refundableTotalKey)
    required double refundableTotal,

    /// refundableTotalPerUnit
    @JsonKey(name: AdminOrderLineItem.refundableTotalPerUnitKey)
    required double refundableTotalPerUnit,

    /// productTypeId
    @JsonKey(name: AdminOrderLineItem.productTypeIdKey)
    required String productTypeId,
  }) = _AdminOrderLineItem;

  factory AdminOrderLineItem.fromJson(Map<String, dynamic> json) =>
      _$AdminOrderLineItemFromJson(json);

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
