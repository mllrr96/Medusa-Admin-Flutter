/// AdminBatchUpdateProductVariant
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
///         },
///         "id": {
///             "type": "string",
///             "description": "The update's ID.",
///             "title": "id"
///         }
///     },
///     "type": "object",
///     "required": [
///         "id"
///     ],
///     "description": "The properties to update of a product variant."
/// }
library;

import 'exports.dart';
part 'admin_batch_update_product_variant.freezed.dart';
part 'admin_batch_update_product_variant.g.dart'; // AdminBatchUpdateProductVariant

@freezed
abstract class AdminBatchUpdateProductVariant
    with _$AdminBatchUpdateProductVariant {
  const AdminBatchUpdateProductVariant._();

  @jsonSerializable
  const factory AdminBatchUpdateProductVariant({
    /// title
    @JsonKey(name: AdminBatchUpdateProductVariant.titleKey)
    required String title,

    /// sku
    @JsonKey(name: AdminBatchUpdateProductVariant.skuKey) required String sku,

    /// ean
    @JsonKey(name: AdminBatchUpdateProductVariant.eanKey) required String ean,

    /// upc
    @JsonKey(name: AdminBatchUpdateProductVariant.upcKey) required String upc,

    /// barcode
    @JsonKey(name: AdminBatchUpdateProductVariant.barcodeKey)
    required String barcode,

    /// hsCode
    @JsonKey(name: AdminBatchUpdateProductVariant.hsCodeKey)
    required String hsCode,

    /// midCode
    @JsonKey(name: AdminBatchUpdateProductVariant.midCodeKey)
    required String midCode,

    /// allowBackorder
    @JsonKey(name: AdminBatchUpdateProductVariant.allowBackorderKey)
    required bool allowBackorder,

    /// manageInventory
    @JsonKey(name: AdminBatchUpdateProductVariant.manageInventoryKey)
    required bool manageInventory,

    /// variantRank
    @JsonKey(name: AdminBatchUpdateProductVariant.variantRankKey)
    required double variantRank,

    /// weight
    @JsonKey(name: AdminBatchUpdateProductVariant.weightKey)
    required double weight,

    /// length
    @JsonKey(name: AdminBatchUpdateProductVariant.lengthKey)
    required double length,

    /// height
    @JsonKey(name: AdminBatchUpdateProductVariant.heightKey)
    required double height,

    /// width
    @JsonKey(name: AdminBatchUpdateProductVariant.widthKey)
    required double width,

    /// originCountry
    @JsonKey(name: AdminBatchUpdateProductVariant.originCountryKey)
    required String originCountry,

    /// material
    @JsonKey(name: AdminBatchUpdateProductVariant.materialKey)
    required String material,

    /// metadata
    @JsonKey(name: AdminBatchUpdateProductVariant.metadataKey)
    required Map<String, dynamic> metadata,

    /// prices
    @JsonKey(name: AdminBatchUpdateProductVariant.pricesKey)
    required List<AdminCreateProductVariantPrice> prices,

    /// options
    @JsonKey(name: AdminBatchUpdateProductVariant.optionsKey)
    required Map<String, dynamic> options,

    /// id
    @JsonKey(name: AdminBatchUpdateProductVariant.idKey) required String id,
  }) = _AdminBatchUpdateProductVariant;

  factory AdminBatchUpdateProductVariant.fromJson(Map<String, dynamic> json) =>
      _$AdminBatchUpdateProductVariantFromJson(json);

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

  static const String idKey = r'id';
}
