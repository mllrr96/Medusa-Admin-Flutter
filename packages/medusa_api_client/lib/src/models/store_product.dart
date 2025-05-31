/// StoreProduct
/// {
///     "properties": {
///         "categories": {
///             "type": "array",
///             "items": {
///                 "type": "object"
///             },
///             "description": "The product's categories."
///         },
///         "type": {
///             "$ref": "#/components/schemas/StoreProductType"
///         },
///         "length": {
///             "type": "number",
///             "description": "The product's length.",
///             "title": "length"
///         },
///         "title": {
///             "type": "string",
///             "description": "The product's title.",
///             "title": "title"
///         },
///         "status": {
///             "enum": [
///                 "draft",
///                 "proposed",
///                 "published",
///                 "rejected"
///             ],
///             "type": "string",
///             "description": "The product's status."
///         },
///         "options": {
///             "type": "array",
///             "items": {
///                 "$ref": "#/components/schemas/StoreProductOption"
///             },
///             "description": "The product's options."
///         },
///         "description": {
///             "type": "string",
///             "description": "The product's description.",
///             "title": "description"
///         },
///         "id": {
///             "type": "string",
///             "description": "The product's ID.",
///             "title": "id"
///         },
///         "metadata": {
///             "type": "object",
///             "description": "The product's metadata, can hold custom key-value pairs."
///         },
///         "created_at": {
///             "type": "string",
///             "format": "date-time",
///             "description": "The date the product was created.",
///             "title": "created_at"
///         },
///         "updated_at": {
///             "type": "string",
///             "format": "date-time",
///             "description": "The date the product was updated.",
///             "title": "updated_at"
///         },
///         "variants": {
///             "type": "array",
///             "items": {
///                 "$ref": "#/components/schemas/StoreProductVariant"
///             },
///             "description": "The product's variants."
///         },
///         "handle": {
///             "type": "string",
///             "description": "The product's handle.",
///             "title": "handle"
///         },
///         "subtitle": {
///             "type": "string",
///             "description": "The product's subtitle.",
///             "title": "subtitle"
///         },
///         "is_giftcard": {
///             "type": "boolean",
///             "description": "Whether the product is a gift card.",
///             "title": "is_giftcard"
///         },
///         "thumbnail": {
///             "type": "string",
///             "description": "The product's thumbnail URL.",
///             "title": "thumbnail"
///         },
///         "width": {
///             "type": "number",
///             "description": "The product's width.",
///             "title": "width"
///         },
///         "weight": {
///             "type": "number",
///             "description": "The product's weight.",
///             "title": "weight"
///         },
///         "height": {
///             "type": "number",
///             "description": "The product's height.",
///             "title": "height"
///         },
///         "origin_country": {
///             "type": "string",
///             "description": "The product's origin country.",
///             "title": "origin_country"
///         },
///         "hs_code": {
///             "type": "string",
///             "description": "The product's HS code.",
///             "title": "hs_code"
///         },
///         "mid_code": {
///             "type": "string",
///             "description": "The product's MID code.",
///             "title": "mid_code"
///         },
///         "material": {
///             "type": "string",
///             "description": "The product's material.",
///             "title": "material"
///         },
///         "collection": {
///             "$ref": "#/components/schemas/StoreCollection"
///         },
///         "collection_id": {
///             "type": "string",
///             "description": "The ID of the collection that the product belongs to.",
///             "title": "collection_id"
///         },
///         "type_id": {
///             "type": "string",
///             "description": "The ID of the product's type.",
///             "title": "type_id"
///         },
///         "tags": {
///             "type": "array",
///             "items": {
///                 "$ref": "#/components/schemas/StoreProductTag"
///             },
///             "description": "The product's tags."
///         },
///         "images": {
///             "type": "array",
///             "items": {
///                 "$ref": "#/components/schemas/StoreProductImage"
///             },
///             "description": "The product's images."
///         },
///         "discountable": {
///             "type": "boolean",
///             "description": "Whether the product can be discounted.",
///             "title": "discountable"
///         },
///         "external_id": {
///             "type": "string",
///             "description": "The ID of the product in an external service or system.",
///             "title": "external_id"
///         },
///         "deleted_at": {
///             "type": "string",
///             "format": "date-time",
///             "description": "The date the product was deleted.",
///             "title": "deleted_at"
///         }
///     },
///     "type": "object",
///     "required": [
///         "variants",
///         "options",
///         "images",
///         "length",
///         "title",
///         "status",
///         "description",
///         "id",
///         "created_at",
///         "updated_at",
///         "subtitle",
///         "thumbnail",
///         "handle",
///         "is_giftcard",
///         "width",
///         "weight",
///         "height",
///         "origin_country",
///         "hs_code",
///         "mid_code",
///         "material",
///         "collection_id",
///         "type_id",
///         "discountable",
///         "external_id",
///         "deleted_at"
///     ],
///     "description": "The product's details."
/// }
library store_product;

import 'exports.dart';
part 'store_product.freezed.dart';
part 'store_product.g.dart'; // StoreProduct

@freezed
abstract class StoreProduct with _$StoreProduct {
  const StoreProduct._();

  @jsonSerializable
  const factory StoreProduct({
    /// categories
    @JsonKey(name: StoreProduct.categoriesKey)
    required List<Map<String, dynamic>> categories,

    /// type
    @JsonKey(name: StoreProduct.typeKey) required StoreProductType type,

    /// length
    @JsonKey(name: StoreProduct.lengthKey) required double length,

    /// title
    @JsonKey(name: StoreProduct.titleKey) required String title,

    /// status
    @JsonKey(name: StoreProduct.statusKey) required NullEnum status,

    /// options
    @JsonKey(name: StoreProduct.optionsKey)
    required List<StoreProductOption> options,

    /// description
    @JsonKey(name: StoreProduct.descriptionKey) required String description,

    /// id
    @JsonKey(name: StoreProduct.idKey) required String id,

    /// metadata
    @JsonKey(name: StoreProduct.metadataKey)
    required Map<String, dynamic> metadata,

    /// createdAt
    @JsonKey(name: StoreProduct.createdAtKey) required DateTime createdAt,

    /// updatedAt
    @JsonKey(name: StoreProduct.updatedAtKey) required DateTime updatedAt,

    /// variants
    @JsonKey(name: StoreProduct.variantsKey)
    required List<StoreProductVariant> variants,

    /// handle
    @JsonKey(name: StoreProduct.handleKey) required String handle,

    /// subtitle
    @JsonKey(name: StoreProduct.subtitleKey) required String subtitle,

    /// isGiftcard
    @JsonKey(name: StoreProduct.isGiftcardKey) required bool isGiftcard,

    /// thumbnail
    @JsonKey(name: StoreProduct.thumbnailKey) required String thumbnail,

    /// width
    @JsonKey(name: StoreProduct.widthKey) required double width,

    /// weight
    @JsonKey(name: StoreProduct.weightKey) required double weight,

    /// height
    @JsonKey(name: StoreProduct.heightKey) required double height,

    /// originCountry
    @JsonKey(name: StoreProduct.originCountryKey) required String originCountry,

    /// hsCode
    @JsonKey(name: StoreProduct.hsCodeKey) required String hsCode,

    /// midCode
    @JsonKey(name: StoreProduct.midCodeKey) required String midCode,

    /// material
    @JsonKey(name: StoreProduct.materialKey) required String material,

    /// collection
    @JsonKey(name: StoreProduct.collectionKey)
    required StoreCollection collection,

    /// collectionId
    @JsonKey(name: StoreProduct.collectionIdKey) required String collectionId,

    /// typeId
    @JsonKey(name: StoreProduct.typeIdKey) required String typeId,

    /// tags
    @JsonKey(name: StoreProduct.tagsKey) required List<StoreProductTag> tags,

    /// images
    @JsonKey(name: StoreProduct.imagesKey)
    required List<StoreProductImage> images,

    /// discountable
    @JsonKey(name: StoreProduct.discountableKey) required bool discountable,

    /// externalId
    @JsonKey(name: StoreProduct.externalIdKey) required String externalId,

    /// deletedAt
    @JsonKey(name: StoreProduct.deletedAtKey) required DateTime deletedAt,
  }) = _StoreProduct;

  factory StoreProduct.fromJson(Map<String, dynamic> json) =>
      _$StoreProductFromJson(json);

  static const String categoriesKey = r'categories';

  static const String typeKey = r'type';

  static const String lengthKey = r'length';

  static const String titleKey = r'title';

  static const String statusKey = r'status';

  static const String optionsKey = r'options';

  static const String descriptionKey = r'description';

  static const String idKey = r'id';

  static const String metadataKey = r'metadata';

  static const String createdAtKey = r'created_at';

  static const String updatedAtKey = r'updated_at';

  static const String variantsKey = r'variants';

  static const String handleKey = r'handle';

  static const String subtitleKey = r'subtitle';

  static const String isGiftcardKey = r'is_giftcard';

  static const String thumbnailKey = r'thumbnail';

  static const String widthKey = r'width';

  static const String weightKey = r'weight';

  static const String heightKey = r'height';

  static const String originCountryKey = r'origin_country';

  static const String hsCodeKey = r'hs_code';

  static const String midCodeKey = r'mid_code';

  static const String materialKey = r'material';

  static const String collectionKey = r'collection';

  static const String collectionIdKey = r'collection_id';

  static const String typeIdKey = r'type_id';

  static const String tagsKey = r'tags';

  static const String imagesKey = r'images';

  static const String discountableKey = r'discountable';

  static const String externalIdKey = r'external_id';

  static const String deletedAtKey = r'deleted_at';
}
