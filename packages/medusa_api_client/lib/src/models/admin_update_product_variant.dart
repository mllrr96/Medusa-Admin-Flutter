/// AdminUpdateProductVariant
/// {
///     "properties": {
///         "title": {
///             "type": "string",
///             "description": "The product variant's title.",
///             "title": "title"
///         },
///         "sku": {
///             "type": "string",
///             "description": "The product variant's SKU.",
///             "title": "sku"
///         },
///         "ean": {
///             "type": "string",
///             "description": "The product variant's EAN.",
///             "title": "ean"
///         },
///         "upc": {
///             "type": "string",
///             "description": "The product variant's UPC.",
///             "title": "upc"
///         },
///         "barcode": {
///             "type": "string",
///             "description": "The product variant's barcode.",
///             "title": "barcode"
///         },
///         "hs_code": {
///             "type": "string",
///             "description": "The product variant's HS code.",
///             "title": "hs_code"
///         },
///         "mid_code": {
///             "type": "string",
///             "description": "The product variant's MID code.",
///             "title": "mid_code"
///         },
///         "allow_backorder": {
///             "type": "boolean",
///             "description": "Whether customers can order the variant even if it's not in stock.",
///             "title": "allow_backorder"
///         },
///         "manage_inventory": {
///             "type": "boolean",
///             "description": "Whether the Medusa application manages the variant's inventory. If disabled, the product variant is always considered in stock.",
///             "title": "manage_inventory"
///         },
///         "variant_rank": {
///             "type": "number",
///             "description": "The product variant's rank among its siblings.",
///             "title": "variant_rank"
///         },
///         "weight": {
///             "type": "number",
///             "description": "The product variant's weight.",
///             "title": "weight"
///         },
///         "length": {
///             "type": "number",
///             "description": "The product variant's length.",
///             "title": "length"
///         },
///         "height": {
///             "type": "number",
///             "description": "The product variant's height.",
///             "title": "height"
///         },
///         "width": {
///             "type": "number",
///             "description": "The product variant's width.",
///             "title": "width"
///         },
///         "origin_country": {
///             "type": "string",
///             "description": "The product variant's origin country.",
///             "title": "origin_country"
///         },
///         "material": {
///             "type": "string",
///             "description": "The product variant's material.",
///             "title": "material"
///         },
///         "metadata": {
///             "type": "object",
///             "description": "The product variant's metadata, can hold custom key-value pairs."
///         },
///         "prices": {
///             "type": "array",
///             "items": {
///                 "$ref": "#/components/schemas/AdminCreateProductVariantPrice"
///             },
///             "description": "The product variant's prices."
///         },
///         "options": {
///             "type": "object",
///             "description": "The product variant's options."
///         }
///     },
///     "type": "object",
///     "description": "The properties to update of a product variant."
/// }
library;

import 'exports.dart';
part 'admin_update_product_variant.freezed.dart';
part 'admin_update_product_variant.g.dart'; // AdminUpdateProductVariant

@freezed
abstract class AdminUpdateProductVariant with _$AdminUpdateProductVariant {
  const AdminUpdateProductVariant._();

  @jsonSerializable
  const factory AdminUpdateProductVariant({
    /// title
    @JsonKey(name: AdminUpdateProductVariant.titleKey) required String title,

    /// sku
    @JsonKey(name: AdminUpdateProductVariant.skuKey) required String sku,

    /// ean
    @JsonKey(name: AdminUpdateProductVariant.eanKey) required String ean,

    /// upc
    @JsonKey(name: AdminUpdateProductVariant.upcKey) required String upc,

    /// barcode
    @JsonKey(name: AdminUpdateProductVariant.barcodeKey)
    required String barcode,

    /// hsCode
    @JsonKey(name: AdminUpdateProductVariant.hsCodeKey) required String hsCode,

    /// midCode
    @JsonKey(name: AdminUpdateProductVariant.midCodeKey)
    required String midCode,

    /// allowBackorder
    @JsonKey(name: AdminUpdateProductVariant.allowBackorderKey)
    required bool allowBackorder,

    /// manageInventory
    @JsonKey(name: AdminUpdateProductVariant.manageInventoryKey)
    required bool manageInventory,

    /// variantRank
    @JsonKey(name: AdminUpdateProductVariant.variantRankKey)
    required double variantRank,

    /// weight
    @JsonKey(name: AdminUpdateProductVariant.weightKey) required double weight,

    /// length
    @JsonKey(name: AdminUpdateProductVariant.lengthKey) required double length,

    /// height
    @JsonKey(name: AdminUpdateProductVariant.heightKey) required double height,

    /// width
    @JsonKey(name: AdminUpdateProductVariant.widthKey) required double width,

    /// originCountry
    @JsonKey(name: AdminUpdateProductVariant.originCountryKey)
    required String originCountry,

    /// material
    @JsonKey(name: AdminUpdateProductVariant.materialKey)
    required String material,

    /// metadata
    @JsonKey(name: AdminUpdateProductVariant.metadataKey)
    required Map<String, dynamic> metadata,

    /// prices
    @JsonKey(name: AdminUpdateProductVariant.pricesKey)
    required List<AdminCreateProductVariantPrice> prices,

    /// options
    @JsonKey(name: AdminUpdateProductVariant.optionsKey)
    required Map<String, dynamic> options,
  }) = _AdminUpdateProductVariant;

  factory AdminUpdateProductVariant.fromJson(Map<String, dynamic> json) =>
      _$AdminUpdateProductVariantFromJson(json);

  static const String titleKey = r'title';

  static const String skuKey = r'sku';

  static const String eanKey = r'ean';

  static const String upcKey = r'upc';

  static const String barcodeKey = r'barcode';

  static const String hsCodeKey = r'hs_code';

  static const String midCodeKey = r'mid_code';

  static const String allowBackorderKey = r'allow_backorder';

  static const String manageInventoryKey = r'manage_inventory';

  static const String variantRankKey = r'variant_rank';

  static const String weightKey = r'weight';

  static const String lengthKey = r'length';

  static const String heightKey = r'height';

  static const String widthKey = r'width';

  static const String originCountryKey = r'origin_country';

  static const String materialKey = r'material';

  static const String metadataKey = r'metadata';

  static const String pricesKey = r'prices';

  static const String optionsKey = r'options';
}
