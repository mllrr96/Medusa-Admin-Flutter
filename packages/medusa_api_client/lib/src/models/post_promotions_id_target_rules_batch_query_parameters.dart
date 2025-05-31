/// PostPromotionsIdTargetRulesBatchQueryParameters
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
part 'post_promotions_id_target_rules_batch_query_parameters.freezed.dart';
part 'post_promotions_id_target_rules_batch_query_parameters.g.dart'; // PostPromotionsIdTargetRulesBatchQueryParameters

@freezed
abstract class PostPromotionsIdTargetRulesBatchQueryParameters
    with _$PostPromotionsIdTargetRulesBatchQueryParameters {
  const PostPromotionsIdTargetRulesBatchQueryParameters._();

  @jsonSerializable
  const factory PostPromotionsIdTargetRulesBatchQueryParameters({
    /// fields
    @JsonKey(name: PostPromotionsIdTargetRulesBatchQueryParameters.fieldsKey)
    required String fields,
  }) = _PostPromotionsIdTargetRulesBatchQueryParameters;

  factory PostPromotionsIdTargetRulesBatchQueryParameters.fromJson(
    Map<String, dynamic> json,
  ) => _$PostPromotionsIdTargetRulesBatchQueryParametersFromJson(json);

  static const String fieldsKey = r'fields';
}
