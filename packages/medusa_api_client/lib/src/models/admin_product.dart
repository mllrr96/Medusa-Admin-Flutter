/// AdminProduct
/// {
///     "properties": {
///         "collection": {
///             "$ref": "#/components/schemas/AdminCollection"
///         },
///         "categories": {
///             "type": "array",
///             "items": {
///                 "$ref": "#/components/schemas/AdminProductCategory"
///             },
///             "description": "The product's categories."
///         },
///         "sales_channels": {
///             "type": "array",
///             "items": {
///                 "$ref": "#/components/schemas/AdminSalesChannel"
///             },
///             "description": "The sales channels that the product is available in."
///         },
///         "variants": {
///             "type": "array",
///             "items": {
///                 "$ref": "#/components/schemas/AdminProductVariant"
///             },
///             "description": "The product's variants."
///         },
///         "type": {
///             "$ref": "#/components/schemas/AdminProductType"
///         },
///         "tags": {
///             "type": "array",
///             "items": {
///                 "$ref": "#/components/schemas/AdminProductTag"
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
///                 "$ref": "#/components/schemas/AdminProductOption"
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
///                 "$ref": "#/components/schemas/AdminProductImage"
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
///         },
///         "shipping_profile": {
///             "$ref": "#/components/schemas/AdminShippingProfile"
///         }
///     },
///     "type": "object",
///     "required": [
///         "variants",
///         "type",
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
library;

import 'exports.dart';
part 'admin_product.freezed.dart';
part 'admin_product.g.dart'; // AdminProduct

@freezed
abstract class AdminProduct with _$AdminProduct {
  const AdminProduct._();

  @jsonSerializable
  const factory AdminProduct({
    /// collection
    @JsonKey(name: AdminProduct.collectionKey)
    required AdminCollection collection,

    /// categories
    @JsonKey(name: AdminProduct.categoriesKey)
    required List<AdminProductCategory> categories,

    /// salesChannels
    @JsonKey(name: AdminProduct.salesChannelsKey)
    required List<AdminSalesChannel> salesChannels,

    /// variants
    @JsonKey(name: AdminProduct.variantsKey)
    required List<AdminProductVariant> variants,

    /// type
    @JsonKey(name: AdminProduct.typeKey) required AdminProductType type,

    /// tags
    @JsonKey(name: AdminProduct.tagsKey) required List<AdminProductTag> tags,

    /// length
    @JsonKey(name: AdminProduct.lengthKey) required double length,

    /// title
    @JsonKey(name: AdminProduct.titleKey) required String title,

    /// status
    @JsonKey(name: AdminProduct.statusKey) required NullEnum status,

    /// options
    @JsonKey(name: AdminProduct.optionsKey)
    required List<AdminProductOption> options,

    /// description
    @JsonKey(name: AdminProduct.descriptionKey) required String description,

    /// id
    @JsonKey(name: AdminProduct.idKey) required String id,

    /// metadata
    @JsonKey(name: AdminProduct.metadataKey)
    required Map<String, dynamic> metadata,

    /// createdAt
    @JsonKey(name: AdminProduct.createdAtKey) required DateTime createdAt,

    /// updatedAt
    @JsonKey(name: AdminProduct.updatedAtKey) required DateTime updatedAt,

    /// handle
    @JsonKey(name: AdminProduct.handleKey) required String handle,

    /// subtitle
    @JsonKey(name: AdminProduct.subtitleKey) required String subtitle,

    /// isGiftcard
    @JsonKey(name: AdminProduct.isGiftcardKey) required bool isGiftcard,

    /// thumbnail
    @JsonKey(name: AdminProduct.thumbnailKey) required String thumbnail,

    /// width
    @JsonKey(name: AdminProduct.widthKey) required double width,

    /// weight
    @JsonKey(name: AdminProduct.weightKey) required double weight,

    /// height
    @JsonKey(name: AdminProduct.heightKey) required double height,

    /// originCountry
    @JsonKey(name: AdminProduct.originCountryKey) required String originCountry,

    /// hsCode
    @JsonKey(name: AdminProduct.hsCodeKey) required String hsCode,

    /// midCode
    @JsonKey(name: AdminProduct.midCodeKey) required String midCode,

    /// material
    @JsonKey(name: AdminProduct.materialKey) required String material,

    /// collectionId
    @JsonKey(name: AdminProduct.collectionIdKey) required String collectionId,

    /// typeId
    @JsonKey(name: AdminProduct.typeIdKey) required String typeId,

    /// images
    @JsonKey(name: AdminProduct.imagesKey)
    required List<AdminProductImage> images,

    /// discountable
    @JsonKey(name: AdminProduct.discountableKey) required bool discountable,

    /// externalId
    @JsonKey(name: AdminProduct.externalIdKey) required String externalId,

    /// deletedAt
    @JsonKey(name: AdminProduct.deletedAtKey) required DateTime deletedAt,

    /// shippingProfile
    @JsonKey(name: AdminProduct.shippingProfileKey)
    required AdminShippingProfile shippingProfile,
  }) = _AdminProduct;

  factory AdminProduct.fromJson(Map<String, dynamic> json) =>
      _$AdminProductFromJson(json);

  static const String collectionKey = r'collection';

  static const String categoriesKey = r'categories';

  static const String salesChannelsKey = r'sales_channels';

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

  static const String shippingProfileKey = r'shipping_profile';
}
