/// AdminUpdatePromotionRule
/// {
///     "properties": {
///         "id": {
///             "type": "string",
///             "description": "The buy rule's ID.",
///             "title": "id"
///         },
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
///             "description": "The buy rule's description.",
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
///         "id",
///         "values"
///     ],
///     "description": "The properties to update in a buy rule."
/// }
library;

import 'exports.dart';
part 'admin_update_promotion_rule.freezed.dart';
part 'admin_update_promotion_rule.g.dart'; // AdminUpdatePromotionRule

@freezed
abstract class AdminUpdatePromotionRule with _$AdminUpdatePromotionRule {
  const AdminUpdatePromotionRule._();

  @jsonSerializable
  const factory AdminUpdatePromotionRule({
    /// id
    @JsonKey(name: AdminUpdatePromotionRule.idKey) required String id,

    /// operatorAA
    @JsonKey(name: AdminUpdatePromotionRule.operatorAAKey)
    required NullEnum operatorAA,

    /// description
    @JsonKey(name: AdminUpdatePromotionRule.descriptionKey)
    required String description,

    /// attribute
    @JsonKey(name: AdminUpdatePromotionRule.attributeKey)
    required String attribute,

    /// values
    @JsonKey(name: AdminUpdatePromotionRule.valuesKey) required dynamic values,
  }) = _AdminUpdatePromotionRule;

  factory AdminUpdatePromotionRule.fromJson(Map<String, dynamic> json) =>
      _$AdminUpdatePromotionRuleFromJson(json);

  static const String idKey = r'id';

  static const String operatorAAKey = r'operator';

  static const String descriptionKey = r'description';

  static const String attributeKey = r'attribute';

  static const String valuesKey = r'values';
}
