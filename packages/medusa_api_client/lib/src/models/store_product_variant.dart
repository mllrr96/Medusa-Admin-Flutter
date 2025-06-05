/// StoreProductVariant
/// {
///     "properties": {
///         "options": {
///             "type": "array",
///             "items": {
///                 "$ref": "#/components/schemas/StoreProductOptionValue"
///             },
///             "description": "The variant's options."
///         },
///         "product": {
///             "type": "object"
///         },
///         "length": {
///             "type": "number",
///             "description": "The variant's length.",
///             "title": "length"
///         },
///         "title": {
///             "type": "string",
///             "description": "The variant's title.",
///             "title": "title"
///         },
///         "metadata": {
///             "type": "object",
///             "description": "The variant's metadata, can hold custom key-value pairs."
///         },
///         "id": {
///             "type": "string",
///             "description": "The variant's ID.",
///             "title": "id"
///         },
///         "width": {
///             "type": "number",
///             "description": "The variant's width.",
///             "title": "width"
///         },
///         "weight": {
///             "type": "number",
///             "description": "The variant's weight.",
///             "title": "weight"
///         },
///         "height": {
///             "type": "number",
///             "description": "The variant's height.",
///             "title": "height"
///         },
///         "origin_country": {
///             "type": "string",
///             "description": "The variant's origin country.",
///             "title": "origin_country"
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
///         "material": {
///             "type": "string",
///             "description": "The variant's material.",
///             "title": "material"
///         },
///         "created_at": {
///             "type": "string",
///             "format": "date-time",
///             "description": "The date the variant was created.",
///             "title": "created_at"
///         },
///         "updated_at": {
///             "type": "string",
///             "format": "date-time",
///             "description": "The date the variant was updated.",
///             "title": "updated_at"
///         },
///         "deleted_at": {
///             "type": "string",
///             "format": "date-time",
///             "description": "The date the variant was deleted.",
///             "title": "deleted_at"
///         },
///         "product_id": {
///             "type": "string",
///             "description": "The ID of the product this variant belongs to.",
///             "title": "product_id"
///         },
///         "sku": {
///             "type": "string",
///             "description": "The variant's SKU.",
///             "title": "sku"
///         },
///         "barcode": {
///             "type": "string",
///             "description": "The variant's barcode.",
///             "title": "barcode"
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
///         "allow_backorder": {
///             "type": "boolean",
///             "description": "Whether the variant can be ordered even if it's not in stock.",
///             "title": "allow_backorder"
///         },
///         "manage_inventory": {
///             "type": "boolean",
///             "description": "Whether Medusa manages the variant's inventory. If disabled, the variant is always considered in stock.",
///             "title": "manage_inventory"
///         },
///         "inventory_quantity": {
///             "type": "number",
///             "description": "The variant's inventory quantity. This property is only available if you pass `+variants.inventory_quantity` in the `fields` query parameter.",
///             "title": "inventory_quantity"
///         },
///         "variant_rank": {
///             "type": "number",
///             "description": "The variant's rank among its siblings.",
///             "title": "variant_rank"
///         },
///         "calculated_price": {
///             "$ref": "#/components/schemas/BaseCalculatedPriceSet"
///         }
///     },
///     "type": "object",
///     "required": [
///         "options",
///         "length",
///         "title",
///         "id",
///         "created_at",
///         "updated_at",
///         "width",
///         "weight",
///         "height",
///         "origin_country",
///         "hs_code",
///         "mid_code",
///         "material",
///         "deleted_at",
///         "sku",
///         "barcode",
///         "ean",
///         "upc",
///         "allow_backorder",
///         "manage_inventory"
///     ],
///     "description": "The variant's details."
/// }
library;

import 'exports.dart';
part 'store_product_variant.freezed.dart';
part 'store_product_variant.g.dart'; // StoreProductVariant

@freezed
abstract class StoreProductVariant with _$StoreProductVariant {
  const StoreProductVariant._();

  @jsonSerializable
  const factory StoreProductVariant({
    /// options
    @JsonKey(name: StoreProductVariant.optionsKey)
    required List<StoreProductOptionValue> options,

    /// product
    @JsonKey(name: StoreProductVariant.productKey)
    required Map<String, dynamic> product,

    /// length
    @JsonKey(name: StoreProductVariant.lengthKey) required double length,

    /// title
    @JsonKey(name: StoreProductVariant.titleKey) required String title,

    /// metadata
    @JsonKey(name: StoreProductVariant.metadataKey)
    required Map<String, dynamic> metadata,

    /// id
    @JsonKey(name: StoreProductVariant.idKey) required String id,

    /// width
    @JsonKey(name: StoreProductVariant.widthKey) required double width,

    /// weight
    @JsonKey(name: StoreProductVariant.weightKey) required double weight,

    /// height
    @JsonKey(name: StoreProductVariant.heightKey) required double height,

    /// originCountry
    @JsonKey(name: StoreProductVariant.originCountryKey)
    required String originCountry,

    /// hsCode
    @JsonKey(name: StoreProductVariant.hsCodeKey) required String hsCode,

    /// midCode
    @JsonKey(name: StoreProductVariant.midCodeKey) required String midCode,

    /// material
    @JsonKey(name: StoreProductVariant.materialKey) required String material,

    /// createdAt
    @JsonKey(name: StoreProductVariant.createdAtKey)
    required DateTime createdAt,

    /// updatedAt
    @JsonKey(name: StoreProductVariant.updatedAtKey)
    required DateTime updatedAt,

    /// deletedAt
    @JsonKey(name: StoreProductVariant.deletedAtKey)
    required DateTime deletedAt,

    /// productId
    @JsonKey(name: StoreProductVariant.productIdKey) required String productId,

    /// sku
    @JsonKey(name: StoreProductVariant.skuKey) required String sku,

    /// barcode
    @JsonKey(name: StoreProductVariant.barcodeKey) required String barcode,

    /// ean
    @JsonKey(name: StoreProductVariant.eanKey) required String ean,

    /// upc
    @JsonKey(name: StoreProductVariant.upcKey) required String upc,

    /// allowBackorder
    @JsonKey(name: StoreProductVariant.allowBackorderKey)
    required bool allowBackorder,

    /// manageInventory
    @JsonKey(name: StoreProductVariant.manageInventoryKey)
    required bool manageInventory,

    /// inventoryQuantity
    @JsonKey(name: StoreProductVariant.inventoryQuantityKey)
    required double inventoryQuantity,

    /// variantRank
    @JsonKey(name: StoreProductVariant.variantRankKey)
    required double variantRank,

    /// calculatedPrice
    @JsonKey(name: StoreProductVariant.calculatedPriceKey)
    required BaseCalculatedPriceSet calculatedPrice,
  }) = _StoreProductVariant;

  factory StoreProductVariant.fromJson(Map<String, dynamic> json) =>
      _$StoreProductVariantFromJson(json);

  static const String optionsKey = r'options';

  static const String productKey = r'product';

  static const String lengthKey = r'length';

  static const String titleKey = r'title';

  static const String metadataKey = r'metadata';

  static const String idKey = r'id';

  static const String widthKey = r'width';

  static const String weightKey = r'weight';

  static const String heightKey = r'height';

  static const String originCountryKey = r'origin_country';

  static const String hsCodeKey = r'hs_code';

  static const String midCodeKey = r'mid_code';

  static const String materialKey = r'material';

  static const String createdAtKey = r'created_at';

  static const String updatedAtKey = r'updated_at';

  static const String deletedAtKey = r'deleted_at';

  static const String productIdKey = r'product_id';

  static const String skuKey = r'sku';

  static const String barcodeKey = r'barcode';

  static const String eanKey = r'ean';

  static const String upcKey = r'upc';

  static const String allowBackorderKey = r'allow_backorder';

  static const String manageInventoryKey = r'manage_inventory';

  static const String inventoryQuantityKey = r'inventory_quantity';

  static const String variantRankKey = r'variant_rank';

  static const String calculatedPriceKey = r'calculated_price';
}
