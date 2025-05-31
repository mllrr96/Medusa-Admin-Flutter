/// AdminCreateProduct
/// {
///     "properties": {
///         "title": {
///             "type": "string",
///             "description": "The product's title.",
///             "title": "title"
///         },
///         "subtitle": {
///             "type": "string",
///             "description": "The product's subtitle.",
///             "title": "subtitle"
///         },
///         "description": {
///             "type": "string",
///             "description": "The product's description.",
///             "title": "description"
///         },
///         "is_giftcard": {
///             "type": "boolean",
///             "description": "Whether the product is a gift card.",
///             "title": "is_giftcard"
///         },
///         "discountable": {
///             "type": "boolean",
///             "description": "Whether the product is discountable.",
///             "title": "discountable"
///         },
///         "images": {
///             "type": "array",
///             "items": {
///                 "type": "object",
///                 "description": "A product's image details."
///             },
///             "description": "The product's images."
///         },
///         "thumbnail": {
///             "type": "string",
///             "description": "The URL of the product's thumbnail.",
///             "title": "thumbnail"
///         },
///         "handle": {
///             "type": "string",
///             "description": "The product's handle.",
///             "title": "handle"
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
///         "type_id": {
///             "type": "string",
///             "description": "The ID of the type the product belongs to.",
///             "title": "type_id"
///         },
///         "collection_id": {
///             "type": "string",
///             "description": "The ID of the collection the product belongs to.",
///             "title": "collection_id"
///         },
///         "categories": {
///             "type": "array",
///             "items": {
///                 "type": "object",
///                 "description": "A category's details."
///             },
///             "description": "The categories the product belongs to."
///         },
///         "tags": {
///             "type": "array",
///             "items": {
///                 "type": "object",
///                 "description": "A tag's details."
///             },
///             "description": "The product's tags."
///         },
///         "options": {
///             "type": "array",
///             "items": {
///                 "$ref": "#/components/schemas/AdminCreateProductOption"
///             },
///             "description": "The product's options."
///         },
///         "variants": {
///             "type": "array",
///             "items": {
///                 "$ref": "#/components/schemas/AdminCreateProductVariant"
///             },
///             "description": "The product's variants."
///         },
///         "sales_channels": {
///             "type": "array",
///             "items": {
///                 "type": "object",
///                 "description": "A sales channel's details."
///             },
///             "description": "The sales channels the product is available in."
///         },
///         "weight": {
///             "type": "number",
///             "description": "The product's weight.",
///             "title": "weight"
///         },
///         "length": {
///             "type": "number",
///             "description": "The product's length.",
///             "title": "length"
///         },
///         "height": {
///             "type": "number",
///             "description": "The product's height.",
///             "title": "height"
///         },
///         "width": {
///             "type": "number",
///             "description": "The product's width.",
///             "title": "width"
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
///         "origin_country": {
///             "type": "string",
///             "description": "The product's origin country.",
///             "title": "origin_country"
///         },
///         "material": {
///             "type": "string",
///             "description": "The product's material.",
///             "title": "material"
///         },
///         "metadata": {
///             "type": "object",
///             "description": "The product's metadata, used to store custom key-value pairs."
///         },
///         "external_id": {
///             "type": "string",
///             "description": "The ID of the product in an external or third-party system.",
///             "title": "external_id"
///         },
///         "shipping_profile_id": {
///             "type": "string",
///             "description": "The ID of the product's shipping profile.",
///             "title": "shipping_profile_id"
///         }
///     },
///     "type": "object",
///     "required": [
///         "title",
///         "options"
///     ],
///     "description": "The product's details."
/// }
library admin_create_product;

import 'exports.dart';
part 'admin_create_product.freezed.dart';
part 'admin_create_product.g.dart'; // AdminCreateProduct

@freezed
abstract class AdminCreateProduct with _$AdminCreateProduct {
  const AdminCreateProduct._();

  @jsonSerializable
  const factory AdminCreateProduct({
    /// title
    @JsonKey(name: AdminCreateProduct.titleKey) required String title,

    /// subtitle
    @JsonKey(name: AdminCreateProduct.subtitleKey) required String subtitle,

    /// description
    @JsonKey(name: AdminCreateProduct.descriptionKey)
    required String description,

    /// isGiftcard
    @JsonKey(name: AdminCreateProduct.isGiftcardKey) required bool isGiftcard,

    /// discountable
    @JsonKey(name: AdminCreateProduct.discountableKey)
    required bool discountable,

    /// images
    @JsonKey(name: AdminCreateProduct.imagesKey)
    required List<Map<String, dynamic>> images,

    /// thumbnail
    @JsonKey(name: AdminCreateProduct.thumbnailKey) required String thumbnail,

    /// handle
    @JsonKey(name: AdminCreateProduct.handleKey) required String handle,

    /// status
    @JsonKey(name: AdminCreateProduct.statusKey) required NullEnum status,

    /// typeId
    @JsonKey(name: AdminCreateProduct.typeIdKey) required String typeId,

    /// collectionId
    @JsonKey(name: AdminCreateProduct.collectionIdKey)
    required String collectionId,

    /// categories
    @JsonKey(name: AdminCreateProduct.categoriesKey)
    required List<Map<String, dynamic>> categories,

    /// tags
    @JsonKey(name: AdminCreateProduct.tagsKey)
    required List<Map<String, dynamic>> tags,

    /// options
    @JsonKey(name: AdminCreateProduct.optionsKey)
    required List<AdminCreateProductOption> options,

    /// variants
    @JsonKey(name: AdminCreateProduct.variantsKey)
    required List<AdminCreateProductVariant> variants,

    /// salesChannels
    @JsonKey(name: AdminCreateProduct.salesChannelsKey)
    required List<Map<String, dynamic>> salesChannels,

    /// weight
    @JsonKey(name: AdminCreateProduct.weightKey) required double weight,

    /// length
    @JsonKey(name: AdminCreateProduct.lengthKey) required double length,

    /// height
    @JsonKey(name: AdminCreateProduct.heightKey) required double height,

    /// width
    @JsonKey(name: AdminCreateProduct.widthKey) required double width,

    /// hsCode
    @JsonKey(name: AdminCreateProduct.hsCodeKey) required String hsCode,

    /// midCode
    @JsonKey(name: AdminCreateProduct.midCodeKey) required String midCode,

    /// originCountry
    @JsonKey(name: AdminCreateProduct.originCountryKey)
    required String originCountry,

    /// material
    @JsonKey(name: AdminCreateProduct.materialKey) required String material,

    /// metadata
    @JsonKey(name: AdminCreateProduct.metadataKey)
    required Map<String, dynamic> metadata,

    /// externalId
    @JsonKey(name: AdminCreateProduct.externalIdKey) required String externalId,

    /// shippingProfileId
    @JsonKey(name: AdminCreateProduct.shippingProfileIdKey)
    required String shippingProfileId,
  }) = _AdminCreateProduct;

  factory AdminCreateProduct.fromJson(Map<String, dynamic> json) =>
      _$AdminCreateProductFromJson(json);

  static const String titleKey = r'title';

  static const String subtitleKey = r'subtitle';

  static const String descriptionKey = r'description';

  static const String isGiftcardKey = r'is_giftcard';

  static const String discountableKey = r'discountable';

  static const String imagesKey = r'images';

  static const String thumbnailKey = r'thumbnail';

  static const String handleKey = r'handle';

  static const String statusKey = r'status';

  static const String typeIdKey = r'type_id';

  static const String collectionIdKey = r'collection_id';

  static const String categoriesKey = r'categories';

  static const String tagsKey = r'tags';

  static const String optionsKey = r'options';

  static const String variantsKey = r'variants';

  static const String salesChannelsKey = r'sales_channels';

  static const String weightKey = r'weight';

  static const String lengthKey = r'length';

  static const String heightKey = r'height';

  static const String widthKey = r'width';

  static const String hsCodeKey = r'hs_code';

  static const String midCodeKey = r'mid_code';

  static const String originCountryKey = r'origin_country';

  static const String materialKey = r'material';

  static const String metadataKey = r'metadata';

  static const String externalIdKey = r'external_id';

  static const String shippingProfileIdKey = r'shipping_profile_id';
}
