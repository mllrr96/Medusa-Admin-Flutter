/// AdminRuleAttributeOption
/// {
///     "properties": {
///         "id": {
///             "type": "string",
///             "description": "The rule attribute's ID, which is a rule's `attribute` it refers to.",
///             "title": "id"
///         },
///         "value": {
///             "type": "string",
///             "description": "The rule attribute's value.",
///             "title": "value"
///         },
///         "label": {
///             "type": "string",
///             "description": "The rule attribute option's label.",
///             "title": "label"
///         },
///         "operators": {
///             "type": "array",
///             "items": {
///                 "$ref": "#/components/schemas/BaseRuleOperatorOptions"
///             },
///             "description": "The attribute's operators."
///         }
///     },
///     "type": "object",
///     "required": [
///         "id",
///         "value",
///         "label",
///         "operators"
///     ],
///     "description": "The details of a potential rule attribute."
/// }
library admin_rule_attribute_option;

import 'exports.dart';
part 'admin_rule_attribute_option.freezed.dart';
part 'admin_rule_attribute_option.g.dart'; // AdminRuleAttributeOption

@freezed
abstract class AdminRuleAttributeOption with _$AdminRuleAttributeOption {
  const AdminRuleAttributeOption._();

  @jsonSerializable
  const factory AdminRuleAttributeOption({
    /// id
    @JsonKey(name: AdminRuleAttributeOption.idKey) required String id,

    /// value
    @JsonKey(name: AdminRuleAttributeOption.valueKey) required String value,

    /// label
    @JsonKey(name: AdminRuleAttributeOption.labelKey) required String label,

    /// operators
    @JsonKey(name: AdminRuleAttributeOption.operatorsKey)
    required List<BaseRuleOperatorOptions> operators,
  }) = _AdminRuleAttributeOption;

  factory AdminRuleAttributeOption.fromJson(Map<String, dynamic> json) =>
      _$AdminRuleAttributeOptionFromJson(json);

  static const String idKey = r'id';

  static const String valueKey = r'value';

  static const String labelKey = r'label';

  static const String operatorsKey = r'operators';
}
