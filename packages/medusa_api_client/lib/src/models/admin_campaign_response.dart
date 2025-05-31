/// AdminCampaignResponse
/// {
///     "properties": {
///         "campaign": {
///             "$ref": "#/components/schemas/AdminCampaign"
///         }
///     },
///     "type": "object",
///     "required": [
///         "campaign"
///     ],
///     "description": "The campaign's details."
/// }
library admin_campaign_response;

import 'exports.dart';
part 'admin_campaign_response.freezed.dart';
part 'admin_campaign_response.g.dart'; // AdminCampaignResponse

@freezed
abstract class AdminCampaignResponse with _$AdminCampaignResponse {
  const AdminCampaignResponse._();

  @jsonSerializable
  const factory AdminCampaignResponse({
    /// campaign
    @JsonKey(name: AdminCampaignResponse.campaignKey)
    required AdminCampaign campaign,
  }) = _AdminCampaignResponse;

  factory AdminCampaignResponse.fromJson(Map<String, dynamic> json) =>
      _$AdminCampaignResponseFromJson(json);

  static const String campaignKey = r'campaign';
}
