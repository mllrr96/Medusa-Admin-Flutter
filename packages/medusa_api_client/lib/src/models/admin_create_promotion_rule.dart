/// AdminCreatePromotionRule
/// {
///     "properties": {
///         "operator": {
///             "enum": [
///                 "gte",
///                 "lte",
///                 "gt",
///                 "lt",
///                 "eq",
///                 "ne",
///                 "in"
///             ],
///             "type": "string",
///             "description": "The operator used to check whether the buy rule applies on a cart. For example, `eq` means that the cart's value for the specified attribute must match the specified value."
///         },
///         "description": {
///             "type": "string",
///             "description": "The rule's description.",
///             "title": "description"
///         },
///         "attribute": {
///             "type": "string",
///             "description": "The attribute to compare against when checking whether a promotion can be applied on a cart.",
///             "title": "attribute"
///         },
///         "values": {
///             "oneOf": [
///                 {
///                     "type": "string",
///                     "description": "The attribute's value.",
///                     "title": "values"
///                 },
///                 {
///                     "type": "array",
///                     "items": {
///                         "type": "string",
///                         "description": "An attribute value.",
///                         "title": "values"
///                     },
///                     "description": "The allowed attribute values."
///                 }
///             ]
///         }
///     },
///     "type": "object",
///     "required": [
///         "operator",
///         "attribute",
///         "values"
///     ],
///     "description": "The promotion rule's details."
/// }
library admin_create_promotion_rule;

import 'exports.dart';
part 'admin_create_promotion_rule.freezed.dart';
part 'admin_create_promotion_rule.g.dart'; // AdminCreatePromotionRule

@freezed
abstract class AdminCreatePromotionRule with _$AdminCreatePromotionRule {
  const AdminCreatePromotionRule._();

  @jsonSerializable
  const factory AdminCreatePromotionRule({
    /// operatorAA
    @JsonKey(name: AdminCreatePromotionRule.operatorAAKey)
    required NullEnum operatorAA,

    /// description
    @JsonKey(name: AdminCreatePromotionRule.descriptionKey)
    required String description,

    /// attribute
    @JsonKey(name: AdminCreatePromotionRule.attributeKey)
    required String attribute,

    /// values
    @JsonKey(name: AdminCreatePromotionRule.valuesKey) required dynamic values,
  }) = _AdminCreatePromotionRule;

  factory AdminCreatePromotionRule.fromJson(Map<String, dynamic> json) =>
      _$AdminCreatePromotionRuleFromJson(json);

  static const String operatorAAKey = r'operator';

  static const String descriptionKey = r'description';

  static const String attributeKey = r'attribute';

  static const String valuesKey = r'values';
}
