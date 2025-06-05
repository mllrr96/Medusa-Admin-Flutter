/// AdminTaxRateRule
/// {
///     "properties": {
///         "reference": {
///             "type": "string",
///             "description": "The name of the table this rule references.",
///             "title": "reference"
///         },
///         "reference_id": {
///             "type": "string",
///             "description": "The ID of a record in the table that this rule references.",
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
library;

import 'exports.dart';
part 'admin_tax_rate_rule.freezed.dart';
part 'admin_tax_rate_rule.g.dart'; // AdminTaxRateRule

@freezed
abstract class AdminTaxRateRule with _$AdminTaxRateRule {
  const AdminTaxRateRule._();

  @jsonSerializable
  const factory AdminTaxRateRule({
    /// reference
    @JsonKey(name: AdminTaxRateRule.referenceKey) required String reference,

    /// referenceId
    @JsonKey(name: AdminTaxRateRule.referenceIdKey) required String referenceId,
  }) = _AdminTaxRateRule;

  factory AdminTaxRateRule.fromJson(Map<String, dynamic> json) =>
      _$AdminTaxRateRuleFromJson(json);

  static const String referenceKey = r'reference';

  static const String referenceIdKey = r'reference_id';
}
