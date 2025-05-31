/// AdminUpdateShippingOptionRule
/// {
///     "properties": {
///         "id": {
///             "type": "string",
///             "description": "The rule's ID.",
///             "title": "id"
///         },
///         "operator": {
///             "enum": [
///                 "in",
///                 "eq",
///                 "ne",
///                 "gt",
///                 "gte",
///                 "lt",
///                 "lte",
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
///         "id",
///         "operator",
///         "attribute",
///         "value"
///     ],
///     "description": "The properties to update in the shipping option rule."
/// }
library;

import 'exports.dart';
part 'admin_update_shipping_option_rule.freezed.dart';
part 'admin_update_shipping_option_rule.g.dart'; // AdminUpdateShippingOptionRule

@freezed
abstract class AdminUpdateShippingOptionRule
    with _$AdminUpdateShippingOptionRule {
  const AdminUpdateShippingOptionRule._();

  @jsonSerializable
  const factory AdminUpdateShippingOptionRule({
    /// id
    @JsonKey(name: AdminUpdateShippingOptionRule.idKey) required String id,

    /// operatorAA
    @JsonKey(name: AdminUpdateShippingOptionRule.operatorAAKey)
    required NullEnum operatorAA,

    /// attribute
    @JsonKey(name: AdminUpdateShippingOptionRule.attributeKey)
    required String attribute,

    /// value
    @JsonKey(name: AdminUpdateShippingOptionRule.valueKey)
    required dynamic value,
  }) = _AdminUpdateShippingOptionRule;

  factory AdminUpdateShippingOptionRule.fromJson(Map<String, dynamic> json) =>
      _$AdminUpdateShippingOptionRuleFromJson(json);

  static const String idKey = r'id';

  static const String operatorAAKey = r'operator';

  static const String attributeKey = r'attribute';

  static const String valueKey = r'value';
}
