/// GetPromotionsRuleAttributeOptionsRuleTypeQueryParameters
/// {
///     "properties": {
///         "promotion_type": {
///             "enum": [
///                 "standard",
///                 "buyget"
///             ],
///             "type": "string",
///             "description": "The promotion type to retrieve rules for.",
///             "title": "promotion_type"
///         },
///         "application_method_type": {
///             "enum": [
///                 "fixed",
///                 "percentage"
///             ],
///             "type": "string",
///             "description": "The application method type to retrieve rules for.",
///             "title": "application_method_type"
///         }
///     },
///     "type": "object"
/// }
library;

import 'exports.dart';
part 'get_promotions_rule_attribute_options_rule_type_query_parameters.freezed.dart';
part 'get_promotions_rule_attribute_options_rule_type_query_parameters.g.dart'; // GetPromotionsRuleAttributeOptionsRuleTypeQueryParameters

@freezed
abstract class GetPromotionsRuleAttributeOptionsRuleTypeQueryParameters
    with _$GetPromotionsRuleAttributeOptionsRuleTypeQueryParameters {
  const GetPromotionsRuleAttributeOptionsRuleTypeQueryParameters._();

  @jsonSerializable
  const factory GetPromotionsRuleAttributeOptionsRuleTypeQueryParameters({
    /// promotionType
    @JsonKey(
      name: GetPromotionsRuleAttributeOptionsRuleTypeQueryParameters
          .promotionTypeKey,
    )
    required PromotionTypeEnum promotionType,

    /// applicationMethodType
    @JsonKey(
      name: GetPromotionsRuleAttributeOptionsRuleTypeQueryParameters
          .applicationMethodTypeKey,
    )
    required ApplicationMethodTypeEnum applicationMethodType,
  }) = _GetPromotionsRuleAttributeOptionsRuleTypeQueryParameters;

  factory GetPromotionsRuleAttributeOptionsRuleTypeQueryParameters.fromJson(
    Map<String, dynamic> json,
  ) => _$GetPromotionsRuleAttributeOptionsRuleTypeQueryParametersFromJson(json);

  static const String promotionTypeKey = r'promotion_type';

  static const String applicationMethodTypeKey = r'application_method_type';
}
