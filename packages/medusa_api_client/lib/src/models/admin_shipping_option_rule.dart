/// AdminShippingOptionRule
/// {
///     "properties": {
///         "id": {
///             "type": "string",
///             "description": "The shipping option rule's ID.",
///             "title": "id"
///         },
///         "attribute": {
///             "type": "string",
///             "description": "The shipping option rule's attribute.",
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
///                 "gte",
///                 "nin"
///             ],
///             "type": "string",
///             "description": "The rule's operator."
///         },
///         "value": {
///             "type": "string",
///             "title": "value"
///         },
///         "shipping_option_id": {
///             "type": "string",
///             "description": "The ID of the shipping option this rule is for.",
///             "title": "shipping_option_id"
///         },
///         "created_at": {
///             "type": "string",
///             "format": "date-time",
///             "description": "The date the shipping option rule was created.",
///             "title": "created_at"
///         },
///         "updated_at": {
///             "type": "string",
///             "format": "date-time",
///             "description": "The date the shipping option rule was updated.",
///             "title": "updated_at"
///         },
///         "deleted_at": {
///             "type": "string",
///             "format": "date-time",
///             "description": "The date the shipping option rule was deleted.",
///             "title": "deleted_at"
///         }
///     },
///     "type": "object",
///     "required": [
///         "id",
///         "attribute",
///         "operator",
///         "value",
///         "shipping_option_id",
///         "created_at",
///         "updated_at",
///         "deleted_at"
///     ],
///     "description": "The shipping option rule's details."
/// }
library;

import 'exports.dart';
part 'admin_shipping_option_rule.freezed.dart';
part 'admin_shipping_option_rule.g.dart'; // AdminShippingOptionRule

@freezed
abstract class AdminShippingOptionRule with _$AdminShippingOptionRule {
  const AdminShippingOptionRule._();

  @jsonSerializable
  const factory AdminShippingOptionRule({
    /// id
    @JsonKey(name: AdminShippingOptionRule.idKey) required String id,

    /// attribute
    @JsonKey(name: AdminShippingOptionRule.attributeKey)
    required String attribute,

    /// operatorAA
    @JsonKey(name: AdminShippingOptionRule.operatorAAKey)
    required NullEnum operatorAA,

    /// value
    @JsonKey(name: AdminShippingOptionRule.valueKey) required String value,

    /// shippingOptionId
    @JsonKey(name: AdminShippingOptionRule.shippingOptionIdKey)
    required String shippingOptionId,

    /// createdAt
    @JsonKey(name: AdminShippingOptionRule.createdAtKey)
    required DateTime createdAt,

    /// updatedAt
    @JsonKey(name: AdminShippingOptionRule.updatedAtKey)
    required DateTime updatedAt,

    /// deletedAt
    @JsonKey(name: AdminShippingOptionRule.deletedAtKey)
    required DateTime deletedAt,
  }) = _AdminShippingOptionRule;

  factory AdminShippingOptionRule.fromJson(Map<String, dynamic> json) =>
      _$AdminShippingOptionRuleFromJson(json);

  static const String idKey = r'id';

  static const String attributeKey = r'attribute';

  static const String operatorAAKey = r'operator';

  static const String valueKey = r'value';

  static const String shippingOptionIdKey = r'shipping_option_id';

  static const String createdAtKey = r'created_at';

  static const String updatedAtKey = r'updated_at';

  static const String deletedAtKey = r'deleted_at';
}
