/// AdminCreateTaxRateRule
/// {
///     "properties": {
///         "reference": {
///             "type": "string",
///             "description": "The name of a table in the database that this rule points to.",
///             "title": "reference"
///         },
///         "reference_id": {
///             "type": "string",
///             "description": "The ID of a record in the table specified in reference.",
///             "title": "reference_id"
///         }
///     },
///     "type": "object",
///     "required": [
///         "reference",
///         "reference_id"
///     ],
///     "description": "The tax rate rule's details."
/// }
library admin_create_tax_rate_rule;

import 'exports.dart';
part 'admin_create_tax_rate_rule.freezed.dart';
part 'admin_create_tax_rate_rule.g.dart'; // AdminCreateTaxRateRule

@freezed
abstract class AdminCreateTaxRateRule with _$AdminCreateTaxRateRule {
  const AdminCreateTaxRateRule._();

  @jsonSerializable
  const factory AdminCreateTaxRateRule({
    /// reference
    @JsonKey(name: AdminCreateTaxRateRule.referenceKey)
    required String reference,

    /// referenceId
    @JsonKey(name: AdminCreateTaxRateRule.referenceIdKey)
    required String referenceId,
  }) = _AdminCreateTaxRateRule;

  factory AdminCreateTaxRateRule.fromJson(Map<String, dynamic> json) =>
      _$AdminCreateTaxRateRuleFromJson(json);

  static const String referenceKey = r'reference';

  static const String referenceIdKey = r'reference_id';
}
