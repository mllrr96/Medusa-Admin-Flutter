/// AdminInventoryItem
/// {
///     "properties": {
///         "id": {
///             "type": "string",
///             "description": "The inventory item's ID.",
///             "title": "id"
///         },
///         "sku": {
///             "type": "string",
///             "description": "The inventory item's sku.",
///             "title": "sku"
///         },
///         "origin_country": {
///             "type": "string",
///             "description": "The inventory item's origin country.",
///             "title": "origin_country"
///         },
///         "hs_code": {
///             "type": "string",
///             "description": "The inventory item's HS code.",
///             "title": "hs_code"
///         },
///         "requires_shipping": {
///             "type": "boolean",
///             "description": "Whether the inventory item requires shipping.",
///             "title": "requires_shipping"
///         },
///         "mid_code": {
///             "type": "string",
///             "description": "The inventory item's MID code.",
///             "title": "mid_code"
///         },
///         "material": {
///             "type": "string",
///             "description": "The inventory item's material.",
///             "title": "material"
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
///         "title": {
///             "type": "string",
///             "description": "The inventory item's title.",
///             "title": "title"
///         },
///         "description": {
///             "type": "string",
///             "description": "The inventory item's description.",
///             "title": "description"
///         },
///         "thumbnail": {
///             "type": "string",
///             "description": "The thumbnail URL of the inventory item.",
///             "title": "thumbnail"
///         },
///         "metadata": {
///             "type": "object",
///             "description": "Custom key-value pairs, used to store additional information about the inventory item."
///         },
///         "location_levels": {
///             "type": "array",
///             "items": {
///                 "$ref": "#/components/schemas/AdminInventoryLevel"
///             },
///             "description": "The inventory item's location levels."
///         }
///     },
///     "type": "object",
///     "required": [
///         "id",
///         "requires_shipping"
///     ],
///     "description": "The inventory item's details."
/// }
library;

import 'exports.dart';
part 'admin_inventory_item.freezed.dart';
part 'admin_inventory_item.g.dart'; // AdminInventoryItem

@freezed
abstract class AdminInventoryItem with _$AdminInventoryItem {
  const AdminInventoryItem._();

  @jsonSerializable
  const factory AdminInventoryItem({
    /// id
    @JsonKey(name: AdminInventoryItem.idKey) required String id,

    /// sku
    @JsonKey(name: AdminInventoryItem.skuKey) required String sku,

    /// originCountry
    @JsonKey(name: AdminInventoryItem.originCountryKey)
    required String originCountry,

    /// hsCode
    @JsonKey(name: AdminInventoryItem.hsCodeKey) required String hsCode,

    /// requiresShipping
    @JsonKey(name: AdminInventoryItem.requiresShippingKey)
    required bool requiresShipping,

    /// midCode
    @JsonKey(name: AdminInventoryItem.midCodeKey) required String midCode,

    /// material
    @JsonKey(name: AdminInventoryItem.materialKey) required String material,

    /// weight
    @JsonKey(name: AdminInventoryItem.weightKey) required double weight,

    /// length
    @JsonKey(name: AdminInventoryItem.lengthKey) required double length,

    /// height
    @JsonKey(name: AdminInventoryItem.heightKey) required double height,

    /// width
    @JsonKey(name: AdminInventoryItem.widthKey) required double width,

    /// title
    @JsonKey(name: AdminInventoryItem.titleKey) required String title,

    /// description
    @JsonKey(name: AdminInventoryItem.descriptionKey)
    required String description,

    /// thumbnail
    @JsonKey(name: AdminInventoryItem.thumbnailKey) required String thumbnail,

    /// metadata
    @JsonKey(name: AdminInventoryItem.metadataKey)
    required Map<String, dynamic> metadata,

    /// locationLevels
    @JsonKey(name: AdminInventoryItem.locationLevelsKey)
    required List<AdminInventoryLevel> locationLevels,
  }) = _AdminInventoryItem;

  factory AdminInventoryItem.fromJson(Map<String, dynamic> json) =>
      _$AdminInventoryItemFromJson(json);

  static const String idKey = r'id';

  static const String skuKey = r'sku';

  static const String originCountryKey = r'origin_country';

  static const String hsCodeKey = r'hs_code';

  static const String requiresShippingKey = r'requires_shipping';

  static const String midCodeKey = r'mid_code';

  static const String materialKey = r'material';

  static const String weightKey = r'weight';

  static const String lengthKey = r'length';

  static const String heightKey = r'height';

  static const String widthKey = r'width';

  static const String titleKey = r'title';

  static const String descriptionKey = r'description';

  static const String thumbnailKey = r'thumbnail';

  static const String metadataKey = r'metadata';

  static const String locationLevelsKey = r'location_levels';
}
