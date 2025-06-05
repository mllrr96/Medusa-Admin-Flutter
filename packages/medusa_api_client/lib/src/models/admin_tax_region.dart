/// AdminTaxRegion
/// {
///     "properties": {
///         "id": {
///             "type": "string",
///             "description": "The tax region's ID.",
///             "title": "id"
///         },
///         "country_code": {
///             "type": "string",
///             "description": "The tax region's country code.",
///             "title": "country_code"
///         },
///         "province_code": {
///             "type": "string",
///             "description": "The tax region's lower-case ISO 3166-2 province code.",
///             "title": "province_code"
///         },
///         "metadata": {
///             "type": "object",
///             "description": "The tax region's metadata, can hold custom key-value pairs."
///         },
///         "parent_id": {
///             "type": "string",
///             "description": "The ID of the parent tax region.",
///             "title": "parent_id"
///         },
///         "created_at": {
///             "type": "string",
///             "format": "date-time",
///             "description": "The date the tax region was created.",
///             "title": "created_at"
///         },
///         "updated_at": {
///             "type": "string",
///             "format": "date-time",
///             "description": "The date the tax region was updated.",
///             "title": "updated_at"
///         },
///         "deleted_at": {
///             "type": "string",
///             "format": "date-time",
///             "description": "The date the tax region was deleted.",
///             "title": "deleted_at"
///         },
///         "created_by": {
///             "type": "string",
///             "description": "The ID of the user that created the tax region.",
///             "title": "created_by"
///         },
///         "tax_rates": {
///             "type": "array",
///             "items": {
///                 "type": "object"
///             },
///             "description": "The tax region's rates."
///         },
///         "parent": {
///             "type": "object"
///         },
///         "children": {
///             "type": "array",
///             "items": {
///                 "type": "object"
///             },
///             "description": "The tax region's children."
///         }
///     },
///     "type": "object",
///     "required": [
///         "id",
///         "country_code",
///         "province_code",
///         "metadata",
///         "parent_id",
///         "created_at",
///         "updated_at",
///         "deleted_at",
///         "created_by",
///         "tax_rates",
///         "parent",
///         "children"
///     ],
///     "description": "The tax region's details."
/// }
library;

import 'exports.dart';
part 'admin_tax_region.freezed.dart';
part 'admin_tax_region.g.dart'; // AdminTaxRegion

@freezed
abstract class AdminTaxRegion with _$AdminTaxRegion {
  const AdminTaxRegion._();

  @jsonSerializable
  const factory AdminTaxRegion({
    /// id
    @JsonKey(name: AdminTaxRegion.idKey) required String id,

    /// countryCode
    @JsonKey(name: AdminTaxRegion.countryCodeKey) required String countryCode,

    /// provinceCode
    @JsonKey(name: AdminTaxRegion.provinceCodeKey) required String provinceCode,

    /// metadata
    @JsonKey(name: AdminTaxRegion.metadataKey)
    required Map<String, dynamic> metadata,

    /// parentId
    @JsonKey(name: AdminTaxRegion.parentIdKey) required String parentId,

    /// createdAt
    @JsonKey(name: AdminTaxRegion.createdAtKey) required DateTime createdAt,

    /// updatedAt
    @JsonKey(name: AdminTaxRegion.updatedAtKey) required DateTime updatedAt,

    /// deletedAt
    @JsonKey(name: AdminTaxRegion.deletedAtKey) required DateTime deletedAt,

    /// createdBy
    @JsonKey(name: AdminTaxRegion.createdByKey) required String createdBy,

    /// taxRates
    @JsonKey(name: AdminTaxRegion.taxRatesKey)
    required List<Map<String, dynamic>> taxRates,

    /// parent
    @JsonKey(name: AdminTaxRegion.parentKey)
    required Map<String, dynamic> parent,

    /// children
    @JsonKey(name: AdminTaxRegion.childrenKey)
    required List<Map<String, dynamic>> children,
  }) = _AdminTaxRegion;

  factory AdminTaxRegion.fromJson(Map<String, dynamic> json) =>
      _$AdminTaxRegionFromJson(json);

  static const String idKey = r'id';

  static const String countryCodeKey = r'country_code';

  static const String provinceCodeKey = r'province_code';

  static const String metadataKey = r'metadata';

  static const String parentIdKey = r'parent_id';

  static const String createdAtKey = r'created_at';

  static const String updatedAtKey = r'updated_at';

  static const String deletedAtKey = r'deleted_at';

  static const String createdByKey = r'created_by';

  static const String taxRatesKey = r'tax_rates';

  static const String parentKey = r'parent';

  static const String childrenKey = r'children';
}
