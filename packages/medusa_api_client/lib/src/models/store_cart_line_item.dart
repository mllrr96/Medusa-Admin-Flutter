/// StoreCartLineItem
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
///         "quantity": {
///             "type": "number",
///             "description": "The item's quantity.",
///             "title": "quantity"
///         },
///         "product": {
///             "$ref": "#/components/schemas/StoreProduct"
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
///         "variant": {
///             "$ref": "#/components/schemas/StoreProductVariant"
///         },
///         "variant_id": {
///             "type": "string",
///             "description": "The ID of the associated product variant.",
///             "title": "variant_id"
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
///             "description": "The associated variant's value for the product's options."
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
///             "description": "The price of a single quantity of the item.",
///             "title": "unit_price"
///         },
///         "tax_lines": {
///             "type": "array",
///             "items": {
///                 "description": "The tax line's details"
///             },
///             "description": "The item's tax lines."
///         },
///         "adjustments": {
///             "type": "array",
///             "items": {
///                 "description": "The adjustment's details."
///             },
///             "description": "The item's adjustments."
///         },
///         "cart": {
///             "type": "object"
///         },
///         "cart_id": {
///             "type": "string",
///             "description": "The ID of the cart that the line item belongs to.",
///             "title": "cart_id"
///         },
///         "metadata": {
///             "type": "object",
///             "description": "The item's metadata, can hold custom key-value pairs."
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
///         "deleted_at": {
///             "type": "string",
///             "format": "date-time",
///             "description": "The date the item was deleted.",
///             "title": "deleted_at"
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
///             "description": "The total taxes of the item excluding promotions.",
///             "title": "original_tax_total"
///         },
///         "item_total": {
///             "type": "number",
///             "description": "The item's total including taxes and promotions.",
///             "title": "original_tax_total"
///         },
///         "item_subtotal": {
///             "type": "number",
///             "description": "The item's total excluding taxes, including promotions.",
///             "title": "item_subtotal"
///         },
///         "item_tax_total": {
///             "type": "number",
///             "description": "The total taxes of the item including promotions.",
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
///             "description": "The total taxes of the item including promotions.",
///             "title": "tax_total"
///         },
///         "discount_total": {
///             "type": "number",
///             "description": "The total discount of the item.",
///             "title": "discount_total"
///         },
///         "discount_tax_total": {
///             "type": "number",
///             "description": "The total taxes applied on the discounted amount.",
///             "title": "discount_tax_total"
///         }
///     },
///     "type": "object",
///     "required": [
///         "cart",
///         "title",
///         "id",
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
///         "requires_shipping",
///         "is_discountable",
///         "is_tax_inclusive",
///         "unit_price",
///         "quantity",
///         "cart_id"
///     ],
///     "description": "The item's details."
/// }
library;

import 'exports.dart';
part 'store_cart_line_item.freezed.dart';
part 'store_cart_line_item.g.dart'; // StoreCartLineItem

@freezed
abstract class StoreCartLineItem with _$StoreCartLineItem {
  const StoreCartLineItem._();

  @jsonSerializable
  const factory StoreCartLineItem({
    /// id
    @JsonKey(name: StoreCartLineItem.idKey) required String id,

    /// title
    @JsonKey(name: StoreCartLineItem.titleKey) required String title,

    /// subtitle
    @JsonKey(name: StoreCartLineItem.subtitleKey) required String subtitle,

    /// thumbnail
    @JsonKey(name: StoreCartLineItem.thumbnailKey) required String thumbnail,

    /// quantity
    @JsonKey(name: StoreCartLineItem.quantityKey) required double quantity,

    /// product
    @JsonKey(name: StoreCartLineItem.productKey) required StoreProduct product,

    /// productId
    @JsonKey(name: StoreCartLineItem.productIdKey) required String productId,

    /// productTitle
    @JsonKey(name: StoreCartLineItem.productTitleKey)
    required String productTitle,

    /// productDescription
    @JsonKey(name: StoreCartLineItem.productDescriptionKey)
    required String productDescription,

    /// productSubtitle
    @JsonKey(name: StoreCartLineItem.productSubtitleKey)
    required String productSubtitle,

    /// productType
    @JsonKey(name: StoreCartLineItem.productTypeKey)
    required String productType,

    /// productCollection
    @JsonKey(name: StoreCartLineItem.productCollectionKey)
    required String productCollection,

    /// productHandle
    @JsonKey(name: StoreCartLineItem.productHandleKey)
    required String productHandle,

    /// variant
    @JsonKey(name: StoreCartLineItem.variantKey)
    required StoreProductVariant variant,

    /// variantId
    @JsonKey(name: StoreCartLineItem.variantIdKey) required String variantId,

    /// variantSku
    @JsonKey(name: StoreCartLineItem.variantSkuKey) required String variantSku,

    /// variantBarcode
    @JsonKey(name: StoreCartLineItem.variantBarcodeKey)
    required String variantBarcode,

    /// variantTitle
    @JsonKey(name: StoreCartLineItem.variantTitleKey)
    required String variantTitle,

    /// variantOptionValues
    @JsonKey(name: StoreCartLineItem.variantOptionValuesKey)
    required Map<String, dynamic> variantOptionValues,

    /// requiresShipping
    @JsonKey(name: StoreCartLineItem.requiresShippingKey)
    required bool requiresShipping,

    /// isDiscountable
    @JsonKey(name: StoreCartLineItem.isDiscountableKey)
    required bool isDiscountable,

    /// isTaxInclusive
    @JsonKey(name: StoreCartLineItem.isTaxInclusiveKey)
    required bool isTaxInclusive,

    /// compareAtUnitPrice
    @JsonKey(name: StoreCartLineItem.compareAtUnitPriceKey)
    required double compareAtUnitPrice,

    /// unitPrice
    @JsonKey(name: StoreCartLineItem.unitPriceKey) required double unitPrice,

    /// taxLines
    @JsonKey(name: StoreCartLineItem.taxLinesKey)
    required List<dynamic> taxLines,

    /// adjustments
    @JsonKey(name: StoreCartLineItem.adjustmentsKey)
    required List<dynamic> adjustments,

    /// cart
    @JsonKey(name: StoreCartLineItem.cartKey)
    required Map<String, dynamic> cart,

    /// cartId
    @JsonKey(name: StoreCartLineItem.cartIdKey) required String cartId,

    /// metadata
    @JsonKey(name: StoreCartLineItem.metadataKey)
    required Map<String, dynamic> metadata,

    /// createdAt
    @JsonKey(name: StoreCartLineItem.createdAtKey) required DateTime createdAt,

    /// updatedAt
    @JsonKey(name: StoreCartLineItem.updatedAtKey) required DateTime updatedAt,

    /// deletedAt
    @JsonKey(name: StoreCartLineItem.deletedAtKey) required DateTime deletedAt,

    /// originalTotal
    @JsonKey(name: StoreCartLineItem.originalTotalKey)
    required double originalTotal,

    /// originalSubtotal
    @JsonKey(name: StoreCartLineItem.originalSubtotalKey)
    required double originalSubtotal,

    /// originalTaxTotal
    @JsonKey(name: StoreCartLineItem.originalTaxTotalKey)
    required double originalTaxTotal,

    /// itemTotal
    @JsonKey(name: StoreCartLineItem.itemTotalKey) required double itemTotal,

    /// itemSubtotal
    @JsonKey(name: StoreCartLineItem.itemSubtotalKey)
    required double itemSubtotal,

    /// itemTaxTotal
    @JsonKey(name: StoreCartLineItem.itemTaxTotalKey)
    required double itemTaxTotal,

    /// total
    @JsonKey(name: StoreCartLineItem.totalKey) required double total,

    /// subtotal
    @JsonKey(name: StoreCartLineItem.subtotalKey) required double subtotal,

    /// taxTotal
    @JsonKey(name: StoreCartLineItem.taxTotalKey) required double taxTotal,

    /// discountTotal
    @JsonKey(name: StoreCartLineItem.discountTotalKey)
    required double discountTotal,

    /// discountTaxTotal
    @JsonKey(name: StoreCartLineItem.discountTaxTotalKey)
    required double discountTaxTotal,
  }) = _StoreCartLineItem;

  factory StoreCartLineItem.fromJson(Map<String, dynamic> json) =>
      _$StoreCartLineItemFromJson(json);

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
