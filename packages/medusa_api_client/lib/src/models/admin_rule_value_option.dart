/// AdminRuleValueOption
/// {
///     "properties": {
///         "value": {
///             "type": "string",
///             "description": "The rule value's value.",
///             "title": "value"
///         },
///         "label": {
///             "type": "string",
///             "description": "The rule value's label.",
///             "title": "label"
///         }
///     },
///     "type": "object",
///     "required": [
///         "value",
///         "label"
///     ],
///     "description": "The details of a potential rule value."
/// }
library;

import 'exports.dart';
part 'admin_rule_value_option.freezed.dart';
part 'admin_rule_value_option.g.dart'; // AdminRuleValueOption

@freezed
abstract class AdminRuleValueOption with _$AdminRuleValueOption {
  const AdminRuleValueOption._();

  @jsonSerializable
  const factory AdminRuleValueOption({
    /// value
    @JsonKey(name: AdminRuleValueOption.valueKey) required String value,

    /// label
    @JsonKey(name: AdminRuleValueOption.labelKey) required String label,
  }) = _AdminRuleValueOption;

  factory AdminRuleValueOption.fromJson(Map<String, dynamic> json) =>
      _$AdminRuleValueOptionFromJson(json);

  static const String valueKey = r'value';

  static const String labelKey = r'label';
}
