/// PostPromotionsIdBuyRulesBatchQueryParameters
/// {
///     "properties": {
///         "fields": {
///             "type": "string",
///             "description": "Comma-separated fields that should be included in the returned data. if a field is prefixed with `+` it will be added to the default fields, using `-` will remove it from the default fields. without prefix it will replace the entire default fields.",
///             "title": "fields"
///         }
///     },
///     "type": "object"
/// }
library;

import 'exports.dart';
part 'post_promotions_id_buy_rules_batch_query_parameters.freezed.dart';
part 'post_promotions_id_buy_rules_batch_query_parameters.g.dart'; // PostPromotionsIdBuyRulesBatchQueryParameters

@freezed
abstract class PostPromotionsIdBuyRulesBatchQueryParameters
    with _$PostPromotionsIdBuyRulesBatchQueryParameters {
  const PostPromotionsIdBuyRulesBatchQueryParameters._();

  @jsonSerializable
  const factory PostPromotionsIdBuyRulesBatchQueryParameters({
    /// fields
    @JsonKey(name: PostPromotionsIdBuyRulesBatchQueryParameters.fieldsKey)
    required String fields,
  }) = _PostPromotionsIdBuyRulesBatchQueryParameters;

  factory PostPromotionsIdBuyRulesBatchQueryParameters.fromJson(
    Map<String, dynamic> json,
  ) => _$PostPromotionsIdBuyRulesBatchQueryParametersFromJson(json);

  static const String fieldsKey = r'fields';
}
