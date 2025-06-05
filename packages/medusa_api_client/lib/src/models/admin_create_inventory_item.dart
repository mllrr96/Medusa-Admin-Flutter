/// AdminCreateInventoryItem
/// {
///     "properties": {
///         "sku": {
///             "type": "string",
///             "description": "The inventory item's SKU.",
///             "title": "sku"
///         },
///         "hs_code": {
///             "type": "string",
///             "description": "The inventory item's HS code.",
///             "title": "hs_code"
///         },
///         "weight": {
///             "type": "number",
///             "description": "The inventory item's weight.",
///             "title": "weight"
///         },
///         "length": {
///             "type": "number",
///             "description": "The inventory item's length.",
///             "title": "length"
///         },
///         "height": {
///             "type": "number",
///             "description": "The inventory item's height.",
///             "title": "height"
///         },
///         "width": {
///             "type": "number",
///             "description": "The inventory item's width.",
///             "title": "width"
///         },
///         "origin_country": {
///             "type": "string",
///             "description": "The inventory item's origin country.",
///             "title": "origin_country"
///         },
///         "mid_code": {
///             "type": "string",
///             "description": "The inventory item's mid code.",
///             "title": "mid_code"
///         },
///         "material": {
///             "type": "string",
///             "description": "The inventory item's material.",
///             "title": "material"
///         },
///         "title": {
///             "type": "string",
///             "description": "The inventory item's title.",
///             "title": "title"
///         },
///         "description": {
///             "type": "string",
///             "description": "The description of the variant associated with the inventory item.",
///             "title": "description"
///         },
///         "requires_shipping": {
///             "type": "boolean",
///             "description": "Whether the item requires shipping.",
///             "title": "requires_shipping"
///         },
///         "thumbnail": {
///             "type": "string",
///             "description": "The inventory item's thumbnail.",
///             "title": "thumbnail"
///         },
///         "metadata": {
///             "type": "object",
///             "description": "The inventory item's metadata, used to store custom key-value pairs."
///         }
///     },
///     "type": "object",
///     "description": "The inventory item's details."
/// }
library;

import 'exports.dart';
part 'admin_create_inventory_item.freezed.dart';
part 'admin_create_inventory_item.g.dart'; // AdminCreateInventoryItem

@freezed
abstract class AdminCreateInventoryItem with _$AdminCreateInventoryItem {
  const AdminCreateInventoryItem._();

  @jsonSerializable
  const factory AdminCreateInventoryItem({
    /// sku
    @JsonKey(name: AdminCreateInventoryItem.skuKey) required String sku,

    /// hsCode
    @JsonKey(name: AdminCreateInventoryItem.hsCodeKey) required String hsCode,

    /// weight
    @JsonKey(name: AdminCreateInventoryItem.weightKey) required double weight,

    /// length
    @JsonKey(name: AdminCreateInventoryItem.lengthKey) required double length,

    /// height
    @JsonKey(name: AdminCreateInventoryItem.heightKey) required double height,

    /// width
    @JsonKey(name: AdminCreateInventoryItem.widthKey) required double width,

    /// originCountry
    @JsonKey(name: AdminCreateInventoryItem.originCountryKey)
    required String originCountry,

    /// midCode
    @JsonKey(name: AdminCreateInventoryItem.midCodeKey) required String midCode,

    /// material
    @JsonKey(name: AdminCreateInventoryItem.materialKey)
    required String material,

    /// title
    @JsonKey(name: AdminCreateInventoryItem.titleKey) required String title,

    /// description
    @JsonKey(name: AdminCreateInventoryItem.descriptionKey)
    required String description,

    /// requiresShipping
    @JsonKey(name: AdminCreateInventoryItem.requiresShippingKey)
    required bool requiresShipping,

    /// thumbnail
    @JsonKey(name: AdminCreateInventoryItem.thumbnailKey)
    required String thumbnail,

    /// metadata
    @JsonKey(name: AdminCreateInventoryItem.metadataKey)
    required Map<String, dynamic> metadata,
  }) = _AdminCreateInventoryItem;

  factory AdminCreateInventoryItem.fromJson(Map<String, dynamic> json) =>
      _$AdminCreateInventoryItemFromJson(json);

  static const String skuKey = r'sku';

  static const String hsCodeKey = r'hs_code';

  static const String weightKey = r'weight';

  static const String lengthKey = r'length';

  static const String heightKey = r'height';

  static const String widthKey = r'width';

  static const String originCountryKey = r'origin_country';

  static const String midCodeKey = r'mid_code';

  static const String materialKey = r'material';

  static const String titleKey = r'title';

  static const String descriptionKey = r'description';

  static const String requiresShippingKey = r'requires_shipping';

  static const String thumbnailKey = r'thumbnail';

  static const String metadataKey = r'metadata';
}
