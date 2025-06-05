/// BaseCartLineItem
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
///             "description": "The item's thumbnail.",
///             "title": "thumbnail"
///         },
///         "quantity": {
///             "type": "number",
///             "description": "The item's quantity.",
///             "title": "quantity"
///         },
///         "product": {
///             "$ref": "#/components/schemas/BaseProduct"
///         },
///         "product_id": {
///             "type": "string",
///             "description": "The item's product id.",
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
///             "description": "The item's product collection.",
///             "title": "product_collection"
///         },
///         "product_handle": {
///             "type": "string",
///             "description": "The item's product handle.",
///             "title": "product_handle"
///         },
///         "variant": {
///             "$ref": "#/components/schemas/BaseProductVariant"
///         },
///         "variant_id": {
///             "type": "string",
///             "description": "The item's variant id.",
///             "title": "variant_id"
///         },
///         "variant_sku": {
///             "type": "string",
///             "description": "The item's variant sku.",
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
///             "description": "The item's variant option values."
///         },
///         "requires_shipping": {
///             "type": "boolean",
///             "description": "The item's requires shipping.",
///             "title": "requires_shipping"
///         },
///         "is_discountable": {
///             "type": "boolean",
///             "description": "The item's is discountable.",
///             "title": "is_discountable"
///         },
///         "is_tax_inclusive": {
///             "type": "boolean",
///             "description": "The item's is tax inclusive.",
///             "title": "is_tax_inclusive"
///         },
///         "compare_at_unit_price": {
///             "type": "number",
///             "description": "The item's compare at unit price.",
///             "title": "compare_at_unit_price"
///         },
///         "unit_price": {
///             "type": "number",
///             "description": "The item's unit price.",
///             "title": "unit_price"
///         },
///         "tax_lines": {
///             "type": "array",
///             "items": {
///                 "type": "object"
///             },
///             "description": "The item's tax lines."
///         },
///         "adjustments": {
///             "type": "array",
///             "items": {
///                 "$ref": "#/components/schemas/BaseLineItemAdjustment"
///             },
///             "description": "The item's adjustments."
///         },
///         "cart": {
///             "$ref": "#/components/schemas/BaseCart"
///         },
///         "cart_id": {
///             "type": "string",
///             "description": "The item's cart id.",
///             "title": "cart_id"
///         },
///         "metadata": {
///             "type": "object",
///             "description": "The item's metadata."
///         },
///         "created_at": {
///             "type": "string",
///             "format": "date-time",
///             "description": "The item's created at.",
///             "title": "created_at"
///         },
///         "updated_at": {
///             "type": "string",
///             "format": "date-time",
///             "description": "The item's updated at.",
///             "title": "updated_at"
///         },
///         "deleted_at": {
///             "type": "string",
///             "format": "date-time",
///             "description": "The item's deleted at.",
///             "title": "deleted_at"
///         },
///         "original_total": {
///             "type": "number",
///             "description": "The item's original total.",
///             "title": "original_total"
///         },
///         "original_subtotal": {
///             "type": "number",
///             "description": "The item's original subtotal.",
///             "title": "original_subtotal"
///         },
///         "original_tax_total": {
///             "type": "number",
///             "description": "The item's original tax total.",
///             "title": "original_tax_total"
///         },
///         "item_total": {
///             "type": "number",
///             "description": "The item's item total.",
///             "title": "item_total"
///         },
///         "item_subtotal": {
///             "type": "number",
///             "description": "The item's item subtotal.",
///             "title": "item_subtotal"
///         },
///         "item_tax_total": {
///             "type": "number",
///             "description": "The item's item tax total.",
///             "title": "item_tax_total"
///         },
///         "total": {
///             "type": "number",
///             "description": "The item's total.",
///             "title": "total"
///         },
///         "subtotal": {
///             "type": "number",
///             "description": "The item's subtotal.",
///             "title": "subtotal"
///         },
///         "tax_total": {
///             "type": "number",
///             "description": "The item's tax total.",
///             "title": "tax_total"
///         },
///         "discount_total": {
///             "type": "number",
///             "description": "The item's discount total.",
///             "title": "discount_total"
///         },
///         "discount_tax_total": {
///             "type": "number",
///             "description": "The item's discount tax total.",
///             "title": "discount_tax_total"
///         }
///     },
///     "type": "object",
///     "required": [
///         "id",
///         "title",
///         "quantity",
///         "requires_shipping",
///         "is_discountable",
///         "is_tax_inclusive",
///         "unit_price",
///         "cart",
///         "cart_id",
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
///         "discount_tax_total"
///     ],
///     "description": "The tax line's item."
/// }
library;

import 'exports.dart';
part 'base_cart_line_item.freezed.dart';
part 'base_cart_line_item.g.dart'; // BaseCartLineItem

@freezed
abstract class BaseCartLineItem with _$BaseCartLineItem {
  const BaseCartLineItem._();

  @jsonSerializable
  const factory BaseCartLineItem({
    /// id
    @JsonKey(name: BaseCartLineItem.idKey) required String id,

    /// title
    @JsonKey(name: BaseCartLineItem.titleKey) required String title,

    /// subtitle
    @JsonKey(name: BaseCartLineItem.subtitleKey) required String subtitle,

    /// thumbnail
    @JsonKey(name: BaseCartLineItem.thumbnailKey) required String thumbnail,

    /// quantity
    @JsonKey(name: BaseCartLineItem.quantityKey) required double quantity,

    /// product
    @JsonKey(name: BaseCartLineItem.productKey) required BaseProduct product,

    /// productId
    @JsonKey(name: BaseCartLineItem.productIdKey) required String productId,

    /// productTitle
    @JsonKey(name: BaseCartLineItem.productTitleKey)
    required String productTitle,

    /// productDescription
    @JsonKey(name: BaseCartLineItem.productDescriptionKey)
    required String productDescription,

    /// productSubtitle
    @JsonKey(name: BaseCartLineItem.productSubtitleKey)
    required String productSubtitle,

    /// productType
    @JsonKey(name: BaseCartLineItem.productTypeKey) required String productType,

    /// productCollection
    @JsonKey(name: BaseCartLineItem.productCollectionKey)
    required String productCollection,

    /// productHandle
    @JsonKey(name: BaseCartLineItem.productHandleKey)
    required String productHandle,

    /// variant
    @JsonKey(name: BaseCartLineItem.variantKey)
    required BaseProductVariant variant,

    /// variantId
    @JsonKey(name: BaseCartLineItem.variantIdKey) required String variantId,

    /// variantSku
    @JsonKey(name: BaseCartLineItem.variantSkuKey) required String variantSku,

    /// variantBarcode
    @JsonKey(name: BaseCartLineItem.variantBarcodeKey)
    required String variantBarcode,

    /// variantTitle
    @JsonKey(name: BaseCartLineItem.variantTitleKey)
    required String variantTitle,

    /// variantOptionValues
    @JsonKey(name: BaseCartLineItem.variantOptionValuesKey)
    required Map<String, dynamic> variantOptionValues,

    /// requiresShipping
    @JsonKey(name: BaseCartLineItem.requiresShippingKey)
    required bool requiresShipping,

    /// isDiscountable
    @JsonKey(name: BaseCartLineItem.isDiscountableKey)
    required bool isDiscountable,

    /// isTaxInclusive
    @JsonKey(name: BaseCartLineItem.isTaxInclusiveKey)
    required bool isTaxInclusive,

    /// compareAtUnitPrice
    @JsonKey(name: BaseCartLineItem.compareAtUnitPriceKey)
    required double compareAtUnitPrice,

    /// unitPrice
    @JsonKey(name: BaseCartLineItem.unitPriceKey) required double unitPrice,

    /// taxLines
    @JsonKey(name: BaseCartLineItem.taxLinesKey)
    required List<Map<String, dynamic>> taxLines,

    /// adjustments
    @JsonKey(name: BaseCartLineItem.adjustmentsKey)
    required List<BaseLineItemAdjustment> adjustments,

    /// cart
    @JsonKey(name: BaseCartLineItem.cartKey) required BaseCart cart,

    /// cartId
    @JsonKey(name: BaseCartLineItem.cartIdKey) required String cartId,

    /// metadata
    @JsonKey(name: BaseCartLineItem.metadataKey)
    required Map<String, dynamic> metadata,

    /// createdAt
    @JsonKey(name: BaseCartLineItem.createdAtKey) required DateTime createdAt,

    /// updatedAt
    @JsonKey(name: BaseCartLineItem.updatedAtKey) required DateTime updatedAt,

    /// deletedAt
    @JsonKey(name: BaseCartLineItem.deletedAtKey) required DateTime deletedAt,

    /// originalTotal
    @JsonKey(name: BaseCartLineItem.originalTotalKey)
    required double originalTotal,

    /// originalSubtotal
    @JsonKey(name: BaseCartLineItem.originalSubtotalKey)
    required double originalSubtotal,

    /// originalTaxTotal
    @JsonKey(name: BaseCartLineItem.originalTaxTotalKey)
    required double originalTaxTotal,

    /// itemTotal
    @JsonKey(name: BaseCartLineItem.itemTotalKey) required double itemTotal,

    /// itemSubtotal
    @JsonKey(name: BaseCartLineItem.itemSubtotalKey)
    required double itemSubtotal,

    /// itemTaxTotal
    @JsonKey(name: BaseCartLineItem.itemTaxTotalKey)
    required double itemTaxTotal,

    /// total
    @JsonKey(name: BaseCartLineItem.totalKey) required double total,

    /// subtotal
    @JsonKey(name: BaseCartLineItem.subtotalKey) required double subtotal,

    /// taxTotal
    @JsonKey(name: BaseCartLineItem.taxTotalKey) required double taxTotal,

    /// discountTotal
    @JsonKey(name: BaseCartLineItem.discountTotalKey)
    required double discountTotal,

    /// discountTaxTotal
    @JsonKey(name: BaseCartLineItem.discountTaxTotalKey)
    required double discountTaxTotal,
  }) = _BaseCartLineItem;

  factory BaseCartLineItem.fromJson(Map<String, dynamic> json) =>
      _$BaseCartLineItemFromJson(json);

  static const String idKey = r'id';

  static const String titleKey = r'title';

  static const String subtitleKey = r'subtitle';

  static const String thumbnailKey = r'thumbnail';

  static const String quantityKey = r'quantity';

  static const String productKey = r'product';

  static const String productIdKey = r'product_id';

  static const String productTitleKey = r'product_title';

  static const String productDescriptionKey = r'product_description';

  static const String productSubtitleKey = r'product_subtitle';

  static const String productTypeKey = r'product_type';

  static const String productCollectionKey = r'product_collection';

  static const String productHandleKey = r'product_handle';

  static const String variantKey = r'variant';

  static const String variantIdKey = r'variant_id';

  static const String variantSkuKey = r'variant_sku';

  static const String variantBarcodeKey = r'variant_barcode';

  static const String variantTitleKey = r'variant_title';

  static const String variantOptionValuesKey = r'variant_option_values';

  static const String requiresShippingKey = r'requires_shipping';

  static const String isDiscountableKey = r'is_discountable';

  static const String isTaxInclusiveKey = r'is_tax_inclusive';

  static const String compareAtUnitPriceKey = r'compare_at_unit_price';

  static const String unitPriceKey = r'unit_price';

  static const String taxLinesKey = r'tax_lines';

  static const String adjustmentsKey = r'adjustments';

  static const String cartKey = r'cart';

  static const String cartIdKey = r'cart_id';

  static const String metadataKey = r'metadata';

  static const String createdAtKey = r'created_at';

  static const String updatedAtKey = r'updated_at';

  static const String deletedAtKey = r'deleted_at';

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
}
