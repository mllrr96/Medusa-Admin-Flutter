/// AdminShippingOptionPriceRule
/// {
///     "properties": {
///         "id": {
///             "type": "string",
///             "description": "The price rule's ID.",
///             "title": "id"
///         },
///         "value": {
///             "oneOf": [
///                 {
///                     "type": "string",
///                     "description": "The price rule's value.",
///                     "title": "value"
///                 },
///                 {
///                     "type": "number",
///                     "description": "The price rule's value.",
///                     "title": "value"
///                 }
///             ],
///             "description": "The price rule's value."
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
///             "description": "The price rule's operator."
///         },
///         "attribute": {
///             "type": "string",
///             "description": "The price rule's attribute.",
///             "title": "attribute"
///         },
///         "price_id": {
///             "type": "string",
///             "description": "The ID of the price this rule applies to.",
///             "title": "price_id"
///         },
///         "priority": {
///             "type": "number",
///             "description": "The price rule's priority.",
///             "title": "priority"
///         },
///         "created_at": {
///             "type": "string",
///             "format": "date-time",
///             "description": "The date the price rule was created.",
///             "title": "created_at"
///         },
///         "updated_at": {
///             "type": "string",
///             "format": "date-time",
///             "description": "The date the price rule was updated.",
///             "title": "updated_at"
///         },
///         "deleted_at": {
///             "type": "string",
///             "format": "date-time",
///             "description": "The date the price rule was deleted.",
///             "title": "deleted_at"
///         }
///     },
///     "type": "object",
///     "required": [
///         "id",
///         "value",
///         "operator",
///         "attribute",
///         "price_id",
///         "priority",
///         "created_at",
///         "updated_at",
///         "deleted_at"
///     ],
///     "description": "The details of a shipping option price's rule."
/// }
library;

import 'exports.dart';
part 'admin_shipping_option_price_rule.freezed.dart';
part 'admin_shipping_option_price_rule.g.dart'; // AdminShippingOptionPriceRule

@freezed
abstract class AdminShippingOptionPriceRule
    with _$AdminShippingOptionPriceRule {
  const AdminShippingOptionPriceRule._();

  @jsonSerializable
  const factory AdminShippingOptionPriceRule({
    /// id
    @JsonKey(name: AdminShippingOptionPriceRule.idKey) required String id,

    /// value
    @JsonKey(name: AdminShippingOptionPriceRule.valueKey)
    required dynamic value,

    /// operatorAA
    @JsonKey(name: AdminShippingOptionPriceRule.operatorAAKey)
    required NullEnum operatorAA,

    /// attribute
    @JsonKey(name: AdminShippingOptionPriceRule.attributeKey)
    required String attribute,

    /// priceId
    @JsonKey(name: AdminShippingOptionPriceRule.priceIdKey)
    required String priceId,

    /// priority
    @JsonKey(name: AdminShippingOptionPriceRule.priorityKey)
    required double priority,

    /// createdAt
    @JsonKey(name: AdminShippingOptionPriceRule.createdAtKey)
    required DateTime createdAt,

    /// updatedAt
    @JsonKey(name: AdminShippingOptionPriceRule.updatedAtKey)
    required DateTime updatedAt,

    /// deletedAt
    @JsonKey(name: AdminShippingOptionPriceRule.deletedAtKey)
    required DateTime deletedAt,
  }) = _AdminShippingOptionPriceRule;

  factory AdminShippingOptionPriceRule.fromJson(Map<String, dynamic> json) =>
      _$AdminShippingOptionPriceRuleFromJson(json);

  static const String idKey = r'id';

  static const String valueKey = r'value';

  static const String operatorAAKey = r'operator';

  static const String attributeKey = r'attribute';

  static const String priceIdKey = r'price_id';

  static const String priorityKey = r'priority';

  static const String createdAtKey = r'created_at';

  static const String updatedAtKey = r'updated_at';

  static const String deletedAtKey = r'deleted_at';
}
