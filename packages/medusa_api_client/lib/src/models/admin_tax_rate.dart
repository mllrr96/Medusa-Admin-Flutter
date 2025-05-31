/// AdminTaxRate
/// {
///     "properties": {
///         "id": {
///             "type": "string",
///             "description": "The tax rate's ID.",
///             "title": "id"
///         },
///         "rate": {
///             "type": "number",
///             "description": "The rate to charge.",
///             "title": "rate"
///         },
///         "code": {
///             "type": "string",
///             "description": "The code the tax rate is identified by.",
///             "title": "code"
///         },
///         "name": {
///             "type": "string",
///             "description": "The tax rate's name.",
///             "title": "name"
///         },
///         "metadata": {
///             "type": "object",
///             "description": "The tax rate's metadata, can hold custom key-value pairs."
///         },
///         "tax_region_id": {
///             "type": "string",
///             "description": "The ID of the tax region this rate belongs to.",
///             "title": "tax_region_id"
///         },
///         "is_combinable": {
///             "type": "boolean",
///             "description": "Whether the tax rate should be combined with parent rates.",
///             "title": "is_combinable"
///         },
///         "is_default": {
///             "type": "boolean",
///             "description": "Whether this tax rate is the default in the tax region.",
///             "title": "is_default"
///         },
///         "created_at": {
///             "type": "string",
///             "format": "date-time",
///             "description": "The date the tax rate was created.",
///             "title": "created_at"
///         },
///         "updated_at": {
///             "type": "string",
///             "format": "date-time",
///             "description": "The date the tax rate was updated.",
///             "title": "updated_at"
///         },
///         "deleted_at": {
///             "type": "string",
///             "format": "date-time",
///             "description": "The date the tax rate was deleted.",
///             "title": "deleted_at"
///         },
///         "created_by": {
///             "type": "string",
///             "description": "The ID of the user that created the tax rate.",
///             "title": "created_by"
///         },
///         "tax_region": {
///             "$ref": "#/components/schemas/AdminTaxRegion"
///         },
///         "rules": {
///             "type": "array",
///             "items": {
///                 "$ref": "#/components/schemas/AdminTaxRateRule"
///             },
///             "description": "The tax rate's rules."
///         }
///     },
///     "type": "object",
///     "required": [
///         "id",
///         "rate",
///         "code",
///         "name",
///         "metadata",
///         "tax_region_id",
///         "is_combinable",
///         "is_default",
///         "created_at",
///         "updated_at",
///         "deleted_at",
///         "created_by",
///         "tax_region",
///         "rules"
///     ],
///     "description": "The tax rate's details."
/// }
library admin_tax_rate;

import 'exports.dart';
part 'admin_tax_rate.freezed.dart';
part 'admin_tax_rate.g.dart'; // AdminTaxRate

@freezed
abstract class AdminTaxRate with _$AdminTaxRate {
  const AdminTaxRate._();

  @jsonSerializable
  const factory AdminTaxRate({
    /// id
    @JsonKey(name: AdminTaxRate.idKey) required String id,

    /// rate
    @JsonKey(name: AdminTaxRate.rateKey) required double rate,

    /// code
    @JsonKey(name: AdminTaxRate.codeKey) required String code,

    /// name
    @JsonKey(name: AdminTaxRate.nameKey) required String name,

    /// metadata
    @JsonKey(name: AdminTaxRate.metadataKey)
    required Map<String, dynamic> metadata,

    /// taxRegionId
    @JsonKey(name: AdminTaxRate.taxRegionIdKey) required String taxRegionId,

    /// isCombinable
    @JsonKey(name: AdminTaxRate.isCombinableKey) required bool isCombinable,

    /// isDefault
    @JsonKey(name: AdminTaxRate.isDefaultKey) required bool isDefault,

    /// createdAt
    @JsonKey(name: AdminTaxRate.createdAtKey) required DateTime createdAt,

    /// updatedAt
    @JsonKey(name: AdminTaxRate.updatedAtKey) required DateTime updatedAt,

    /// deletedAt
    @JsonKey(name: AdminTaxRate.deletedAtKey) required DateTime deletedAt,

    /// createdBy
    @JsonKey(name: AdminTaxRate.createdByKey) required String createdBy,

    /// taxRegion
    @JsonKey(name: AdminTaxRate.taxRegionKey) required AdminTaxRegion taxRegion,

    /// rules
    @JsonKey(name: AdminTaxRate.rulesKey) required List<AdminTaxRateRule> rules,
  }) = _AdminTaxRate;

  factory AdminTaxRate.fromJson(Map<String, dynamic> json) =>
      _$AdminTaxRateFromJson(json);

  static const String idKey = r'id';

  static const String rateKey = r'rate';

  static const String codeKey = r'code';

  static const String nameKey = r'name';

  static const String metadataKey = r'metadata';

  static const String taxRegionIdKey = r'tax_region_id';

  static const String isCombinableKey = r'is_combinable';

  static const String isDefaultKey = r'is_default';

  static const String createdAtKey = r'created_at';

  static const String updatedAtKey = r'updated_at';

  static const String deletedAtKey = r'deleted_at';

  static const String createdByKey = r'created_by';

  static const String taxRegionKey = r'tax_region';

  static const String rulesKey = r'rules';
}
