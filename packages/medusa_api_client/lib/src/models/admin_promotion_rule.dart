/// AdminPromotionRule
/// {
///     "properties": {
///         "id": {
///             "type": "string",
///             "description": "The promotion rule's ID.",
///             "title": "id"
///         },
///         "description": {
///             "type": "string",
///             "description": "The promotion rule's description.",
///             "title": "description"
///         },
///         "attribute": {
///             "type": "string",
///             "description": "The promotion rule's attribute.",
///             "title": "attribute"
///         },
///         "operator": {
///             "enum": [
///                 "gt",
///                 "lt",
///                 "eq",
///                 "ne",
///                 "in",
///                 "lte",
///                 "gte"
///             ],
///             "type": "string",
///             "description": "The rule's operator."
///         },
///         "values": {
///             "type": "array",
///             "items": {
///                 "$ref": "#/components/schemas/BasePromotionRuleValue"
///             },
///             "description": "The rule's values."
///         }
///     },
///     "type": "object",
///     "required": [
///         "id",
///         "values"
///     ],
///     "description": "The promotion rule's details."
/// }
library admin_promotion_rule;

import 'exports.dart';
part 'admin_promotion_rule.freezed.dart';
part 'admin_promotion_rule.g.dart'; // AdminPromotionRule

@freezed
abstract class AdminPromotionRule with _$AdminPromotionRule {
  const AdminPromotionRule._();

  @jsonSerializable
  const factory AdminPromotionRule({
    /// id
    @JsonKey(name: AdminPromotionRule.idKey) required String id,

    /// description
    @JsonKey(name: AdminPromotionRule.descriptionKey)
    required String description,

    /// attribute
    @JsonKey(name: AdminPromotionRule.attributeKey) required String attribute,

    /// operatorAA
    @JsonKey(name: AdminPromotionRule.operatorAAKey)
    required NullEnum operatorAA,

    /// values
    @JsonKey(name: AdminPromotionRule.valuesKey)
    required List<BasePromotionRuleValue> values,
  }) = _AdminPromotionRule;

  factory AdminPromotionRule.fromJson(Map<String, dynamic> json) =>
      _$AdminPromotionRuleFromJson(json);

  static const String idKey = r'id';

  static const String descriptionKey = r'description';

  static const String attributeKey = r'attribute';

  static const String operatorAAKey = r'operator';

  static const String valuesKey = r'values';
}
