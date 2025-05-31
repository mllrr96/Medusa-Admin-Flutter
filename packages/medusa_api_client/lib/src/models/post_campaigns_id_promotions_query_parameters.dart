/// PostCampaignsIdPromotionsQueryParameters
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
part 'post_campaigns_id_promotions_query_parameters.freezed.dart';
part 'post_campaigns_id_promotions_query_parameters.g.dart'; // PostCampaignsIdPromotionsQueryParameters

@freezed
abstract class PostCampaignsIdPromotionsQueryParameters
    with _$PostCampaignsIdPromotionsQueryParameters {
  const PostCampaignsIdPromotionsQueryParameters._();

  @jsonSerializable
  const factory PostCampaignsIdPromotionsQueryParameters({
    /// fields
    @JsonKey(name: PostCampaignsIdPromotionsQueryParameters.fieldsKey)
    required String fields,
  }) = _PostCampaignsIdPromotionsQueryParameters;

  factory PostCampaignsIdPromotionsQueryParameters.fromJson(
    Map<String, dynamic> json,
  ) => _$PostCampaignsIdPromotionsQueryParametersFromJson(json);

  static const String fieldsKey = r'fields';
}
