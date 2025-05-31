/// AdminUpdateTaxRate
/// {
///     "properties": {
///         "rate": {
///             "type": "number",
///             "description": "The rate to charge.",
///             "title": "rate"
///         },
///         "code": {
///             "type": "string",
///             "description": "The code that the tax rate is identified by.",
///             "title": "code"
///         },
///         "rules": {
///             "type": "array",
///             "items": {
///                 "type": "object",
///                 "description": "A tax rate rule."
///             },
///             "description": "The tax rate's rules."
///         },
///         "name": {
///             "type": "string",
///             "description": "The tax rate's name.",
///             "title": "name"
///         },
///         "is_default": {
///             "type": "boolean",
///             "description": "Whether the tax rate is the default in the store.",
///             "title": "is_default"
///         },
///         "is_combinable": {
///             "type": "boolean",
///             "description": "Whether the tax rate should be combined with parent rates.",
///             "title": "is_combinable"
///         },
///         "metadata": {
///             "type": "object",
///             "description": "The tax rate's metadata, can hold custom key-value pairs."
///         }
///     },
///     "type": "object",
///     "description": "The properties to update in the tax rate."
/// }
library admin_update_tax_rate;

import 'exports.dart';
part 'admin_update_tax_rate.freezed.dart';
part 'admin_update_tax_rate.g.dart'; // AdminUpdateTaxRate

@freezed
abstract class AdminUpdateTaxRate with _$AdminUpdateTaxRate {
  const AdminUpdateTaxRate._();

  @jsonSerializable
  const factory AdminUpdateTaxRate({
    /// rate
    @JsonKey(name: AdminUpdateTaxRate.rateKey) required double rate,

    /// code
    @JsonKey(name: AdminUpdateTaxRate.codeKey) required String code,

    /// rules
    @JsonKey(name: AdminUpdateTaxRate.rulesKey)
    required List<Map<String, dynamic>> rules,

    /// name
    @JsonKey(name: AdminUpdateTaxRate.nameKey) required String name,

    /// isDefault
    @JsonKey(name: AdminUpdateTaxRate.isDefaultKey) required bool isDefault,

    /// isCombinable
    @JsonKey(name: AdminUpdateTaxRate.isCombinableKey)
    required bool isCombinable,

    /// metadata
    @JsonKey(name: AdminUpdateTaxRate.metadataKey)
    required Map<String, dynamic> metadata,
  }) = _AdminUpdateTaxRate;

  factory AdminUpdateTaxRate.fromJson(Map<String, dynamic> json) =>
      _$AdminUpdateTaxRateFromJson(json);

  static const String rateKey = r'rate';

  static const String codeKey = r'code';

  static const String rulesKey = r'rules';

  static const String nameKey = r'name';

  static const String isDefaultKey = r'is_default';

  static const String isCombinableKey = r'is_combinable';

  static const String metadataKey = r'metadata';
}
