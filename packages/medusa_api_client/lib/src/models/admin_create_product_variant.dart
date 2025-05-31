/// AdminCreateProductVariant
/// {
///     "properties": {
///         "title": {
///             "type": "string",
///             "description": "The variant's title.",
///             "title": "title"
///         },
///         "sku": {
///             "type": "string",
///             "description": "The variant's SKU.",
///             "title": "sku"
///         },
///         "ean": {
///             "type": "string",
///             "description": "The variant's EAN.",
///             "title": "ean"
///         },
///         "upc": {
///             "type": "string",
///             "description": "The variant's UPC.",
///             "title": "upc"
///         },
///         "barcode": {
///             "type": "string",
///             "description": "The variant's barcode.",
///             "title": "barcode"
///         },
///         "hs_code": {
///             "type": "string",
///             "description": "The variant's HS code.",
///             "title": "hs_code"
///         },
///         "mid_code": {
///             "type": "string",
///             "description": "The variant's MID code.",
///             "title": "mid_code"
///         },
///         "allow_backorder": {
///             "type": "boolean",
///             "description": "Whether it's allowed to order this variant when it's out of stock.",
///             "title": "allow_backorder"
///         },
///         "manage_inventory": {
///             "type": "boolean",
///             "description": "Whether Medusa manages the variant's inventory quantity. If disabled, the product variant is always considered in stock.",
///             "title": "manage_inventory"
///         },
///         "variant_rank": {
///             "type": "number",
///             "description": "The sorting order of the variant among other variants in the product.",
///             "title": "variant_rank"
///         },
///         "weight": {
///             "type": "number",
///             "description": "The variant's weight.",
///             "title": "weight"
///         },
///         "length": {
///             "type": "number",
///             "description": "The variant's length.",
///             "title": "length"
///         },
///         "height": {
///             "type": "number",
///             "description": "The variant's height.",
///             "title": "height"
///         },
///         "width": {
///             "type": "number",
///             "description": "The variant's width.",
///             "title": "width"
///         },
///         "origin_country": {
///             "type": "string",
///             "description": "The variant's origin country.",
///             "title": "origin_country"
///         },
///         "material": {
///             "type": "string",
///             "description": "The variant's material.",
///             "title": "material"
///         },
///         "metadata": {
///             "type": "object",
///             "description": "The variant's metadata, used to store custom key-value pairs."
///         },
///         "prices": {
///             "type": "array",
///             "items": {
///                 "$ref": "#/components/schemas/AdminCreateProductVariantPrice"
///             },
///             "description": "The variant's prices."
///         },
///         "options": {
///             "type": "object",
///             "description": "The variant's options, where the key is an option's name, and the value is the option's value."
///         },
///         "inventory_items": {
///             "type": "array",
///             "items": {
///                 "$ref": "#/components/schemas/AdminCreateProductVariantInventoryKit"
///             },
///             "description": "The variant's inventory items to create."
///         }
///     },
///     "type": "object",
///     "required": [
///         "title",
///         "prices"
///     ],
///     "description": "The product variant's details."
/// }
library;

import 'exports.dart';
part 'admin_create_product_variant.freezed.dart';
part 'admin_create_product_variant.g.dart'; // AdminCreateProductVariant

@freezed
abstract class AdminCreateProductVariant with _$AdminCreateProductVariant {
  const AdminCreateProductVariant._();

  @jsonSerializable
  const factory AdminCreateProductVariant({
    /// title
    @JsonKey(name: AdminCreateProductVariant.titleKey) required String title,

    /// sku
    @JsonKey(name: AdminCreateProductVariant.skuKey) required String sku,

    /// ean
    @JsonKey(name: AdminCreateProductVariant.eanKey) required String ean,

    /// upc
    @JsonKey(name: AdminCreateProductVariant.upcKey) required String upc,

    /// barcode
    @JsonKey(name: AdminCreateProductVariant.barcodeKey)
    required String barcode,

    /// hsCode
    @JsonKey(name: AdminCreateProductVariant.hsCodeKey) required String hsCode,

    /// midCode
    @JsonKey(name: AdminCreateProductVariant.midCodeKey)
    required String midCode,

    /// allowBackorder
    @JsonKey(name: AdminCreateProductVariant.allowBackorderKey)
    required bool allowBackorder,

    /// manageInventory
    @JsonKey(name: AdminCreateProductVariant.manageInventoryKey)
    required bool manageInventory,

    /// variantRank
    @JsonKey(name: AdminCreateProductVariant.variantRankKey)
    required double variantRank,

    /// weight
    @JsonKey(name: AdminCreateProductVariant.weightKey) required double weight,

    /// length
    @JsonKey(name: AdminCreateProductVariant.lengthKey) required double length,

    /// height
    @JsonKey(name: AdminCreateProductVariant.heightKey) required double height,

    /// width
    @JsonKey(name: AdminCreateProductVariant.widthKey) required double width,

    /// originCountry
    @JsonKey(name: AdminCreateProductVariant.originCountryKey)
    required String originCountry,

    /// material
    @JsonKey(name: AdminCreateProductVariant.materialKey)
    required String material,

    /// metadata
    @JsonKey(name: AdminCreateProductVariant.metadataKey)
    required Map<String, dynamic> metadata,

    /// prices
    @JsonKey(name: AdminCreateProductVariant.pricesKey)
    required List<AdminCreateProductVariantPrice> prices,

    /// options
    @JsonKey(name: AdminCreateProductVariant.optionsKey)
    required Map<String, dynamic> options,

    /// inventoryItems
    @JsonKey(name: AdminCreateProductVariant.inventoryItemsKey)
    required List<AdminCreateProductVariantInventoryKit> inventoryItems,
  }) = _AdminCreateProductVariant;

  factory AdminCreateProductVariant.fromJson(Map<String, dynamic> json) =>
      _$AdminCreateProductVariantFromJson(json);

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

  static const String inventoryItemsKey = r'inventory_items';
}
