/// GetPromotionsRuleValueOptionsRuleTypeRuleAttributeIdQueryParameters
/// {
///     "properties": {
///         "offset": {
///             "type": "number",
///             "description": "The number of items to skip when retrieving a list.",
///             "title": "offset"
///         },
///         "limit": {
///             "type": "number",
///             "description": "Limit the number of items returned in the list.",
///             "title": "limit"
///         },
///         "order": {
///             "type": "string",
///             "description": "The field to sort the data by. By default, the sort order is ascending. To change the order to descending, prefix the field name with `-`.",
///             "title": "order"
///         },
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
part 'get_promotions_rule_value_options_rule_type_rule_attribute_id_query_parameters.freezed.dart';
part 'get_promotions_rule_value_options_rule_type_rule_attribute_id_query_parameters.g.dart'; // GetPromotionsRuleValueOptionsRuleTypeRuleAttributeIdQueryParameters

@freezed
abstract class GetPromotionsRuleValueOptionsRuleTypeRuleAttributeIdQueryParameters
    with _$GetPromotionsRuleValueOptionsRuleTypeRuleAttributeIdQueryParameters {
  const GetPromotionsRuleValueOptionsRuleTypeRuleAttributeIdQueryParameters._();

  @jsonSerializable
  const factory GetPromotionsRuleValueOptionsRuleTypeRuleAttributeIdQueryParameters({
    /// offset
    @JsonKey(
      name: GetPromotionsRuleValueOptionsRuleTypeRuleAttributeIdQueryParameters
          .offsetKey,
    )
    required double offset,

    /// limit
    @JsonKey(
      name: GetPromotionsRuleValueOptionsRuleTypeRuleAttributeIdQueryParameters
          .limitKey,
    )
    required double limit,

    /// order
    @JsonKey(
      name: GetPromotionsRuleValueOptionsRuleTypeRuleAttributeIdQueryParameters
          .orderKey,
    )
    required String order,

    /// promotionType
    @JsonKey(
      name: GetPromotionsRuleValueOptionsRuleTypeRuleAttributeIdQueryParameters
          .promotionTypeKey,
    )
    required PromotionTypeEnum promotionType,

    /// applicationMethodType
    @JsonKey(
      name: GetPromotionsRuleValueOptionsRuleTypeRuleAttributeIdQueryParameters
          .applicationMethodTypeKey,
    )
    required ApplicationMethodTypeEnum applicationMethodType,
  }) = _GetPromotionsRuleValueOptionsRuleTypeRuleAttributeIdQueryParameters;

  factory GetPromotionsRuleValueOptionsRuleTypeRuleAttributeIdQueryParameters.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$GetPromotionsRuleValueOptionsRuleTypeRuleAttributeIdQueryParametersFromJson(
        json,
      );

  static const String offsetKey = r'offset';

  static const String limitKey = r'limit';

  static const String orderKey = r'order';

  static const String promotionTypeKey = r'promotion_type';

  static const String applicationMethodTypeKey = r'application_method_type';
}
