/// BaseRuleOperatorOptions
/// {
///     "properties": {
///         "id": {
///             "type": "string",
///             "description": "The operator's ID.",
///             "title": "id"
///         },
///         "value": {
///             "type": "string",
///             "description": "The operator's value.",
///             "title": "value"
///         },
///         "label": {
///             "type": "string",
///             "description": "The operator's label.",
///             "title": "label"
///         }
///     },
///     "type": "object",
///     "required": [
///         "id",
///         "value",
///         "label"
///     ],
///     "description": "The operator's details."
/// }
library base_rule_operator_options;

import 'exports.dart';
part 'base_rule_operator_options.freezed.dart';
part 'base_rule_operator_options.g.dart'; // BaseRuleOperatorOptions

@freezed
abstract class BaseRuleOperatorOptions with _$BaseRuleOperatorOptions {
  const BaseRuleOperatorOptions._();

  @jsonSerializable
  const factory BaseRuleOperatorOptions({
    /// id
    @JsonKey(name: BaseRuleOperatorOptions.idKey) required String id,

    /// value
    @JsonKey(name: BaseRuleOperatorOptions.valueKey) required String value,

    /// label
    @JsonKey(name: BaseRuleOperatorOptions.labelKey) required String label,
  }) = _BaseRuleOperatorOptions;

  factory BaseRuleOperatorOptions.fromJson(Map<String, dynamic> json) =>
      _$BaseRuleOperatorOptionsFromJson(json);

  static const String idKey = r'id';

  static const String valueKey = r'value';

  static const String labelKey = r'label';
}
