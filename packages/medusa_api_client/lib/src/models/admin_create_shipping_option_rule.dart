/// AdminCreateShippingOptionRule
/// {
///     "properties": {
///         "operator": {
///             "enum": [
///                 "gt",
///                 "lt",
///                 "eq",
///                 "ne",
///                 "in",
///                 "lte",
///                 "gte",
///                 "nin"
///             ],
///             "type": "string",
///             "description": "The operator used to check whether a rule applies."
///         },
///         "attribute": {
///             "type": "string",
///             "description": "The name of a property or table that the rule applies to.",
///             "title": "attribute"
///         },
///         "value": {
///             "oneOf": [
///                 {
///                     "type": "string",
///                     "description": "A value of the attribute that enables this rule.",
///                     "title": "value"
///                 },
///                 {
///                     "type": "array",
///                     "items": {
///                         "type": "string",
///                         "description": "A value of the attribute that enables this rule.",
///                         "title": "value"
///                     },
///                     "description": "Values of the attribute that enable this rule."
///                 }
///             ]
///         }
///     },
///     "type": "object",
///     "required": [
///         "operator",
///         "attribute",
///         "value"
///     ],
///     "description": "The details of the shipping option rule."
/// }
library;

import 'exports.dart';
part 'admin_create_shipping_option_rule.freezed.dart';
part 'admin_create_shipping_option_rule.g.dart'; // AdminCreateShippingOptionRule

@freezed
abstract class AdminCreateShippingOptionRule
    with _$AdminCreateShippingOptionRule {
  const AdminCreateShippingOptionRule._();

  @jsonSerializable
  const factory AdminCreateShippingOptionRule({
    /// operatorAA
    @JsonKey(name: AdminCreateShippingOptionRule.operatorAAKey)
    required NullEnum operatorAA,

    /// attribute
    @JsonKey(name: AdminCreateShippingOptionRule.attributeKey)
    required String attribute,

    /// value
    @JsonKey(name: AdminCreateShippingOptionRule.valueKey)
    required dynamic value,
  }) = _AdminCreateShippingOptionRule;

  factory AdminCreateShippingOptionRule.fromJson(Map<String, dynamic> json) =>
      _$AdminCreateShippingOptionRuleFromJson(json);

  static const String operatorAAKey = r'operator';

  static const String attributeKey = r'attribute';

  static const String valueKey = r'value';
}
