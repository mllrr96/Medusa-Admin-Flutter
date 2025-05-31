/// PostPromotionsIdRulesBatchQueryParameters
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
part 'post_promotions_id_rules_batch_query_parameters.freezed.dart';
part 'post_promotions_id_rules_batch_query_parameters.g.dart'; // PostPromotionsIdRulesBatchQueryParameters

@freezed
abstract class PostPromotionsIdRulesBatchQueryParameters
    with _$PostPromotionsIdRulesBatchQueryParameters {
  const PostPromotionsIdRulesBatchQueryParameters._();

  @jsonSerializable
  const factory PostPromotionsIdRulesBatchQueryParameters({
    /// fields
    @JsonKey(name: PostPromotionsIdRulesBatchQueryParameters.fieldsKey)
    required String fields,
  }) = _PostPromotionsIdRulesBatchQueryParameters;

  factory PostPromotionsIdRulesBatchQueryParameters.fromJson(
    Map<String, dynamic> json,
  ) => _$PostPromotionsIdRulesBatchQueryParametersFromJson(json);

  static const String fieldsKey = r'fields';
}
