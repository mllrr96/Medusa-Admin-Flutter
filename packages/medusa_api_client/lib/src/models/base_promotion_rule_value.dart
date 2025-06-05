/// BasePromotionRuleValue
/// {
///     "properties": {
///         "id": {
///             "type": "string",
///             "description": "The value's ID.",
///             "title": "id"
///         },
///         "value": {
///             "type": "string",
///             "description": "The value.",
///             "title": "value"
///         }
///     },
///     "type": "object",
///     "required": [
///         "id"
///     ],
///     "description": "The rule value's details."
/// }
library;

import 'exports.dart';
part 'base_promotion_rule_value.freezed.dart';
part 'base_promotion_rule_value.g.dart'; // BasePromotionRuleValue

@freezed
abstract class BasePromotionRuleValue with _$BasePromotionRuleValue {
  const BasePromotionRuleValue._();

  @jsonSerializable
  const factory BasePromotionRuleValue({
    /// id
    @JsonKey(name: BasePromotionRuleValue.idKey) required String id,

    /// value
    @JsonKey(name: BasePromotionRuleValue.valueKey) required String value,
  }) = _BasePromotionRuleValue;

  factory BasePromotionRuleValue.fromJson(Map<String, dynamic> json) =>
      _$BasePromotionRuleValueFromJson(json);

  static const String idKey = r'id';

  static const String valueKey = r'value';
}
