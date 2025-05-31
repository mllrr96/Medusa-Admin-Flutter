/// DeleteTaxRatesIdRulesRuleIdQueryParameters
/// {
///     "properties": {
///         "fields": {
///             "type": "string",
///             "description": "Comma-separated fields that should be included in the returned data. if a field is prefixed with `+` it will be added to the default fields, using `-` will remove it from the default fields. without prefix it will replace the entire default fields.",
///             "title": "fields"
///         }
///     },
///     "type": "object"
/// }
library;

import 'exports.dart';
part 'delete_tax_rates_id_rules_rule_id_query_parameters.freezed.dart';
part 'delete_tax_rates_id_rules_rule_id_query_parameters.g.dart'; // DeleteTaxRatesIdRulesRuleIdQueryParameters

@freezed
abstract class DeleteTaxRatesIdRulesRuleIdQueryParameters
    with _$DeleteTaxRatesIdRulesRuleIdQueryParameters {
  const DeleteTaxRatesIdRulesRuleIdQueryParameters._();

  @jsonSerializable
  const factory DeleteTaxRatesIdRulesRuleIdQueryParameters({
    /// fields
    @JsonKey(name: DeleteTaxRatesIdRulesRuleIdQueryParameters.fieldsKey)
    required String fields,
  }) = _DeleteTaxRatesIdRulesRuleIdQueryParameters;

  factory DeleteTaxRatesIdRulesRuleIdQueryParameters.fromJson(
    Map<String, dynamic> json,
  ) => _$DeleteTaxRatesIdRulesRuleIdQueryParametersFromJson(json);

  static const String fieldsKey = r'fields';
}
