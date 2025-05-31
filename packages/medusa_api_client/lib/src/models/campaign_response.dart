/// CampaignResponse
/// {
///     "properties": {
///         "id": {
///             "type": "string",
///             "description": "The campaign's ID.",
///             "title": "id"
///         },
///         "name": {
///             "type": "string",
///             "description": "The campaign's name.",
///             "title": "name"
///         },
///         "description": {
///             "type": "string",
///             "description": "The campaign's description.",
///             "title": "description"
///         },
///         "currency": {
///             "type": "string",
///             "description": "The campaign's currency.",
///             "title": "currency"
///         },
///         "campaign_identifier": {
///             "type": "string",
///             "description": "The campaign's campaign identifier.",
///             "title": "campaign_identifier"
///         },
///         "starts_at": {
///             "type": "string",
///             "description": "The campaign's starts at.",
///             "title": "starts_at"
///         },
///         "ends_at": {
///             "type": "string",
///             "description": "The campaign's ends at.",
///             "title": "ends_at"
///         },
///         "budget": {
///             "type": "object",
///             "description": "The campaign's budget."
///         }
///     },
///     "type": "object",
///     "required": [
///         "id",
///         "name",
///         "description",
///         "currency",
///         "campaign_identifier",
///         "starts_at",
///         "ends_at",
///         "budget"
///     ],
///     "description": "The campaign's details."
/// }
library campaign_response;

import 'exports.dart';
part 'campaign_response.freezed.dart';
part 'campaign_response.g.dart'; // CampaignResponse

@freezed
abstract class CampaignResponse with _$CampaignResponse {
  const CampaignResponse._();

  @jsonSerializable
  const factory CampaignResponse({
    /// id
    @JsonKey(name: CampaignResponse.idKey) required String id,

    /// name
    @JsonKey(name: CampaignResponse.nameKey) required String name,

    /// description
    @JsonKey(name: CampaignResponse.descriptionKey) required String description,

    /// currency
    @JsonKey(name: CampaignResponse.currencyKey) required String currency,

    /// campaignIdentifier
    @JsonKey(name: CampaignResponse.campaignIdentifierKey)
    required String campaignIdentifier,

    /// startsAt
    @JsonKey(name: CampaignResponse.startsAtKey) required String startsAt,

    /// endsAt
    @JsonKey(name: CampaignResponse.endsAtKey) required String endsAt,

    /// budget
    @JsonKey(name: CampaignResponse.budgetKey)
    required Map<String, dynamic> budget,
  }) = _CampaignResponse;

  factory CampaignResponse.fromJson(Map<String, dynamic> json) =>
      _$CampaignResponseFromJson(json);

  static const String idKey = r'id';

  static const String nameKey = r'name';

  static const String descriptionKey = r'description';

  static const String currencyKey = r'currency';

  static const String campaignIdentifierKey = r'campaign_identifier';

  static const String startsAtKey = r'starts_at';

  static const String endsAtKey = r'ends_at';

  static const String budgetKey = r'budget';
}
