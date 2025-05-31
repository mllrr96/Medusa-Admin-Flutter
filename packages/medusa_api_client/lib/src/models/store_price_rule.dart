/// StorePriceRule
/// {
///     "properties": {
///         "id": {
///             "type": "string",
///             "description": "The price rule's ID.",
///             "title": "id"
///         },
///         "attribute": {
///             "type": "string",
///             "description": "The price rule's attribute.",
///             "title": "attribute"
///         },
///         "operator": {
///             "enum": [
///                 "gt",
///                 "lt",
///                 "eq",
///                 "lte",
///                 "gte"
///             ],
///             "type": "string",
///             "description": "The price rule's operator."
///         },
///         "value": {
///             "type": "string",
///             "description": "The price rule's value.",
///             "title": "value"
///         }
///     },
///     "type": "object",
///     "required": [
///         "id",
///         "attribute",
///         "operator",
///         "value"
///     ],
///     "description": "The price rule's details."
/// }
library store_price_rule;

import 'exports.dart';
part 'store_price_rule.freezed.dart';
part 'store_price_rule.g.dart'; // StorePriceRule

@freezed
abstract class StorePriceRule with _$StorePriceRule {
  const StorePriceRule._();

  @jsonSerializable
  const factory StorePriceRule({
    /// id
    @JsonKey(name: StorePriceRule.idKey) required String id,

    /// attribute
    @JsonKey(name: StorePriceRule.attributeKey) required String attribute,

    /// operatorAA
    @JsonKey(name: StorePriceRule.operatorAAKey) required NullEnum operatorAA,

    /// value
    @JsonKey(name: StorePriceRule.valueKey) required String value,
  }) = _StorePriceRule;

  factory StorePriceRule.fromJson(Map<String, dynamic> json) =>
      _$StorePriceRuleFromJson(json);

  static const String idKey = r'id';

  static const String attributeKey = r'attribute';

  static const String operatorAAKey = r'operator';

  static const String valueKey = r'value';
}
