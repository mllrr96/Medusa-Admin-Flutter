/// BaseProduct
/// {
///     "properties": {
///         "collection": {
///             "$ref": "#/components/schemas/BaseCollection"
///         },
///         "categories": {
///             "type": "array",
///             "items": {
///                 "$ref": "#/components/schemas/BaseProductCategory"
///             },
///             "description": "The product's categories."
///         },
///         "variants": {
///             "type": "array",
///             "items": {
///                 "type": "object"
///             },
///             "description": "The product's variants."
///         },
///         "type": {
///             "$ref": "#/components/schemas/BaseProductType"
///         },
///         "tags": {
///             "type": "array",
///             "items": {
///                 "$ref": "#/components/schemas/BaseProductTag"
///             },
///             "description": "The product's tags."
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
///                 "$ref": "#/components/schemas/BaseProductOption"
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
///         "handle": {
///             "type": "string",
///             "description": "The product's unique handle.",
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
///             "description": "The product's thumbnail.",
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
///         "images": {
///             "type": "array",
///             "items": {
///                 "$ref": "#/components/schemas/BaseProductImage"
///             },
///             "description": "The product's images."
///         },
///         "discountable": {
///             "type": "boolean",
///             "description": "Whether discounts can be applied on the product.",
///             "title": "discountable"
///         },
///         "external_id": {
///             "type": "string",
///             "description": "The ID of a product in an external system, such as an ERP or CMS.",
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
///         "id",
///         "title",
///         "handle",
///         "subtitle",
///         "description",
///         "is_giftcard",
///         "status",
///         "thumbnail",
///         "width",
///         "weight",
///         "length",
///         "height",
///         "origin_country",
///         "hs_code",
///         "mid_code",
///         "material",
///         "collection_id",
///         "type_id",
///         "variants",
///         "options",
///         "images",
///         "discountable",
///         "external_id",
///         "created_at",
///         "updated_at",
///         "deleted_at"
///     ],
///     "description": "The product's details."
/// }
library;

import 'exports.dart';
part 'base_product.freezed.dart';
part 'base_product.g.dart'; // BaseProduct

@freezed
abstract class BaseProduct with _$BaseProduct {
  const BaseProduct._();

  @jsonSerializable
  const factory BaseProduct({
    /// collection
    @JsonKey(name: BaseProduct.collectionKey)
    required BaseCollection collection,

    /// categories
    @JsonKey(name: BaseProduct.categoriesKey)
    required List<BaseProductCategory> categories,

    /// variants
    @JsonKey(name: BaseProduct.variantsKey)
    required List<Map<String, dynamic>> variants,

    /// type
    @JsonKey(name: BaseProduct.typeKey) required BaseProductType type,

    /// tags
    @JsonKey(name: BaseProduct.tagsKey) required List<BaseProductTag> tags,

    /// length
    @JsonKey(name: BaseProduct.lengthKey) required double length,

    /// title
    @JsonKey(name: BaseProduct.titleKey) required String title,

    /// status
    @JsonKey(name: BaseProduct.statusKey) required NullEnum status,

    /// options
    @JsonKey(name: BaseProduct.optionsKey)
    required List<BaseProductOption> options,

    /// description
    @JsonKey(name: BaseProduct.descriptionKey) required String description,

    /// id
    @JsonKey(name: BaseProduct.idKey) required String id,

    /// metadata
    @JsonKey(name: BaseProduct.metadataKey)
    required Map<String, dynamic> metadata,

    /// createdAt
    @JsonKey(name: BaseProduct.createdAtKey) required DateTime createdAt,

    /// updatedAt
    @JsonKey(name: BaseProduct.updatedAtKey) required DateTime updatedAt,

    /// handle
    @JsonKey(name: BaseProduct.handleKey) required String handle,

    /// subtitle
    @JsonKey(name: BaseProduct.subtitleKey) required String subtitle,

    /// isGiftcard
    @JsonKey(name: BaseProduct.isGiftcardKey) required bool isGiftcard,

    /// thumbnail
    @JsonKey(name: BaseProduct.thumbnailKey) required String thumbnail,

    /// width
    @JsonKey(name: BaseProduct.widthKey) required double width,

    /// weight
    @JsonKey(name: BaseProduct.weightKey) required double weight,

    /// height
    @JsonKey(name: BaseProduct.heightKey) required double height,

    /// originCountry
    @JsonKey(name: BaseProduct.originCountryKey) required String originCountry,

    /// hsCode
    @JsonKey(name: BaseProduct.hsCodeKey) required String hsCode,

    /// midCode
    @JsonKey(name: BaseProduct.midCodeKey) required String midCode,

    /// material
    @JsonKey(name: BaseProduct.materialKey) required String material,

    /// collectionId
    @JsonKey(name: BaseProduct.collectionIdKey) required String collectionId,

    /// typeId
    @JsonKey(name: BaseProduct.typeIdKey) required String typeId,

    /// images
    @JsonKey(name: BaseProduct.imagesKey)
    required List<BaseProductImage> images,

    /// discountable
    @JsonKey(name: BaseProduct.discountableKey) required bool discountable,

    /// externalId
    @JsonKey(name: BaseProduct.externalIdKey) required String externalId,

    /// deletedAt
    @JsonKey(name: BaseProduct.deletedAtKey) required DateTime deletedAt,
  }) = _BaseProduct;

  factory BaseProduct.fromJson(Map<String, dynamic> json) =>
      _$BaseProductFromJson(json);

  static const String collectionKey = r'collection';

  static const String categoriesKey = r'categories';

  static const String variantsKey = r'variants';

  static const String typeKey = r'type';

  static const String tagsKey = r'tags';

  static const String lengthKey = r'length';

  static const String titleKey = r'title';

  static const String statusKey = r'status';

  static const String optionsKey = r'options';

  static const String descriptionKey = r'description';

  static const String idKey = r'id';

  static const String metadataKey = r'metadata';

  static const String createdAtKey = r'created_at';

  static const String updatedAtKey = r'updated_at';

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

  static const String collectionIdKey = r'collection_id';

  static const String typeIdKey = r'type_id';

  static const String imagesKey = r'images';

  static const String discountableKey = r'discountable';

  static const String externalIdKey = r'external_id';

  static const String deletedAtKey = r'deleted_at';
}
