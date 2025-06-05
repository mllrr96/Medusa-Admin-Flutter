/// AdminBatchUpdateProduct
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
///             "description": "Whether discounts can be applied on the product.",
///             "title": "discountable"
///         },
///         "images": {
///             "type": "array",
///             "items": {
///                 "type": "object",
///                 "description": "The image's details."
///             },
///             "description": "The product's images."
///         },
///         "thumbnail": {
///             "type": "string",
///             "description": "The product's thumbnail URL.",
///             "title": "thumbnail"
///         },
///         "handle": {
///             "type": "string",
///             "description": "The product's unique handle.",
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
///             "description": "The ID of the product's type.",
///             "title": "type_id"
///         },
///         "collection_id": {
///             "type": "string",
///             "description": "The ID of the product's collection.",
///             "title": "collection_id"
///         },
///         "categories": {
///             "type": "array",
///             "items": {
///                 "type": "object",
///                 "description": "The product's category."
///             },
///             "description": "The product's categories."
///         },
///         "tags": {
///             "type": "array",
///             "items": {
///                 "type": "object",
///                 "description": "The product's tag."
///             },
///             "description": "The product's tags."
///         },
///         "options": {
///             "type": "array",
///             "items": {
///                 "$ref": "#/components/schemas/AdminUpdateProductOption"
///             },
///             "description": "The product's options."
///         },
///         "variants": {
///             "type": "array",
///             "items": {
///                 "oneOf": [
///                     {
///                         "$ref": "#/components/schemas/AdminCreateProductVariant"
///                     },
///                     {
///                         "$ref": "#/components/schemas/AdminUpdateProductVariant"
///                     }
///                 ]
///             },
///             "description": "The product's variants. You can add new variants or update existing ones, passing their IDs in the object."
///         },
///         "sales_channels": {
///             "type": "array",
///             "items": {
///                 "type": "object",
///                 "description": "The sales channel's details."
///             },
///             "description": "The sales channels that the product is available in."
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
///             "description": "The product's metadata, can hold custom key-value pairs."
///         },
///         "external_id": {
///             "type": "string",
///             "description": "The ID of the product in an external or third-party system.",
///             "title": "external_id"
///         },
///         "id": {
///             "type": "string",
///             "description": "The product's ID.",
///             "title": "id"
///         },
///         "shipping_profile_id": {
///             "type": "string",
///             "description": "The ID of the product's shipping profile.",
///             "title": "shipping_profile_id"
///         }
///     },
///     "type": "object",
///     "required": [
///         "id"
///     ],
///     "description": "The product's details."
/// }
library;

import 'exports.dart';
part 'admin_batch_update_product.freezed.dart';
part 'admin_batch_update_product.g.dart'; // AdminBatchUpdateProduct

@freezed
abstract class AdminBatchUpdateProduct with _$AdminBatchUpdateProduct {
  const AdminBatchUpdateProduct._();

  @jsonSerializable
  const factory AdminBatchUpdateProduct({
    /// title
    @JsonKey(name: AdminBatchUpdateProduct.titleKey) required String title,

    /// subtitle
    @JsonKey(name: AdminBatchUpdateProduct.subtitleKey)
    required String subtitle,

    /// description
    @JsonKey(name: AdminBatchUpdateProduct.descriptionKey)
    required String description,

    /// isGiftcard
    @JsonKey(name: AdminBatchUpdateProduct.isGiftcardKey)
    required bool isGiftcard,

    /// discountable
    @JsonKey(name: AdminBatchUpdateProduct.discountableKey)
    required bool discountable,

    /// images
    @JsonKey(name: AdminBatchUpdateProduct.imagesKey)
    required List<Map<String, dynamic>> images,

    /// thumbnail
    @JsonKey(name: AdminBatchUpdateProduct.thumbnailKey)
    required String thumbnail,

    /// handle
    @JsonKey(name: AdminBatchUpdateProduct.handleKey) required String handle,

    /// status
    @JsonKey(name: AdminBatchUpdateProduct.statusKey) required NullEnum status,

    /// typeId
    @JsonKey(name: AdminBatchUpdateProduct.typeIdKey) required String typeId,

    /// collectionId
    @JsonKey(name: AdminBatchUpdateProduct.collectionIdKey)
    required String collectionId,

    /// categories
    @JsonKey(name: AdminBatchUpdateProduct.categoriesKey)
    required List<Map<String, dynamic>> categories,

    /// tags
    @JsonKey(name: AdminBatchUpdateProduct.tagsKey)
    required List<Map<String, dynamic>> tags,

    /// options
    @JsonKey(name: AdminBatchUpdateProduct.optionsKey)
    required List<AdminUpdateProductOption> options,

    /// variants
    @JsonKey(name: AdminBatchUpdateProduct.variantsKey)
    required List<AdminCreateProductVariantOrAdminUpdateProductVariantUnion>
    variants,

    /// salesChannels
    @JsonKey(name: AdminBatchUpdateProduct.salesChannelsKey)
    required List<Map<String, dynamic>> salesChannels,

    /// weight
    @JsonKey(name: AdminBatchUpdateProduct.weightKey) required double weight,

    /// length
    @JsonKey(name: AdminBatchUpdateProduct.lengthKey) required double length,

    /// height
    @JsonKey(name: AdminBatchUpdateProduct.heightKey) required double height,

    /// width
    @JsonKey(name: AdminBatchUpdateProduct.widthKey) required double width,

    /// hsCode
    @JsonKey(name: AdminBatchUpdateProduct.hsCodeKey) required String hsCode,

    /// midCode
    @JsonKey(name: AdminBatchUpdateProduct.midCodeKey) required String midCode,

    /// originCountry
    @JsonKey(name: AdminBatchUpdateProduct.originCountryKey)
    required String originCountry,

    /// material
    @JsonKey(name: AdminBatchUpdateProduct.materialKey)
    required String material,

    /// metadata
    @JsonKey(name: AdminBatchUpdateProduct.metadataKey)
    required Map<String, dynamic> metadata,

    /// externalId
    @JsonKey(name: AdminBatchUpdateProduct.externalIdKey)
    required String externalId,

    /// id
    @JsonKey(name: AdminBatchUpdateProduct.idKey) required String id,

    /// shippingProfileId
    @JsonKey(name: AdminBatchUpdateProduct.shippingProfileIdKey)
    required String shippingProfileId,
  }) = _AdminBatchUpdateProduct;

  factory AdminBatchUpdateProduct.fromJson(Map<String, dynamic> json) =>
      _$AdminBatchUpdateProductFromJson(json);

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

  static const String idKey = r'id';

  static const String shippingProfileIdKey = r'shipping_profile_id';
}
