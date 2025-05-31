/// BaseProductVariant
/// {
///     "properties": {
///         "id": {
///             "type": "string",
///             "description": "The variant's ID.",
///             "title": "id"
///         },
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
///         "barcode": {
///             "type": "string",
///             "description": "The variant's barcode.",
///             "title": "barcode"
///         },
///         "ean": {
///             "type": "string",
///             "description": "The variant's EAN code.",
///             "title": "ean"
///         },
///         "upc": {
///             "type": "string",
///             "description": "The variant's UPC.",
///             "title": "upc"
///         },
///         "allow_backorder": {
///             "type": "boolean",
///             "description": "Whether the variant can be ordered even if it's out of stock.",
///             "title": "allow_backorder"
///         },
///         "manage_inventory": {
///             "type": "boolean",
///             "description": "Whether the Medusa application manages the variant's inventory quantity and availablility. If disabled, the variant is always considered in stock.",
///             "title": "manage_inventory"
///         },
///         "inventory_quantity": {
///             "type": "number",
///             "description": "The variant's inventory quantity. This is only included if you pass in the `fields` query parameter a `+variants.inventory_quantity` parameter.",
///             "title": "inventory_quantity"
///         },
///         "hs_code": {
///             "type": "string",
///             "description": "The variant's HS code.",
///             "title": "hs_code"
///         },
///         "origin_country": {
///             "type": "string",
///             "description": "The variant's origin country.",
///             "title": "origin_country"
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
///         "variant_rank": {
///             "type": "number",
///             "description": "The variant's rank among its sibling variants.",
///             "title": "variant_rank"
///         },
///         "options": {
///             "type": "array",
///             "items": {
///                 "$ref": "#/components/schemas/BaseProductOptionValue"
///             },
///             "description": "The variant's option values."
///         },
///         "product": {
///             "$ref": "#/components/schemas/BaseProduct"
///         },
///         "product_id": {
///             "type": "string",
///             "description": "The ID of the product that the variant belongs to.",
///             "title": "product_id"
///         },
///         "calculated_price": {
///             "$ref": "#/components/schemas/BaseCalculatedPriceSet"
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
///         "metadata": {
///             "type": "object",
///             "description": "The variant's metadata, can hold custom key-value pairs."
///         }
///     },
///     "type": "object",
///     "required": [
///         "id",
///         "title",
///         "sku",
///         "barcode",
///         "ean",
///         "upc",
///         "allow_backorder",
///         "manage_inventory",
///         "hs_code",
///         "origin_country",
///         "mid_code",
///         "material",
///         "weight",
///         "length",
///         "height",
///         "width",
///         "options",
///         "created_at",
///         "updated_at",
///         "deleted_at"
///     ],
///     "description": "The product variant's details."
/// }
library base_product_variant;

import 'exports.dart';
part 'base_product_variant.freezed.dart';
part 'base_product_variant.g.dart'; // BaseProductVariant

@freezed
abstract class BaseProductVariant with _$BaseProductVariant {
  const BaseProductVariant._();

  @jsonSerializable
  const factory BaseProductVariant({
    /// id
    @JsonKey(name: BaseProductVariant.idKey) required String id,

    /// title
    @JsonKey(name: BaseProductVariant.titleKey) required String title,

    /// sku
    @JsonKey(name: BaseProductVariant.skuKey) required String sku,

    /// barcode
    @JsonKey(name: BaseProductVariant.barcodeKey) required String barcode,

    /// ean
    @JsonKey(name: BaseProductVariant.eanKey) required String ean,

    /// upc
    @JsonKey(name: BaseProductVariant.upcKey) required String upc,

    /// allowBackorder
    @JsonKey(name: BaseProductVariant.allowBackorderKey)
    required bool allowBackorder,

    /// manageInventory
    @JsonKey(name: BaseProductVariant.manageInventoryKey)
    required bool manageInventory,

    /// inventoryQuantity
    @JsonKey(name: BaseProductVariant.inventoryQuantityKey)
    required double inventoryQuantity,

    /// hsCode
    @JsonKey(name: BaseProductVariant.hsCodeKey) required String hsCode,

    /// originCountry
    @JsonKey(name: BaseProductVariant.originCountryKey)
    required String originCountry,

    /// midCode
    @JsonKey(name: BaseProductVariant.midCodeKey) required String midCode,

    /// material
    @JsonKey(name: BaseProductVariant.materialKey) required String material,

    /// weight
    @JsonKey(name: BaseProductVariant.weightKey) required double weight,

    /// length
    @JsonKey(name: BaseProductVariant.lengthKey) required double length,

    /// height
    @JsonKey(name: BaseProductVariant.heightKey) required double height,

    /// width
    @JsonKey(name: BaseProductVariant.widthKey) required double width,

    /// variantRank
    @JsonKey(name: BaseProductVariant.variantRankKey)
    required double variantRank,

    /// options
    @JsonKey(name: BaseProductVariant.optionsKey)
    required List<BaseProductOptionValue> options,

    /// product
    @JsonKey(name: BaseProductVariant.productKey) required BaseProduct product,

    /// productId
    @JsonKey(name: BaseProductVariant.productIdKey) required String productId,

    /// calculatedPrice
    @JsonKey(name: BaseProductVariant.calculatedPriceKey)
    required BaseCalculatedPriceSet calculatedPrice,

    /// createdAt
    @JsonKey(name: BaseProductVariant.createdAtKey) required DateTime createdAt,

    /// updatedAt
    @JsonKey(name: BaseProductVariant.updatedAtKey) required DateTime updatedAt,

    /// deletedAt
    @JsonKey(name: BaseProductVariant.deletedAtKey) required DateTime deletedAt,

    /// metadata
    @JsonKey(name: BaseProductVariant.metadataKey)
    required Map<String, dynamic> metadata,
  }) = _BaseProductVariant;

  factory BaseProductVariant.fromJson(Map<String, dynamic> json) =>
      _$BaseProductVariantFromJson(json);

  static const String idKey = r'id';

  static const String titleKey = r'title';

  static const String skuKey = r'sku';

  static const String barcodeKey = r'barcode';

  static const String eanKey = r'ean';

  static const String upcKey = r'upc';

  static const String allowBackorderKey = r'allow_backorder';

  static const String manageInventoryKey = r'manage_inventory';

  static const String inventoryQuantityKey = r'inventory_quantity';

  static const String hsCodeKey = r'hs_code';

  static const String originCountryKey = r'origin_country';

  static const String midCodeKey = r'mid_code';

  static const String materialKey = r'material';

  static const String weightKey = r'weight';

  static const String lengthKey = r'length';

  static const String heightKey = r'height';

  static const String widthKey = r'width';

  static const String variantRankKey = r'variant_rank';

  static const String optionsKey = r'options';

  static const String productKey = r'product';

  static const String productIdKey = r'product_id';

  static const String calculatedPriceKey = r'calculated_price';

  static const String createdAtKey = r'created_at';

  static const String updatedAtKey = r'updated_at';

  static const String deletedAtKey = r'deleted_at';

  static const String metadataKey = r'metadata';
}
