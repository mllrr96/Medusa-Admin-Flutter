/// AdminCreateTaxRate
/// {
///     "properties": {
///         "name": {
///             "type": "string",
///             "description": "The tax rate's name.",
///             "title": "name"
///         },
///         "tax_region_id": {
///             "type": "string",
///             "description": "The ID of the tax region this rate belongs to.",
///             "title": "tax_region_id"
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
///         "rules": {
///             "type": "array",
///             "items": {
///                 "$ref": "#/components/schemas/AdminCreateTaxRateRule"
///             },
///             "description": "The tax rate's rules."
///         },
///         "is_default": {
///             "type": "boolean",
///             "description": "Whether the tax rate is the default in its tax region.",
///             "title": "is_default"
///         },
///         "is_combinable": {
///             "type": "boolean",
///             "description": "Whether the tax rate should be combined with parent rates.",
///             "title": "is_combinable"
///         },
///         "metadata": {
///             "type": "object",
///             "description": "The tax rate's metadata, used to store custom key-value pairs."
///         }
///     },
///     "type": "object",
///     "required": [
///         "name",
///         "tax_region_id",
///         "code"
///     ],
///     "description": "The tax rate's details."
/// }
library;

import 'exports.dart';
part 'admin_create_tax_rate.freezed.dart';
part 'admin_create_tax_rate.g.dart'; // AdminCreateTaxRate

@freezed
abstract class AdminCreateTaxRate with _$AdminCreateTaxRate {
  const AdminCreateTaxRate._();

  @jsonSerializable
  const factory AdminCreateTaxRate({
    /// name
    @JsonKey(name: AdminCreateTaxRate.nameKey) required String name,

    /// taxRegionId
    @JsonKey(name: AdminCreateTaxRate.taxRegionIdKey)
    required String taxRegionId,

    /// rate
    @JsonKey(name: AdminCreateTaxRate.rateKey) required double rate,

    /// code
    @JsonKey(name: AdminCreateTaxRate.codeKey) required String code,

    /// rules
    @JsonKey(name: AdminCreateTaxRate.rulesKey)
    required List<AdminCreateTaxRateRule> rules,

    /// isDefault
    @JsonKey(name: AdminCreateTaxRate.isDefaultKey) required bool isDefault,

    /// isCombinable
    @JsonKey(name: AdminCreateTaxRate.isCombinableKey)
    required bool isCombinable,

    /// metadata
    @JsonKey(name: AdminCreateTaxRate.metadataKey)
    required Map<String, dynamic> metadata,
  }) = _AdminCreateTaxRate;

  factory AdminCreateTaxRate.fromJson(Map<String, dynamic> json) =>
      _$AdminCreateTaxRateFromJson(json);

  static const String nameKey = r'name';

  static const String taxRegionIdKey = r'tax_region_id';

  static const String rateKey = r'rate';

  static const String codeKey = r'code';

  static const String rulesKey = r'rules';

  static const String isDefaultKey = r'is_default';

  static const String isCombinableKey = r'is_combinable';

  static const String metadataKey = r'metadata';
}
